From: Mike Zick <minimod@morethan.org>
Date: Fri, 7 Feb 2014 08:14:30 -0600
Subject: [Buildroot] Antw: Re: Why can't I see any effects by different
 rootfs compression methods ??
In-Reply-To: <52F4A423.1060102@mind.be>
References: <52F361B10200004600049F5D@gwia2.rz.hs-offenburg.de>
 <52F3C228.2080002@mind.be>
 <52F495EA020000460004A4C6@gwia2.rz.hs-offenburg.de>
 <52F4A423.1060102@mind.be>
Message-ID: <20140207081430.72c3955e@core2quad.morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 07 Feb 2014 10:15:15 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

>  An initrd/initramfs is normally passed by the bootloader to the
> kernel as part of the boot arguments. On your PC, for instance,
> you'll see in /boot:
> 
> initrd.img-3.12-1-amd64
> vmlinuz-3.12-1-amd64
> 
>  As an extra option, the kernel has the feature that you can link the
> initramfs directly into the kernel - which has the advantage that you
> only need to manage a single image instead of two.
>

Leaving the choice to the final implementor of the system can be
important.

Linking the initramfs (or older initrd format) into the kernel binary
makes its contents subject to the kernel's (viral) GPLv2.

Keeping the kernel and the file system as separate files stops the
viral spread of the GPL license from the kernel to the file system.

When the initial file system contains proprietary code, an important
point to keep in mind.

Another point arises in the case of the GPLv3 -
If the initial file system is statically linked into the kernel, it
becomes much more difficult to replace a GPLv3 binary in the file
system for the end user (or even for the vendor) without re-building
the kernel.

- - - -

Two everyday common instances:

Google Android: Their "bootloader image" (their terms) carries the
kernel and the initial file system as two binary images.

Amazon Kindle (the e-ink models): Their u-boot loaded kernel image
has the initial file system statically linked with the kernel.
(and contains what Amazon considers proprietary code, which they
do not release, but that is off-topic here).

Mike
