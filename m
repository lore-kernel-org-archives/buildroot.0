Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF762C5B559
	for <buildroot@archiver.kernel.org>; Tue,  3 Jun 2025 06:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 769C940B2D;
	Tue,  3 Jun 2025 06:22:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mc94aR0ydQs4; Tue,  3 Jun 2025 06:22:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6E9541766
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6E9541766;
	Tue,  3 Jun 2025 06:22:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B0BC3DA
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 06:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92E8041E47
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 06:22:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XqRTiBsnAQ2L for <buildroot@buildroot.org>;
 Tue,  3 Jun 2025 06:22:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C637640ADD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C637640ADD
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C637640ADD
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 06:22:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0EB091C1413; Tue,  3 Jun 2025 08:22:11 +0200 (CEST)
Message-ID: <e7763dd9-920d-4c36-9e81-12632ef193e2@rnout.be>
Date: Sat, 31 May 2025 19:03:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>, buildroot@buildroot.org
References: <20250516075553.3942690-1-roykollensvendsen@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250516075553.3942690-1-roykollensvendsen@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1748931731; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Zu/vd33vmhU7d95QcK2NhNZiJcxVPJuusGfne0MJbhA=;
 b=AwDBmHhVGlCSYidxvzs1C/fHifR/VklzA2BfA9PXjaew/wFlQs0cfAmHdQTaUwAmPWyUxG
 /aX0hk9/PhutbTV9soJBclytek/klM/oxgNDDbRPB1EvJlDTiYtR0pA+ViRezLJXyWmiUj
 3YJjCapoEytUeZVcov1Rsi0vD0i3MidJrOU4n2P+47t+BaK84fz6Toj2ZytqCAHw4wMNcB
 +N6DFoVMKo/bLrzuIidcL6bM37B9Ycm4iC4U70vNNg/hR1jzF4lE1mQfne0ojpUgEyIFyF
 SYhsOpaVo3IUxTuoMpRkfwZj0STHWttHWxPn9BDp34RSliknTGt0GxMgOMvG5g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=AwDBmHhV
Subject: Re: [Buildroot] [PATCH 1/2] package/dlib: bump version to 19.24.9
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



On 16/05/2025 09:55, Roy Kollen Svendsen wrote:
> Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>

  Applied both to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/dlib/dlib.hash | 2 +-
>   package/dlib/dlib.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/dlib/dlib.hash b/package/dlib/dlib.hash
> index af206386b8..350f30dc26 100644
> --- a/package/dlib/dlib.hash
> +++ b/package/dlib/dlib.hash
> @@ -1,5 +1,5 @@
>   # Locally computed
> -sha256  22513c353ec9c153300c394050c96ca9d088e02966ac0f639e989e50318c82d6  dlib-19.24.6.tar.gz
> +sha256  65ff8debc3ffea84430bdd4992982082caf505404e16d986b7493c00f96f44e9  dlib-19.24.9.tar.gz
>   
>   # Hashes for license files
>   sha256  50c1c5978d490c7f13062d91c4b89affc83774f87bc4568a714f748b62a5b216  dlib/external/libjpeg/README
> diff --git a/package/dlib/dlib.mk b/package/dlib/dlib.mk
> index 4eb0002775..0c93130d34 100644
> --- a/package/dlib/dlib.mk
> +++ b/package/dlib/dlib.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -DLIB_VERSION = 19.24.6
> +DLIB_VERSION = 19.24.9
>   DLIB_SITE = $(call github,davisking,dlib,v$(DLIB_VERSION))
>   DLIB_CMAKE_BACKEND = ninja
>   DLIB_INSTALL_STAGING = YES

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
