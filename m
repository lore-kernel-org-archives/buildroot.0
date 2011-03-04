From: bruce bushby <bruce.bushby@gmail.com>
Date: Fri, 4 Mar 2011 23:02:26 +0000
Subject: [Buildroot] [OT?] Re: Applying custom kernel patches
In-Reply-To: <9AC3F0E75060224C8BBC5BA2DDC8853A1F734FA3@EXV1.corp.adtran.com>
References: <AANLkTi=_dHFneTLXe3+P1-cOM2dsLsQW6f_fgbK7hSQy@mail.gmail.com>
	<518665.81144.qm@web161818.mail.bf1.yahoo.com>
	<4D716A17.1040008@wp.pl>
	<9AC3F0E75060224C8BBC5BA2DDC8853A1F734FA3@EXV1.corp.adtran.com>
Message-ID: <AANLkTikET+tnALmPDw67_17SsJpuOOFDarCKm7tWOGEE@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I think I've got it working....doing a full build now.

This is what I did:

1. mkdir /opt/buildroot/linux/kernel-patches

2. name patches in the order that you want them applied, for example:
root at prodvarm:/opt/buildroot/linux/kernel-patches# ls -1
linux-2.6.38-rc5-0001.patch
linux-2.6.38-rc5-0002.patch
linux-2.6.38-rc5-0003.patch
linux-2.6.38-rc5-0004.patch
linux-2.6.38-rc5-0005.patch
linux-2.6.38-rc5-0006.patch

3. Create a list of patches to paste into the "Custom patches" option when
running "make menuconfig":
root at prodvarm:/opt/buildroot# find linux/kernel-patches/ | grep "\.patch" |
sort -n | xargs
linux/kernel-patches/linux-2.6.38-rc5-0001.patch
linux/kernel-patches/linux-2.6.38-rc5-0002.patch
linux/kernel-patches/linux-2.6.38-rc5-0003.patch
linux/kernel-patches/linux-2.6.38-rc5-0004.patch
linux/kernel-patches/linux-2.6.38-rc5-0005.patch
linux/kernel-patches/linux-2.6.38-rc5-0006.patch
root at prodvarm:/opt/buildroot#

4. run "make menuconfig", then go to kernel/custom patches option and paste
the "patch list" like so:
linux/kernel-patches/linux-2.6.38-rc5-0001.patch
linux/kernel-patches/linux-2.6.38-rc5-0002.patch
linux/kernel-patches/linux-2.6.38-rc5-0003.patch
linux/kernel-patches/linux-2.6.38-rc5-0004.patch
linux/kernel-patches/linux-2.6.38-rc5-0005.patch
linux/kernel-patches/linux-2.6.38-rc5-0006.patch

5. Make sure previous kernel bits have been removed:
rm -rf  output/toolchain/linux-2.6.38-rc5 ; rm
-rf output/build/linux-2.6.38-rc5

6. "make"


After a while you'll see it extracting the kernel and then applying the
patches....although I've not tried to boot the resulting uImage yet....but
my boards ".._defconfig" was there and the build appeared to go through.


Thanks for the help!!!



On Fri, Mar 4, 2011 at 10:45 PM, ANDY KENNEDY <ANDY.KENNEDY@adtran.com>wrote:

> > Could someone write a HOWTO?
> > I mean:
> > step 0): "I have kernel.xxx.yy.zzz directory unpacked AND a set of
> > patches (that applies correctly from kernel root) patch.00xx.patch"
> > step 1): where should I put (link?) kernel source?,
> > step 2): where should I put patches?.
> > step 3): how do I inform buildroot about patches?
>
> It isn't that "dumbed down" but how about:
>
> buildroot/docs/patches.html  <Linux kernel section>?
>
> Andy
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110304/9496d28d/attachment.html>
