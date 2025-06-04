Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF85C5B549
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 18:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E62D80D48;
	Wed,  4 Jun 2025 18:21:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7XIVACzBCbQw; Wed,  4 Jun 2025 18:21:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAD3080D18
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAD3080D18;
	Wed,  4 Jun 2025 18:21:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E81781A6
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D997D80D18
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:21:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id anSJopK9ANEH for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 18:21:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D66FC80D04
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D66FC80D04
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D66FC80D04
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:21:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0412F1C010A; Wed,  4 Jun 2025 20:21:17 +0200 (CEST)
Message-ID: <76f760ba-299f-4196-aada-72abcd14bb6f@rnout.be>
Date: Wed, 4 Jun 2025 20:21:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20250518130323.2598282-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250518130323.2598282-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749061278; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=IUD4hqo9yQLTa1Qur+MLuZkayqzWZ5NJWHYSrByyt7c=;
 b=TD/fU4pcGtOrd0jPwuuQ0vcSlNArttPO5NnoMp+H5crTUQhQcQZsHaX/r4U6gRkdXdGDXf
 xWAXX19X6W/Ukj604xKarjxUj6P3SNQ/dqgkNvcbbeVpjUEMduvJWBpMy/3kd8Z4v4UR/p
 gEWhKyUnhE9c+87wS0y6haQGfDsGZXB9DEulnClg1qO5HER0npxYsLEDl2RHEZ+F43AbmP
 futRrfyqpDaeLLoSTEV30TPuCVn1YIjhhuQrwXLIGLXq4Nk+UCOe1x7ngn4f0M2NY+cQar
 RbCyPhpGh1EDaBwCaXogrfytbrR+3TUzzBofC+b3c0ZHP1x4KKgr8VInznqaBA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=TD/fU4pc
Subject: Re: [Buildroot] [PATCH 1/1] package/alsa-utils: remove autoreconf
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



On 18/05/2025 15:03, Bernd Kuhls wrote:
> Buildroot commit 96a7db5a4b7526ecf744d89d9c19986b91626325 removed
> 0011-configure.ac-fix-UMP-support-detection.patch but forgot to remove
> ALSA_UTILS_AUTORECONF = YES as well.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/alsa-utils/alsa-utils.mk | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
> index 5620cc0e41..64da2201bf 100644
> --- a/package/alsa-utils/alsa-utils.mk
> +++ b/package/alsa-utils/alsa-utils.mk
> @@ -9,8 +9,6 @@ ALSA_UTILS_SOURCE = alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
>   ALSA_UTILS_SITE = https://www.alsa-project.org/files/pub/utils
>   ALSA_UTILS_LICENSE = GPL-2.0
>   ALSA_UTILS_LICENSE_FILES = COPYING
> -# 0011-configure.ac-fix-UMP-support-detection.patch
> -ALSA_UTILS_AUTORECONF = YES
>   ALSA_UTILS_INSTALL_STAGING = YES
>   ALSA_UTILS_DEPENDENCIES = host-pkgconf alsa-lib \
>   	$(if $(BR2_PACKAGE_NCURSES),ncurses) \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
