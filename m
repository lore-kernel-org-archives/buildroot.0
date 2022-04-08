Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0920C433EF
	for <buildroot@archiver.kernel.org>; Fri,  8 Apr 2022 21:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26A8F41E69;
	Fri,  8 Apr 2022 21:19:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LUuQjNoYv57w; Fri,  8 Apr 2022 21:19:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C02B241E37;
	Fri,  8 Apr 2022 21:18:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F1CD61BF3EA
 for <buildroot@lists.busybox.net>; Fri,  8 Apr 2022 21:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF01641CA8
 for <buildroot@lists.busybox.net>; Fri,  8 Apr 2022 21:18:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gQuzsL1qfeQb for <buildroot@lists.busybox.net>;
 Fri,  8 Apr 2022 21:18:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DADB441DFE
 for <buildroot@buildroot.org>; Fri,  8 Apr 2022 21:18:55 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-e2a00f2cc8so1594100fac.4
 for <buildroot@buildroot.org>; Fri, 08 Apr 2022 14:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z7eBsF2zM6CQN9gD+qaXDiTYl3hnkGoZwF3Y509dJeE=;
 b=WBsa0IYDl25edHxOEsMA6lMsSc4nlfxHPjyfOccLvFnOavoBZfGGvfe8ZI3GOjkinE
 2hMsUIQ9XCaEIiDS56IYvbMFrxZ8j/CqqjhgRWERrrMx9kVDZf5d+G6C+FYGg79B6wGV
 Q97Km3i9U/sYAmVQZQRB909maHgKhle9uGLPPU/66Ekbj8osebGLnrgIEfjOoo9QfHT4
 q7fTlsEg/i60ypZ5LJhrlF2pKvJJtPrEZP3fo1jUHLj//dQUf4Syx5pVqNVNWQF8Syqu
 6qoWnIF2ySINjBzVFeNvG8Xlh2jAlIx1Jr2aASal90SRrKpFVo7LTQtXhEb81i8UGbGY
 X3yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z7eBsF2zM6CQN9gD+qaXDiTYl3hnkGoZwF3Y509dJeE=;
 b=euK2z5QfCF0wr5mMyf8oC1SbHFdHMRq8kqelrOogSDusxwxqfCTNO0VZCgJWIOGDvz
 rZuo3rHzcLRSUGvVsSWop0tnirWVUn0tnoqFE60G0pvYab9PaJEsGiTyGRuQ3XyxhSrz
 /huyFpOiLs40IrIoWiUqJU8xuwzJm7RBWNoI5mLcFV8wabdtdLaC77sOaC7XSGTB3++6
 zwJ1aGG1CGroHUHxVfsGLnVNJzF1bUvM6R5Iuz+311fm+vgP2OPAnJUnMlkktphyMF3U
 Z59ASC/XF+sMUEkBzj/FsOkqRVDOU+jwCZyMEGAFngFw8qoTS8RFSS3iLB4HNSoh/JP4
 DDpg==
X-Gm-Message-State: AOAM533UDivJ8N81/4sy/MWPkg5v2Mxo0A2PSje2t9jhIu97rv8IVjuf
 QXjJZOzO+OBB4sh2JUKtKwmwHyYbAHs3bTWs8Gk=
X-Google-Smtp-Source: ABdhPJxA9MQh3tsVwdOikzJGsfQLdiQLr0Di7LxowQJ0qRxlSCSNVb0Venihrz/hWmGqUT42k58ZdnrCWgLtM/RUQr8=
X-Received: by 2002:a05:6870:311d:b0:de:9b6c:362b with SMTP id
 v29-20020a056870311d00b000de9b6c362bmr8974514oaa.200.1649452734893; Fri, 08
 Apr 2022 14:18:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220408070921.1786-1-ambi@samba.org>
In-Reply-To: <20220408070921.1786-1-ambi@samba.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 8 Apr 2022 15:18:43 -0600
Message-ID: <CADvTj4o=EQwRhbEfOoXLAej4JW2kdnLNOwQ-R0AG9hHytJWtLQ@mail.gmail.com>
To: ambi@samba.org
Subject: Re: [Buildroot] [PATCH 1/2] package/openjdk-bin: add support for
 host architecture aarc64
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
Cc: Tudor Holton <buildroot@tudorholton.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Apr 8, 2022 at 1:10 AM Christian Ambach via buildroot
<buildroot@buildroot.org> wrote:
>
> From: Christian Ambach <ambi@samba.org>
>
> Signed-off-by: Christian Ambach <ambi@samba.org>
> ---
>  package/openjdk-bin/openjdk-bin.hash |  2 ++
>  package/openjdk-bin/openjdk-bin.mk   | 11 ++++++++++-
>  2 files changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/package/openjdk-bin/openjdk-bin.hash b/package/openjdk-bin/openjdk-bin.hash
> index bbc939d4e8..58bb646b45 100644
> --- a/package/openjdk-bin/openjdk-bin.hash
> +++ b/package/openjdk-bin/openjdk-bin.hash
> @@ -1,8 +1,10 @@
>  # https://github.com/adoptium/temurin17-binaries/releases
>  sha256  6ea18c276dcbb8522feeebcfc3a4b5cb7c7e7368ba8590d3326c6c3efc5448b6  OpenJDK17U-jdk_x64_linux_hotspot_17.0.1_12.tar.gz
> +sha256  f23d482b2b4ada08166201d1a0e299e3e371fdca5cd7288dcbd81ae82f3a75e3  OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.1_12.tar.gz
>
>  # From https://github.com/adoptium/temurin11-binaries/releases
>  sha256  3b1c0c34be4c894e64135a454f2d5aaa4bd10aea04ec2fa0c0efe6bb26528e30  OpenJDK11U-jdk_x64_linux_hotspot_11.0.13_8.tar.gz
> +sha256  a77013bff10a5e9c59159231dd5c4bd071fc4c24beed42bd49b82803ba9506ef  OpenJDK11U-jdk_aarch64_linux_hotspot_11.0.13_8.tar.gz
>
>  # Locally calculated
>  sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
> diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
> index 266c93d363..efe90f6e97 100644
> --- a/package/openjdk-bin/openjdk-bin.mk
> +++ b/package/openjdk-bin/openjdk-bin.mk
> @@ -11,8 +11,17 @@ else
>  HOST_OPENJDK_BIN_VERSION_MAJOR = 11
>  HOST_OPENJDK_BIN_VERSION_MINOR = 0.13_8
>  endif
> +
> +HOST_OPENJDK_BIN_HOST_ARCH := $(shell uname -m)

Just use HOSTARCH instead like this:
https://github.com/buildroot/buildroot/blob/8f3cfe41961d83a9c01630f241bf045e3aa59b40/package/rustc/rustc.mk#L14

> +ifeq ($(HOST_OPENJDK_BIN_HOST_ARCH),x86_64)
> +HOST_OPENJDK_BIN_DOWNLOAD_ARCH_NAME = x64
> +endif
> +ifeq ($(HOST_OPENJDK_BIN_HOST_ARCH),aarch64)
> +HOST_OPENJDK_BIN_DOWNLOAD_ARCH_NAME = aarch64
> +endif
> +
>  HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR).$(HOST_OPENJDK_BIN_VERSION_MINOR)
> -HOST_OPENJDK_BIN_SOURCE = OpenJDK$(HOST_OPENJDK_BIN_VERSION_MAJOR)U-jdk_x64_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
> +HOST_OPENJDK_BIN_SOURCE = OpenJDK$(HOST_OPENJDK_BIN_VERSION_MAJOR)U-jdk_$(HOST_OPENJDK_BIN_DOWNLOAD_ARCH_NAME)_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
>  HOST_OPENJDK_BIN_SITE = https://github.com/adoptium/temurin$(HOST_OPENJDK_BIN_VERSION_MAJOR)-binaries/releases/download/jdk-$(subst _,%2B,$(HOST_OPENJDK_BIN_VERSION))
>
>  HOST_OPENJDK_BIN_LICENSE = GPL-2.0+ with exception
> --
> 2.27.0.windows.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
