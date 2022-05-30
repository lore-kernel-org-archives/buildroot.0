Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 651B7C433F5
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 12:42:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0170A81A92;
	Mon, 30 May 2022 12:42:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id puwYrEHOCE-y; Mon, 30 May 2022 12:42:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 218E781A5C;
	Mon, 30 May 2022 12:42:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B02051BF425
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 12:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9EB4C81A4E
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 12:42:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jT-OWxe4pnp8 for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 12:42:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B336381A29
 for <buildroot@buildroot.org>; Mon, 30 May 2022 12:42:13 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id g4so5197565ybf.12
 for <buildroot@buildroot.org>; Mon, 30 May 2022 05:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=btfs0UeGgL/zFAmObfg87gnEiva7abXOSIx11iQkt2c=;
 b=GCZURqsdgkXWVcPEZNGjU9BFua8GFDT81/pd3XsgxLpTE/toAGToa6YWTrF/7qha0D
 UuNlVltQyHIH4sesD1HQABG3azLY2FAMljKJzQMiVPWJ1NRKDt7SSMGGlN2p9wOCyxAV
 Fud+zkebznkEPQNExjo4hy6kM1ehTxd0PaOwvmX6Z8Sjm42L067dStwZpI5/nmQuT0US
 C2qoYjZOv8zGpg35+FyE6lqWw4LSE5aJ8hkRyqo66Zwf/v2Pwlq2zdG0J8QcNt0CwJiJ
 +26/p2ZYjihK9UJNcOizqfquqEDq3cSem+XD3aD7hOLTou/kyoAcer5HqNr9tbvDEiJ0
 8KzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=btfs0UeGgL/zFAmObfg87gnEiva7abXOSIx11iQkt2c=;
 b=XGsgDnG6I5wqLBOroTv07iIJgkzsrB36emEhu+xayTRR1W+7fn7y573mIXdfCzhAJz
 LhwKBo0fFXLgJMtLES9Fkc71TGskewJ/jXM2+Q/Y13LPEScNO4y241DE3hQoNCEp7MZF
 QAKB7VdN4AY6cOacQbAFvS3X8UCcmufvFIANehLvJl1nu5xbHeMW8X1qll34VH+n6+eU
 m/NgpgkVYIdF/Ngd05WIsQsHYOvnWSHQSpnlrbAG0XcM4toO1f/aR/mIoMWCYS36dpBc
 M7qK9EP4T8JAj7O7RWf8s5xK3avUsVgzvHfyEBYdIkJZ/nmITsRghwQ7pXqljLzZfK4f
 0VYA==
X-Gm-Message-State: AOAM5333QKE1fD7uVS1qfUwvfbhWZLP7OGtq1XL6CDuVsY70IDoUvljE
 f+oOW9v8OSyKOjw46k3Oio8veEMz8c2BpuVnONc=
X-Google-Smtp-Source: ABdhPJzJ6ZrVYsWQuqFnabJbS3boX+J7q10TML7F6XhUKBk6luAkvnpYIwroaJAH7wDacQ4dGlVbj4VLNXDJIYxWhSk=
X-Received: by 2002:a25:a292:0:b0:65c:f540:4182 with SMTP id
 c18-20020a25a292000000b0065cf5404182mr3231209ybi.238.1653914532559; Mon, 30
 May 2022 05:42:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220329145904.63900-1-andreynech@gmail.com>
 <20220528213306.GL301044@scaer>
 <CAOiXNkCGcqXo2dy7Ae=Ne8SP3c1ANnSP57cpPocBMoXVwRGAVw@mail.gmail.com>
In-Reply-To: <CAOiXNkCGcqXo2dy7Ae=Ne8SP3c1ANnSP57cpPocBMoXVwRGAVw@mail.gmail.com>
From: Andrey Nechypurenko <andreynech@gmail.com>
Date: Mon, 30 May 2022 14:42:01 +0200
Message-ID: <CAOiXNkDRYVi94Y1dSEz65s+QEC=1=wtB3Oi0-VhjZ_3c8szoPQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It looks like gmail adds line breaks. Will resend it using git in a few minutes.
Sorry for the inconvenience.


On Mon, 30 May 2022 at 14:38, Andrey Nechypurenko <andreynech@gmail.com> wrote:
>
> Version 3.20 is the first one where the following issue is fixed:
> https://gitlab.kitware.com/cmake/cmake/-/issues/18299
> Was affected by this bug and decide to bump the version to the
> latest stable
>
> Signed-off-by: Andrey Nechypurenko <andreynech@gmail.com>
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
> -sha256  124f571ab70332da97a173cb794dfa09a5b20ccbb80a08e56570a500f47b6600
>  cmake-3.18.6.tar.gz
> +# From https://cmake.org/files/v3.22/cmake-3.22.3-SHA-256.txt
> +sha256  9f8469166f94553b6978a16ee29227ec49a2eb5ceb608275dec40d8ae0d1b5a0
>  cmake-3.22.3.tar.gz
>
>  # Locally calculated
>  sha256  131b9ff756b64a25b7461c3c1382e70b16c70a5b4833a1577897fa3ea6d88f8d
>  Copyright.txt
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
