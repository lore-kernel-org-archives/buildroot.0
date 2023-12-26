Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778B4C46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 21:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29E13409DD;
	Tue, 26 Dec 2023 21:34:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29E13409DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1p1OTGgh-Zpq; Tue, 26 Dec 2023 21:34:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFF69409E6;
	Tue, 26 Dec 2023 21:34:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFF69409E6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AB9F71BF36A
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 21:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 89FCB60F90
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 21:34:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89FCB60F90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DbgXmlNJf0XE for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 21:34:41 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 20CDC60F8C
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 21:34:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20CDC60F8C
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 5D61BB00548;
 Tue, 26 Dec 2023 22:34:36 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 26 Dec 2023 22:34:36 +0100
Date: Tue, 26 Dec 2023 22:34:36 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZYtG7M2KdeCKKWu1@landeda>
References: <20231226131805.2608387-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231226131805.2608387-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703626479;
 bh=sNImhZMcS4j3tm4tJ+UexfAjmSgbDcqsHuv6IxWsvwQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fwtyganvjlADXmY18e61WyumGRIShv+d4MTwl7K8g1thrkHMtXzjzgSphnJlc03j2
 MFFLAn+EI2uhxgsgTHRXQPkhlCPSsyAFIxWvwFzLeG/90MbBGe4lI8K9F8PtP2IjMq
 nyZgunFmOM88lw3gIxp/FLt4YSWhweVXLy7DRt0bldzlmSEldojZeb/u0mGGqncK/n
 +ljny2sp6bwG49m0P3ssANMGPvzxUct5N+IU/PjUcbaNTTZbRjsOL2P10rAEJMR7Bh
 lmaaG2RrYOlrMK2NmXlBn7PFc7QSzuo1/dqK9lzIu2HXepyIp1uadRu8gt9agCuiGw
 6U2DzvsI8tVDg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fwtyganv
Subject: Re: [Buildroot] [PATCH] package/flickcurl: remove package
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
Cc: Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2023-12-26 14:18 +0100, Thomas Petazzoni via buildroot spake thusly:
> This package is causing some build issues, which are probably due to
> the recent libxml2 upgrade:
> 
>   http://autobuild.buildroot.net/results/34d6f6c02f884ab9a2578a38ee8646e14632d6ff/
> 
> There has been no new commit upstream for the past 8 years:
> https://github.com/dajobe/flickcurl, and the last release, 1.26 is
> from 2014. So let's kill the package.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/34d6f6c02f884ab9a2578a38ee8646e14632d6ff/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  Config.in.legacy                 |  7 +++++++
>  DEVELOPERS                       |  1 -
>  package/Config.in                |  1 -
>  package/flickcurl/Config.in      | 21 ---------------------
>  package/flickcurl/flickcurl.hash |  7 -------
>  package/flickcurl/flickcurl.mk   | 23 -----------------------
>  6 files changed, 7 insertions(+), 53 deletions(-)
>  delete mode 100644 package/flickcurl/Config.in
>  delete mode 100644 package/flickcurl/flickcurl.hash
>  delete mode 100644 package/flickcurl/flickcurl.mk
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index d46bd97442..e5822eec24 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,13 @@ endif
>  
>  comment "Legacy options removed in 2023.11"
>  
> +config BR2_PACKAGE_FLICKCURL
> +	bool "flickcurl package was removed"
> +	select BR2_LEGACY
> +	help
> +	  The flickcurl package was removed because it was
> +	  unmaintained upstream and causing build failures.
> +
>  config BR2_PACKAGE_ONEVPL
>  	bool "onevpl package was renamed"
>  	select BR2_LEGACY
> diff --git a/DEVELOPERS b/DEVELOPERS
> index f4adda40a8..cc089e8ff6 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2386,7 +2386,6 @@ F:	package/dfu-programmer/
>  F:	package/docker-compose/
>  F:	package/dump1090/
>  F:	package/fatcat/
> -F:	package/flickcurl/
>  F:	package/fscryptctl/
>  F:	package/ifmetric/
>  F:	package/jo/
> diff --git a/package/Config.in b/package/Config.in
> index 98653ff29d..14af880cb8 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1934,7 +1934,6 @@ menu "Networking"
>  	source "package/dht/Config.in"
>  	source "package/enet/Config.in"
>  	source "package/filemq/Config.in"
> -	source "package/flickcurl/Config.in"
>  	source "package/fmlib/Config.in"
>  	source "package/freeradius-client/Config.in"
>  	source "package/gensio/Config.in"
> diff --git a/package/flickcurl/Config.in b/package/flickcurl/Config.in
> deleted file mode 100644
> index 426ceecba1..0000000000
> --- a/package/flickcurl/Config.in
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -config BR2_PACKAGE_FLICKCURL
> -	bool "flickcurl"
> -	select BR2_PACKAGE_LIBCURL
> -	select BR2_PACKAGE_LIBXML2
> -	# Ensure that libcurl is built with crypto support, since
> -	# flickcurl must access https:// URLs.
> -	select BR2_PACKAGE_OPENSSL if !(BR2_PACKAGE_GNUTLS || BR2_PACKAGE_LIBNSS)
> -	select BR2_PACKAGE_CA_CERTIFICATES # runtime
> -	help
> -	  Flickcurl is a C library for the Flickr API, handling
> -	  creating the requests, signing, token management, calling
> -	  the API, marshalling request parameters and decoding
> -	  responses.
> -
> -	  http://librdf.org/flickcurl/
> -
> -config BR2_PACKAGE_FLICKCURL_UTILS
> -	bool "flickcurl utilities"
> -	depends on BR2_PACKAGE_FLICKCURL
> -	help
> -	  Install flickcurl utilites (flickcurl + flickrdf) to target.
> diff --git a/package/flickcurl/flickcurl.hash b/package/flickcurl/flickcurl.hash
> deleted file mode 100644
> index 8c3ea1682a..0000000000
> --- a/package/flickcurl/flickcurl.hash
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Locally calculated after checking pgp signature
> -sha256  ff42a36c7c1c7d368246f6bc9b7d792ed298348e5f0f5d432e49f6803562f5a3  flickcurl-1.26.tar.gz
> -# Locally computed
> -sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> -sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
> -sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE-2.0.txt
> -sha256  3590f30b0fb9446a1f0a7ea5bcbb5786fa66fa362800f53d2575875d74b91909  LICENSE.html
> diff --git a/package/flickcurl/flickcurl.mk b/package/flickcurl/flickcurl.mk
> deleted file mode 100644
> index 610b81f4d4..0000000000
> --- a/package/flickcurl/flickcurl.mk
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -################################################################################
> -#
> -# flickcurl
> -#
> -################################################################################
> -
> -FLICKCURL_VERSION = 1.26
> -FLICKCURL_SITE = http://download.dajobe.org/flickcurl
> -FLICKCURL_LICENSE = LGPL-2.1+ or GPL-2.0+ or Apache-2.0+
> -FLICKCURL_LICENSE_FILES = COPYING COPYING.LIB LICENSE-2.0.txt LICENSE.html
> -FLICKCURL_INSTALL_STAGING = YES
> -FLICKCURL_CONFIG_SCRIPTS = flickcurl-config
> -FLICKCURL_CONF_OPTS = --without-curl-config --without-xml2-config --without-raptor
> -FLICKCURL_DEPENDENCIES = libcurl libxml2 host-pkgconf
> -
> -ifeq ($(BR2_PACKAGE_FLICKCURL_UTILS),)
> -define FLICKCURL_REMOVE_UTILS
> -	rm -f $(TARGET_DIR)/usr/bin/flickcurl $(TARGET_DIR)/usr/bin/flickrdf
> -endef
> -FLICKCURL_POST_INSTALL_TARGET_HOOKS += FLICKCURL_REMOVE_UTILS
> -endif
> -
> -$(eval $(autotools-package))
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
