From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Wed, 01 Mar 2017 22:54:24 -0300
Subject: [Buildroot] [PATCH 5/5] support/testing: add toolchain tests
References: <1486467363-19881-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <58b77b501a321_1c373ff16aa2fe54927a@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Tue, Feb 07, 2017 at 09:36 AM, Thomas Petazzoni wrote:

[snip]
> +++ b/support/testing/tests/toolchain/test_external.py
> @@ -0,0 +1,77 @@
> +import os
> +
> +import infra
> +
> +class TestExternalToolchainSourceryArmv4(infra.basetest.BRTest):
> +    config = \
> +"""
> +BR2_arm=y
> +BR2_arm920t=y
> +BR2_TOOLCHAIN_EXTERNAL=y
> +BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM=y
> +BR2_TARGET_ROOTFS_CPIO=y
> +# BR2_TARGET_ROOTFS_TAR is not set
> +"""
[snip]
> +        self.emulator.login("root")

Shouldn't it be like this?
        self.emulator.login()

> +
> +class TestExternalToolchainSourceryArmv5(infra.basetest.BRTest):
[snip]
> +        self.emulator.login("root")

Same here.

> +
> +class TestExternalToolchainSourceryArmv7(infra.basetest.BRTest):
[snip]
> +        self.emulator.login("root")

Same here.

Regards,
Ricardo
