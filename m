Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CB9C46CD2
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 11:09:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1678416D6;
	Sun, 24 Dec 2023 11:09:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1678416D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iWXYsqIlgNne; Sun, 24 Dec 2023 11:09:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46DE1416D0;
	Sun, 24 Dec 2023 11:09:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46DE1416D0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 339AD1BF5D7
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 11:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2E1E6072A
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 11:09:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2E1E6072A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CSjoSH3a0pjd for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 11:09:41 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4A0176061B
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 11:09:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A0176061B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3CBD61BF203;
 Sun, 24 Dec 2023 11:09:37 +0000 (UTC)
Date: Sun, 24 Dec 2023 12:09:36 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231224120936.43969775@windsurf>
In-Reply-To: <20231203041841.492885-4-adam.duskett@amarulasolutions.com>
References: <20231203041841.492885-1-adam.duskett@amarulasolutions.com>
 <20231203041841.492885-4-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703416177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fsgvrFnnaStY7Grtf9VAdolzozNetHJewvR/kqps5TI=;
 b=iDAF4JFaNSJNz7jgmfrPMQjpFcEbvnx/V33MkpB12DIXYqh+74pJ3AgWkpGqBYp91UPzfg
 XbKP8Mm8q00RV5TCa1dLEwZRGnxAEI/euHmwtOZoGwvWW/L+M2JvNVGc54C7Xh72pdPYIW
 hSRhWv4FETiTKOw49j+lFjYEotJ/8HAnLETggk2kdKun00WwM9ExnDjIavpHnOGhRaQtjA
 g63qh/i7N9zmf3vXxfrZMN16pilngqN/h/1T+LzUB06njHGCjHi4LhcXVMSpMuwLFMLIAw
 H++CUNafzsMufE3X14kK8xgUjm2Zg7RjuwRgYgdexJ/oO1XxIKXtBbLwbsWjcg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iDAF4JFa
Subject: Re: [Buildroot] [PATCH 4/6]
 support/testing/tests/package/test_google_breakpad.py: new runtime test
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Julien Olivain <ju.o@free.fr>, Pascal Huerst <pascal.huerst@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Julien (Olivain, there is some question for you towards the end).

On Sat,  2 Dec 2023 21:18:37 -0700
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> Add a test that does the following:
> 
>   - Builds the example code found here:
>     https://chromium.googlesource.com/breakpad/breakpad/+/master/docs/linux_starter_guide.md
> 
>   - runs the google-breakpad-example program and checks to ensure the exit
>     code is 139 (SIGSEGV)
> 
>   - Runs the minidump_stackwalk tool against the google-breakpad-example
>     symbols and checks for the following:
>     - That the google-breakpad-examples symbols loaded properly.
>     - That the crash() method in the google-breakpad-example.cpp file is
>       printed.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

Very nice test case! Clearly not the simplest test case. I have some
suggestions below.


> diff --git a/support/testing/tests/package/br2-external/google-breakpad/package/google-breakpad-example/google-breakpad-example.mk b/support/testing/tests/package/br2-external/google-breakpad/package/google-breakpad-example/google-breakpad-example.mk
> new file mode 100644
> index 0000000000..17ddd68716
> --- /dev/null
> +++ b/support/testing/tests/package/br2-external/google-breakpad/package/google-breakpad-example/google-breakpad-example.mk
> @@ -0,0 +1,24 @@
> +################################################################################
> +#
> +# google-breakpad-example
> +#
> +################################################################################
> +
> +GOOGLE_BREAKPAD_EXAMPLE_DEPENDENCIES = google-breakpad
> +
> +define GOOGLE_BREAKPAD_EXAMPLE_BUILD_CMDS
> +	$(INSTALL) -D $(GOOGLE_BREAKPAD_EXAMPLE_PKGDIR)/google-breakpad-example.cpp \
> +		$(@D)/google-breakpad-example.cpp

Trivial: I think this particular command should go into
GOOGLE_BREAKPAD_EXAMPLE_EXTRACT_CMDS.

> +
> +	$(TARGET_MAKE_ENV) $(TARGET_CXX) $(TARGET_CPPFLAGS) \
> +		-I$(STAGING_DIR)/usr/include/breakpad \
> +		$(@D)/google-breakpad-example.cpp \
> +		$(STAGING_DIR)/usr/lib/libbreakpad_client.a -o $(@D)/google-breakpad-example

Perhaps you can use -lbreakpad_client instead of
$(STAGING_DIR)/usr/lib/libbreakpad_client.a ?

> diff --git a/support/testing/tests/package/br2-external/google-breakpad/post-build.sh b/support/testing/tests/package/br2-external/google-breakpad/post-build.sh
> new file mode 100755
> index 0000000000..6778aae339
> --- /dev/null
> +++ b/support/testing/tests/package/br2-external/google-breakpad/post-build.sh
> @@ -0,0 +1,5 @@
> +#!/usr/bin/env bash
> +set -e
> +
> +# We are going to run the minidump_stackwalk tool in the qemu instance.
> +cp -rf "${STAGING_DIR}"/usr/share/google-breakpad-symbols "${TARGET_DIR}"/root/

See below, I have a suggestion that I believe would make this
post-build script not necessary.

> diff --git a/support/testing/tests/package/test_google_breakpad.py b/support/testing/tests/package/test_google_breakpad.py
> new file mode 100644
> index 0000000000..646bdf6ee3
> --- /dev/null
> +++ b/support/testing/tests/package/test_google_breakpad.py
> @@ -0,0 +1,50 @@
> +import os
> +import infra.basetest
> +
> +
> +class GoogelBreakPadBase(infra.basetest.BRTest):

            ^^^ minor typo here

> +    br2_external = [infra.filepath("tests/package/br2-external/google-breakpad")]
> +    config = \
> +        """
> +        BR2_arm=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> +        BR2_ENABLE_DEBUG=y
> +        BR2_ROOTFS_POST_BUILD_SCRIPT="support/testing/tests/package/br2-external/google-breakpad/post-build.sh"
> +        BR2_STRIP_EXCLUDE_FILES="google-breakpad-example"

So the target exclude needs to have debugging symbols for
google-breakpad to work? I thought the whole idea was precisely that it
allowed to avoid the need for having debugging symbols on the target? I
must admit I am not very familiar with google-breakpad, so I might
totally wrong on this.

> +        BR2_GOOGLE_BREAKPAD_ENABLE=y
> +        BR2_GOOGLE_BREAKPAD_INCLUDE_FILES="/usr/bin/google-breakpad-example"
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        BR2_PACKAGE_GOOGLE_BREAKPAD=y
> +        BR2_PACKAGE_GOOGLE_BREAKPAD_TOOLS=y

With my proposal below, the tools on the target would not be needed.

> +        BR2_PACKAGE_GOOGLE_BREAKPAD_EXAMPLE=y
> +        """
> +
> +    def check_google_breakpad(self):
> +        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        self.emulator.boot(arch="armv5",
> +                           kernel="builtin",
> +                           options=["-initrd", cpio_file])
> +        self.emulator.login()
> +        output, exit_code = self.emulator.run("google-breakpad-example")
> +
> +        # google-breakpad-example is expected to exit SIGSEGV.
> +        self.assertEqual(exit_code, 139)
> +        dump_path = output[0].split(' ')[2]
> +        output, exit_code = self.emulator.run(f"minidump_stackwalk {dump_path} /root/google-breakpad-symbols/")
> +        self.assertEqual(exit_code, 0)
> +
> +        # Ensure that minidump_stackwalk properly loaded the google-breakpad-example symbols
> +        if not any("Loading symbols for module /usr/bin/google-breakpad-example" in line for line in output):
> +            self.fail("Failed to load symbols from /usr/bin/google-breakpad-example")
> +
> +        # Ensure that the crash method is found and printed by minidump_stackwalk
> +        if not any("google-breakpad-example!crash()" in line for line in output):
> +            self.fail("google-breakpad-example!crash() not in minidump_stackwalk output!")

I think the analysis of the dump should happen on the host rather than
the target, because this is really the primary use-case for
google-breakpad: your target application is linked with
google-breakpad, so that when it crashes it creates a minidump, which
you can then retrieve for off-line analysis with the debugging symbols
that you have kept around in your build system.

So after the application is run and has crashed, I believe we should
transfer the crash data back to the host, and then use
minidump_stackwalk on the host.

As we discussed, I am just not sure what would be the right mechanism
to exchange data between the target system running in Qemu, and the
host running the test suite. Our default Busybox configuration doesn't
enable httpd or ftpd. One option would be dropbear of course. This
would in all cases require networking between host and target.

Julien: do you have some suggestions here?

> +class TestGoogleBreakPadGlibC(GoogelBreakPadBase):
> +    config = GoogelBreakPadBase.config + "BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE=y"
> +
> +    def test_run(self):
> +        self.check_google_breakpad()

Since for now we're keeping breakpad glibc-only, let's keep things
simple and have the main test case use a glibc toolchain. We can always
rework this if uclibc (or musl) support gets enabled at some point in
the future.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
