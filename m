Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6317AC433EF
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 12:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 047E183F8C;
	Mon, 30 May 2022 12:57:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hpPvuWWUD8Kq; Mon, 30 May 2022 12:57:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0408783F85;
	Mon, 30 May 2022 12:57:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 608D21BF425
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 12:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D3F66108F
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 12:57:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TfAQdwOt4y4u for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 12:57:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 678E060EC6
 for <buildroot@buildroot.org>; Mon, 30 May 2022 12:57:34 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-30c1c9b9b6cso44708177b3.13
 for <buildroot@buildroot.org>; Mon, 30 May 2022 05:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dfSd5P1KNsotiW8YhNOJ9D+rzbeweaEaitTcu7gdczw=;
 b=dquC+jGa4kYahH5uXDHnsbAT1szlYSHxkT39miuMcHhToPCyMdknmk3QZHDWg8v17C
 2Y99YIyAkWj4wrnlE2q2p6YKNlyBqo/qZmhWg20I7tXkz7bZH7WGHJo4ume9Toz9g6+G
 FO3hnO9+IK/llAbUfb2cofo3qnQn10nysnVp5XMpo1DHkYTYh5EuE6olg34pOUi18lSn
 Q29DSPTobeMmzz8IPEExmU6Tm5F4rRwJktvAf9ylKgVPxHMma7Ynh0fz8C25uw5XHkpJ
 +uFKyk0ZoXziMIFlI3plFBxf0b1ZppoueHC8ys1VYZzZct4TqucWHC7D1MbdQ2kAh0Sg
 i1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dfSd5P1KNsotiW8YhNOJ9D+rzbeweaEaitTcu7gdczw=;
 b=aZbFJtm60pbgMipLyiDjElPMlnAX44tsVK97CIuaxnqdogU1SCDXsCMKdp38Q6Ws3t
 tyL4ZNlB6FIey6m+9xp1KBAIky5hBPYAW8wGEsky2k51H2PHyL/TKyUhW534AqVr+9Lu
 X4je3Vb3Y4EVZxCCp/JaU9QxC83lG97zLpLf36zkIQ/iheJu7mGzE52c+PJ0O4ENocQk
 AU0QfDY1A+rBx2i0gZHaWt8/fIEhUwifYq9AzWbDO3HZJ2kpi1XNiXQ44bjXsv487eai
 B0r3Y8siyvLhueR/rH8hLICAfrzMfnaWt1CUYpCe9I4UaQbUk8VHJrUWUjUfYUU3FBSm
 C3Gw==
X-Gm-Message-State: AOAM532OiMz108zbpSdMEO2ryexUUuDM2IVn9qiM5YcHeWYfBjlePrq7
 RGKX0UGEnTGQGGosSBdVBvg45kLurp0RMFRAnZPvYvrwb3dFJA==
X-Google-Smtp-Source: ABdhPJyaTY5uxGgVtvNKuGcQc47/3/8o8ECYeWrmQ9zKWYL7XJR/DdCtskrj5Nk1MEMqOp+Eco+vcmW2H7Hy6vdnXj8=
X-Received: by 2002:a81:1615:0:b0:30c:245e:71ff with SMTP id
 21-20020a811615000000b0030c245e71ffmr10296124yww.406.1653915452858; Mon, 30
 May 2022 05:57:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220530124450.19073-1-andreynech@gmail.com>
In-Reply-To: <20220530124450.19073-1-andreynech@gmail.com>
From: Andrey Nechypurenko <andreynech@gmail.com>
Date: Mon, 30 May 2022 14:57:21 +0200
Message-ID: <CAOiXNkCfAQ-jBTrxT2dCZw9AR6uuFJ7WxEsYWXdhfm_iF4DLPg@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
Subject: Re: [Buildroot] [PATCH] package/cmake: bump version to 3.22.3
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

This is a little bit strange. The patch file located in outgoing
directory and generated with
# git format-patch -M -n -s -o outgoing origin/master
do contains Signed-off-by: tag. However, the command
# git send-email --to buildroot@buildroot.org --cc-cmd
'./utils/get-developers -e' origin/master
leads to what could be seen in my previous mail - no Signed-off-by: tag.

Am I doing something wrong or are there some configuration options I am missing?

Thanks,
Andrey.


On Mon, 30 May 2022 at 14:44, Andrey Nechypurenko <andreynech@gmail.com> wrote:
>
> Version 3.20 is the first one where the following issue is fixed:
> https://gitlab.kitware.com/cmake/cmake/-/issues/18299
> Was affected by this bug and decide to bump the version to the
> latest stable
> ---
>  package/cmake/cmake.hash | 4 ++--
>  package/cmake/cmake.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
> index da514a6d6b..1749db8c27 100644
> --- a/package/cmake/cmake.hash
> +++ b/package/cmake/cmake.hash
> @@ -1,5 +1,5 @@
> -# From https://cmake.org/files/v3.18/cmake-3.18.6-SHA-256.txt
> -sha256  124f571ab70332da97a173cb794dfa09a5b20ccbb80a08e56570a500f47b6600  cmake-3.18.6.tar.gz
> +# From https://cmake.org/files/v3.22/cmake-3.22.3-SHA-256.txt
> +sha256  9f8469166f94553b6978a16ee29227ec49a2eb5ceb608275dec40d8ae0d1b5a0  cmake-3.22.3.tar.gz
>
>  # Locally calculated
>  sha256  131b9ff756b64a25b7461c3c1382e70b16c70a5b4833a1577897fa3ea6d88f8d  Copyright.txt
> diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
> index 4177b119ab..053658fad6 100644
> --- a/package/cmake/cmake.mk
> +++ b/package/cmake/cmake.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>
> -CMAKE_VERSION_MAJOR = 3.18
> -CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).6
> +CMAKE_VERSION_MAJOR = 3.22
> +CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).3
>  CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
>  CMAKE_LICENSE = BSD-3-Clause
>  CMAKE_LICENSE_FILES = Copyright.txt
> --
> 2.32.0
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
