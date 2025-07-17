Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FCB1C83F1A
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F15C3405A7;
	Thu, 17 Jul 2025 20:22:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oxbk0KAn-vk1; Thu, 17 Jul 2025 20:22:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 201A6405A1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 201A6405A1;
	Thu, 17 Jul 2025 20:22:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FF6C1A6
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 060F781EBC
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:22:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p-_XaAebZZqS for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:22:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0FAB980B4D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FAB980B4D
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0FAB980B4D
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:22:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B3F0DB977AA4; Thu, 17 Jul 2025 22:22:11 +0200 (CEST)
Message-ID: <a779c437-7661-4202-be18-8c79285937ed@rnout.be>
Date: Thu, 17 Jul 2025 22:22:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20250622100412.3836588-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250622100412.3836588-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1752783731; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=Mc7My4snfEtfNMpxV3nH0sHJkHNx1pCyq5taNkhQtDo=;
 b=Oq1UWKxceu4/RDe3OTETnr0d2ny9NPVifLD0OSGUfji+UCh+OesCUyUs9OlgL1O7HzX1hg
 eugHnkDBYu8fpS4jV5znCyi1hsIWOLSHXSe8LDALTrcNkW3307nK4Zs00XRUcFEqhev8Wx
 DP6AXU81ExH04Wg7KMsjBPW5PAUUArF30syMLnVCyQsuxP3mOUxI0xGT7dfV4eQtbEnGS1
 ys+xBwXExDv8wKWOwFC5fj5ZTtWje7L7XhJPOof20463X6YbAs7CiGn2OKnHoopEjkA5Z3
 HvTi4Mckg6FePaaa0W035g/BGBMS+b0iQ+Aw2RLdVcbGoj2A8vSmgz71Lp/sJg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Oq1UWKxc
Subject: Re: [Buildroot] [PATCH 1/1] package/libcrossguid: bump version
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



On 22/06/2025 12:04, Bernd Kuhls wrote:
> Needed for kodi 22.x.
> 
> Added build fix for >= gcc-13.
> 
> Switched build system to cmake following upstream:
> https://github.com/graeme-hill/crossguid/commit/13683c56e559f93d75f8640488aa3335f43443ed
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to 2025.02.x and 2025.05.x, thanks.

  Regards,
  Arnout

> ---
>   .../0001-pr67-include-missing-cstdint.patch   | 31 +++++++++++++++++++
>   package/libcrossguid/libcrossguid.hash        |  2 +-
>   package/libcrossguid/libcrossguid.mk          | 19 ++----------
>   3 files changed, 35 insertions(+), 17 deletions(-)
>   create mode 100644 package/libcrossguid/0001-pr67-include-missing-cstdint.patch
> 
> diff --git a/package/libcrossguid/0001-pr67-include-missing-cstdint.patch b/package/libcrossguid/0001-pr67-include-missing-cstdint.patch
> new file mode 100644
> index 0000000000..0986f4e9e5
> --- /dev/null
> +++ b/package/libcrossguid/0001-pr67-include-missing-cstdint.patch
> @@ -0,0 +1,31 @@
> +From 1eb9bea38c320b2b588635cffceaaa2a8d434780 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 25 Jan 2023 22:09:26 -0800
> +Subject: [PATCH] include missing <cstdint>
> +
> +gcc 13 moved some includes around and as a result <cstdint> is no longer transitively
> +included [1]. Explicitly include it for uint{32,64}_t.
> +
> +[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream: https://github.com/graeme-hill/crossguid/pull/67
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + include/crossguid/guid.hpp | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/include/crossguid/guid.hpp b/include/crossguid/guid.hpp
> +index 61e0f17..70966f2 100644
> +--- a/include/crossguid/guid.hpp
> ++++ b/include/crossguid/guid.hpp
> +@@ -29,6 +29,7 @@ THE SOFTWARE.
> + #include <jni.h>
> + #endif
> +
> ++#include <cstdint>
> + #include <functional>
> + #include <iostream>
> + #include <array>
> diff --git a/package/libcrossguid/libcrossguid.hash b/package/libcrossguid/libcrossguid.hash
> index 17dbe35c71..3f5c56d641 100644
> --- a/package/libcrossguid/libcrossguid.hash
> +++ b/package/libcrossguid/libcrossguid.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  022c9f02cc36e865cd8fd0111a597ff2bd91988deeb348dbe2aba64aed1abd99  libcrossguid-8f399e8bd4252be9952f3dfa8199924cc8487ca4.tar.gz
> +sha256  6be27e0b3a4907f0cd3cfadec255ee1b925569e1bd06e67a4d2f4267299b69c4  libcrossguid-ca1bf4b810e2d188d04cb6286f957008ee1b7681.tar.gz
>   sha256  779e58787f966a1552f68d5ec041513cef68785dae4a519dbda7bc0b86eda20e  LICENSE
> diff --git a/package/libcrossguid/libcrossguid.mk b/package/libcrossguid/libcrossguid.mk
> index 46d9a9dcc6..3573bdc807 100644
> --- a/package/libcrossguid/libcrossguid.mk
> +++ b/package/libcrossguid/libcrossguid.mk
> @@ -4,25 +4,12 @@
>   #
>   ################################################################################
>   
> -LIBCROSSGUID_VERSION = 8f399e8bd4252be9952f3dfa8199924cc8487ca4
> +LIBCROSSGUID_VERSION = ca1bf4b810e2d188d04cb6286f957008ee1b7681
>   LIBCROSSGUID_SITE = $(call github,graeme-hill,crossguid,$(LIBCROSSGUID_VERSION))
>   LIBCROSSGUID_LICENSE = MIT
>   LIBCROSSGUID_LICENSE_FILES = LICENSE
>   LIBCROSSGUID_INSTALL_STAGING = YES
> -# only a static library
> -LIBCROSSGUID_INSTALL_TARGET = NO
>   LIBCROSSGUID_DEPENDENCIES = util-linux
> +LIBCROSSGUID_CONF_OPTS = -DCROSSGUID_TESTS=OFF
>   
> -define LIBCROSSGUID_BUILD_CMDS
> -	(cd $(@D); $(TARGET_CXX) $(TARGET_CXXFLAGS) -std=c++11 -DGUID_LIBUUID \
> -		-c guid.cpp -o guid.o)
> -	(cd $(@D); $(TARGET_AR) rvs libcrossguid.a guid.o)
> -endef
> -
> -define LIBCROSSGUID_INSTALL_STAGING_CMDS
> -	$(INSTALL) -D -m 644 $(@D)/libcrossguid.a \
> -		$(STAGING_DIR)/usr/lib/libcrossguid.a
> -	$(INSTALL) -D -m 644 $(@D)/guid.h $(STAGING_DIR)/usr/include/guid.h
> -endef
> -
> -$(eval $(generic-package))
> +$(eval $(cmake-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
