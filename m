Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBBD4CEACEF
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 19:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EF2361374;
	Mon, 17 Nov 2025 19:59:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tlOsMHuwfb1n; Mon, 17 Nov 2025 19:59:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A401A605B3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A401A605B3;
	Mon, 17 Nov 2025 19:59:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EDC0C158
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF162402F8
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:59:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4QGRWAY3tIIC for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 19:59:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DD5CE40022
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD5CE40022
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DD5CE40022
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:59:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F37FBB9796C0; Mon, 17 Nov 2025 20:59:31 +0100 (CET)
Message-ID: <38372135-59c3-414e-aafe-5bcb29bff354@rnout.be>
Date: Mon, 17 Nov 2025 20:59:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20251014061621.80231-1-peter@korsgaard.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251014061621.80231-1-peter@korsgaard.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1763409572; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=UM87+4qPUu4afFUGCZqzlp1QMM6i7PfgKHzcotT/Jus=;
 b=M1vGFIwIUqDdT82qtoAqbNHp0HvgogakKNJtNQrlS6kyfIerUB+KUfNoMjGIK2DHN7Rp1W
 1IhoomyH+zoGc1tmNFtllde2sX+xCRZxHPBqXCWTZoZQtDRBcWvagDRRKi33ApNS9swNh1
 uESgOyi45bad5eFyukElS3pE9MgnMdoLFj7h3S1/R2TS2XczJdOW1tnWwx5B8x3Y+X0HV0
 JnntsJW+/9FzkxZ8E0C2BCtVXwmEpM0vUotH10wQrHfG/cdPId5AILsP2sA4pq0F3Cz53t
 sGy0ZU84q9toOwxQAF56kEmR+CwpsdFp1l4p9KgUwTI8spI4E+Q3i2T7BnexWg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=M1vGFIwI
Subject: Re: [Buildroot] [PATCH] package/gstd: bump to version 0.15.2
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



On 14/10/2025 08:16, Peter Korsgaard wrote:
> Bugfix release:
> https://github.com/RidgeRun/gstd-1.x/releases/tag/v0.15.2
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to 2025.02.x and 2025.08.x, thanks.

  Regards,
  Arnout

> ---
>   package/gstreamer1/gstd/gstd.hash | 2 +-
>   package/gstreamer1/gstd/gstd.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/gstreamer1/gstd/gstd.hash b/package/gstreamer1/gstd/gstd.hash
> index 632f83f8e8..bdbc137287 100644
> --- a/package/gstreamer1/gstd/gstd.hash
> +++ b/package/gstreamer1/gstd/gstd.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  f4a83765d2cf2948c38abc5107ab07d49a01b4101047f188fed7204f1d4e49c7  gstd-0.15.0.tar.gz
> +sha256  d9d3205551482acd6b7ec2a865407b60efce252e8f747553628401c84f88c556  gstd-0.15.2.tar.gz
>   sha256  10162be9f7ddb9e98c22c3edd0f78d62ab88f0ca8b1cc968bd85d5d665489d90  COPYING
> diff --git a/package/gstreamer1/gstd/gstd.mk b/package/gstreamer1/gstd/gstd.mk
> index 965ede7949..d855fc52f0 100644
> --- a/package/gstreamer1/gstd/gstd.mk
> +++ b/package/gstreamer1/gstd/gstd.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -GSTD_VERSION = 0.15.0
> +GSTD_VERSION = 0.15.2
>   GSTD_SITE = $(call github,RidgeRun,gstd-1.x,v$(GSTD_VERSION))
>   GSTD_LICENSE_FILES = COPYING
>   GSTD_LICENSE = LGPL-2.1+

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
