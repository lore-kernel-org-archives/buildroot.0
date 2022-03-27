Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA56C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 16:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE0A560EFE;
	Sun, 27 Mar 2022 16:09:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QA5MJm5wHaG9; Sun, 27 Mar 2022 16:09:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2E5A60E64;
	Sun, 27 Mar 2022 16:09:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 24BC21BF303
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14439401E5
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:09:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hSzPDn8Y85ln for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 16:09:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D46E0401E3
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 16:09:18 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id u26so14364882eda.12
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 09:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Z7ez8XSvORe+ghmBBSqGTKEZCeptsW7PiRBV/1niqHQ=;
 b=U4vDT4p5a8zR6f22P0gaP4XwQdDh8BJ1qwCMcjnS1K42htkOAXASonqbxNRjRh9wUe
 O+dyn0NKOf2Be/j1Iv7p3CN2ug5ieG0LSZCwfW2mo1udeHs++S76rcY1rYLjRZ6SIHUm
 uZnY3GG2a6AYr4YuB6fly/Vh7YyaQpoiY6hMBYFR7OZ+y1BfE4kATvjsNTY7lG47TP6E
 YiG9atXzpUAUUnR5PCXqIZTWLAtDko1tSXpikNzqDIc4jgvCI0XIkOQrVR5kjn8y6V2G
 komQor7PVcEFH8J89agcUEcAQZP3a/dtyW28Sy/bcwPSJ/j19/UWIT2zkpQWqrfEBCvj
 pnxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Z7ez8XSvORe+ghmBBSqGTKEZCeptsW7PiRBV/1niqHQ=;
 b=zWjJQVym8mWKOMClA/GAKxWAMFwIDtYrovR2vrnxjIgHnQ5VgUUIyM8uK6R2yzc+v0
 w0+oRoJ7oDXtKiorW5OHeXdE9yknUmxYqgfmcsOcgWoxNSkT1Q2l8hBIsD/g676PMyZ0
 PBPWGhNP5pgX6ZJKNhbC3E89unfY/Sj8Fv6JRlkqGc02wIEIEOoSWa74vQaCajbv+FjL
 yM7hnuA/X/orSpZPtEyW0VlSeG65XQN/H5++XRc3ywp7aMUfDSFoabFArsnqn/KWV/iQ
 4Ad3T/NwOxPJhvcpo9ITtZObQrxTw23sw3K73PE6NHepUvlSPhbte9Wt4vy9oi+rc4NG
 RfXQ==
X-Gm-Message-State: AOAM532yjL6CwVclW+AGco8Nu6jzb9VU4A371xfGhMkR9ukuXsLOiz22
 0JQnYJguyChAUXph0NtGFUxlaenudH8V7Q==
X-Google-Smtp-Source: ABdhPJyGLdL1IysigrVZPlTXZA08h4Mv3CkLQzsykFRYn9RXTOOTC5XagUDmOpKrpXGL0QTb0ia0Og==
X-Received: by 2002:a05:6402:350c:b0:419:3cb8:b714 with SMTP id
 b12-20020a056402350c00b004193cb8b714mr11019231edd.297.1648397357093; 
 Sun, 27 Mar 2022 09:09:17 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 v26-20020a50955a000000b00418ebdb07ddsm5914701eda.56.2022.03.27.09.09.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 09:09:16 -0700 (PDT)
Message-ID: <b54bdffa-b82c-9c2f-0f76-4a8a71937af5@mind.be>
Date: Sun, 27 Mar 2022 18:09:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220322182946.2446236-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220322182946.2446236-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/mp4v2: bump to version 2.1.1
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/03/2022 19:29, Fabrice Fontaine wrote:
> - Switch to new active fork:
>    https://github.com/enzo1982/mp4v2/discussions/1
>    https://github.com/TechSmith/mp4v2/commit/461abd2b1365e14ba28dd0e4a0cb6c3bee1bab41
> - C++11 is not needed anymore thanks to
>    https://github.com/enzo1982/mp4v2/commit/5a57bc2ce8948f6ffa96761286921ab3e2ebe467
> - Drop patch (not needed since
>    https://github.com/enzo1982/mp4v2/commit/23f8b907d4a221e1dae9e8b859cb6b1161206866)
> - Update license (minor fix:
>    https://github.com/enzo1982/mp4v2/commit/0c37402d9d3644ea0b7d55db1d901bfad9723dfc)
> - Version 2.1.1 was never released before so no issue is expected
>    (except a misunderstanding of users but new upstream is aware of this:
>    https://github.com/enzo1982/mp4v2/discussions/1#discussioncomment-2399344)
> 
> https://github.com/enzo1982/mp4v2/releases/tag/v2.1.1
> https://github.com/enzo1982/mp4v2/releases/tag/v2.1.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...tatic-cast-to-unsigned-int-for-cases.patch | 99 -------------------
>   package/mp4v2/Config.in                       |  8 +-
>   package/mp4v2/mp4v2.hash                      |  4 +-
>   package/mp4v2/mp4v2.mk                        |  5 +-
>   4 files changed, 8 insertions(+), 108 deletions(-)
>   delete mode 100644 package/mp4v2/0001-Static-cast-to-unsigned-int-for-cases.patch
> 
> diff --git a/package/mp4v2/0001-Static-cast-to-unsigned-int-for-cases.patch b/package/mp4v2/0001-Static-cast-to-unsigned-int-for-cases.patch
> deleted file mode 100644
> index 6c9b13bed8..0000000000
> --- a/package/mp4v2/0001-Static-cast-to-unsigned-int-for-cases.patch
> +++ /dev/null
> @@ -1,99 +0,0 @@
> -From a5ca35b044bbf13c0b16f0066bf24646604bb218 Mon Sep 17 00:00:00 2001
> -From: "Jason A. Donenfeld" <Jason@zx2c4.com>
> -Date: Thu, 6 Aug 2020 15:22:04 +0200
> -Subject: [PATCH] Static cast to unsigned int for cases
> -
> -Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> -[Retrieved from:
> -https://gitweb.gentoo.org/repo/gentoo.git/tree/media-libs/libmp4v2/files/libmp4v2-2.0.0-unsigned-int-cast.patch]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - libutil/Utility.cpp  | 2 +-
> - util/mp4art.cpp      | 2 +-
> - util/mp4chaps.cpp    | 2 +-
> - util/mp4file.cpp     | 2 +-
> - util/mp4subtitle.cpp | 2 +-
> - util/mp4track.cpp    | 2 +-
> - 6 files changed, 6 insertions(+), 6 deletions(-)
> -
> -diff --git a/libutil/Utility.cpp b/libutil/Utility.cpp
> -index 76cdd12..d6739d4 100644
> ---- a/libutil/Utility.cpp
> -+++ b/libutil/Utility.cpp
> -@@ -493,7 +493,7 @@ Utility::process_impl()
> -         if( codes.find( code ) == codes.end() )
> -             continue;
> -
> --        switch( code ) {
> -+        switch( static_cast<unsigned int>( code ) ) {
> -             case 'z':
> -                 _optimize = true;
> -                 break;
> -diff --git a/util/mp4art.cpp b/util/mp4art.cpp
> -index add935e..6e7f531 100644
> ---- a/util/mp4art.cpp
> -+++ b/util/mp4art.cpp
> -@@ -376,7 +376,7 @@ ArtUtility::utility_option( int code, bool& handled )
> - {
> -     handled = true;
> -
> --    switch( code ) {
> -+    switch( static_cast<unsigned int> ( code ) ) {
> -         case LC_ART_ANY:
> -             _artFilter = numeric_limits<uint32_t>::max();
> -             break;
> -diff --git a/util/mp4chaps.cpp b/util/mp4chaps.cpp
> -index 98400f8..ccc8b70 100644
> ---- a/util/mp4chaps.cpp
> -+++ b/util/mp4chaps.cpp
> -@@ -632,7 +632,7 @@ ChapterUtility::utility_option( int code, bool& handled )
> - {
> -     handled = true;
> -
> --    switch( code ) {
> -+    switch( static_cast<unsigned int> ( code ) ) {
> -         case 'A':
> -         case LC_CHPT_ANY:
> -             _ChapterType = MP4ChapterTypeAny;
> -diff --git a/util/mp4file.cpp b/util/mp4file.cpp
> -index c27844b..b127cd1 100644
> ---- a/util/mp4file.cpp
> -+++ b/util/mp4file.cpp
> -@@ -189,7 +189,7 @@ FileUtility::utility_option( int code, bool& handled )
> - {
> -     handled = true;
> -
> --    switch( code ) {
> -+    switch( static_cast<unsigned int>( code ) ) {
> -         case LC_LIST:
> -             _action = &FileUtility::actionList;
> -             break;
> -diff --git a/util/mp4subtitle.cpp b/util/mp4subtitle.cpp
> -index 7462153..19d977d 100644
> ---- a/util/mp4subtitle.cpp
> -+++ b/util/mp4subtitle.cpp
> -@@ -164,7 +164,7 @@ SubtitleUtility::utility_option( int code, bool& handled )
> - {
> -     handled = true;
> -
> --    switch( code ) {
> -+    switch( static_cast<unsigned int>( code ) ) {
> -         case LC_LIST:
> -             _action = &SubtitleUtility::actionList;
> -             break;
> -diff --git a/util/mp4track.cpp b/util/mp4track.cpp
> -index d550506..cd63d7e 100644
> ---- a/util/mp4track.cpp
> -+++ b/util/mp4track.cpp
> -@@ -788,7 +788,7 @@ TrackUtility::utility_option( int code, bool& handled )
> - {
> -     handled = true;
> -
> --    switch( code ) {
> -+    switch( static_cast<unsigned int>( code ) ) {
> -         case LC_TRACK_WILDCARD:
> -             _trackMode = TM_WILDCARD;
> -             break;
> ---
> -2.28.0
> -
> diff --git a/package/mp4v2/Config.in b/package/mp4v2/Config.in
> index 00e80cd358..705a8c9d24 100644
> --- a/package/mp4v2/Config.in
> +++ b/package/mp4v2/Config.in
> @@ -1,12 +1,11 @@
>   config BR2_PACKAGE_MP4V2
>   	bool "mp4v2"
>   	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++11
>   	help
>   	  The MP4v2 library provides functions to read, create, and
>   	  modify mp4 files.
>   
> -	  https://github.com/TechSmith/mp4v2/
> +	  https://mp4v2.org/
>   
>   if BR2_PACKAGE_MP4V2
>   
> @@ -19,6 +18,5 @@ config BR2_PACKAGE_MP4V2_UTIL
>   
>   endif
>   
> -comment "mp4v2 needs a toolchain w/ C++, gcc >= 5"
> -	depends on !BR2_INSTALL_LIBSTDCPP || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
> +comment "mp4v2 needs a toolchain w/ C++"
> +	depends on !BR2_INSTALL_LIBSTDCPP
> diff --git a/package/mp4v2/mp4v2.hash b/package/mp4v2/mp4v2.hash
> index 7aa5402c8f..d3f0243650 100644
> --- a/package/mp4v2/mp4v2.hash
> +++ b/package/mp4v2/mp4v2.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  de31e430e2641f25b67d10c47b0cda35279881b0196120e33bcd71b9cef1bd58  mp4v2-5.0.1.tar.gz
> -sha256  15e38684c940176e2fc76331a2299d2ab5115ac997078f768ef31b896af69fc5  COPYING
> +sha256  29420c62e56a2e527fd8979d59d05ed6d83ebe27e0e2c782c1ec19a3a402eaee  mp4v2-2.1.1.tar.bz2
> +sha256  7187891a4c39ee9e7ec70c71fc7dc8b8ed02c6f56ae1ffc017a34ac66dca5390  COPYING
> diff --git a/package/mp4v2/mp4v2.mk b/package/mp4v2/mp4v2.mk
> index 6d29228a13..7de837c170 100644
> --- a/package/mp4v2/mp4v2.mk
> +++ b/package/mp4v2/mp4v2.mk
> @@ -4,9 +4,10 @@
>   #
>   ################################################################################
>   
> -MP4V2_VERSION = 5.0.1
> +MP4V2_VERSION = 2.1.1
>   MP4V2_SITE = \
> -	$(call github,TechSmith,mp4v2,Release-ThirdParty-MP4v2-$(MP4V2_VERSION))
> +	https://github.com/enzo1982/mp4v2/releases/download/v$(MP4V2_VERSION)
> +MP4V2_SOURCE = mp4v2-$(MP4V2_VERSION).tar.bz2
>   MP4V2_INSTALL_STAGING = YES
>   MP4V2_LICENSE = MPL-1.1
>   MP4V2_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
