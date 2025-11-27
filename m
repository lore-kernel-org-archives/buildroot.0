Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C30C5D116EA
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 19:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C911E616EA;
	Thu, 27 Nov 2025 19:54:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zjke8-AXLtqW; Thu, 27 Nov 2025 19:54:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2777D616FD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2777D616FD;
	Thu, 27 Nov 2025 19:54:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D85A0708
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:54:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5753616E5
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:54:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fuU5BtZ1nVbT for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 19:54:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6757560F83
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6757560F83
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6757560F83
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:54:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 13A58B979CA9; Thu, 27 Nov 2025 20:54:08 +0100 (CET)
Message-ID: <4ebc6324-abc0-4a7a-be5f-49e620151a21@rnout.be>
Date: Thu, 27 Nov 2025 20:54:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Carsten Schoenert <c.schoenert@gmail.com>,
 Lionel Orry <lionel.orry@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20251106204522.3273683-1-bernd@kuhls.net>
 <20251106204522.3273683-5-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251106204522.3273683-5-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1764273249; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=szfw660MfzT4eRYaTgK2t6NXdBX5lvZV2HUAnAgkCq0=;
 b=G5MhUaIjbKi5W3p3Jm/mL56LaCUyjLhu9J0WDc1mGimbrRJTyzOuHG4/Qs+vniez+nI2PD
 3lsPKZiyWM+qvZna2XdlesAGAQAWrsd2tnXJcUKlLh+VgUtiL0WA7A63AViVIMGm7zL6MO
 fBMAi2pLxhwBXTNJpAWDyleYUUmTCyl7W3timVPgKTM8FbDylXl1uENWnM+oQZic8BEYVe
 PYMT4nxxlrlpWrYEU++8/jYOxiCUpUtrcyfqePGCVhBOu8466YldfPoVhOTpgvHS+nlHrM
 HZ7BmSqot+jhBYXMiM3exjyB8IQTwGNfqhfKq4WmeTcO1R0lvRsgsbPGxW90Bw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=G5MhUaIj
Subject: Re: [Buildroot] [PATCH v3 04/14] package/belle-sip: remove package
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
> belle-sip was only needed as a dependency of linphone, as is anyway
> bundled in more recent versions of linphone, making a separate package
> unnnecessary.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to 2025.02.x and 2025.08.x, thanks.

  Regards,
  Arnout

> ---
>   Config.in.legacy                 |  8 +++++++
>   DEVELOPERS                       |  1 -
>   package/Config.in                |  1 -
>   package/belle-sip/Config.in      | 22 ------------------
>   package/belle-sip/belle-sip.hash |  3 ---
>   package/belle-sip/belle-sip.mk   | 40 --------------------------------
>   6 files changed, 8 insertions(+), 67 deletions(-)
>   delete mode 100644 package/belle-sip/Config.in
>   delete mode 100644 package/belle-sip/belle-sip.hash
>   delete mode 100644 package/belle-sip/belle-sip.mk
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index b33798e7ed..db63ed2aab 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,14 @@ endif
>   
>   comment "Legacy options removed in 2025.11"
>   
> +config BR2_PACKAGE_BELLE_SIP
> +	bool "belle-sip has been removed"
> +	select BR2_LEGACY
> +	help
> +	  This package has been removed as part of the linphone
> +	  removal. In addition, newer version of linphone directly
> +	  bundle belle-sip making a separate package unnecessary.
> +
>   config BR2_PACKAGE_LINPHONE
>   	bool "linphone has been removed"
>   	select BR2_LEGACY
> diff --git a/DEVELOPERS b/DEVELOPERS
> index f9cf31f7e2..cb48886d08 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1019,7 +1019,6 @@ F:	package/openzwave/
>   
>   N:	Fabrice Fontaine <fontaine.fabrice@gmail.com>
>   F:	package/bearssl/
> -F:	package/belle-sip/
>   F:	package/belr/
>   F:	package/boinc/
>   F:	package/cairo/
> diff --git a/package/Config.in b/package/Config.in
> index f7f5755315..9d80df3797 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2010,7 +2010,6 @@ menu "Networking"
>   	source "package/azmq/Config.in"
>   	source "package/azure-iot-sdk-c/Config.in"
>   	source "package/batman-adv/Config.in"
> -	source "package/belle-sip/Config.in"
>   	source "package/bluez5_utils-headers/Config.in"
>   	source "package/c-ares/Config.in"
>   	source "package/cni-plugins/Config.in"
> diff --git a/package/belle-sip/Config.in b/package/belle-sip/Config.in
> deleted file mode 100644
> index 8e4de366e4..0000000000
> --- a/package/belle-sip/Config.in
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -config BR2_PACKAGE_BELLE_SIP
> -	bool "belle-sip"
> -	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on !BR2_STATIC_LIBS # dlfcn.h
> -	depends on BR2_TOOLCHAIN_HAS_THREADS
> -	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # bctoolbox
> -	depends on BR2_USE_WCHAR
> -	select BR2_PACKAGE_BCTOOLBOX
> -	# needs crypto support in bctoolbox
> -	select BR2_PACKAGE_MBEDTLS
> -	help
> -	  Belle-sip is a modern library implementing SIP (RFC 3261)
> -	  transport, transaction and dialog layers.
> -
> -	  http://www.linphone.org/technical-corner/belle-sip
> -
> -comment "belle-sip needs a toolchain w/ threads, C++, dynamic library, wchar"
> -	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
> -		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
> -
> -comment "belle-sip needs a toolchain not affected by GCC bug 64735"
> -	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
> diff --git a/package/belle-sip/belle-sip.hash b/package/belle-sip/belle-sip.hash
> deleted file mode 100644
> index 670ce0062e..0000000000
> --- a/package/belle-sip/belle-sip.hash
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -# Locally calculated
> -sha256  eabba615c97080572c1b9d3c76f8f9cf6a7432eedf37482672e5fa178a688f72  belle-sip-4.4.8.tar.gz
> -sha256  1b3782ccad7b8614100cda30d3faf42fc39f2e97932908c543005053b654ca68  LICENSE.txt
> diff --git a/package/belle-sip/belle-sip.mk b/package/belle-sip/belle-sip.mk
> deleted file mode 100644
> index b4de3612ce..0000000000
> --- a/package/belle-sip/belle-sip.mk
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -################################################################################
> -#
> -# belle-sip
> -#
> -################################################################################
> -
> -BELLE_SIP_VERSION = 4.4.8
> -BELLE_SIP_SITE = \
> -	https://gitlab.linphone.org/BC/public/belle-sip/-/archive/$(BELLE_SIP_VERSION)
> -BELLE_SIP_LICENSE = GPL-3.0+
> -BELLE_SIP_LICENSE_FILES = LICENSE.txt
> -BELLE_SIP_CPE_ID_VENDOR = linphone
> -BELLE_SIP_INSTALL_STAGING = YES
> -BELLE_SIP_DEPENDENCIES = \
> -	bctoolbox \
> -	$(if $(BR2_PACKAGE_ZLIB),zlib)
> -BELLE_SIP_CONF_OPTS = \
> -	-DENABLE_STRICT=OFF \
> -	-DENABLE_TESTS=OFF
> -
> -ifeq ($(BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY),y)
> -BELLE_SIP_CONF_OPTS += -DENABLE_MDNS=ON
> -BELLE_SIP_DEPENDENCIES += avahi
> -else
> -BELLE_SIP_CONF_OPTS += -DENABLE_MDNS=OFF
> -endif
> -
> -ifeq ($(BR2_STATIC_LIBS),y)
> -BELLE_SIP_CONF_OPTS += -DENABLE_SHARED=OFF -DENABLE_STATIC=ON
> -else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
> -BELLE_SIP_CONF_OPTS += -DENABLE_SHARED=ON -DENABLE_STATIC=ON
> -else ifeq ($(BR2_SHARED_LIBS),y)
> -BELLE_SIP_CONF_OPTS += -DENABLE_SHARED=ON -DENABLE_STATIC=OFF
> -endif
> -
> -BELLE_SIP_CFLAGS = $(TARGET_CFLAGS)
> -
> -BELLE_SIP_CONF_OPTS += -DCMAKE_C_FLAGS="$(BELLE_SIP_CFLAGS)"
> -
> -$(eval $(cmake-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
