Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D8DC4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 16:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E50940180;
	Wed,  1 Nov 2023 16:43:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E50940180
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gN5jeGWq2laG; Wed,  1 Nov 2023 16:43:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96650401CC;
	Wed,  1 Nov 2023 16:43:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96650401CC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 26F321BF841
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 16:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5F2484BFF
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 16:43:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5F2484BFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xFXZKrfG7NOF for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 16:43:37 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 898CF84BFE
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 16:43:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 898CF84BFE
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4D52C40006;
 Wed,  1 Nov 2023 16:43:35 +0000 (UTC)
Date: Wed, 1 Nov 2023 17:43:34 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231101174334.2b6a1e77@windsurf>
In-Reply-To: <20231010164554.2954023-2-adam.duskett@amarulasolutions.com>
References: <20231010164554.2954023-1-adam.duskett@amarulasolutions.com>
 <20231010164554.2954023-2-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698857015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PjK6dwVx4DfGnCmQlkF8Yk10aAN24fVCUBjS8s/saDU=;
 b=JNC0kkg/bWf8jX6JcQCZzT9DC7IVEM7f8mYq14/LJSoLbohST7jjHKY1ZyA1L5ekrhw+Gt
 SK290d4uHP7QfjJkkd8IYJfr7Lbqt+mHLqBh04qD6WcGk6D8okcVz/K7Y7VxOm/602LfP7
 +A2xfT4xp2uTKwE6DWPHJJoPHdsj+xZm3VIW8bDMqtjJu9N8MVx8W/llY/L1QBDfgmO4Z+
 jARzPRvF7MFEAN3ZDnuLT8G+A98WEMsgT83zE8XpnCDO13vsnUkA6VreLVowCfau0Rr7hA
 XkQciceG54168SC/YRv84eV72EjxySNkDBdKYliav9JKlPwtP4sA5AACRQxwRA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JNC0kkg/
Subject: Re: [Buildroot] [PATCH 2/2]
 support/testing/tests/package/test_postgresql.py: new test
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Tue, 10 Oct 2023 18:45:54 +0200
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> +class TestPostgreSQLInitd(infra.basetest.BRTest):

Initd is not a very good name. To me Initd doesn't mean
"Sysvinit/Busybox init".

I see the polkit tests already use that naming, though.

> +    config: str = """

Any reason to use this syntax? I don't have anything against it, but
it's not consistent with how we define the configuration in other test
cases, and I like consistency.

> +        BR2_arm=y
> +        BR2_cortex_a9=y
> +        BR2_ARM_ENABLE_VFP=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y

Any reason not to use BASIC_TOOLCHAIN_CONFIG instead?

> +        BR2_PER_PACKAGE_DIRECTORIES=y

Not needed.

> +        BR2_PACKAGE_POSTGRESQL=y
> +        BR2_TARGET_ROOTFS_EXT2=y
> +        BR2_TARGET_ROOTFS_EXT2_4=y
> +        BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def test_run(self):
> +        img = os.path.join(self.builddir, "images", "rootfs.ext2")
> +        self.emulator.boot(
> +            arch="armv7",

This would have to be changed to arvm5 if you use the
BASIC_TOOLCHAIN_CONFIG.

Long term, maybe we could consider changing the BASIC_TOOLCHAIN_CONFIG
to use ARMv7, would perhaps be more sensible than the aging ARMv5
architecture.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
