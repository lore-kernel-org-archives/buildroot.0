From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 2 May 2016 09:31:18 +0200
Subject: [Buildroot] [PATCH v2] package/luajit: luajit.pc: return the
 path to host-luajit from the Buildroot package
In-Reply-To: <20160501233214.74ca9bf0@free-electrons.com>
References: <1462137728-17445-1-git-send-email-romain.naour@gmail.com>
 <20160501233214.74ca9bf0@free-electrons.com>
Message-ID: <CANLo3JjVoBerDhNm49-jK26C=jRA+PSY+bysKZqgzzVO7GM5Dw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le 1 mai 2016 23:32, "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
a ?crit :
>
> Hello,
>
> On Sun,  1 May 2016 23:22:08 +0200, Romain Naour wrote:
> > The luajit.pc file is manually generated in the luajit Makefile, so it
give a wrong
> > path for host-luajit.
> >
> > $ output/host/usr/bin/pkgconf --cflags luajit
> > /usr/include/luajit-2.0
> >
> > It should be:
> > $ output/host/usr/bin/pkgconf --cflags luajit
> > [...]output/host/usr/include/luajit-2.0
> >
> > Set PREFIX with $(HOST_DIR)/usr and remove DESTDIR since the
installation path
> > is DPREFIX=$(DESTDIR)$(PREFIX).
> > Otherwise the host-luajit is installed to
output/host/home/[...]/output/host/usr
> >
> > Signed-off-by: Romain Naour <romain.naour@gmail.com>
> > Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> > ---
> > v2: remove the post install hook and set PREFIX with $(HOST_DIR)/usr
(ThomasP)
> > ---
> >  package/luajit/luajit.mk | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>
> I've quite significantly rewritten the commit log, and applied, thanks!

OK, thanks.

Romain
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160502/98173d42/attachment.html>
