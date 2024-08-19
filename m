Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE7AC3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 08:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43845607C9;
	Mon, 19 Aug 2024 08:38:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZyBMPkGS74Zg; Mon, 19 Aug 2024 08:38:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AFC0607DE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AFC0607DE;
	Mon, 19 Aug 2024 08:38:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BF96E1BF3EF
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 08:38:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB8D5607DF
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 08:38:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mk80he7wPDKE for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 08:38:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 95786607DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95786607DE
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 95786607DE
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 08:38:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 656DF1BF204;
 Mon, 19 Aug 2024 08:38:04 +0000 (UTC)
Date: Mon, 19 Aug 2024 10:38:03 +0200
To: Brandon Maier <brandon.maier@collins.com>
Message-ID: <20240819103803.35e5cea1@booty>
In-Reply-To: <20240815-boot-uboot-clean-for-pmufw-v1-2-3f0d9909c0b4@collins.com>
References: <20240815-boot-uboot-clean-for-pmufw-v1-0-3f0d9909c0b4@collins.com>
 <20240815-boot-uboot-clean-for-pmufw-v1-2-3f0d9909c0b4@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724056684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K1h/RRy3hp9OxeRKKapzaNATz9e4SvUL/VNJuJIUl80=;
 b=R9+tHGpwGWWdgFE3vI3jaWsiZLU5ILl5cMfG9fclPd2HoAlKYC2je3kw9SUuo/D1WRODfB
 emJslDceNOKfgBpm4lmtmmt+/hfRcjgd8//HGJgD7QsEsMQ5DThxk/VVTCnQpg7nFAD685
 SCub87txHQKSpsrfzdHqVUm2ywDflydr5pqZURsQZQA0ps0CFHEfLCWiNBBCYE9/xODRu/
 WYILTDccmNRGPTb1tFa+R+fUNVyaq790OB1YYathRuYIjHR+hSGKTjw0IUb08I49UMPOm6
 WkGwiN207gRt/ICHraL5HZMrBzfXEBDXXDFmlg6CD6FcCscsS7J6ZhpoM909xg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=R9+tHGpw
Subject: Re: [Buildroot] [PATCH 2/2] boot/uboot: use $(TARGET_OBJCOPY) for
 ZynqMP pmufw.elf
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Neal Frager <neal.frager@amd.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Brandon,

On Thu, 15 Aug 2024 14:22:31 +0000
Brandon Maier <brandon.maier@collins.com> wrote:

> Converting the pmufw.elf to a binary works with any objcopy, regardless
> if it's from the host or cross-compiler. Prefer to use the
> $(TARGET_OBJCOPY) as it's always available and reproducible.
> 
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> ---
>  boot/uboot/uboot.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 9de0776ace..08493996e5 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -463,7 +463,7 @@ endif #BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
>  ifeq ($(suffix $(UBOOT_ZYNQMP_PMUFW_PATH)),.elf)
>  UBOOT_ZYNQMP_PMUFW_PATH_FINAL = $(basename $(UBOOT_ZYNQMP_PMUFW_PATH)).bin
>  define UBOOT_ZYNQMP_PMUFW_CONVERT
> -	objcopy -O binary -I elf32-little $(UBOOT_ZYNQMP_PMUFW_PATH) $(UBOOT_ZYNQMP_PMUFW_PATH_FINAL)
> +	$(TARGET_OBJCOPY) -O binary -I elf32-little $(UBOOT_ZYNQMP_PMUFW_PATH) $(UBOOT_ZYNQMP_PMUFW_PATH_FINAL)

As I wrote earlier today (way after you sent this patch, so surely not
blaming you!) a short comment would help understand why we are using
the "wrong" objcopy.

E.g.:

 # objcopy is arch-agnostic so we can use $(TARGET_OBJCOPY) in lack of
 # a microblaze objcopy

But this can be added later, or in v2 in case you send one, so:

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
