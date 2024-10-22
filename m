Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB7DCDD0EA
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 20:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7001D60604;
	Tue, 22 Oct 2024 20:50:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TIkndXe0XMGA; Tue, 22 Oct 2024 20:50:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C91860640
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C91860640;
	Tue, 22 Oct 2024 20:50:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F25559F4
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58A2D40182
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:50:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r6D5GqOL70sx for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 20:50:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 13E9A40106
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13E9A40106
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 13E9A40106
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:50:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EFA271BF204;
 Tue, 22 Oct 2024 20:50:41 +0000 (UTC)
Date: Tue, 22 Oct 2024 22:50:40 +0200
To: Niklas Cassel via buildroot <buildroot@buildroot.org>
Cc: Niklas Cassel <niklas.cassel@wdc.com>, Niklas Cassel
 <cassel@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, Kilian Zinnecker
 <kilian.zinnecker@mail.de>
Message-ID: <20241022225040.09c4ca7c@windsurf>
In-Reply-To: <20241016132443.3859149-5-niklas.cassel@wdc.com>
References: <20241016132443.3859149-1-niklas.cassel@wdc.com>
 <20241016132443.3859149-5-niklas.cassel@wdc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729630242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tyu0QnB3HGScPaZdH4BMyOrTqrAwoIL+cD1xAj6V7q4=;
 b=C3XClMLkPn/hWFZEAFnHQAvySmRvhRXWFm5pUxNnwVrZLdKuAIZGRqWSxl200W6B9YAaBE
 aEkhuVUftHwtV4qq3F4l5EcgCU4sVM121CC7BVL3se3ze7ysmWzdDB/NAv6mzyDnRo2EIm
 0P5bTW0XxQAj/BXvwa2TJ2sxsxZSWkHXN516dnL3yd8RqnH7J/XpMC/vORNejmuvexcVCv
 ZtF7yVewH6LVrGm7LNF7NdnIrK0lhNpaix3tpxCv25kSBKVvWiVuvzVDbKlUxqf5n1D4bV
 oKaOJCahSA9oKEkzSVjYjcHHQzDrd9hsycDbhA92hRD7BpGf//NzyDX2JDToRg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=C3XClMLk
Subject: Re: [Buildroot] [PATCH v3 4/4] configs/rock5b: enable uboot-env on
 the SD card
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Niklas,

On Wed, 16 Oct 2024 15:24:43 +0200
Niklas Cassel via buildroot <buildroot@buildroot.org> wrote:

> +	partition uboot-env {
> +		offset = 16M
> +		size = 64K
> +	}
> +
>  	partition rootfs {
>  		partition-type-uuid = root-arm64
>  		image = "rootfs.ext2"
> +		bootable = true
>  	}
>  }
> diff --git a/board/radxa/rock5b/u-boot.fragment b/board/radxa/rock5b/u-boot.fragment
> new file mode 100644
> index 0000000000..e332bc0c79
> --- /dev/null
> +++ b/board/radxa/rock5b/u-boot.fragment
> @@ -0,0 +1,5 @@
> +CONFIG_SYS_MMC_ENV_DEV=1
> +CONFIG_ENV_SIZE=0x10000
> +CONFIG_ENV_OFFSET=0x1000000

Hardcoding an offset isn't super nice. Could you try using
CONFIG_SYS_MMC_ENV_PART instead? It isn't clear to me how it interacts
CONFIG_ENV_OFFSET.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
