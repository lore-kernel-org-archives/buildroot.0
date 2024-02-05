Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850A6C4829A
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 22:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BDFB418AC;
	Mon,  5 Feb 2024 22:20:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BDFB418AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B-n30JO3QZfm; Mon,  5 Feb 2024 22:20:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48DDD418A9;
	Mon,  5 Feb 2024 22:20:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48DDD418A9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 21FFE1BF319
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 22:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EEB3B40198
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 22:19:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EEB3B40198
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gxPMbhzecV4r for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 22:19:59 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7F14440022
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 22:19:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F14440022
Received: by mail.gandi.net (Postfix) with ESMTPSA id C6A611C0002;
 Mon,  5 Feb 2024 22:19:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rX7Ji-00DEwq-2Y;
 Mon, 05 Feb 2024 23:19:54 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
References: <20240124222523.16703-1-ju.o@free.fr>
Date: Mon, 05 Feb 2024 23:19:54 +0100
In-Reply-To: <20240124222523.16703-1-ju.o@free.fr> (Julien Olivain's message
 of "Wed, 24 Jan 2024 23:25:23 +0100")
Message-ID: <8734u6a705.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add usbutils runtime
 test
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > Signed-off-by: Julien Olivain <ju.o@free.fr>
 > ---
 > Patch tested on branch master at commit 7a59c3a with commands:

 >     make check-package
 >     ...
 >     0 warnings generated

 >     support/testing/run-tests \
 >         -d dl -o output_folder \
 >         tests.package.test_usbutils
 >     ...
 >     OK
 > ---
 >  DEVELOPERS                                    |  2 +
 >  .../testing/tests/package/test_usbutils.py    | 60 +++++++++++++++++++
 >  .../test_usbutils/linux-usbutils.fragment     |  2 +
 >  3 files changed, 64 insertions(+)
 >  create mode 100644 support/testing/tests/package/test_usbutils.py
 >  create mode 100644 support/testing/tests/package/test_usbutils/linux-usbutils.fragment

 > diff --git a/DEVELOPERS b/DEVELOPERS
 > index f5b04937b6..5a5ce47d73 100644
 > --- a/DEVELOPERS
 > +++ b/DEVELOPERS
 > @@ -1814,6 +1814,8 @@ F:	support/testing/tests/package/test_screen.py
 >  F:	support/testing/tests/package/test_stress_ng.py
 >  F:	support/testing/tests/package/test_tcl.py
 >  F:	support/testing/tests/package/test_tcl/
 > +F:	support/testing/tests/package/test_usbutils.py
 > +F:	support/testing/tests/package/test_usbutils/
 >  F:	support/testing/tests/package/test_weston.py
 >  F:	support/testing/tests/package/test_weston/
 >  F:	support/testing/tests/package/test_xz.py
 > diff --git a/support/testing/tests/package/test_usbutils.py b/support/testing/tests/package/test_usbutils.py
 > new file mode 100644
 > index 0000000000..9a5484d5e6
 > --- /dev/null
 > +++ b/support/testing/tests/package/test_usbutils.py
 > @@ -0,0 +1,60 @@
 > +import os
 > +
 > +import infra.basetest
 > +
 > +
 > +class TestUsbUtils(infra.basetest.BRTest):
 > +    # A specific configuration is needed for testing usbutils, to
 > +    # enable USB 2.0 support in the Kernel.
 > +    linux_fragment = \
 > +        infra.filepath("tests/package/test_usbutils/linux-usbutils.fragment")
 > +    config = \
 > +        f"""
 > +        BR2_aarch64=y
 > +        BR2_TOOLCHAIN_EXTERNAL=y
 > +        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 > +        BR2_LINUX_KERNEL=y
 > +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 > +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.73"
 > +        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 > +        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
 > +        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{linux_fragment}"
 > +        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 > +        BR2_PACKAGE_EUDEV=y
 > +        BR2_PACKAGE_USBUTILS=y
 > +        BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 > +        BR2_TARGET_ROOTFS_CPIO=y
 > +        BR2_TARGET_ROOTFS_CPIO_GZIP=y
 > +        # BR2_TARGET_ROOTFS_TAR is not set
 > +        """
 > +
 > +    def test_run(self):
 > +        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
 > +        kern = os.path.join(self.builddir, "images", "Image")
 > +        # We add a USB keyboard and mouse devices for the test.
 > +        self.emulator.boot(arch="aarch64",
 > +                           kernel=kern,
 > +                           kernel_cmdline=["console=ttyAMA0"],
 > +                           options=["-M", "virt", "-cpu", "cortex-a57", "-m", "256M",
 > +                                    "-initrd", img,
 > +                                    "-device", "usb-ehci,id=ehci",
 > +                                    "-device", "usb-kbd,bus=ehci.0",
 > +                                    "-device", "usb-mouse,bus=ehci.0"])
 > +        self.emulator.login()
 > +
 > +        # Check the program can execute. We also check the version
 > +        # string to make sure we have the usbutils version. The
 > +        # BusyBox lsusb ignores arguments.
 > +        output, exit_code = self.emulator.run("lsusb --version")
 > +        self.assertEqual(exit_code, 0)
 > +        self.assertTrue(output[0].startswith("lsusb (usbutils)"))
 > +
 > +        # Test few simple and common invocations
 > +        self.assertRunOk("lsusb")
 > +        self.assertRunOk("lsusb --tree")
 > +        self.assertRunOk("lsusb --verbose")
 > +        # 1d6b:0002 is Linux Foundation 2.0 root hub
 > +        # it should be present. lsusb return an error if no device
 > +        # is found.
 > +        self.assertRunOk("lsusb -d 1d6b:0002")
 > +        self.assertRunOk("usbhid-dump")

It was not directly obvious why this would not fail until I noticed that
you configure qemu to emulate a USB keyboard and a mouse, so I added a
comment about this and applied - Thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
