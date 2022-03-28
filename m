Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B19CEC433EF
	for <buildroot@archiver.kernel.org>; Mon, 28 Mar 2022 20:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 689D34157F;
	Mon, 28 Mar 2022 20:36:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LVLi7Ik8ceWf; Mon, 28 Mar 2022 20:36:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF31441519;
	Mon, 28 Mar 2022 20:36:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6BDF61BF388
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 20:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6633140120
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 20:36:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PFtayoItwsoe for <buildroot@lists.busybox.net>;
 Mon, 28 Mar 2022 20:36:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 08F5240117
 for <buildroot@buildroot.org>; Mon, 28 Mar 2022 20:36:01 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id a17so18329791edm.9
 for <buildroot@buildroot.org>; Mon, 28 Mar 2022 13:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qFMOzYIo2oNaq1JtRs64FdGscLfRDbwVrCSSmvQw4+s=;
 b=fvmTfahXVRgzVZ7zOl8K/41Wpi4JsbEf2bPueGD3gEMFUGAdMiy1/2cTojxfNSsjVO
 HKpHKO2+aqliC5ntTBovEczal1VTmdGmNg6zsWG35YYNqSrLVsW5SckOCBGeLReF/zON
 GfMD2wWUmFqY6Y72IADjr1Uxh1YODk2pymb5faFB/vjIN9J8xoH7pBm03zIky4XI5f04
 W3L+Elq20Tum6VS+E/+cKST51RB4u4TZ+vU7cDTKDIlR3tKeMRSFIF3PW+FMwC/8Tx+o
 5bhe9DNmyKs6tXHD12y8bJ27zdeN5hlCuxkJ8yG8/nMrNQvsjhK0bWXcqqTwkNvlp994
 8WzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qFMOzYIo2oNaq1JtRs64FdGscLfRDbwVrCSSmvQw4+s=;
 b=fE41mvDBc4qRL9bl/a079BXQDtIsBshi0o2sJjbpbi8tOjTJHDmiydNFh/41cl49Ad
 WxMghVIMXidiFDqnplNphh2gv9LaaGImuofnASEe8N5ki08DZOoUrlnEXubctOFQv/T1
 cOhE01eBUTc4v35vC+ErjSKGfdvc4fvWbZZhYynBUUJX6C56WSvlIT/o2x+SrN+eYr+l
 FWac56QLhZa7F8FOdWKGMgjQOYr4+dHJmx3qncENr+T7+DKLqvGYOvd3UICJwxSQ7ygo
 6hhb525fcIqLgt4j1/PWxmgayLETKQYjEqyXsskHaqMVeTDeOm0n39eGc2dEDn3Rc+/1
 LGKQ==
X-Gm-Message-State: AOAM533nBw4ny/T32PZxZ4crBOgMZYxQSH6d/fsfJUyN8L4kinZmd/m4
 5abzH2GyCcT17cJF2btB26umvQ==
X-Google-Smtp-Source: ABdhPJxnnD/6qMWM2rVpKZMLymVNJSO1QakAGuaSdjulC0KR5MiUB0vKNHi2BCo9cXeCq59H6nGblA==
X-Received: by 2002:a05:6402:4414:b0:408:4dc0:3ee9 with SMTP id
 y20-20020a056402441400b004084dc03ee9mr18450373eda.203.1648499759841; 
 Mon, 28 Mar 2022 13:35:59 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 nc13-20020a1709071c0d00b006dfa376ee55sm6355758ejc.131.2022.03.28.13.35.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 13:35:59 -0700 (PDT)
Message-ID: <8f356e94-2fe6-2d89-4d50-b8c2da1c96b7@mind.be>
Date: Mon, 28 Mar 2022 22:35:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Alsey Coleman Miller <alseycmiller@gmail.com>, buildroot@buildroot.org
References: <20220328060027.2483147-1-alseycmiller@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220328060027.2483147-1-alseycmiller@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/swift: add Swift runtime
 libraries
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Alsey,

  Thank you for your contribution! I have a number of review comments below. 
Please take them into account and send a new patch series. For the time being, 
I've marked the patch as Changes Requested in patchwork.

  Firt of all, the patch should be split up in separate patches: one patch per 
package you add. Make sure all of them are posted together and in the correct 
order. Each patch should have as subject "package/...: new package".

  I have a few more comments below, but it's hard to properly review such a big 
patch so I will probably have missed some things.

On 28/03/2022 08:00, Alsey Coleman Miller wrote:
> Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
> ---
>   package/Config.in                             |  11 +


  Please add yourself to the DEVELOPERS file [1] for this package. This way, 
you'll get an e-mail if the package fails in the autobuilders, or when a new 
version is released if the package is registered on release-monitoring.org.

[snip]
> diff --git a/package/foundation/Config.in b/package/foundation/Config.in
> new file mode 100644
> index 0000000000..7a9dc8b514
> --- /dev/null
> +++ b/package/foundation/Config.in
> @@ -0,0 +1,14 @@
> +if BR2_PACKAGE_SWIFT

  I get that you only want swift-related packages to appear in the menus if 
swift itself is selected. It would be even better, then, to sort all of them 
under the swift main entry. Perhaps even prefix all of them with swift-, like is 
done for python, perl and lua packages.

> +
> +config BR2_PACKAGE_FOUNDATION
> +	bool "foundation"
> +	depends on BR2_PACKAGE_SWIFT
> +	select BR2_PACKAGE_LIBSWIFTDISPATCH
> +	select BR2_PACKAGE_LIBCURL
> +	select BR2_PACKAGE_LIBXML2
> +	help
> +	  The Foundation framework defines a base layer of functionality that is required for almost all applications. It provides primitive classes and introduces several paradigms that define functionality not provided by either the Objective-C runtime and language or Swift standard library and language.

  Please make sure indentation is done correctly, as reported by the 
utils/check-package script. In this case, the line length is way too long.

> +
> +	  http://swift.org
> +
> +endif
> diff --git a/package/foundation/foundation.hash b/package/foundation/foundation.hash
> new file mode 100644
> index 0000000000..f15edb8420
> --- /dev/null
> +++ b/package/foundation/foundation.hash
> @@ -0,0 +1 @@
> +sha256 3fa96321729ea1e99847320bc3b5eefcbc39ba57eb8750a16700afa0173b6bb0 swift-5.6-RELEASE.tar.gz
> diff --git a/package/foundation/foundation.mk b/package/foundation/foundation.mk
> new file mode 100644
> index 0000000000..93c7cedbdd
> --- /dev/null
> +++ b/package/foundation/foundation.mk
> @@ -0,0 +1,102 @@
> +### Foundation

  Missin comment header, as reported by check-package (I'm not going to repeat 
all the other check-package errors).

> +FOUNDATION_VERSION = $(SWIFT_VERSION)
> +FOUNDATION_SOURCE = swift-$(SWIFT_VERSION)-RELEASE.tar.gz
> +FOUNDATION_SITE = https://github.com/apple/swift-corelibs-foundation/archive/refs/tags

  This doesn't look right - shouldn't you be using the github helper?

> +FOUNDATION_LICENSE = Apache-2.0
> +FOUNDATION_LICENSE_FILES = LICENSE
> +FOUNDATION_INSTALL_STAGING = YES
> +FOUNDATION_INSTALL_TARGET = YES

  _INSTALL_TARGET = YES is not needed, it's done automatically.

> +FOUNDATION_SUPPORTS_IN_SOURCE_BUILD = NO
> +FOUNDATION_DEPENDENCIES = icu libxml2 libcurl swift libswiftdispatch
> +
> +FOUNDATION_CONF_OPTS += \
> +    -DCMAKE_Swift_FLAGS=${SWIFTC_FLAGS} \
> +	-DCMAKE_Swift_FLAGS_DEBUG="" \

  Please consistently indent with one tab.

> +	-DCMAKE_Swift_FLAGS_RELEASE="" \
> +	-DCMAKE_Swift_FLAGS_RELWITHDEBINFO="" \
> +    -DCF_DEPLOYMENT_SWIFT=ON \
> +    -Ddispatch_DIR="$(LIBSWIFTDISPATCH_BUILDDIR)/cmake/modules" \
> +    -DICU_I18N_LIBRARY_RELEASE=${STAGING_DIR}/usr/lib/libicui18n.so \
> +    -DICU_UC_LIBRARY_RELEASE=${STAGING_DIR}/usr/lib/libicuuc.so \
> +    -DICU_I18N_LIBRARY_DEBUG=${STAGING_DIR}/usr/lib/libicui18n.so \
> +    -DICU_UC_LIBRARY_DEBUG=${STAGING_DIR}/usr/lib/libicuuc.so \
> +    -DICU_INCLUDE_DIR="${STAGING_DIR}/usr/include" \
> +
> +ifeq ($(BR2_PACKAGE_LIBCURL),y)

  Since Config.in selects libcurl, this is always true.

> +	FOUNDATION_DEPENDENCIES += libcurl

  No indentation within make conditions.

> +	FOUNDATION_CONF_OPTS += \
> +    	-DCURL_LIBRARY_RELEASE=${STAGING_DIR}/usr/lib/libcurl.so \
> +    	-DCURL_INCLUDE_DIR="${STAGING_DIR}/usr/include" \
> +
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBXML2),y)
> +	FOUNDATION_DEPENDENCIES += libxml2
> +	FOUNDATION_CONF_OPTS += \
> +		-DLIBXML2_LIBRARY=${STAGING_DIR}/usr/lib/libxml2.so \
> +    	-DLIBXML2_INCLUDE_DIR=${STAGING_DIR}/usr/include/libxml2 \
> +	
> +endif
> +
> +ifeq (FOUNDATION_SUPPORTS_IN_SOURCE_BUILD),YES)
> +FOUNDATION_BUILDDIR			= $(FOUNDATION_SRCDIR)
> +else
> +FOUNDATION_BUILDDIR			= $(FOUNDATION_SRCDIR)/build
> +endif

  This stuff is done automatically by the infra.

> +
> +define FOUNDATION_CONFIGURE_CMDS
> +	# Workaround Dispatch defined with cmake and module
> +	rm -rf ${STAGING_DIR}/usr/lib/swift/dispatch
> +	# Clean
> +	rm -rf $(FOUNDATION_BUILDDIR)
> +	rm -rf $(STAGING_DIR)/usr/lib/swift/CoreFoundation
> +	# Configure
> +	(mkdir -p $(FOUNDATION_BUILDDIR) && \
> +	cd $(FOUNDATION_BUILDDIR) && \
> +	rm -f CMakeCache.txt && \
> +	PATH=$(BR_PATH):$(SWIFT_NATIVE_PATH) \
> +	$(FOUNDATION_CONF_ENV) $(BR2_CMAKE) -S $(FOUNDATION_SRCDIR) -B $(FOUNDATION_BUILDDIR) -G Ninja \
> +		-DCMAKE_INSTALL_PREFIX="/usr" \
> +		-DBUILD_SHARED_LIBS=ON \
> +		-DCMAKE_BUILD_TYPE=$(if $(BR2_ENABLE_RUNTIME_DEBUG),Debug,Release) \
> +    	-DCMAKE_C_COMPILER=$(SWIFT_NATIVE_PATH)/clang \
> +    	-DCMAKE_C_FLAGS="-w -fuse-ld=lld -target $(SWIFT_TARGET_NAME) --sysroot=$(STAGING_DIR) $(SWIFT_EXTRA_FLAGS) -I$(STAGING_DIR)/usr/include -B$(STAGING_DIR)/usr/lib -B$(HOST_DIR)/lib/gcc/$(GNU_TARGET_NAME)/$(call qstrip,$(BR2_GCC_VERSION)) -L$(HOST_DIR)/lib/gcc/$(GNU_TARGET_NAME)/$(call qstrip,$(BR2_GCC_VERSION))" \
> +    	-DCMAKE_C_LINK_FLAGS="-target $(SWIFT_TARGET_NAME) --sysroot=$(STAGING_DIR)" \
> +		-DCMAKE_ASM_FLAGS="-target $(SWIFT_TARGET_NAME) --sysroot=$(STAGING_DIR)" \
> +		$(FOUNDATION_CONF_OPTS) \
> +	)

  I haven't looked at the details, but not using the cmake infrastructure is not 
a good idea.


> +endef
> +
> +define FOUNDATION_BUILD_CMDS
> +	# Compile
> +	(cd $(FOUNDATION_BUILDDIR) && ninja)

  If the problem is that it only supports the ninja build system: please use [2] 
and explain in the cover letter of your series that it depends on that.

> +endef
> +
> +define FOUNDATION_INSTALL_TARGET_CMDS
> +	cp $(FOUNDATION_BUILDDIR)/lib/*.so $(TARGET_DIR)/usr/lib/
> +endef
> +
> +define FOUNDATION_INSTALL_STAGING_CMDS
> +	# Copy libraries
> +	cp $(FOUNDATION_BUILDDIR)/lib/*.so $(STAGING_DIR)/usr/lib/swift/linux/
> +	# Copy CoreFoundation module
> +	mkdir -p ${STAGING_DIR}/usr/lib/swift/CoreFoundation
> +	cp $(FOUNDATION_BUILDDIR)/CoreFoundation.framework/Headers/*.h ${STAGING_DIR}/usr/lib/swift/CoreFoundation/
> +	touch ${STAGING_DIR}/usr/lib/swift/CoreFoundation/module.map
> +	echo 'framework module CoreFoundation [extern_c] [system] { umbrella header "${STAGING_DIR}/usr/lib/swift/CoreFoundation/CoreFoundation.h" }' > ${STAGING_DIR}/usr/lib/swift/CoreFoundation/module.map
> +	# Copy CFXMLInterface module
> +	mkdir -p ${STAGING_DIR}/usr/lib/swift/CFXMLInterface
> +	touch ${STAGING_DIR}/usr/lib/swift/CFXMLInterface/module.map
> +	echo 'framework module CFXMLInterface [extern_c] [system] { umbrella header "${STAGING_DIR}/usr/lib/swift/CFXMLInterface/CFXMLInterface.h" }' > ${STAGING_DIR}/usr/lib/swift/CFXMLInterface/module.map
> +	# Copy CFURLSessionInterface module
> +	mkdir -p ${STAGING_DIR}/usr/lib/swift/CFURLSessionInterface
> +	touch ${STAGING_DIR}/usr/lib/swift/CFURLSessionInterface/module.map
> +	echo 'framework module CFURLSessionInterface [extern_c] [system] { umbrella header "${STAGING_DIR}/usr/lib/swift/CFURLSessionInterface/CFURLSessionInterface.h" }' > ${STAGING_DIR}/usr/lib/swift/CFURLSessionInterface/module.map
> +	# Copy Swift modules
> +	cp $(FOUNDATION_BUILDDIR)/swift/*  ${STAGING_DIR}/usr/lib/swift/linux/$(SWIFT_TARGET_ARCH)/
> +	# Restore Dispatch headers
> +	$(LIBSWIFTDISPATCH_INSTALL_STAGING_CMDS)
> +	
> +endef
> +
> +$(eval $(generic-package))
> diff --git a/package/libdispatch/Config.in b/package/libdispatch/Config.in
> new file mode 100644
> index 0000000000..2f7c115375
> --- /dev/null
> +++ b/package/libdispatch/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_LIBDISPATCH
> +	bool "libdispatch"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_STATIC_LIBS
> +	depends on BR2_TOOLCHAIN_USES_GLIBC

  When there are toolchain dependencies, there should also be a comment that 
tells the user why the package can't be selected. Look at other packages for 
examples.

  Since it's not clear here, you should probably explain in the commit message 
why these dependencies are needed.

> +	select BR2_PACKAGE_LIBBSD
> +	
> +	help
> +	  Grand Central Dispatch (GCD or libdispatch) provides comprehensive support for concurrent code execution on multicore hardware.
> +
> +	  http://swift.org
> diff --git a/package/libdispatch/libdispatch.hash b/package/libdispatch/libdispatch.hash
> new file mode 100644
> index 0000000000..a89c48c55f
> --- /dev/null
> +++ b/package/libdispatch/libdispatch.hash
> @@ -0,0 +1,2 @@
> +sha256 d2bbfb5b98d129caa2c6bd7662c850bf57cb434572d09844b56641c4558906ab swift-5.6-RELEASE.tar.gz
> +sha256 c83647dac6a1e36795a62626e3a9c7dab7ed4b46919a757afb5562d5ed49da73 libdispatch-5.5.3-armv5.patch
> diff --git a/package/libdispatch/libdispatch.mk b/package/libdispatch/libdispatch.mk
> new file mode 100644
> index 0000000000..a334c3052d
> --- /dev/null
> +++ b/package/libdispatch/libdispatch.mk
> @@ -0,0 +1,78 @@
> +### Grand Central Dispatch (C API)
> +LIBDISPATCH_VERSION = $(SWIFT_VERSION)
> +LIBDISPATCH_SOURCE = swift-$(SWIFT_VERSION)-RELEASE.tar.gz
> +LIBDISPATCH_SITE = https://github.com/apple/swift-corelibs-libdispatch/archive/refs/tags
> +LIBDISPATCH_LICENSE = Apache-2.0
> +LIBDISPATCH_LICENSE_FILES = LICENSE
> +LIBDISPATCH_INSTALL_STAGING = YES
> +LIBDISPATCH_INSTALL_TARGET = YES
> +LIBDISPATCH_SUPPORTS_IN_SOURCE_BUILD = NO
> +LIBDISPATCH_DEPENDENCIES = libbsd
> +LIBDISPATCH_PATCH = \
> +	https://gist.githubusercontent.com/colemancda/e19ec96d8b3caa7f4a3f9ec9a82f356a/raw/a8a62d61856de09f02618d32d14ac637017cc44f/libdispatch-5.5.3-armv5.patch

  Downloading a patch from your own gist isn't exactly great for allowing 
reviews :-). Please instead include the patch directly in Buildroot. Since 
upstream is managed in git, please make this a git-formatted patch (generated 
with git format-patch -N) [1]. Make sure it has a summary and description just 
like any other commit, and also include your Signed-off-by. The latter is needed 
to ascertain that the patch may be distributed under the upstream project's 
license (which may be different from Buildroot's).

[snip]
> diff --git a/package/swift-hello/Config.in b/package/swift-hello/Config.in
> new file mode 100644
> index 0000000000..cbeed69667
> --- /dev/null
> +++ b/package/swift-hello/Config.in
> @@ -0,0 +1,10 @@
> +if BR2_PACKAGE_SWIFT
> +
> +config BR2_PACKAGE_SWIFT_HELLO
> +	bool "swift-hello"
> +	depends on BR2_PACKAGE_SWIFT
> +	depends on BR2_PACKAGE_FOUNDATION
> +	help
> +	  Demo application for Swift.

  If I understand correctly, this package serves no purpose other than proving 
that it's possibleto biuld a swift application in Buildroot. Nobody is ever 
going to select it. Instead, it would be better to move it to the runtime test 
infrastructure (and of course actually runtime test it, which proves that the 
generated binaries actually work).

[snip]
> diff --git a/package/swift-hello/swift-hello.mk b/package/swift-hello/swift-hello.mk
> new file mode 100644
> index 0000000000..b3cded3f7c
> --- /dev/null
> +++ b/package/swift-hello/swift-hello.mk
> @@ -0,0 +1,33 @@
> +### Swift Demo
> +SWIFT_HELLO_VERSION = 0.1.0
> +SWIFT_HELLO_SITE = $(SWIFT_HELLO_PKGDIR)/src
> +SWIFT_HELLO_SITE_METHOD = local
> +SWIFT_HELLO_INSTALL_STAGING = NO
> +SWIFT_HELLO_INSTALL_TARGET = YES
> +SWIFT_HELLO_SUPPORTS_IN_SOURCE_BUILD = YES
> +SWIFT_HELLO_DEPENDENCIES = swift foundation
> +SWIFT_HELLO_EXECUTABLES = swift-hello
> +SWIFT_HELLO_BUILDDIR = $(SWIFT_HELLO_SRCDIR)/.build/$(if $(BR2_ENABLE_RUNTIME_DEBUG),debug,release)
> +
> +define SWIFT_HELLO_BUILD_CMDS
> +	( \

  These parenthesis are actually not needed. They are still used in a lot of 
places in Buildroot, but that's legacy stuff.

> +	cd $(SWIFT_HELLO_SRCDIR) && \
> +	rm -rf .build && \
> +	PATH=$(BR_PATH):$(SWIFT_NATIVE_PATH) \
> +	$(SWIFT_NATIVE_PATH)/swift build -c $(if $(BR2_ENABLE_RUNTIME_DEBUG),debug,release) --destination $(SWIFTPM_DESTINATION_FILE) \
> +	)
> +endef
> +
> +define SWIFT_HELLO_INSTALL_TARGET_CMDS
> +	# Copy dynamic libraries
> +	#cp $(SWIFT_HELLO_BUILDDIR)/*.so $(TARGET_DIR)/usr/lib/

  Please don't keep commented-out lines.

> +	cp $(SWIFT_HELLO_BUILDDIR)/swift-hello $(TARGET_DIR)/usr/bin/hello
> +endef
> +
> +define SWIFT_HELLO_INSTALL_STAGING_CMDS
> +	# Copy dynamic libraries
> +	#cp $(SWIFT_HELLO_BUILDDIR)/*.so $(STAGING_DIR)/usr/lib/swift/linux/
> +	cp $(SWIFT_HELLO_BUILDDIR)/swift-hello $(STAGING_DIR)/usr/bin/hello
> +endef
> +
> +$(eval $(generic-package))

[snip]
> +config BR2_PACKAGE_SWIFT
> +	bool "swift"
> +	depends on BR2_PACKAGE_SWIFT_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_STATIC_LIBS
> +	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	select BR2_PACKAGE_ICU
> +	select BR2_PACKAGE_LIBDISPATCH
> +	help
> +	  Swift is a general-purpose programming language built using a modern approach to safety, performance, and software design patterns.
> +
> +	  http://swift.org
> +
> +if BR2_PACKAGE_SWIFT || BR2_PACKAGE_LIBDISPATCH
> +
> +config BR2_PACKAGE_SWIFT_NATIVE_TOOLS
> +	string "Path to host Swift toolchain"
> +	default "/usr/bin"
> +
> +config BR2_PACKAGE_SWIFT_LLVM_DIR
> +	string "Path to host LLVM library path"
> +	default "/usr/lib/llvm-12"

  I guess swift is built on top of LLVM. Is it possible to use package/llvm, or 
is it a patched version?

> +
> +endif
> +
> +comment "swift needs a toolchain w/ Glibc, ICU, wchar, threads, C++, dynamic library"
> +	depends on BR2_PACKAGE_SWIFT_ARCH_SUPPORTS
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP \
> +		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR

[snip]
> diff --git a/package/swift/swift.mk b/package/swift/swift.mk
> new file mode 100644
> index 0000000000..da10aae8fd
> --- /dev/null
> +++ b/package/swift/swift.mk
> @@ -0,0 +1,232 @@
> +### Apple's Swift Programming Language
> +SWIFT_VERSION = 5.6
> +SWIFT_SOURCE = swift-$(SWIFT_VERSION)-RELEASE.tar.gz
> +SWIFT_SITE = https://github.com/apple/swift/archive/refs/tags
> +SWIFT_LICENSE = Apache-2.0
> +SWIFT_LICENSE_FILES = LICENSE.txt
> +SWIFT_TARGET_ARCH = $(call qstrip,$(BR2_PACKAGE_SWIFT_TARGET_ARCH))
> +SWIFT_NATIVE_PATH = $(call qstrip,$(BR2_PACKAGE_SWIFT_NATIVE_TOOLS))
> +SWIFT_LLVM_DIR = $(call qstrip,$(BR2_PACKAGE_SWIFT_LLVM_DIR))
> +SWIFT_INSTALL_STAGING = YES
> +SWIFT_INSTALL_TARGET = YES
> +SWIFT_SUPPORTS_IN_SOURCE_BUILD = NO
> +SWIFT_DEPENDENCIES = icu libxml2 libbsd libdispatch
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +SWIFT_CONF_ENV += LIBS="-latomic"
> +endif
> +
> +HOST_SWIFT_SUPPORT_DIR = $(HOST_DIR)/usr/share/swift
> +SWIFTPM_DESTINATION_FILE = $(HOST_SWIFT_SUPPORT_DIR)/$(SWIFT_TARGET_NAME)-toolchain.json

  This should have simply a SWIFT_ prefix, not SWIFTPM.

[snip]
> +define SWIFT_INSTALL_STAGING_CMDS
> +	mkdir -p $(HOST_SWIFT_SUPPORT_DIR)
> +	# Copy runtime libraries and swift interfaces
> +	cp -rf $(SWIFT_BUILDDIR)/lib/swift ${STAGING_DIR}/usr/lib/
> +	# Generate SwiftPM cross compilation toolchain file
> +	rm -f $(SWIFTPM_DESTINATION_FILE)
> +	touch $(SWIFTPM_DESTINATION_FILE)
> +	echo '{' >> $(SWIFTPM_DESTINATION_FILE)
> +	echo '   "version":1,' >> $(SWIFTPM_DESTINATION_FILE)

  We generally prefer to have a template file (called swift-toolchain.json.in) 
in the package directory, and use sed to replace @XXXX@ entries. See e.g. how 
it's done for cmake's toolchainfile.

> +	echo '   "sdk":"$(STAGING_DIR)",' >> $(SWIFTPM_DESTINATION_FILE)
> +	echo '   "toolchain-bin-dir":"$(SWIFT_NATIVE_PATH)",' >> $(SWIFTPM_DESTINATION_FILE)
> +	echo '   "target":"$(SWIFT_TARGET_NAME)",' >> $(SWIFTPM_DESTINATION_FILE)
> +	echo '   "dynamic-library-extension":"so",' >> $(SWIFTPM_DESTINATION_FILE)
> +	echo '   "extra-cc-flags":[' >> $(SWIFTPM_DESTINATION_FILE)
> +	echo '      "-fPIC"' >> $(SWIFTPM_DESTINATION_FILE)
> +
> +	@if [ "$(SWIFT_TARGET_ARCH)" = "armv5" ]; then\
> +		echo '      "-march=armv5te",' >> $(SWIFTPM_DESTINATION_FILE);\
> +    fi
> +
> +	echo '   ],' >> $(SWIFTPM_DESTINATION_FILE)
> +	echo '   "extra-swiftc-flags":[' >> $(SWIFTPM_DESTINATION_FILE)
> +	echo '      "-target", "$(SWIFT_TARGET_NAME)",' >> $(SWIFTPM_DESTINATION_FILE)
> +	echo '      "-use-ld=lld",' >> $(SWIFTPM_DESTINATION_FILE)
> +	echo '      "-tools-directory", "$(SWIFT_NATIVE_PATH)",' >> $(SWIFTPM_DESTINATION_FILE)
> +	echo '      "-Xlinker", "-rpath", "-Xlinker", "/usr/lib/swift/linux",' >> $(SWIFTPM_DESTINATION_FILE)
> +	echo '      "-Xlinker", "-L$(STAGING_DIR)",' >> $(SWIFTPM_DESTINATION_FILE)
> +	echo '      "-Xlinker", "-L$(STAGING_DIR)/lib",' >> $(SWIFTPM_DESTINATION_FILE)
> +	echo '      "-Xlinker", "-L$(STAGING_DIR)/usr/lib",' >> $(SWIFTPM_DESTINATION_FILE)
> +	echo '      "-Xlinker", "-L$(STAGING_DIR)/usr/lib/swift/linux",' >> $(SWIFTPM_DESTINATION_FILE)
> +	echo '      "-Xlinker", "-L$(STAGING_DIR)/usr/lib/swift/linux/$(SWIFT_TARGET_ARCH)",' >> $(SWIFTPM_DESTINATION_FILE)
> +	echo '      "-Xlinker", "-L$(HOST_DIR)/lib/gcc/$(GNU_TARGET_NAME)/$(call qstrip,$(BR2_GCC_VERSION))",' >> $(SWIFTPM_DESTINATION_FILE)
> +	echo '      "-Xlinker", "--build-id=sha1",' >> $(SWIFTPM_DESTINATION_FILE)
> +	echo '      "-I$(STAGING_DIR)/usr/include",' >> $(SWIFTPM_DESTINATION_FILE)
> +	echo '      "-I$(STAGING_DIR)/usr/lib/swift",' >> $(SWIFTPM_DESTINATION_FILE)
> +	echo '      "-resource-dir", "$(STAGING_DIR)/usr/lib/swift",' >> $(SWIFTPM_DESTINATION_FILE)
> +	echo '      "-Xclang-linker", "-B$(STAGING_DIR)/usr/lib",' >> $(SWIFTPM_DESTINATION_FILE)
> +	echo '      "-Xclang-linker", "-B$(HOST_DIR)/lib/gcc/$(GNU_TARGET_NAME)/$(call qstrip,$(BR2_GCC_VERSION))",' >> $(SWIFTPM_DESTINATION_FILE)
> +	echo '      "-Xclang-linker", "-latomic",' >> $(SWIFTPM_DESTINATION_FILE);\
> +
> +	@if [ "$(SWIFT_TARGET_ARCH)" = "powerpc" ]; then\
> +		echo '      "-Xcc", "-mcpu=7400",' >> $(SWIFTPM_DESTINATION_FILE);\
> +    fi
> +
> +	@if [ "$(SWIFT_TARGET_ARCH)" = "armv5" ]; then\
> +		echo '      "-Xcc", "-march=armv5te",' >> $(SWIFTPM_DESTINATION_FILE);\
> +    fi
> +
> +	echo '      "-sdk", "$(STAGING_DIR)"' >> $(SWIFTPM_DESTINATION_FILE)
> +	echo '   ],' >> $(SWIFTPM_DESTINATION_FILE)
> +	echo '   "extra-cpp-flags":[' >> $(SWIFTPM_DESTINATION_FILE)
> +	echo '      "-lstdc++"' >> $(SWIFTPM_DESTINATION_FILE)
> +	echo '   ]' >> $(SWIFTPM_DESTINATION_FILE)
> +	echo '}' >> $(SWIFTPM_DESTINATION_FILE)
> +
> +endef
> +
> +$(eval $(generic-package))
> +$(eval $(host-generic-package))
> \ No newline at end of file

  Please make sure there's a newline at the end of the file.

  Regards,
  Arnout

[1] https://buildroot.org/downloads/manual/manual.html#DEVELOPERS
[2] https://patchwork.ozlabs.org/project/buildroot/list/?series=282194
[3] https://buildroot.org/manual.html#_format_and_licensing_of_the_package_patches
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
