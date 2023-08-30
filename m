Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8520C83F01
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 20:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D1BE417F0;
	Wed, 30 Aug 2023 20:37:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D1BE417F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zxErXNRYKvt0; Wed, 30 Aug 2023 20:37:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9347A417F5;
	Wed, 30 Aug 2023 20:37:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9347A417F5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 657981BF40B
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 20:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BA3461015
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 20:37:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BA3461015
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dwk8tFvq9oWK for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 20:37:38 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C3C5960EA5
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 20:37:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3C5960EA5
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9D38B1BF207;
 Wed, 30 Aug 2023 20:37:35 +0000 (UTC)
Date: Wed, 30 Aug 2023 22:37:34 +0200
To: Sebastian Weyer <sebastian.weyer@smile.fr>
Message-ID: <20230830223734.65df730e@windsurf>
In-Reply-To: <20230308131554.642965-3-sebastian.weyer@smile.fr>
References: <20230308131554.642965-1-sebastian.weyer@smile.fr>
 <20230308131554.642965-3-sebastian.weyer@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693427856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OdXDGUovD0Oa4dVBUnRr6U5ectWMQ5TbTfy/LMLKdss=;
 b=IpMdyZp1bitkCEWlLPOQ2zNIhSQLuJLh4UvxfhGSagXgNF8UmaiMP3DkvW6LeJlctQQ1Ft
 QPDMTFREAEWu07Z3RwtQSQF6NfT1WyObaHQnYDIbIjQRp2joWNJcrDQiGwad8YZG8OQXRY
 4QEwxlzZYUNYedC1kw9tv6VBJ4/w9VjHoSE+JFeuUBlr2xMmh83gk6vM9N/1Vu/gHZEON2
 VUS+LMIwAFL5FPBzGtw7FmKwiMbPkghK7JaOxRDsq7dTgsZwPwTAz/mwBIQTvJbUDTPxxq
 2bwyfscsphJnb2N9GhNQ/lgnHhZHfuaTPcxK1w9fYq3wXOYGgFmZqnGdFjOzjw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IpMdyZp1
Subject: Re: [Buildroot] [PATCH v6 3/3]
 support/testing/tests/package/test_nu.py: New runtime test
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
Cc: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  8 Mar 2023 14:15:53 +0100
Sebastian Weyer <sebastian.weyer@smile.fr> wrote:

> +class TestNuBase(infra.basetest.BRTest):
> +    # infra.basetest.BASIC_TOOLCHAIN_CONFIG cannot be used as it doesn't
> +    # support a host rustc which is necessary for nushell
> +    config = \
> +        """
> +        BR2_arm=y
> +        BR2_cortex_a9=y
> +        BR2_ARM_ENABLE_NEON=y
> +        BR2_ARM_ENABLE_VFP=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> +        BR2_SYSTEM_DHCP="eth0"
> +        BR2_PACKAGE_NUSHELL=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        """
> +
> +    def login(self):
> +        img = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        self.emulator.boot(arch="armv7",
> +                           kernel="builtin",
> +                           options=["-initrd",img])
> +        self.emulator.login()
> +
> +# load a script on the target and check if it is executed correctly by nu
> +class TestNu(TestNuBase):
> +    config_sample_scripts = \
> +        """
> +        BR2_ROOTFS_POST_BUILD_SCRIPT="{}"
> +        BR2_ROOTFS_POST_SCRIPT_ARGS="{}"
> +        """.format(infra.filepath("tests/package/copy-sample-script-to-target.sh"),
> +                   "{sample_scripts}")
> +
> +    #simple hello world script found in the nushell doc
> +    sample_scripts = ["tests/package/sample_nu.nu"]
> +
> +    def __init__(self, names):
> +        """Add the scripts to the target in build time."""
> +        super(TestNuBase, self).__init__(names)
> +        scripts = [infra.filepath(s) for s in self.sample_scripts]
> +        self.config += self.config_sample_scripts.format(sample_scripts=" ".join(scripts))
> +
> +    def check_sample_scripts_exist(self):
> +        """Check the scripts were really added to the image."""
> +        scripts = [os.path.basename(s) for s in self.sample_scripts]
> +        cmd = "md5sum " + " ".join(scripts)
> +        _, exit_code = self.emulator.run(cmd)
> +        self.assertEqual(exit_code, 0)
> +
> +    def run_sample_scripts(self):
> +        """Run each script previously added to the image."""
> +        for script in self.sample_scripts:
> +            cmd = "nu " + os.path.basename(script)
> +            self.assertRunOk(cmd)
> +
> +    def test_run(self):
> +        self.login()
> +        self.check_sample_scripts_exist()
> +        self.run_sample_scripts()

This was way too complicated, because you based it on the Python
testing infrastructure that aims at being generic. Here we don't need
to be generic, so it can be as simple as:

import os

import infra.basetest


class TestNu(infra.basetest.BRTest):
    # infra.basetest.BASIC_TOOLCHAIN_CONFIG cannot be used as it doesn't
    # support a host rustc which is necessary for nushell
    config = \
        """
        BR2_arm=y
        BR2_cortex_a9=y
        BR2_ARM_ENABLE_NEON=y
        BR2_ARM_ENABLE_VFP=y
        BR2_TOOLCHAIN_EXTERNAL=y
        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
        BR2_SYSTEM_DHCP="eth0"
        BR2_PACKAGE_NUSHELL=y
        BR2_TARGET_ROOTFS_CPIO=y
        BR2_ROOTFS_POST_BUILD_SCRIPT="{}"
        BR2_ROOTFS_POST_SCRIPT_ARGS="{}"
        """.format(infra.filepath("tests/package/copy-sample-script-to-target.sh"),
                   infra.filepath("tests/package/sample_nu.nu"))

    def test_run(self):
        img = os.path.join(self.builddir, "images", "rootfs.cpio")
        self.emulator.boot(arch="armv7",
                           kernel="builtin",
                           options=["-initrd", img])
        self.emulator.login()
        cmd = "nu sample_nu.nu"
        self.assertRunOk(cmd)

So I adjusted your patch like this and applied to next. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
