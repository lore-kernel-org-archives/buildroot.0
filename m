From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Apr 2014 23:21:18 +0200
Subject: [Buildroot] [PATCH 1/1] xbmc: Depend on host-gettext
In-Reply-To: <qj7o1bx17m.ln2@ID-313208.user.individual.net>
References: <1397319021-20282-1-git-send-email-bernd.kuhls@t-online.de>
 <20140412184222.6406c780@skate>
 <qj7o1bx17m.ln2@ID-313208.user.individual.net>
Message-ID: <20140415232118.513fa8aa@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 12 Apr 2014 18:52:42 +0200, Bernd Kuhls wrote:
> Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote
> in news:20140412184222.6406c780 at skate: 
> 
> > Why is XBMC autoreconf'ed ? It does not have XBMC_AUTORECONF = YES, so
> > it should normally not be autoreconfed.
> 
> because the tarball does not include ./configure, only configure.in.
> Xbmc is autoreconf'ed by calling ./bootstrap using XBMC_PRE_CONFIGURE_HOOKS 
> which initiates its own magic ;)

Right. But then, to be consistent with what we do for packages that can
be autoreconf'ed normally, can you instead pass AUTOPOINT=/bin/true
when calling the ./bootstrap script?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
