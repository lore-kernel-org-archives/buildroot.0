Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB601C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 14:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85A4982279;
	Sat,  4 Nov 2023 14:28:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85A4982279
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SupYYhZwxBKK; Sat,  4 Nov 2023 14:28:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A37668226D;
	Sat,  4 Nov 2023 14:28:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A37668226D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1086F1BF37C
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 14:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D64A4409C8
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 14:28:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D64A4409C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2z6psn2of_60 for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 14:28:40 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 42C2F40127
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 14:28:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42C2F40127
Received: by mail.gandi.net (Postfix) with ESMTPSA id 28A27240005;
 Sat,  4 Nov 2023 14:28:38 +0000 (UTC)
Date: Sat, 4 Nov 2023 15:28:37 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231104152837.0d43559a@windsurf>
In-Reply-To: <20231011092250.3739529-2-adam.duskett@amarulasolutions.com>
References: <20231011092250.3739529-1-adam.duskett@amarulasolutions.com>
 <20231011092250.3739529-2-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699108118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R9l2S3k/pmr1dothOcRFXRZjIzSO+y2/H6IibAr+Lpk=;
 b=oLJL11QQhIevrChKBkxvdkT4qw0h+QYy1ferZ4cUQQu5BFvE0JedlJnWJMIrUU4+zSQT/o
 6l5x87vNgSIO8UGi89BxBsu8V3vEq2Afozr9vYi7WjRJR3ceBM+LMHT6tHaBtFZ/C4Gfzh
 pMqrKINGj6pkGAqEoqecM+c7GDCjRK8LevwCWCongFy0IQR6HHdaTTiT2PG56NUT1lBDQc
 e9ywWvZ8lvpgcEWOReOgd2BqlxCEDYSHPqvPafsZwSKrEM1jqb2E3zpOvoK+Bnxzo0ythR
 MEdLef1MBUOxjNcj3eMj5tZjfBR3CzzLj0u5NzcWvsahyTHLMpgW8jv2Jf8x5w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oLJL11QQ
Subject: Re: [Buildroot] [PATCH 2/2]
 support/testing/tests/package/test_firewalld.py: new test
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Adam,

On Wed, 11 Oct 2023 11:22:50 +0200
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> diff --git a/support/testing/tests/package/test_firewalld.py b/support/testing/tests/package/test_firewalld.py
> new file mode 100644
> index 0000000000..4b0282d3e4
> --- /dev/null
> +++ b/support/testing/tests/package/test_firewalld.py
> @@ -0,0 +1,94 @@
> +"""Test firewalld for both systemd and sysvinit."""
> +import os
> +import infra.basetest
> +
> +
> +class TestFirewalldSystemd(infra.basetest.BRTest):
> +    """Build the kernel as firewalld requires several the nftable options."""
> +
> +    __test__ = True

Are you sure this is needed?

> +    config: str = """

Please use:

	config = """

> +        BR2_arm=y
> +        BR2_cortex_a9=y
> +        BR2_ARM_ENABLE_VFP=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> +        BR2_PER_PACKAGE_DIRECTORIES=y

We typically don't user per-package directories for runtime tests. I
don't want to see a random set of runtime tests use PPD, and another
random set not use PPD.

> +    def test_run(self):
> +        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        kernel_file = os.path.join(self.builddir, "images", "zImage")
> +        dtb_file = os.path.join(self.builddir, "images", "vexpress-v2p-ca9.dtb")
> +        self.emulator.boot(arch="armv7",
> +                           kernel=kernel_file,
> +                           kernel_cmdline=["console=ttyAMA0,115200"],
> +                           options=[
> +                               "-initrd", cpio_file,
> +                               "-dtb", dtb_file,
> +                               "-M", "vexpress-a9"
> +                           ])
> +        # It takes quite some time for the system to boot with firewalld,
> +        self.emulator.timeout_multiplier *= 10

I don't think we should modify the timeout_multiplier. The
timeout_multiplier is meant to be provided on the command line, to
adjust for the slowness of the local machine.

Instead I would prefer that self.emulator.login() gets a timeout
argument to override the current value of 60 seconds.

support/testing/tests/init/test_systemd_selinux.py and
support/testing/tests/package/test_lxc.py should be fixed as well, as
they weak the timeout_multiplier.

Also support/testing/tests/package/test_python_django.py is wrong,
because it does:

        timeout = 35 * self.emulator.timeout_multiplier
[...]
        self.assertRunOk(cmd, timeout=timeout)

This gets re-multiplied by self.emulator.timeout_multiplier in
self.emulator.run().

Could you rework this?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
