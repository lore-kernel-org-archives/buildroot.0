Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610C9C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 18:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E16788126C;
	Sun, 30 Oct 2022 18:54:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E16788126C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T_usrrQ9zPtk; Sun, 30 Oct 2022 18:54:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0549C8124B;
	Sun, 30 Oct 2022 18:54:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0549C8124B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D9BD41BF473
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 18:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1BCF8124B
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 18:54:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1BCF8124B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ycwkifi7Dodx for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 18:54:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6F8380FB6
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E6F8380FB6
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 18:54:11 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id b29so8915791pfp.13
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 11:54:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P4hi2cf96B9gYILEgYkYF5rlNtjOPm4QkbZpHz5xlJQ=;
 b=qXxB8GjB5kN6xYc5bbm2/gLoPZpVTgWv0B9r5mF7or9vb9NpEH8MvKQ/asz1lXkNbi
 WZpx0uPNjdWo32ARfwjRyztgtnKKkF2sqlHbE8zMRmd2/SqXj9gR/PLszySxfskMO9u/
 hBr2gL2bDWR0P5Rv497wI+FFXMVAVAiUP9Ag5SURgDQZij3DNA96SBsV3R0Cyim2x5M3
 hnmMgfCTIp6mxvaHpdnYlnsk49JPhcWVApTCzBeffyqmcB6zgtDtGSCxKDnLivaTRD7Z
 uo2U5NdIbNFSek7z59KwIzenn6jw9fjQhBFYqoyTIsTi2ufOEBo+qGwPCnlPUcvt099V
 QQRw==
X-Gm-Message-State: ACrzQf15Yjuve70zoE5BJb2Zqc93uZX9T3gho+jWWALmyVRVBDIS9Da9
 x10/dz342acqydsxbAEGYwrEJwwNABCt1JpSwH92w2AFjPJaBQ==
X-Google-Smtp-Source: AMsMyM7gpnQB97MQtCqB+0Ce2xG7xKDuP1A0UyircT6MSzzoTgwDmkvEWQHMvxfslbuxtZx5o+fuJ6Hphu5EQZ1J/rg=
X-Received: by 2002:a05:6a00:140d:b0:528:5a5a:d846 with SMTP id
 l13-20020a056a00140d00b005285a5ad846mr10672103pfu.9.1667156051258; Sun, 30
 Oct 2022 11:54:11 -0700 (PDT)
MIME-Version: 1.0
References: <20221030164840.BABD7875A8@busybox.osuosl.org>
In-Reply-To: <20221030164840.BABD7875A8@busybox.osuosl.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 30 Oct 2022 14:53:59 -0400
Message-ID: <CADvTj4rQSTfOnwo6KJBh_fJygJ4y=WgjK9CU9ThqRzknXdzLRQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=P4hi2cf96B9gYILEgYkYF5rlNtjOPm4QkbZpHz5xlJQ=;
 b=K94xmckSfdvYcNwM26DEB2aLVmD9Sve++11769PoFcEnbKJykNqLaQm0qagKdF31dr
 VU9XKAuBBYPAx7G7/zwWdzxAr8rOUC8pfMlablJSY/4wjFCOayRO8+RW9umNM9S3PAHV
 Bq2qJoY5HNsPigoyZRH0EdvG06Mxa8Rb6ljd60B/6pCthHfbRDrKTH8MbAMCH8FnEedK
 Z6cxiTiaihMfja9w/f8r48xKwrH5LyAGOszXjjZIIuNqaJ9W7oht7rknmcU5huGhZYZf
 iBOyDFpBlKQ2zMQZKDKOYaYCIVcIbp6acz7bbIOqjPnqCsTXdorGBqAPsJtkrk1ZeDfo
 d4mA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=K94xmckS
Subject: Re: [Buildroot] [git commit] Force cmake packages to use makefiles
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Oct 30, 2022 at 12:48 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> commit: https://git.buildroot.net/buildroot/commit/?id=a5d8582e37b8b7440a71d4cad68e85bebc4aec6c
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> Force cmake packages to use the "Unix Makefiles" generator
> in case CMAKE_GENERATOR is set in the host environment. This
> patch further isolates the buildroot build environment from
> the host.

All autobuilders appear to have broken due to this commit:
http://autobuild.buildroot.net/results/b0c/b0c61adbe7d512d0b5f6850b2fb3aaee14caa9d9/build-end.log

Error seems to be:
CMake Error: Could not create named generator Unix MakeFiles

Generators
  Green Hills MULTI            = Generates Green Hills MULTI files
                                 (experimental, work-in-progress).
* Unix Makefiles               = Generates standard UNIX makefiles.
  Ninja                        = Generates build.ninja files.
  Ninja Multi-Config           = Generates build-<Config>.ninja files.
  Watcom WMake                 = Generates Watcom WMake makefiles.
  CodeBlocks - Ninja           = Generates CodeBlocks project files.
  CodeBlocks - Unix Makefiles  = Generates CodeBlocks project files.
  CodeLite - Ninja             = Generates CodeLite project files.
  CodeLite - Unix Makefiles    = Generates CodeLite project files.
  Eclipse CDT4 - Ninja         = Generates Eclipse CDT 4.0 project files.
  Eclipse CDT4 - Unix Makefiles= Generates Eclipse CDT 4.0 project files.
  Kate - Ninja                 = Generates Kate project files.
  Kate - Unix Makefiles        = Generates Kate project files.
  Sublime Text 2 - Ninja       = Generates Sublime Text 2 project files.
  Sublime Text 2 - Unix Makefiles
                               = Generates Sublime Text 2 project files.

Looks like MakeFiles is spelled wrong.

>
> Signed-off-by: Woodrow Douglass <wdouglass@carnegierobotics.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  package/pkg-cmake.mk | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index 081960b5bf..db9fdebb8d 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -88,6 +88,7 @@ define $(2)_CONFIGURE_CMDS
>         rm -f CMakeCache.txt && \
>         PATH=$$(BR_PATH) \
>         $$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
> +               -G"Unix MakeFiles" \
>                 -DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/share/buildroot/toolchainfile.cmake" \
>                 -DCMAKE_INSTALL_PREFIX="/usr" \
>                 -DCMAKE_INSTALL_RUNSTATEDIR="/run" \
> @@ -118,6 +119,7 @@ define $(2)_CONFIGURE_CMDS
>         PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
>         PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
>         $$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
> +               -G"Unix MakeFiles" \
>                 -DCMAKE_INSTALL_SO_NO_EXE=0 \
>                 -DCMAKE_FIND_ROOT_PATH="$$(HOST_DIR)" \
>                 -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="BOTH" \
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
