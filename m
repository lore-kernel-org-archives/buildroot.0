From: robert rose <robertroyrose@gmail.com>
Date: Sat, 24 Nov 2018 14:00:40 -0800
Subject: [Buildroot] [PATCH v2 2/2] grpc: new package
In-Reply-To: <20181124214519.5d168fd8@windsurf>
References: <20181118211942.28839-1-robertroyrose@gmail.com>
 <20181118211942.28839-2-robertroyrose@gmail.com>
 <20181124151256.5b786338@windsurf>
 <CALxq1w45Krr6E8Ri7rxrDN9USkbPdLbqmmK2x-XiH3AmHHeqpg@mail.gmail.com>
 <20181124214519.5d168fd8@windsurf>
Message-ID: <CALxq1w6H6h3BY6R=PyuTAqHh6JtJyjVWg7F8DUnChMhyMaP1yw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I just did the make menuconfig, added grpc and it still worked.  I just
installed cmake 3.12.1 and doing a build from scratch (with grpc :)
Let you know in a couple hours how it works.
Try doing
make V=1
and see if you can find anything wrong.

-robert

On Sat, Nov 24, 2018 at 12:45 PM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello Robert,
>
> On Sat, 24 Nov 2018 12:09:36 -0800, robert rose wrote:
>
> > tar xf ~/Downloads/buildroot-2018.08.2.tar.gz
> > cd buildroot-2018.08.2
> > patch -p1 < ~/buildroot/outgoing/v2-0001-c-ares-support-host-build.patch
> > patch -p1 < ~/buildroot/outgoing/v2-0002-grpc-new-package.patch
> > make raspberrypi3_defconfig
> > make
>
> If you do just this, you don't build gprc, you at least need to do
> "make menuconfig" and enable gprc.
>
> > And it worked.  I don't have cmake on my machine, so buildroot
> > built cmake-3.8.2
> > What version of cmake do you use?
>
> I have a cmake installed system-wide, so I'm not using the one built by
> Buildroot. My cmake version is:
>
> $ cmake --version
> cmake version 3.12.1
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181124/e923eec1/attachment.html>
