Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 684E0C433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 18:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE4A781C56;
	Thu, 14 Apr 2022 18:54:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZxTfmxNd9tfP; Thu, 14 Apr 2022 18:54:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEEFA81C67;
	Thu, 14 Apr 2022 18:54:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 04D481BF397
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 18:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5F23403E5
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 18:54:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6CJtYLDFga7m for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 18:54:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6F01B4012D
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 18:54:52 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id z99so7515354ede.5
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 11:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Fh07Si/adV1QvTpUfdnzJrFeeKoHwigPnooU9H2tYqo=;
 b=ZpQF8Fmgqe1htMOkvLDeyHfaqkOpsox5y3i8s8CKn4ESjDeUWkVoyBRDgzhM6hqun7
 390QmfdZczg0RgW2WN/CoroPowjbK3nnAE9LgfIqNn/l3vouyNwRSxyNG4nXe34CAVba
 JS4O7QSdFk4GrZJVbgM3SQ7XPVXoolI16Y3ALIqURqV+yNMUNjXUlklIGYQBc7g7sKzr
 N6EIdZre1c9UjYWqILrUkjsNzvFMMdmIK/qYdl373tB953OlF7ohr1/GpQu+irepeiwh
 RgophoE7BeEkPmOJt/ilOnNc6YVqq8SEFG+62DqQo6x2ic44WAik67dHAX8aSb6cf7KO
 M5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Fh07Si/adV1QvTpUfdnzJrFeeKoHwigPnooU9H2tYqo=;
 b=iIaNmQR7jfwRQWCAdFTrSi6z4XYrdstsduo7xh9PRVnQ+OANYYTdMd93cD18nzVT9H
 atjwjXL194PeeoViq6TH2k/tqHN+SChSIwBkRP9AKzTqUf/YDejkvWs8SqA/VGWLjgXy
 XPNuETtd4PgXF4YClVyuIZmLgzj3GYLTSiT12DEulJxbzhWPZ5w+D8P6QFKINmYHe7ec
 pDotyK+onUedKzvYg2aP4CQ+zd+Y1B2ibdnRyMJCvWY2y/5KeYYnnu/rEQpgRy1J3+ZD
 45SrMwQLkLBGY6vg9rJMj4ioudwWgX2/A/igMVqO+P5Rr1818LX01RE2MyiMSnHS/sal
 2Big==
X-Gm-Message-State: AOAM533zZq/9zv/AgT7qFO/5szmQuDj5nBBkV4HhYlK8d/XC55GQpLIb
 Sa035OiNNf4Rt1zg4rTW6hfEOA==
X-Google-Smtp-Source: ABdhPJxFiwxpK586F9ZlvB34YMxnagGC9KE/vQ7wHN0p1re32CdUIaLIvQp5IAjF6/RobYyMFhdP2Q==
X-Received: by 2002:a05:6402:14b:b0:418:d06e:5d38 with SMTP id
 s11-20020a056402014b00b00418d06e5d38mr4495963edu.90.1649962490449; 
 Thu, 14 Apr 2022 11:54:50 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a17090606c200b006a728f4a9bcsm911197ejb.148.2022.04.14.11.54.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 11:54:49 -0700 (PDT)
Message-ID: <7fa2e422-fbb5-6627-efb6-1eb7d599cae3@mind.be>
Date: Thu, 14 Apr 2022 20:54:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Francis Laniel <flaniel@linux.microsoft.com>, buildroot@buildroot.org
References: <20220414174358.38059-1-flaniel@linux.microsoft.com>
 <20220414174358.38059-4-flaniel@linux.microsoft.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220414174358.38059-4-flaniel@linux.microsoft.com>
Subject: Re: [Buildroot] [PATCH 3/3] package/sysdig: bump to 0.29.1
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/04/2022 19:43, Francis Laniel wrote:
> sysdig 0.27.1 cannot be cross-compiled to, e.g., aarch64 because it uses open()
> syscall [1].
> This patch bumps its version to enable cross-compilation.
> 
> [1] https://marc.info/?l=buildroot&m=164951521629400
> 
> Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
> ---
>   ...BUNDLED_DEPS-before-getting-nlohmann.patch | 50 +++++++++++
>   ...ATCH_COMMAND-to-fix-lua-types-and-fu.patch | 82 -------------------
>   ...gainst-libabseil-cpp-which-grpc-uses.patch | 47 -----------
>   package/sysdig/Config.in                      | 31 ++-----
>   package/sysdig/sysdig.hash                    |  1 +
>   package/sysdig/sysdig.mk                      | 39 ++-------
>   6 files changed, 66 insertions(+), 184 deletions(-)
>   create mode 100644 package/sysdig/0001-cmake-Check-USE_BUNDLED_DEPS-before-getting-nlohmann.patch
>   delete mode 100644 package/sysdig/0001-libsinsp-Apply-PATCH_COMMAND-to-fix-lua-types-and-fu.patch
>   delete mode 100644 package/sysdig/0002-Link-against-libabseil-cpp-which-grpc-uses.patch

  It's convenient for reviewers if in the commit message you explain why the 
patches can be removed. In this case, it's clearly because the patched bits 
moved to falcosecurity-libs, but then explain why they are not needed there.

[snip]
> diff --git a/package/sysdig/sysdig.hash b/package/sysdig/sysdig.hash
> index 4ec46abfc3..f567ed97ac 100644
> --- a/package/sysdig/sysdig.hash
> +++ b/package/sysdig/sysdig.hash
> @@ -1,4 +1,5 @@
>   # sha256 locally computed
> +sha256  3721c97f0da43c1a68d2962d30363525d8532ab5f2534dfefc86d175e17e423e  sysdig-0.29.1.tar.gz
>   sha256  b9d05854493d245a7a7e75f77fc654508f720aab5e5e8a3a932bd8eb54e49bda  sysdig-0.27.1.tar.gz

  Remember to replace the old hash, not just add a new one.

>   sha256  a88fbf820b38b1c7fabc6efe291b8259e02ae21326f56fe31c6c9adf374b2702  COPYING
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  driver/GPL2.txt

  This file no longer exists. make legal-info to verify this.

> diff --git a/package/sysdig/sysdig.mk b/package/sysdig/sysdig.mk
> index 9a9aaa35c3..d1a37162a7 100644
> --- a/package/sysdig/sysdig.mk
> +++ b/package/sysdig/sysdig.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -SYSDIG_VERSION = 0.27.1
> +SYSDIG_VERSION = 0.29.1
>   SYSDIG_SITE = $(call github,draios,sysdig,$(SYSDIG_VERSION))
>   SYSDIG_LICENSE = Apache-2.0 (userspace), MIT or GPL-2.0 (driver)
>   SYSDIG_LICENSE_FILES = COPYING driver/MIT.txt driver/GPL2.txt
> @@ -16,39 +16,18 @@ SYSDIG_CONF_OPTS = \
>   SYSDIG_SUPPORTS_IN_SOURCE_BUILD = NO
>   
>   SYSDIG_DEPENDENCIES = \
> -	c-ares \
> -	elfutils \
> -	grpc \
> -	jq \
> -	jsoncpp \
> -	libb64 \
> -	libcurl \
> -	luainterpreter \
> +	falcosecurity-libs \
>   	ncurses \
> -	openssl \
> -	protobuf \
> -	tbb \
> -	zlib
> +	nlohmann-json \
> +	yaml-cpp
>   
> -# sysdig creates the module Makefile from a template, which contains a
> -# single place-holder, KBUILD_FLAGS, wich is only replaced with two
> -# things:
> -#   - debug flags, which we don't care about here,
> -#   - 'sysdig-feature' flags, which are never set, so always empty
> -# So, just replace the place-holder with the only meaningful value: nothing.
> -define SYSDIG_MODULE_GEN_MAKEFILE
> -	$(INSTALL) -m 0644 $(@D)/driver/Makefile.in $(@D)/driver/Makefile
> -	$(SED) 's/@KBUILD_FLAGS@//;' $(@D)/driver/Makefile
> -	$(SED) 's/@PROBE_NAME@/sysdig-probe/;' $(@D)/driver/Makefile
> -endef
> -SYSDIG_POST_PATCH_HOOKS += SYSDIG_MODULE_GEN_MAKEFILE
> -
> -# Don't build the driver as part of the 'standard' procedure, we'll
> -# build it on our own with the kernel-module infra.
> -SYSDIG_CONF_OPTS += -DBUILD_DRIVER=OFF
> +# sysdig needs falcosecurity-libs sources, so we set the souce directory here.
> +# It will sadly compile again falcosecurity-libs, so we also need to set again
> +# grpc_cpp_plugin.
> +SYSDIG_CONF_OPTS += -DFALCOSECURITY_LIBS_SOURCE_DIR=$(BUILD_DIR)/falcosecurity-libs-e5c53d648f3c4694385bbe488e7d47eaa36c229a -DGRPC_CPP_PLUGIN=$(HOST_DIR)/bin/grpc_cpp_plugin \

  This is not nice (as you wrote in the cover letter). If there's really no way 
to tell sysdig to use the libs installed in STAGING_DIR, then the solution is to 
remove falconsecurity-libs and instead download it as part of the sysdig 
package. There are (fortunately) not many examples of that in Buildroot, but 
there's something a bit similar in android-tools.

# Take this version from cmake/modules/falcosecurity-libs.cmake
SYSDIG_FALCOSECURITY_LIBS_VERSION = e5c53d648f3c4694385bbe488e7d47eaa36c229a
SYSDIG_EXTRA_DOWNLOADS = $(call 
github,falcosecurity,libs,$(SYSDIG_FALCOSECURITY_LIBS_VERSION))/falcosecurity-libs-$(SYSDIG_FALCOSECURITY_LIBS_VERSION).tar.gz
define SYSDIG_EXTRACT_FALCOSECURITY_LIBS
         $(call suitable-extractor,$(notdir $(SYSDIG_EXTRA_DOWNLOADS))) \
                 $(SYSDIG_DL_DIR)/$(notdir $(SYSDIG_EXTRA_DOWNLOADS)) | \
                 $(TAR) -C $(@D)/falcosecurity-libs --strip-components=1 \
			$(TAR_OPTIONS) -
endef
SYSDIG_POST_EXTRACT_HOOKS += SYSDIG_EXTRACT_FALCOSECURITY_LIBS

(you'll need to adapt the above to make sure it's extracted in the right place.)


  Since the driver etc. are then part of the sysdig package again, not as much 
will change. Just some directory names.

  BTW, please also mention in the commit message that the issue with the driver 
is fixed in recent falcosecurity/libs

  Regards,
  Arnout

> +	-DVALIJSON_INCLUDE=$(BUILD_DIR)/valijson-0.6/include/valijson
>   
>   SYSDIG_MODULE_SUBDIRS = driver
>   SYSDIG_MODULE_MAKE_OPTS = KERNELDIR=$(LINUX_DIR)
>   
> -$(eval $(kernel-module))
>   $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
