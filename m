From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 25 Oct 2019 19:45:05 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/gnu-efi: fix efilink
In-Reply-To: <20191025193630.406d43a0@windsurf.dhcp.lyon.intranet>
References: <20191025173320.78781-1-james.hilliard1@gmail.com>
 <20191025193630.406d43a0@windsurf.dhcp.lyon.intranet>
Message-ID: <CADvTj4rQ0Mvvw1ihoEdCC_4xxiWGUhJhOXPrEUtpdaSToapyrQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 25, 2019 at 7:36 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Fri, 25 Oct 2019 11:33:20 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > Fixes:
> > In file included from /home/buildroot/buildroot/output/host/i686-buildroot-linux-uclibc/sysroot/usr/include/efi/efilib.h:25,
> >                  from ../src/boot/efi/measure.c:6:
> > /home/buildroot/buildroot/output/host/i686-buildroot-linux-uclibc/sysroot/usr/include/efi/efilink.h:5:10: fatal error: stdint.h: No such file or directory
> >  #include <stdint.h>
>
> When building what ? Which package, which configuration ?
The systemd-boot package in this branch but with source overridden
to point to a local checkout of https://github.com/systemd/systemd/pull/13842:
https://github.com/jameshilliard/buildroot/tree/systemd-boot
I did make defconfig and selected just the systemd-boot package.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
