Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DEF3C3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B5AE81064;
	Fri,  2 May 2025 10:56:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7DmE5DpAMC10; Fri,  2 May 2025 10:56:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 351D28109F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 351D28109F;
	Fri,  2 May 2025 10:56:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C1A95EE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A679660669
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:56:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gyAe5IJ4MCit for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:56:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D119360672
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D119360672
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D119360672
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:56:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0A6821C0F8A; Fri,  2 May 2025 12:56:43 +0200 (CEST)
Message-ID: <9ac1a048-cab9-49c2-b8db-015565704a88@rnout.be>
Date: Fri, 2 May 2025 12:56:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20250310200442.11588-1-ju.o@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250310200442.11588-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746183403; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=h7x+zworo89ZHWzCfBV4IQaOQWSeu8hF7glcK0MyizU=;
 b=Rv2HqxheyA3YkGB8TSZgyHPo86s6yKJSA0rj57YdQfI9LFCgIFUPAsD35Ig+Ymehip5w2Z
 s9BlOMFVeX/Rb0ghdAnXwnYTriTjKrdOP0W1I0MsX6nzhCaSDV1m1Vs8z6XUoVviODN+Tw
 1AtavG/6POasnWLyGuILCzQlvIq9yzHjWLPDJCZijYYEOR3bLzCDQ4Kog1gvhL/w9bVVhZ
 QPH2V4fGhyAjTELQIii/7wtLkHGp4MYJuzMLrDByg5KegbId7jNVNonr+m/Qvpi5VvH8qA
 22BlFFAB0YWoamz0S0E6U8KsbhpQJvp4rVOdGGpyYxFqtWxByblrLSpiF9kC2w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Rv2Hqxhe
Subject: Re: [Buildroot] [PATCH next 1/1] package/opencsd: bump to version
 1.5.6
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



On 10/03/2025 21:04, Julien Olivain wrote:
> For change log, see:
> https://github.com/Linaro/OpenCSD/blob/v1.5.6/README.md?plain=1#L348
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/opencsd/opencsd.hash | 2 +-
>   package/opencsd/opencsd.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/opencsd/opencsd.hash b/package/opencsd/opencsd.hash
> index 865580968b..d33f96af8a 100644
> --- a/package/opencsd/opencsd.hash
> +++ b/package/opencsd/opencsd.hash
> @@ -1,3 +1,3 @@
>   # Locally Computed:
> -sha256  1df9b61656ac96bc5cca082d8c32a9f25ed07ef684d7d666911280cf162b7d93  opencsd-1.5.5.tar.gz
> +sha256  82f584572c4e3f1d8255be135768bea80b48c4fe731cb8c5877a7389dfd445a6  opencsd-1.5.6.tar.gz
>   sha256  980eef4b0744e63834e3ec0d50c2a4ff6d81d7ec62dd8ba8c66acae0ec5a2e88  LICENSE
> diff --git a/package/opencsd/opencsd.mk b/package/opencsd/opencsd.mk
> index 9714bb970a..2e8747df22 100644
> --- a/package/opencsd/opencsd.mk
> +++ b/package/opencsd/opencsd.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -OPENCSD_VERSION = 1.5.5
> +OPENCSD_VERSION = 1.5.6
>   OPENCSD_SITE = $(call github,Linaro,OpenCSD,v$(OPENCSD_VERSION))
>   OPENCSD_LICENSE = BSD-3-Clause
>   OPENCSD_LICENSE_FILES = LICENSE

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
