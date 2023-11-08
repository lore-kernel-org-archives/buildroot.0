Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB57C4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 22:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBB9A60B5D;
	Wed,  8 Nov 2023 22:21:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBB9A60B5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xjXifNqKAnQ5; Wed,  8 Nov 2023 22:21:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CE4060AFC;
	Wed,  8 Nov 2023 22:21:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CE4060AFC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 896791BF40B
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 22:21:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E1A260AFC
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 22:21:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E1A260AFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RrYkQ2BrGqqc for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 22:20:59 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D666060A7E
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 22:20:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D666060A7E
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0B9F240002;
 Wed,  8 Nov 2023 22:20:55 +0000 (UTC)
Date: Wed, 8 Nov 2023 23:20:55 +0100
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20231108232055.1bdf92f1@windsurf>
In-Reply-To: <ZQgJZxHHCj8iLCdW@waldemar-brodkorb.de>
References: <ZQgJZxHHCj8iLCdW@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699482056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n80NtxJD+6q/+XUSRQdXyVmCmmbt6vp6d2zcWD5om3Q=;
 b=iXYShB53ZT9vZQr1dH4jiRYmPD8vH8G/6nFBEaDxHKfbdtpHD3Ry8p9lfqt5ZHYK/D9dkQ
 /aegSPBr5kHKG/3NxC3LbdsyWjU4M5D7j3pmLjkE2wVAM4tX5I7u3mXlOos/lHT3hApRG4
 iTowWq2vuyYNVXNiTLFY0wtgzjlR9aqM9FpwZx/d/8NIwmoLlTG0Kw8FmitchX0mNseyas
 S3KbVDcPQIj70/fd+02rYxXNQNPk1ENY8l737TjXIXHDyoSMLABVqc0+NOL022ayXVpiAJ
 b0WjsxQNyKc5taZ0yu4wsohPZBgWyPYPxoPK3AQfk+on1z7i373hDY0w+bTawg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iXYShB53
Subject: Re: [Buildroot] [PATCH] support/testing/tests/package/test_ruby.py:
 new runtime test
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

Hello Waldmar,

On Mon, 18 Sep 2023 10:25:11 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  support/testing/tests/package/test_ruby.py | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 support/testing/tests/package/test_ruby.py

The entry in the DEVELOPERS file was missing.

> diff --git a/support/testing/tests/package/test_ruby.py b/support/testing/tests/package/test_ruby.py
> new file mode 100644
> index 0000000000..bedd9afb1c
> --- /dev/null
> +++ b/support/testing/tests/package/test_ruby.py
> @@ -0,0 +1,42 @@
> +import os
> +
> +import infra.basetest
> +
> +
> +class TestRubyBase(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +    interpreter = "ruby"
> +
> +    def login(self):
> +        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        self.emulator.boot(arch="armv5",
> +                           kernel="builtin",
> +                           options=["-initrd", cpio_file])
> +        self.emulator.login()
> +
> +class TestRuby(TestRubyBase):

With just one test, there really wasn't a good reason to split into two
classes. So I've re-grouped the whole thing into just one class. We can
always split things later if we get more tests, and we need to
factorize some parts.

Applied with those changes, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
