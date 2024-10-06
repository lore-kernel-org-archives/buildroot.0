Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3392DCFB43F
	for <buildroot@archiver.kernel.org>; Sun,  6 Oct 2024 14:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C735560716;
	Sun,  6 Oct 2024 14:03:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HIPU4ZzPRZdw; Sun,  6 Oct 2024 14:03:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D043E60717
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D043E60717;
	Sun,  6 Oct 2024 14:03:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 02AE61BF325
 for <buildroot@lists.busybox.net>; Sun,  6 Oct 2024 14:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5C24400D9
 for <buildroot@lists.busybox.net>; Sun,  6 Oct 2024 14:03:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RcINFUstuv7d for <buildroot@lists.busybox.net>;
 Sun,  6 Oct 2024 14:03:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8C32040004
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C32040004
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8C32040004
 for <buildroot@buildroot.org>; Sun,  6 Oct 2024 14:03:16 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-42cb806623eso31287315e9.2
 for <buildroot@buildroot.org>; Sun, 06 Oct 2024 07:03:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728223394; x=1728828194;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bGTT1cEKdYbki/UuZsnOcCFgPHg9DLsfVm7rHKZHNgE=;
 b=riuKFJanjRU4CoJIKVwnNmQsIMXPIUMHQC0QtVlbM2vlunhtl5Qx1+fnsAWtd2M+1F
 nmG/fY9a7uJgS+2zAUaPa438poy52fhu3v6G0lY6e/GtmoEfPt4oV0Og5KAp6G0Bj2fX
 29rCZ3aR6Ti5ASCddbKLqfV9C+zvvrFOqodQsSYkHLvLM9xdSlm+D5SSHId0X6wKl7Tk
 FMgX5aseyPxPnnJQql348eH6AAonWPkkm5ln9d35d1WqIcaJuSrv3Bv2eRgs89EFHL0i
 rRhGvjnLaM0nXtwGy6Wf9deIdQ0dW+qMyzyf6RCytlxSzdaRUMilMZ4UzW/SJPVJIDmS
 sDCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSh9e4uhKDTUc0KMHVmCHJ1NuJnYMgaMpCuFK1Wqg9UY/vPa+dasHclM4LaRB+L3bmo6BUxwKAwlk=@buildroot.org
X-Gm-Message-State: AOJu0YyBBUgtRltTjesiw0KdrWATi0HhmXo4eYDi+MeeVGozWUL429hV
 O+1nK9yfsabuBn0Jxl+Nwz0WzuLaXSN2127YyJqyMwVf/k+EaEI+Cxab5z/FOuU=
X-Google-Smtp-Source: AGHT+IG+1cKPdSdrzb2d1esg6AzR0khVf2ChczsLrJUHtR2zvwQU1vPgbvo8trxbmtltN0tH87v79Q==
X-Received: by 2002:a05:600c:1c98:b0:42c:b8c9:16cb with SMTP id
 5b1f17b1804b1-42f85aa6991mr71322335e9.5.1728223394227; 
 Sun, 06 Oct 2024 07:03:14 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f8fecf504sm14952485e9.32.2024.10.06.07.03.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Oct 2024 07:03:13 -0700 (PDT)
Message-ID: <ebc844e3-aabf-41e2-9133-11c083067a0f@mind.be>
Date: Sun, 6 Oct 2024 16:03:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Brandon Maier <brandon.maier@gmail.com>, buildroot@buildroot.org
References: <20241005-mtd-2-2-1-v1-1-cb0f4543f5d4@gmail.com>
Content-Language: en-GB
In-Reply-To: <20241005-mtd-2-2-1-v1-1-cb0f4543f5d4@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1728223394; x=1728828194; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bGTT1cEKdYbki/UuZsnOcCFgPHg9DLsfVm7rHKZHNgE=;
 b=dEYSkoSqLu3iFN5TW+CzxzEyLCudNpCf/s9lidD7j1kvZl552M7xiD7FB5AVKKN+C6
 iYxnRNB6uzkjebbyzD3jhp/8WNQ1TBcXlNzHMJLzATDOBdCQ455VkKdpKx4KtMyX4JVg
 7WibJuxdIMpCReodjaRNmxrdjCw8Ey4WDp2O1LMft4jfW8WYBiu1o6H5VaYcGBlaqCYe
 czOc2vmvVrExGDsvpL1BD68+bcjrXRKZi6Hyp4qTjvEMvtktSQIKsMQRBLIBEpqwLQ0w
 a1jMNnF4v2hyBTr/qzBBKQTKLNdCeeJvj9yodt4ojA+uiwwdxvBHCRo3Z8wH2Wb0ACuu
 IUMA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dEYSkoSq
Subject: Re: [Buildroot] [PATCH RESEND] package/mtd: update to 2.2.1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/10/2024 18:59, Brandon Maier wrote:
> See https://lore.kernel.org/buildroot/5dcaf594-e727-4ec3-af69-86e578029160@sigma-star.at/
> 
> Signed-off-by: Brandon Maier <brandon.maier@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/mtd/mtd.hash | 4 ++--
>   package/mtd/mtd.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/mtd/mtd.hash b/package/mtd/mtd.hash
> index 1efb06f4902655e088a489a82dcfbc1383773f54..0eb90a5118be19ca20c84b1c6d04c22b62330054 100644
> --- a/package/mtd/mtd.hash
> +++ b/package/mtd/mtd.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated after checking pgp signature
> -# https://infraroot.at/pub/mtd/mtd-utils-2.2.0.tar.bz2.asc
> -sha256  250d082f67375ca8451b5fcfc9a23a53ced3ebebd8312c288daf2507bbab1324  mtd-utils-2.2.0.tar.bz2
> +# https://infraroot.at/pub/mtd/mtd-utils-2.2.1.tar.bz2.asc
> +sha256  f7ae20b2eb79ee83441468f0b99d897024cd96ff853eea59106fb1952065c803  mtd-utils-2.2.1.tar.bz2
>   sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
> diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
> index d3444c88f2f55f98f966dfd7179a5e3c61973547..77050e7e40b6244c632c8298f6de52de8e2e485b 100644
> --- a/package/mtd/mtd.mk
> +++ b/package/mtd/mtd.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -MTD_VERSION = 2.2.0
> +MTD_VERSION = 2.2.1
>   MTD_SOURCE = mtd-utils-$(MTD_VERSION).tar.bz2
>   MTD_SITE = https://infraroot.at/pub/mtd
>   MTD_LICENSE = GPL-2.0
> 
> ---
> base-commit: 09964bc5c0f8b329cda6383a1297029354269da9
> change-id: 20241001-mtd-2-2-1-0ba388487b7e
> 
> Best regards,

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
