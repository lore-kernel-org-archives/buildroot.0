Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF445CFD2F6
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 19:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0D9060EF9;
	Thu, 27 Nov 2025 19:54:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TQy9ewuBnnAR; Thu, 27 Nov 2025 19:54:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CABA9608C2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CABA9608C2;
	Thu, 27 Nov 2025 19:54:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 24290708
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:54:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1655761493
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:54:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QIc0XBkHTfBI for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 19:54:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 98FF460DA6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98FF460DA6
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 98FF460DA6
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:54:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6B5C3B979CF8; Thu, 27 Nov 2025 20:54:18 +0100 (CET)
Message-ID: <f1c5b877-ac3d-4dd7-bf03-d812c0a7afac@rnout.be>
Date: Thu, 27 Nov 2025 20:54:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Carsten Schoenert <c.schoenert@gmail.com>,
 Lionel Orry <lionel.orry@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20251106204522.3273683-1-bernd@kuhls.net>
 <20251106204522.3273683-6-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251106204522.3273683-6-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1764273258; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=HIntuDMHBqrY9a9jJ670mPLf4nLoEfwwPnZ+xthF3nM=;
 b=N2v1XF8JA1Y2EuPiWigWpd1NW+bde1LaipSiMquBsqP8H0GQXB2FzrVWA9BsRDtVH1PU38
 NJdf+BP+aVKZfhkh4Y3W2s/pTRH0P9VyEMiJ2+sqVEJcAhpaDXhaGY2DkpPj4iqHu4NmQd
 r8tOnPvaYNI5S7c2loN2K3leFX5XYlOtxSeb2NRVO4PeDsNyDvGmhEMy+135MozjapbM8n
 lcOsEhOj1GubRhmQoYidYJ0IL2m3MLogdXLIm219PTi1fO/j2oqgvE2CFaIkovPwctwJwi
 UFUWv/PYQXkZebZZKDBFXzOJBtsOM5MPteqwKF/7MoDJ+5PspNG5RCFM3ZDm7A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=N2v1XF8J
Subject: Re: [Buildroot] [PATCH v3 05/14] package/belr: remove package
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



On 06/11/2025 21:45, Bernd Kuhls wrote:
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> belr was only needed as a dependency of linphone, as is anyway bundled
> in more recent versions of linphone, making a separate package
> unnnecessary.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to 2025.02.x and 2025.08.x, thanks.

  Regards,
  Arnout

> ---
>   Config.in.legacy       |  8 ++++++++
>   DEVELOPERS             |  1 -
>   package/Config.in      |  1 -
>   package/belr/Config.in | 19 -------------------
>   package/belr/belr.hash |  3 ---
>   package/belr/belr.mk   | 25 -------------------------
>   6 files changed, 8 insertions(+), 49 deletions(-)
>   delete mode 100644 package/belr/Config.in
>   delete mode 100644 package/belr/belr.hash
>   delete mode 100644 package/belr/belr.mk
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index db63ed2aab..8f3099d89a 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,14 @@ endif
>   
>   comment "Legacy options removed in 2025.11"
>   
> +config BR2_PACKAGE_BELR
> +	bool "belr has been removed"
> +	select BR2_LEGACY
> +	help
> +	  This package has been removed as part of the linphone
> +	  removal. In addition, newer version of linphone directly
> +	  bundle belr making a separate package unnecessary.
> +
>   config BR2_PACKAGE_BELLE_SIP
>   	bool "belle-sip has been removed"
>   	select BR2_LEGACY
> diff --git a/DEVELOPERS b/DEVELOPERS
> index cb48886d08..b9e7a32ea5 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1019,7 +1019,6 @@ F:	package/openzwave/
>   
>   N:	Fabrice Fontaine <fontaine.fabrice@gmail.com>
>   F:	package/bearssl/
> -F:	package/belr/
>   F:	package/boinc/
>   F:	package/cairo/
>   F:	package/daq3/
> diff --git a/package/Config.in b/package/Config.in
> index 9d80df3797..456c922413 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2167,7 +2167,6 @@ menu "Other"
>   	source "package/basu/Config.in"
>   	source "package/bctoolbox/Config.in"
>   	source "package/bdwgc/Config.in"
> -	source "package/belr/Config.in"
>   	source "package/boost/Config.in"
>   	source "package/c-capnproto/Config.in"
>   	source "package/capnproto/Config.in"
> diff --git a/package/belr/Config.in b/package/belr/Config.in
> deleted file mode 100644
> index f3f742ad28..0000000000
> --- a/package/belr/Config.in
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -config BR2_PACKAGE_BELR
> -	bool "belr"
> -	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # bctoolbox
> -	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # bctoolbox
> -	select BR2_PACKAGE_BCTOOLBOX
> -	help
> -	  Belr is Belledonne Communications' language recognition
> -	  library, written in C++11. It parses text inputs formatted
> -	  according to a language defined by an ABNF grammar, such as
> -	  the protocols standardized at IETF.
> -
> -	  https://gitlab.linphone.org/BC/public/belr
> -
> -comment "belr needs a toolchain w/ threads, C++"
> -	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
> -
> -comment "belr needs a toolchain not affected by GCC bug 64735"
> -	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
> diff --git a/package/belr/belr.hash b/package/belr/belr.hash
> deleted file mode 100644
> index 00c733c7df..0000000000
> --- a/package/belr/belr.hash
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -# Locally calculated
> -sha256  6358aa680193d972c831d677da1652c7f57d7e00649b971d4d9fbdebf4331b48  belr-4.4.8.tar.gz
> -sha256  1b3782ccad7b8614100cda30d3faf42fc39f2e97932908c543005053b654ca68  LICENSE.txt
> diff --git a/package/belr/belr.mk b/package/belr/belr.mk
> deleted file mode 100644
> index 26b949734f..0000000000
> --- a/package/belr/belr.mk
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -################################################################################
> -#
> -# belr
> -#
> -################################################################################
> -
> -BELR_VERSION = 4.4.8
> -BELR_SITE = https://gitlab.linphone.org/BC/public/belr/-/archive/$(BELR_VERSION)
> -BELR_LICENSE = GPL-3.0+
> -BELR_LICENSE_FILES = LICENSE.txt
> -BELR_INSTALL_STAGING = YES
> -BELR_DEPENDENCIES = bctoolbox
> -BELR_CONF_OPTS = \
> -	-DENABLE_STRICT=OFF \
> -	-DENABLE_TESTS=OFF \
> -	-DENABLE_TOOLS=OFF
> -
> -ifeq ($(BR2_STATIC_LIBS),y)
> -BELR_CONF_OPTS += -DENABLE_SHARED=OFF -DENABLE_STATIC=ON
> -else
> -# cannot build static and shared together
> -BELR_CONF_OPTS += -DENABLE_SHARED=ON -DENABLE_STATIC=OFF
> -endif
> -
> -$(eval $(cmake-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
