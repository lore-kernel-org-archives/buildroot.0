Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C1D2CAC5A7
	for <buildroot@archiver.kernel.org>; Mon, 22 Sep 2025 08:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09C32614F2;
	Mon, 22 Sep 2025 08:22:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gPhst6i9x3we; Mon, 22 Sep 2025 08:22:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 194E5614CF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 194E5614CF;
	Mon, 22 Sep 2025 08:22:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C9DA116C
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 08:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59B7840EF9
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 08:22:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VDr-oldEz3_I for <buildroot@buildroot.org>;
 Mon, 22 Sep 2025 08:22:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7BBD440EE5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BBD440EE5
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7BBD440EE5
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 08:22:17 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 7F50331E0A54; Mon, 22 Sep 2025 10:22:14 +0200 (CEST)
Date: Mon, 22 Sep 2025 10:22:14 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aNEHNhC3tCHIasx8@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.43+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1758529334; bh=ZirHLEjNmPo9aGGZvckOgNMlVa10Lp8RN1frUAVNQZk=;
 h=Date:From:To:Subject:From;
 b=fevfNnhfv6OwaXBrQP4Tr7TGaxFCH3jmyhe7mcWrdsTLKS/dsZrGh6SL2+S3w0kjM
 qp7ZcSNgUkZekoaJM2SFIVc2wx1w49R3gsqzKGdqCSP1ZGUVv2LpxE2MZNzJf+jNqw
 5C/hs7yQDR8fFC6y9OeyZ1wmL4IEwgyMwO01v388DIRbBgj48ZKYw84dTSNDPc1dy3
 295Xm8ICkpUAOIlcu4si8ZTTlbomUNS+q/lGNpd8BYuVn9Ser/Px8jIRQhMv8476ui
 jSpYVm2vGyr7bEaNrJjL4UoY9dejmZP9y9rmlVS2Xh6GzWPZ0cEjtIw+EmxZpxKRIS
 qv1zITJnsYyig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=fevfNnhf
Subject: [Buildroot] [PATCH] package/icu: bump to 77.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update icu to 77.1.

The LICENSE file contains a lot of changes, so no diff
is presented.

Patch 0002-workaround-toolchain-bugs.patch is no longer required.
Reorder the other patches accordingly.
Update patch 0003-fix-static-linking-with-icu-uc.patch so that
it applies cleanly.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 .checkpackageignore                           |  5 +--
 ...h => 0002-link-icudata-as-data-only.patch} |  0
 .../icu/0002-workaround-toolchain-bugs.patch  | 37 -------------------
 ...0003-fix-static-linking-with-icu-uc.patch} | 24 +++++-------
 package/icu/icu.hash                          |  4 +-
 package/icu/icu.mk                            |  2 +-
 6 files changed, 15 insertions(+), 57 deletions(-)
 rename package/icu/{0003-link-icudata-as-data-only.patch => 0002-link-icudata-as-data-only.patch} (100%)
 delete mode 100644 package/icu/0002-workaround-toolchain-bugs.patch
 rename package/icu/{0004-fix-static-linking-with-icu-uc.patch => 0003-fix-static-linking-with-icu-uc.patch} (50%)

diff --git a/.checkpackageignore b/.checkpackageignore
index f5e550736c..e28db178c7 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -491,9 +491,8 @@ package/ibrcommon/0001-ibrcommon-data-File.cpp-support-POSIX-basename-call.patch
 package/ibrcommon/0002-ibrcommon-added-openssl-1.1-compatibility-264.patch lib_patch.Upstream
 package/ibrcommon/0003-ibrcommon-ssl-gcm-fix-static-build-with-openssl.patch lib_patch.Upstream
 package/icu/0001-dont-build-static-dynamic-twice.patch lib_patch.Upstream
-package/icu/0002-workaround-toolchain-bugs.patch lib_patch.Upstream
-package/icu/0003-link-icudata-as-data-only.patch lib_patch.Upstream
-package/icu/0004-fix-static-linking-with-icu-uc.patch lib_patch.Upstream
+package/icu/0002-link-icudata-as-data-only.patch lib_patch.Upstream
+package/icu/0003-fix-static-linking-with-icu-uc.patch lib_patch.Upstream
 package/ifmetric/0001-Fix-issue-NETLINK-Packet-too-small-or-truncated-92-1.patch lib_patch.Upstream
 package/ifplugd/0001-cross.patch lib_patch.Sob lib_patch.Upstream
 package/ifplugd/0002-fix-headers.patch lib_patch.Sob lib_patch.Upstream
diff --git a/package/icu/0003-link-icudata-as-data-only.patch b/package/icu/0002-link-icudata-as-data-only.patch
similarity index 100%
rename from package/icu/0003-link-icudata-as-data-only.patch
rename to package/icu/0002-link-icudata-as-data-only.patch
diff --git a/package/icu/0002-workaround-toolchain-bugs.patch b/package/icu/0002-workaround-toolchain-bugs.patch
deleted file mode 100644
index f6b124cc2a..0000000000
--- a/package/icu/0002-workaround-toolchain-bugs.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Workaround toolchain bugs
-
-Many of ARM Sourcery CodeBench toolchain have a bug when compiling
-icu's translit.cpp source file. The bug is triggered when there is a
-combination of "-W -Wall" and "-Os", and causes an internal compiler
-error. The bug has been reported to Mentor Graphics.
-
-Even though it is clearly a toolchain bug, having a workaround for it
-is trivial in this case. So it will avoid our users falling into this
-internal compiler error, and allow our autobuilders to test more
-packages using this Sourcery CodeBench toolchain.qq
-
-[Gustavo: update for ICU4C 54.1]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura icu.orig/source/configure icu/source/configure
---- icu.orig/source/configure	2014-12-18 15:49:43.038628644 -0300
-+++ icu/source/configure	2014-12-18 15:51:23.183083232 -0300
-@@ -4323,7 +4323,7 @@
-                 ;;
-             esac
- 
--            CFLAGS="$CFLAGS -Wall -pedantic -Wshadow -Wpointer-arith -Wmissing-prototypes -Wwrite-strings"
-+            CFLAGS="$CFLAGS -pedantic -Wshadow -Wpointer-arith -Wmissing-prototypes -Wwrite-strings"
-         else
-             case "${host}" in
-             *-*-cygwin)
-@@ -4337,7 +4337,7 @@
-         fi
-         if test "$GXX" = yes
-         then
--            CXXFLAGS="$CXXFLAGS -W -Wall -pedantic -Wpointer-arith -Wwrite-strings -Wno-long-long"
-+            CXXFLAGS="$CXXFLAGS -pedantic -Wpointer-arith -Wwrite-strings -Wno-long-long"
-         else
-             case "${host}" in
-             *-*-cygwin)
diff --git a/package/icu/0004-fix-static-linking-with-icu-uc.patch b/package/icu/0003-fix-static-linking-with-icu-uc.patch
similarity index 50%
rename from package/icu/0004-fix-static-linking-with-icu-uc.patch
rename to package/icu/0003-fix-static-linking-with-icu-uc.patch
index 965906b9b9..36a3d1f696 100644
--- a/package/icu/0004-fix-static-linking-with-icu-uc.patch
+++ b/package/icu/0003-fix-static-linking-with-icu-uc.patch
@@ -16,19 +16,15 @@ Signed-off-by: Romain Naour <romain.naour@openwide.fr>
  source/Makefile.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/source/Makefile.in b/source/Makefile.in
-index 9db6c52..ca48e16 100644
---- a/source/Makefile.in
-+++ b/source/Makefile.in
-@@ -264,7 +264,7 @@ config/icu-uc.pc: config/icu.pc Makefile icudefs.mk
- 	@echo "Description: $(PACKAGE_ICU_DESCRIPTION): Common and Data libraries" >> $@
- 	@echo "Name: $(PACKAGE)-uc" >> $@
- 	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" "${ICULIBS_DT}" >> $@
--	@echo "Libs.private:" '$${baselibs}' >> $@
-+	@echo "Libs.private:" '$${baselibs}' -lstdc++ >> $@
+diff -git icu.orig/source/Makefile.in icu/source/Makefile.in
+--- icu.orig/source/Makefile.in	2025-03-13 19:31:23.000000000 +0100
++++ icu/source/Makefile.in	2025-09-22 08:56:36.791792784 +0200
+@@ -279,7 +279,7 @@
+ 	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" "${ICULIBS_DT}" '$${baselibs}' >> $@
+ else
+ 	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" >> $@
+-	@echo "Libs.private:" "${ICULIBS_DT}" '$${baselibs}' >> $@
++	@echo "Libs.private:" "${ICULIBS_DT}" '$${baselibs}' -lstdc++ >> $@
+ endif
  	@echo $@ updated.
  
- config/icu-i18n.pc: config/icu.pc Makefile icudefs.mk
--- 
-2.4.3
-
diff --git a/package/icu/icu.hash b/package/icu/icu.hash
index 0948bf495e..bf9451db8e 100644
--- a/package/icu/icu.hash
+++ b/package/icu/icu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  818a80712ed3caacd9b652305e01afc7fa167e6f2e94996da44b90c2ab604ce1  icu4c-73_2-src.tgz
-sha256  f3005e195ff74d8812cc1f182a1c446fab678d70a10e3dada497585befee5416  LICENSE
+sha256  588e431f77327c39031ffbb8843c0e3bc122c211374485fa87dc5f3faff24061  icu4c-77_1-src.tgz
+sha256  451167c55c0fa447cc2d5632714f5e3c567fe4f1e1badefab2c1333852198aca  LICENSE
diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 73547a7537..4789edf0e2 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -7,7 +7,7 @@
 # Git tags (and therefore versions on release-monitoring.org) use the
 # XX-Y format, but the tarballs are named XX_Y and the containing
 # directories XX.Y.
-ICU_VERSION = 73-2
+ICU_VERSION = 77-1
 ICU_SOURCE = icu4c-$(subst -,_,$(ICU_VERSION))-src.tgz
 ICU_SITE = \
 	https://github.com/unicode-org/icu/releases/download/release-$(ICU_VERSION)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
