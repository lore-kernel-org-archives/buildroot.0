Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A92C46CD4
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 22:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD9A641BEB;
	Wed, 27 Dec 2023 22:14:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD9A641BEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c-w154SCVNAi; Wed, 27 Dec 2023 22:14:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27E1841B72;
	Wed, 27 Dec 2023 22:14:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27E1841B72
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D2D9F1BF2E4
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 22:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B911341B72
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 22:14:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B911341B72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eG2NkjGauBph for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 22:14:08 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8866F4191E
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 22:14:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8866F4191E
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id B8C98B00548;
 Wed, 27 Dec 2023 23:14:01 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 27 Dec 2023 23:14:01 +0100
Date: Wed, 27 Dec 2023 23:14:01 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Sebastian Bauer <mail@sebastianbauer.info>
Message-ID: <ZYyhqUpPsAsPEnE3@landeda>
References: <20231227182429.1215185-1-mail@sebastianbauer.info>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231227182429.1215185-1-mail@sebastianbauer.info>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703715246;
 bh=dN/46vAZfjsaJbQ3Um1FYKvO4GPVTDtPrHdRsm28CMk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N0KVYic7v3PTabPqzUXq0xE69TOseHgif57lyA4IOhPQa97a0gJ5z0fIaKSM8Gw0R
 KT5Pj6H69omuMJdBRdjJOuSppJ7IMFZod0t78uqEBvqqFGlstqEZYHbwU+11gYsztD
 WPffu4T+FquTBvGPAN1Zt2GgBLfJkhlQHIHoPck5zdInxOa/5XUT3IkHknWiXlkOLT
 9XZEKH9Gtgb7dF4b+Gv5dZsna3XQbZbPmIZZULGeJAHJ74V7a25zNt9QCybWHtgOMy
 8FxnB0OzSXSBr1cc1/zVkIUscc0re3kFbH/fnbA2N3OuOWmhCXJ/UrSIIhj9EttDrP
 EkfwaCHxofnOg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=N0KVYic7
Subject: Re: [Buildroot] [PATCH 1/3] Revert "package/libcamera-apps: bump to
 version 1.3.0"
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Sebastien, All,

On 2023-12-27 19:24 +0100, Sebastian Bauer spake thusly:
> This reverts commit c9645fd29bf38b5a960aed3eeac36975d64a400a.
> 
> Building libcamera-apps 1.3.0 with current libcamera 0.1.0 fails because
> some of the symbols like controls::AeFlickerMode are not recognized.
> According to my research, they have been introduced after libcamera 0.1.0
> but there is no release version of libcamera newer than 0.1.0 available
> to which we could bump.
> 
> Signed-off-by: Sebastian Bauer <mail@sebastianbauer.info>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libcamera-apps/libcamera-apps.hash | 2 +-
>  package/libcamera-apps/libcamera-apps.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libcamera-apps/libcamera-apps.hash b/package/libcamera-apps/libcamera-apps.hash
> index 281aab88be..1437a0e8fa 100644
> --- a/package/libcamera-apps/libcamera-apps.hash
> +++ b/package/libcamera-apps/libcamera-apps.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  92ff51e2aa4cd7165a8f5131df57cb0967a259bc74e4a47d7fb9dcfd65e45e25  libcamera-apps-1.3.0.tar.gz
> +sha256  e6b74a0ba10a962f1930199d7dd828c8d9ee370dfe1fdfd8ae2638df744f1344  libcamera-apps-1.2.1.tar.gz
>  sha256  36dfed86bdef661a0a14ec1a1cc84c771d5a06b6f9b92e9ebb610ba711bd528a  license.txt
> diff --git a/package/libcamera-apps/libcamera-apps.mk b/package/libcamera-apps/libcamera-apps.mk
> index d60e58e7e4..2a217f095f 100644
> --- a/package/libcamera-apps/libcamera-apps.mk
> +++ b/package/libcamera-apps/libcamera-apps.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBCAMERA_APPS_VERSION = 1.3.0
> +LIBCAMERA_APPS_VERSION = 1.2.1
>  LIBCAMERA_APPS_SITE = $(call github,raspberrypi,libcamera-apps,v$(LIBCAMERA_APPS_VERSION))
>  LIBCAMERA_APPS_LICENSE = BSD-2-Clause
>  LIBCAMERA_APPS_LICENSE_FILES = license.txt
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
