Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC706C3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 14:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 768C760619;
	Sun, 18 May 2025 14:40:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z4L-HsmWN_DK; Sun, 18 May 2025 14:40:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3648608D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3648608D9;
	Sun, 18 May 2025 14:40:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 423A11BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F1D5404F0
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:40:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id flay_jx_HyP1 for <buildroot@buildroot.org>;
 Sun, 18 May 2025 14:40:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6231040142
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6231040142
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6231040142
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:40:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4CEF81C0FF6; Sun, 18 May 2025 16:40:41 +0200 (CEST)
Message-ID: <0f2d0b9b-2671-476a-baba-67aa813eb914@rnout.be>
Date: Sun, 18 May 2025 16:40:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20250516105726.1462234-1-peter@korsgaard.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250516105726.1462234-1-peter@korsgaard.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747579241; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Br79d+2xVqNV8ck8Xx4+mRailUzLS59bqwTJ+kNm4fo=;
 b=aRes0ILvm7YTO2a6upc2pFz4Y1C+xEfxE44cVsGvKR+hRALfV+sqY95NfCLi+y15O30N2E
 XE74zp3FeFsE0bp4Uw1gFNKyZs0zAYnPy8+O46pr25Cwg18hi4Ogqo2/dgV9l3ePcLAAqh
 Z3Cl7HZaqKhCkzFrfy8jK5Ndnxf5KAm1plIz4SKiWyvnbtbR6P/Jkpdj8+gCemj53kVmup
 rwh6MQT3qpl6cOJ4q8q4Eynz9TNjS7BjUi81/eh+12BDlc4Y/RAYT59cSveltbNumVIjZh
 g2Yp1S+pcTUvZ9RuJ7539C6Lf2hfCA5gcme8zsa8x8Y5BYdB3cCbffH+ovqanQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=aRes0ILv
Subject: Re: [Buildroot] [PATCH] package/screen: security bump to version
 5.0.1
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



On 16/05/2025 12:57, Peter Korsgaard wrote:
> Fixes the following security issues:
> 
> CVE-2025-46805: do NOT send signals with root privileges
> CVE-2025-46804: avoid file existence test information leaks
> CVE-2025-46803: apply safe PTY default mode of 0620
> CVE-2025-46802: prevent temporary 0666 mode on PTYs in attacher
> CVE-2025-23395: reintroduce lf_secreopen() for logfile
> 
> https://lists.gnu.org/archive/html/info-gnu/2025-05/msg00002.html
> 
> For more details, see:
> https://security.opensuse.org/2025/05/12/screen-security-issues.html
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/screen/screen.hash | 4 ++--
>   package/screen/screen.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/screen/screen.hash b/package/screen/screen.hash
> index 208a9cb36d..61bacd88ff 100644
> --- a/package/screen/screen.hash
> +++ b/package/screen/screen.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated after checking pgp signature
> -# https://ftp.gnu.org/gnu/screen/screen-5.0.0.tar.gz.sig
> -sha256  f04a39d00a0e5c7c86a55338808903082ad5df4d73df1a2fd3425976aed94971  screen-5.0.0.tar.gz
> +# https://ftp.gnu.org/gnu/screen/screen-5.0.1.tar.gz.sig
> +sha256  2dae36f4db379ffcd14b691596ba6ec18ac3a9e22bc47ac239789ab58409869d  screen-5.0.1.tar.gz
>   # Locally calculated
>   sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
> diff --git a/package/screen/screen.mk b/package/screen/screen.mk
> index 9a64780a9a..74453faff8 100644
> --- a/package/screen/screen.mk
> +++ b/package/screen/screen.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -SCREEN_VERSION = 5.0.0
> +SCREEN_VERSION = 5.0.1
>   SCREEN_SITE = $(BR2_GNU_MIRROR)/screen
>   SCREEN_LICENSE = GPL-3.0+
>   SCREEN_LICENSE_FILES = COPYING

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
