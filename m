Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE648C3ABDA
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 10:07:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5073405A7;
	Sat, 17 May 2025 10:07:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wk8RnpFQcFsi; Sat, 17 May 2025 10:07:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2CA9405B3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2CA9405B3;
	Sat, 17 May 2025 10:07:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 500ED223
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4177E819E6
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:07:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zezPU6xBQl4k for <buildroot@buildroot.org>;
 Sat, 17 May 2025 10:07:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8DA9581466
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DA9581466
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8DA9581466
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:07:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 83AB51C05C0; Sat, 17 May 2025 12:07:19 +0200 (CEST)
Message-ID: <623ef776-defa-4ef8-a17d-cbfa7ab3970c@rnout.be>
Date: Sat, 17 May 2025 12:07:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1747241900.git.yann.morin.1998@free.fr>
 <02ca8ddc5778a98a4d3b1b12b3947625e8bcad53.1747241900.git.yann.morin.1998@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <02ca8ddc5778a98a4d3b1b12b3947625e8bcad53.1747241900.git.yann.morin.1998@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747476439; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=OCQfMkXxJG8skH4WDPOYNhR45VvzvM1EyUREoCUwDdY=;
 b=pLIufEuXMiiONqfl93gN76MdFzGd+ACYOeeY3bFWkXOSXCx1twtMiopf4JOtM6Lw8EgtgW
 cK1OcvT4sX1u0pJThzzCMXix9L75DPUUUiSGNPRu5FjnMnCzd/H+i/sJQHBW3T7FR4f/yc
 PnyNeLxkR42d3T8AwfWtr1JxTn00bMSFiusE7QlyAAjCptufmysQK+gpPcgRUntDNPhkJT
 SvksB6SAN+EyI194ATebUvopv+nY+SnjZxS5Ol/HnsMjqgJxiJaFNufhEgHcI6Ti+mUhe2
 AbXqBlkeAlYi/gWM555BFOPC/QaBYwpQBpl6nhwGH3H90FmFXrfep352vjy9Dg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=pLIufEuX
Subject: Re: [Buildroot] [PATCH 02/13] system: drop superfluous negative
 condition for default PATH
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/05/2025 18:58, Yann E. MORIN wrote:
> Kconfig applies the default values in the order they are defined, and
> stops at the first which condition is met. In this case, the two
> conditions are mutually exclusive, so we can drop the second one. This
> also makes it obvious there actually is a default value.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Acked-by: Arnout Vandecappelle <arnout@mind.be>

> ---
>   system/Config.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/system/Config.in b/system/Config.in
> index f747fdbc56..2499dc8208 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -534,7 +534,7 @@ endif # BR2_ROOTFS_SKELETON_DEFAULT
>   config BR2_SYSTEM_DEFAULT_PATH
>   	string "Set the system's default PATH"
>   	default "/usr/bin:/usr/sbin" if BR2_ROOTFS_MERGED_USR
> -	default "/bin:/sbin:/usr/bin:/usr/sbin" if !BR2_ROOTFS_MERGED_USR
> +	default "/bin:/sbin:/usr/bin:/usr/sbin"
>   	help
>   	  Sets the system's default PATH. It is being used in
>   	  /etc/profile in the skeleton-init-common package and by some

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
