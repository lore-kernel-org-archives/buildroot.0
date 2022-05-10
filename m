Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F75C433EF
	for <buildroot@archiver.kernel.org>; Tue, 10 May 2022 15:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62F1C81902;
	Tue, 10 May 2022 15:02:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VCsoVCBO4gyo; Tue, 10 May 2022 15:02:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56EE08145A;
	Tue, 10 May 2022 15:02:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 32ABC1BF909
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 15:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2087C403E0
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 15:02:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SA1Cfcr5vDQT for <buildroot@lists.busybox.net>;
 Tue, 10 May 2022 15:02:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D74FD401AF
 for <buildroot@buildroot.org>; Tue, 10 May 2022 15:02:44 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2f7c424c66cso183319587b3.1
 for <buildroot@buildroot.org>; Tue, 10 May 2022 08:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5COkrQwbmbkht5jSvFxrykRu8AuZIJDyLPJ5V+yMPSs=;
 b=EkfhaYXXYnhbhQQCmjBNGWGiz7/gFyqIJuJ1L1zHOf584hNEgC28XsnJ7qwmpvqMTr
 AVT7QRCm+8Wf4T+FaCVecH587et6vmsuP3I4I1MxdkEvIOGeeaXxIGn0VLS2UyxZAQ4b
 AD2jIe+1iPphHfoPMRo71KK35LL9932b5E0FOzBcSjlkgHQtkj6dn0v3d9R/9e8OeoPd
 xYTRBuSBwLKWPdOJh/tdN3f40ncXCAks/lEJOuALe9TpTxx2qdNDKvLH9UPSVLZqgXYr
 VutMOF0oa0Jk9h1nQ+xqoE8RmjRfeC7owy/E+2NwTRzJ/K2BJoec058kgD/hhBvl2fkX
 qv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5COkrQwbmbkht5jSvFxrykRu8AuZIJDyLPJ5V+yMPSs=;
 b=j3vobtdqgnTnK3Pqjj+Dm6d83vTAU8Rj/Cv80p7wCpwuVbIIxGpVd0YxV6q/QmZkIA
 D4ASuDCS1cG21LEaSHZl23bkT27/dmXnnqnygVeWXA6Xv3v4zBnsf3ZyO0ccf8C2rHJK
 AGai+QCx9sOa2mlC2JaGthhklljQC8Or5ogHAVOzJLEC/vv0IsvEs2ZlIwP2agykXvOx
 eP3b8WNp+z2HGW6sGhyhZMIfJZ+JtTNc3RFU0jA+ASBwIFxYg745w8KSQLOkN0TDVVKi
 iFMpOYmfobiuQRpMYdaUSQ7k9ZeA/aIoQoSFjI41g4b3hbpfG7ljcAh2hObc/WLlFCOx
 S2/g==
X-Gm-Message-State: AOAM53069BmF7G2Qs+MEnS+y9eMP6jju2f3bkJUhcGyvuLkRvecdjvSW
 jUVlJUAQkv7AgLRoD3zWduM0VDNPSJQ7rx9bA4ZuCLv2
X-Google-Smtp-Source: ABdhPJxehSLiYLowKvsttJwmc9FkWRKPzDBYWcUOhE9x1mQDNtB6o37zPdy2t+d3Ju84QTB7EwSWqXoI9TbLiV9usOQ=
X-Received: by 2002:a81:604:0:b0:2e6:6b45:4812 with SMTP id
 4-20020a810604000000b002e66b454812mr19765081ywg.266.1652194963284; Tue, 10
 May 2022 08:02:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220329145904.63900-1-andreynech@gmail.com>
In-Reply-To: <20220329145904.63900-1-andreynech@gmail.com>
From: Andrey Nechypurenko <andreynech@gmail.com>
Date: Tue, 10 May 2022 17:02:32 +0200
Message-ID: <CAOiXNkB0QVU8E_XBmurhOzBUq+JL2qfG4cUzRk_7PKrNa2S8Xw@mail.gmail.com>
To: buildroot@buildroot.org
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

Hi Folks,

I am just curious if the following patch will be accepted for the
upcoming release?

Thank you,
Andrey.

On Tue, 29 Mar 2022 at 16:59, Andrey Nechypurenko <andreynech@gmail.com> wrote:
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
