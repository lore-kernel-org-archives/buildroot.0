Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE70ECAC5B8
	for <buildroot@archiver.kernel.org>; Sun,  5 Oct 2025 04:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61DC883F02;
	Sun,  5 Oct 2025 04:34:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nu4_tEQdxk55; Sun,  5 Oct 2025 04:34:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C45883EF9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C45883EF9;
	Sun,  5 Oct 2025 04:34:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 014D5272
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 04:34:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB66483EF9
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 04:34:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FfqDFwyVbgpr for <buildroot@buildroot.org>;
 Sun,  5 Oct 2025 04:34:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6C0E683EF6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C0E683EF6
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C0E683EF6
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 04:34:13 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id DC3A4440FA4;
 Sun,  5 Oct 2025 07:33:15 +0300 (IDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251004105801.380109-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sat, 4 Oct 2025 12:58:01 +0200")
References: <20251004105801.380109-1-bernd@kuhls.net>
User-Agent: mu4e 1.12.12; emacs 30.1
Date: Sun, 05 Oct 2025 07:34:08 +0300
Message-ID: <87347yynjz.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1759638795;
 bh=hZVczpFbjIBgfjjvUbb1F2clcNVUo/DDPWUOYUIW3ks=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=HAQ9KZqcx78ybVkRjqbv98rDGloatHtqgu/YloT9Eo1peJnAiFqbLjbBOYn7w/sxh
 hSvdssaq5DarAKbRfZpfYqGe0Yw4O1zwLRVqEKpwqxjfNDsx4DgWbhAo0FtaKNk7/S
 srMFtkltHmE1kqlt9BvEisFetz0XZCl7f2HTToGyhnR7cUhNmXmI+ajsQgBp3y7BKE
 HR84yOn2M1FJ5i9tezYRjnp7BcInWUMRcVclhEAJuzet3CmUKiXOAh/3/nEpI5nbP9
 JeS3iLswZbsGA/xo1uMw7sjaDjBfmlPT3Qv4AXmOiV8squyAmnk79wOK/dhv0ajEKD
 xTtGit1CAvHKQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=HAQ9KZqc
Subject: Re: [Buildroot] [PATCH 1/1] package/libao: bump version to 1.2.2
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

On Sat, Oct 04 2025, Bernd Kuhls wrote:
> Added upstream patch to fix a missing include, autobuild did not record
> any build errors but Arch Linux provides the patch:
> https://gitlab.archlinux.org/archlinux/packaging/packages/libao/-/commit/bad3196d4e3030d31b01eb3bd41fff8afc8ca113

Where is this patch?

baruch

>
> Switched to gitlab tarball because the previous site does not provide a
> tarball for version 1.2.2 which was tagged in 2016:
> https://gitlab.xiph.org/xiph/libao/-/tags/1.2.2
>
> Added autoreconf due to usage of gitlab tarball which does not contain
> a configure script.
>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libao/libao.hash | 6 ++----
>  package/libao/libao.mk   | 5 +++--
>  2 files changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/package/libao/libao.hash b/package/libao/libao.hash
> index 91c6bd11a7..70e6b4987e 100644
> --- a/package/libao/libao.hash
> +++ b/package/libao/libao.hash
> @@ -1,5 +1,3 @@
> -# From http://downloads.xiph.org/releases/ao/SHA256SUMS.txt
> -sha256  03ad231ad1f9d64b52474392d63c31197b0bc7bd416e58b1c10a329a5ed89caf  libao-1.2.0.tar.gz
> -
> -# Hash for license file:
> +# Locally computed
> +sha256  df8a6d0e238feeccb26a783e778716fb41a801536fe7b6fce068e313c0e2bf4d  libao-1.2.2.tar.gz
>  sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
> diff --git a/package/libao/libao.mk b/package/libao/libao.mk
> index 19a4c165c6..a9fd739ff3 100644
> --- a/package/libao/libao.mk
> +++ b/package/libao/libao.mk
> @@ -4,13 +4,14 @@
>  #
>  ################################################################################
>  
> -LIBAO_VERSION = 1.2.0
> -LIBAO_SITE = http://downloads.xiph.org/releases/ao
> +LIBAO_VERSION = 1.2.2
> +LIBAO_SITE = https://gitlab.xiph.org/xiph/libao/-/archive/$(LIBAO_VERSION)
>  LIBAO_DEPENDENCIES = host-pkgconf
>  LIBAO_INSTALL_STAGING = YES
>  LIBAO_LICENSE = GPL-2.0+
>  LIBAO_LICENSE_FILES = COPYING
>  LIBAO_CPE_ID_VENDOR = xiph
> +LIBAO_AUTORECONF = YES
>  LIBAO_CONF_OPTS = \
>  	--disable-esd \
>  	--disable-wmm \

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
