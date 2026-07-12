Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8429C43458
	for <buildroot@archiver.kernel.org>; Sun, 12 Jul 2026 14:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 680DC8133B;
	Sun, 12 Jul 2026 14:19:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id muXppiXXZqLp; Sun, 12 Jul 2026 14:19:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B02D78129E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783865974;
	bh=LTJcIORtpD4GP/VTEA3Pu1lVnykQ8XqGVeYSeWSfKm0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=g0jtfnyt/ejeQiJBCrvUl6aL/Vs5tKyy+ddlX9eUT6HeMjs4oTD4/IX9TBgncXANG
	 3BiFM9LmJW5D2ZoLsDv+Lefand8H+7p3Kcu7a4XcfFIGzFJoKRJTWCymgX8r5y2Js7
	 o5ir3H/BkHo2UxBYZqp+HB5/Uc5xvXKo5Mqiv4cJB+hxu40JGXu9PTAQYqp6HRGlgO
	 fIMlJVAZykDvF9bDpUQwzHtlIOKY+Iw1AbAcgGSTQ8JfT6gAgNEYds8fpU+vC6MPwR
	 jEAwFzIoR3TqGCPSx899gfmJ/y+YFTvdnrS9PXMtJmZ6GQE1uDP3UodABYMWgFkVrD
	 DO+LPkC0GdLpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B02D78129E;
	Sun, 12 Jul 2026 14:19:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F5D81BFB3
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 14:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 610A2810CC
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 14:19:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iQnk0gLhp88D for <buildroot@buildroot.org>;
 Sun, 12 Jul 2026 14:19:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82FB18116B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82FB18116B
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 14:19:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE1E48866C; Sun, 12 Jul 2026 14:18:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Jul 2026 16:18:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce153495126d058053bb3c2148da08ab9d581ba8
X-Git-Newrev: 4412e6e1af11637ae8ff8dec4adf9cf37a8a2bd3
X-Patchwork-Hint: ignore
Message-Id: <20260712141842.BE1E48866C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bootgen: bump to xilinx_v2026.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1327778853317350310=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1327778853317350310==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4412e6e1af11637ae8ff8dec4adf9cf37a8a2bd3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Bump bootgen to xilinx_v2026.1 release.

The following patches are now included and can be removed:
0001-lms-hash-sigs-hss_param.c-add-stdio.h-include.patch
0002-flexlexer-use-embedded-win_include-flexlexer.h.patch

bootgen xilinx_v2026.1 now requires C++ version 14, so the build command has
been updated to reflect this.

Add dependency on BR2_HOST_GCC_AT_LEAST_5 as gcc v5 is needed for C++
version 14 support.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...hash-sigs-hss_param.c-add-stdio.h-include.patch | 51 ---------------
 ...exer-use-embedded-win_include-flexlexer.h.patch | 76 ----------------------
 package/bootgen/Config.in.host                     |  1 +
 package/bootgen/bootgen.hash                       |  2 +-
 package/bootgen/bootgen.mk                         |  4 +-
 5 files changed, 4 insertions(+), 130 deletions(-)

diff --git a/package/bootgen/0001-lms-hash-sigs-hss_param.c-add-stdio.h-include.patch b/package/bootgen/0001-lms-hash-sigs-hss_param.c-add-stdio.h-include.patch
deleted file mode 100644
index 738887e26b..0000000000
--- a/package/bootgen/0001-lms-hash-sigs-hss_param.c-add-stdio.h-include.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 1675ec9d76b32400f612b1c542be6dbf77dea986 Mon Sep 17 00:00:00 2001
-From: Neal Frager <neal.frager@amd.com>
-Date: Tue, 25 Nov 2025 12:54:48 +0000
-Subject: [PATCH] lms-hash-sigs/hss_param.c: add stdio.h include
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The lms-hash-sigs/hss_param.c is missing an include of stdio.h. Without it,
-the following build error can occur:
-
-hss_param.c: In function ‘hss_get_parameter_set’:
-hss_param.c:157:13: error: implicit declaration of function ‘printf’ [-Wimplicit-function-declaration]
-  157 |             printf("Private key expired\n");
-      |             ^~~~~~
-hss_param.c:7:1: note: include ‘<stdio.h>’ or provide a declaration of ‘printf’
-    6 | #include "lm_common.h"
-  +++ |+#include <stdio.h>
-    7 |
-hss_param.c:157:13: warning: incompatible implicit declaration of built-in function ‘printf’ [-Wbuiltin-declaration-mismatch]
-  157 |             printf("Private key expired\n");
-      |             ^~~~~~
-hss_param.c:157:13: note: include ‘<stdio.h>’ or provide a declaration of ‘printf’
-make[3]: *** [Makefile:38: hss_param.o] Error 1
-make[3]: *** Waiting for unfinished jobs....
-make[2]: *** [Makefile:84: build/bin/bootgen] Error 2
-
-The above error was reported on Debian 13 / gcc 14.2.0.
-
-Reported-by: Peter Korsgaard <peter@korsgaard.com>
-Signed-off-by: Neal Frager <neal.frager@amd.com>
-Upstream: submitted to Xilinx bootgen repo with CR-1256741
----
- lms-hash-sigs/hss_param.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lms-hash-sigs/hss_param.c b/lms-hash-sigs/hss_param.c
-index 7a2abd6..6b2b950 100755
---- a/lms-hash-sigs/hss_param.c
-+++ b/lms-hash-sigs/hss_param.c
-@@ -4,6 +4,7 @@
- #include "endian.h"
- #include "hss_zeroize.h"
- #include "lm_common.h"
-+#include <stdio.h>
- 
- static struct map_structure {
-     param_set_t public;
--- 
-2.25.1
-
diff --git a/package/bootgen/0002-flexlexer-use-embedded-win_include-flexlexer.h.patch b/package/bootgen/0002-flexlexer-use-embedded-win_include-flexlexer.h.patch
deleted file mode 100644
index 1de9a91223..0000000000
--- a/package/bootgen/0002-flexlexer-use-embedded-win_include-flexlexer.h.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From dfe45e10791a171c3c79699257d3d3a978ec30eb Mon Sep 17 00:00:00 2001
-From: Neal Frager <neal.frager@amd.com>
-Date: Wed, 18 Mar 2026 09:51:58 +0000
-Subject: [PATCH] flexlexer: use embedded win_include/flexlexer.h
-
-bootgen embeds an old version of flex. If the host machine has a newer version
-of flex, the bootgen binary that is built will have errors such as the
-following, if the wrong version of flexlexer.h is used.
-
-$ output/host/bin/bootgen
-
-****** Bootgen v2025.1-Merged
-  **** Build date : Mar 18 2026-07:08:01
-    ** Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-    ** Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-
-ERROR: syntax error
--h
-
-Running the bootgen binary should print the help menu by default and should
-not have a syntax error.
-
-Correct the path to the flexlexer.h header files, such that no host version
-of these files can cause a silent build failure.
-
-Upstream: CR to AMD jira
-
-Signed-off-by: Neal Frager <neal.frager@amd.com>
----
- common/include/bifscanner.h        | 2 +-
- common/include/cmdoptionsscanner.h | 2 +-
- common/include/reginitscanner.h    | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/common/include/bifscanner.h b/common/include/bifscanner.h
-index 9683416..9aa72a5 100755
---- a/common/include/bifscanner.h
-+++ b/common/include/bifscanner.h
-@@ -29,7 +29,7 @@
- #if ! defined(yyFlexLexerOnce)
- #undef yyFlexLexer
- #define yyFlexLexer bifFlexLexer
--#include "FlexLexer.h"
-+#include "../../win_include/FlexLexer.h"
- #endif
- 
- // Override the interface for yylex since we namespaced it
-diff --git a/common/include/cmdoptionsscanner.h b/common/include/cmdoptionsscanner.h
-index aa2f474..78fa7cf 100755
---- a/common/include/cmdoptionsscanner.h
-+++ b/common/include/cmdoptionsscanner.h
-@@ -30,7 +30,7 @@
- 
- #undef yyFlexLexer
- #define yyFlexLexer reginitFlexLexer
--#include "FlexLexer.h"
-+#include "../../win_include/FlexLexer.h"
- #endif
- 
- // Override the interface for yylex since we namespaced it
-diff --git a/common/include/reginitscanner.h b/common/include/reginitscanner.h
-index 74463e6..d8152a6 100755
---- a/common/include/reginitscanner.h
-+++ b/common/include/reginitscanner.h
-@@ -30,7 +30,7 @@
- 
- #undef yyFlexLexer
- #define yyFlexLexer reginitFlexLexer
--#include "FlexLexer.h"
-+#include "../../win_include/FlexLexer.h"
- #endif
- 
- // Override the interface for yylex since we namespaced it
--- 
-2.25.1
-
diff --git a/package/bootgen/Config.in.host b/package/bootgen/Config.in.host
index 0acb58dee0..635eaf0f71 100644
--- a/package/bootgen/Config.in.host
+++ b/package/bootgen/Config.in.host
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_HOST_BOOTGEN
 	bool "host bootgen"
+	depends on BR2_HOST_GCC_AT_LEAST_5 # C++14
 	help
 	  bootgen is a tool to generate a boot.bin firmware
 	  for Xilinx versal, zynqmp and zynq product families.
diff --git a/package/bootgen/bootgen.hash b/package/bootgen/bootgen.hash
index 995074c591..007cecfa45 100644
--- a/package/bootgen/bootgen.hash
+++ b/package/bootgen/bootgen.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c92d9be48fabc943c4addd9b12beced6671f5547b4f6dc01e7ccf0f274dbef66  bootgen-xilinx_v2025.2.tar.gz
+sha256  23529d4922efd79d201d6b4a3cdaefe5cc9384b55dd56ef916a56f2a0ed7340c  bootgen-xilinx_v2026.1.tar.gz
 sha256  36e278ff2cc9ef95154a923bf4a9450414f358779045ae4f863c8d77fb18dbdb  LICENSE
diff --git a/package/bootgen/bootgen.mk b/package/bootgen/bootgen.mk
index e5cfee18d9..2e14c625fa 100644
--- a/package/bootgen/bootgen.mk
+++ b/package/bootgen/bootgen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOTGEN_VERSION = xilinx_v2025.2
+BOOTGEN_VERSION = xilinx_v2026.1
 BOOTGEN_SITE = $(call github,Xilinx,bootgen,$(BOOTGEN_VERSION))
 HOST_BOOTGEN_DEPENDENCIES = host-openssl host-pkgconf
 BOOTGEN_LICENSE = Apache-2.0
@@ -14,7 +14,7 @@ define HOST_BOOTGEN_BUILD_CMDS
 	$(MAKE) $(HOST_CONFIGURE_OPTS) \
 		LIBS="`$(HOST_MAKE_ENV) $(PKG_CONFIG_HOST_BINARY) --libs libssl libcrypto`" \
 		INCLUDE_USER="`$(HOST_MAKE_ENV) $(PKG_CONFIG_HOST_BINARY) --cflags libssl libcrypto`" \
-		CXXFLAGS="$(HOST_CXXFLAGS) -std=c++0x" \
+		CXXFLAGS="$(HOST_CXXFLAGS) -std=c++14" \
 		-C $(@D)
 endef
 

--===============1327778853317350310==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1327778853317350310==--
