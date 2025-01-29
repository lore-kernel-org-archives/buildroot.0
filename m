Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F76C0218D
	for <buildroot@archiver.kernel.org>; Wed, 29 Jan 2025 09:29:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A5F6410A5;
	Wed, 29 Jan 2025 09:29:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 609lq8RjsAwa; Wed, 29 Jan 2025 09:29:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 547E4410A3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 547E4410A3;
	Wed, 29 Jan 2025 09:29:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 24B86942
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 09:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 119BB410A1
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 09:29:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NAytitZItFud for <buildroot@buildroot.org>;
 Wed, 29 Jan 2025 09:29:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 98F35410A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98F35410A3
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 98F35410A3
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 09:29:30 +0000 (UTC)
Received: from [192.168.178.36] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 757742C86EAE;
 Wed, 29 Jan 2025 10:29:27 +0100 (CET)
Message-ID: <469f3f14-1bc6-4666-9785-e61df7ba659b@bubu1.eu>
Date: Wed, 29 Jan 2025 10:29:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Akhilesh Nema <nemaakhilesh@gmail.com>, buildroot@buildroot.org
References: <20250129073437.5540-1-nemaakhilesh@gmail.com>
Content-Language: en-US
In-Reply-To: <20250129073437.5540-1-nemaakhilesh@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1738142967; bh=V5PRE7s4v/CfNX68BT4cK7/46AtjTkofXGxPJRUh/as=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=UM3D6i0EARO9mGDCjtbtLv1vxf7b0CcqjbJFcir1Et9MKdCrJACrk1G2E6StYw75P
 5XPDbPgK8esbH0ehpWZ4wvJOzC4ikd8U+55bbZJvQjY3tU0vdRl/su0nPcljgNMO4G
 YEKGFukKPEdRLBcSDWMeyLwjNc3BvozbMIYTKM4jO0+COaHjPqKTRr6s3kZaYco8Ln
 Juoxg6yL17aiGgORTNupg6NBUUQHLdAv/A8VOlLABfKwa0wIqKuB32z/lUoMoEDQTY
 v9Yy3riNlFfrV80w1En3Wyyvo8d7wewxOGM+yAi6OdYWoPvdxgApxu3M2niLLEK2DE
 5mBj4iX4+WY4Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=UM3D6i0E
Subject: Re: [Buildroot] [PATCH 1/1] package/iw: bump version to 6.9
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 29.01.25 08:34, Akhilesh Nema wrote:
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Tested-by: Marcus Hoffmann <buildroot@bubu1.eu>

> ---
>   package/iw/iw.hash | 2 +-
>   package/iw/iw.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/iw/iw.hash b/package/iw/iw.hash
> index 376dc3b499..e1e5ddd868 100644
> --- a/package/iw/iw.hash
> +++ b/package/iw/iw.hash
> @@ -1,4 +1,4 @@
>   # From https://www.kernel.org/pub/software/network/iw/sha256sums.asc
> -sha256  f167bbe947dd53bb9ebc0c1dcef5db6ad73ac1d6084f2c6f9376c5c360cc4d4e  iw-5.19.tar.xz
> +sha256  3f2db22ad41c675242b98ae3942dbf3112548c60a42ff739210f2de4e98e4894  iw-6.9.tar.xz
>   # Locally calculated
>   sha256  5932fb70481e128940168a5fdf133e6454293c0865c7e757874b235cb6daa2af  COPYING
> diff --git a/package/iw/iw.mk b/package/iw/iw.mk
> index 60ada9d57f..f20d8f1065 100644
> --- a/package/iw/iw.mk
> +++ b/package/iw/iw.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -IW_VERSION = 5.19
> +IW_VERSION = 6.9
>   IW_SOURCE = iw-$(IW_VERSION).tar.xz
>   IW_SITE = $(BR2_KERNEL_MIRROR)/software/network/iw
>   IW_LICENSE = ISC

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
