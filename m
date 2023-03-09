Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C535C64EC4
	for <buildroot@archiver.kernel.org>; Thu,  9 Mar 2023 07:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1303418B5;
	Thu,  9 Mar 2023 07:53:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1303418B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kah0x8FdGLyE; Thu,  9 Mar 2023 07:53:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B52E7418BE;
	Thu,  9 Mar 2023 07:53:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B52E7418BE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3CA821BF40A
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 07:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 164546123E
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 07:53:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 164546123E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eaO6Fmuw17Pj for <buildroot@lists.busybox.net>;
 Thu,  9 Mar 2023 07:53:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD7C46080A
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BD7C46080A
 for <buildroot@buildroot.org>; Thu,  9 Mar 2023 07:53:37 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 736AF5C0E47;
 Thu,  9 Mar 2023 08:53:35 +0100 (CET)
MIME-Version: 1.0
Date: Thu, 09 Mar 2023 08:53:35 +0100
From: Stefan Agner <stefan@agner.ch>
To: buildroot@buildroot.org
In-Reply-To: <674d788fda128807b203f3b1d8b407b5bb85948b.1677628527.git.stefan@agner.ch>
References: <674d788fda128807b203f3b1d8b407b5bb85948b.1677628527.git.stefan@agner.ch>
Message-ID: <b6b9a05867d45fa2a8eaa5e349d3617e@agner.ch>
X-Sender: stefan@agner.ch
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1678348415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5qbkYGPv9mWZkxeUak/d74UsCFNaNJuzG+K7AnakAWQ=;
 b=kiurYvnNUGiRxuWo8VCi1w9X1fMiYKMSxCGesIOy6BFuoksuidLhEVWH/JCOlZinBPZRow
 79ttY8+dVh8GDKjQRcFLhSYb/xYcJLyIl1jPdUMX0X5z12kCHGWAbaakhJ616cVOHTFo5T
 nsoRCX8SLWdHmASjCUSMldFHlYOyncs=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch
 header.a=rsa-sha256 header.s=dkim header.b=kiurYvnN
Subject: Re: [Buildroot] [PATCH] package/{bluez5_utils,
 bluez5_utils-headers}: bump to version 5.66
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
Cc: Grzegorz Blach <grzegorz@blach.pl>, Marcin Bis <marcin@bis.org.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2023-03-01 00:55, Stefan Agner wrote:
> bluez 5.66 contains various fixes and initial support for Basic Audio
> Profile and Volume Control Profile.

Hello,

Is that something which still can get merged into 2023.02? Besides the
new features it comes with a whole slew of fixes as well.

Best regards,
Stefan

> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  package/bluez5_utils-headers/bluez5_utils-headers.mk | 2 +-
>  package/bluez5_utils/bluez5_utils.hash               | 2 +-
>  package/bluez5_utils/bluez5_utils.mk                 | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/bluez5_utils-headers/bluez5_utils-headers.mk
> b/package/bluez5_utils-headers/bluez5_utils-headers.mk
> index 565511120f..8ca3764935 100644
> --- a/package/bluez5_utils-headers/bluez5_utils-headers.mk
> +++ b/package/bluez5_utils-headers/bluez5_utils-headers.mk
> @@ -5,7 +5,7 @@
>
> ################################################################################
>  
>  # Keep the version and patches in sync with bluez5_utils
> -BLUEZ5_UTILS_HEADERS_VERSION = 5.65
> +BLUEZ5_UTILS_HEADERS_VERSION = 5.66
>  BLUEZ5_UTILS_HEADERS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
>  BLUEZ5_UTILS_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
>  BLUEZ5_UTILS_HEADERS_DL_SUBDIR = bluez5_utils
> diff --git a/package/bluez5_utils/bluez5_utils.hash
> b/package/bluez5_utils/bluez5_utils.hash
> index e0c9f3cdb9..9467647592 100644
> --- a/package/bluez5_utils/bluez5_utils.hash
> +++ b/package/bluez5_utils/bluez5_utils.hash
> @@ -1,5 +1,5 @@
>  # From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc:
> -sha256 
> 2565a4d48354b576e6ad92e25b54ed66808296581c8abb80587051f9993d96d4 
> bluez-5.65.tar.xz
> +sha256 
> 39fea64b590c9492984a0c27a89fc203e1cdc74866086efb8f4698677ab2b574 
> bluez-5.66.tar.xz
>  # Locally computed
>  sha256 
> b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259 
> COPYING
>  sha256 
> ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5 
> COPYING.LIB
> diff --git a/package/bluez5_utils/bluez5_utils.mk
> b/package/bluez5_utils/bluez5_utils.mk
> index 76070dc3a9..4059b34556 100644
> --- a/package/bluez5_utils/bluez5_utils.mk
> +++ b/package/bluez5_utils/bluez5_utils.mk
> @@ -5,7 +5,7 @@
>
> ################################################################################
>  
>  # Keep the version and patches in sync with bluez5_utils-headers
> -BLUEZ5_UTILS_VERSION = 5.65
> +BLUEZ5_UTILS_VERSION = 5.66
>  BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
>  BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
>  BLUEZ5_UTILS_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
