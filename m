Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 680FB1077617
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 20:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EB6D41753;
	Wed, 18 Mar 2026 20:32:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U_dP9GPccLVj; Wed, 18 Mar 2026 20:32:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D6404174B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773865949;
	bh=gaHoj/UQYd3qXT2vtIIdp3sP/3FMGalDrG7zmCdM23E=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=X9Fb+fVtkc5NvumqcAOaWUtp+TzSZz/RimYHWZKOMtEdZHj4kLPikCygRYt569fww
	 6BuU7qkHo8Chwx2PpdsPgh+gPAm6r620nRFg7bIJHacQcfww7u01i4mRmKhZD+Iwt9
	 kdJZyUEOmhrsix4iFf2nxtvk61UavpfRCPb4VnUU//KVTa8+pMORAS0B7ug2OtJpT5
	 GtHpGvWujNbHkY0ggDiMGxElGde9PSNltA3ujr1Ata2oV9WXLLSg46sua6yFk1VMaO
	 hT9qjT7tdCQ9/FnNi+P9FiQty/bB2HToFZi/npBd2bLpZu3TR9f6CWAn34mWu3yRGh
	 z1ukXd4tp5Cdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D6404174B;
	Wed, 18 Mar 2026 20:32:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 403E11B6
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 20:32:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D48D4174B
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 20:32:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VfUwpLXaGHgm for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 20:32:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E67C4174A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E67C4174A
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 20:32:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 86F2183FF8; Wed, 18 Mar 2026 20:32:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 18 Mar 2026 21:30:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 79cef8416ed67d50dc4bd30a64f712122195c7a6
X-Git-Newrev: 5e78c6cf3323b4a45f84bcbc504f511dd268e270
X-Patchwork-Hint: ignore
Message-Id: <20260318203226.86F2183FF8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/snort3: bump version to 3.11.1.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5e78c6cf3323b4a45f84bcbc504f511dd268e270
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/snort3/snort3/blob/3.11.1.0/ChangeLog.md

Removed patch which is included in this release.

Upstream switched from pcre to pcre2:
https://github.com/snort3/snort3/commit/bb80b5d754774fc8b1c9c1d9208b6b78cc609521

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ild-fix-cstdint-related-clearlinux-errors.patch | 60 ----------------------
 package/snort3/Config.in                           |  2 +-
 package/snort3/snort3.hash                         |  2 +-
 package/snort3/snort3.mk                           |  4 +-
 4 files changed, 4 insertions(+), 64 deletions(-)

diff --git a/package/snort3/0001-Pull-request-3925-build-fix-cstdint-related-clearlinux-errors.patch b/package/snort3/0001-Pull-request-3925-build-fix-cstdint-related-clearlinux-errors.patch
deleted file mode 100644
index 4f24ee72d4..0000000000
--- a/package/snort3/0001-Pull-request-3925-build-fix-cstdint-related-clearlinux-errors.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 154cf0312b3652bdfdf241e6883d7c6de9b85e01 Mon Sep 17 00:00:00 2001
-From: "Maya Dagon (mdagon)" <mdagon@cisco.com>
-Date: Mon, 24 Jul 2023 08:06:50 +0000
-Subject: [PATCH] Pull request #3925: build: fix cstdint related clearlinux
- errors
-
-Merge in SNORT/snort3 from ~MDAGON/snort3:clearlinux to master
-
-Squashed commit of the following:
-
-commit 7ef2bc13851ffa2bf7908964242859a8c05ddd96
-Author: maya dagon <mdagon@cisco.com>
-Date:   Thu Jul 20 14:34:01 2023 -0400
-
-    build: fix cstdint related clearlinux errors
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/snort3/snort3/commit/154cf0312b3652bdfdf241e6883d7c6de9b85e01
----
- src/js_norm/js_identifier_ctx.h       | 1 +
- src/packet_io/sfdaq_config.h          | 1 +
- src/service_inspectors/wizard/magic.h | 1 +
- 3 files changed, 3 insertions(+)
-
-diff --git a/src/utils/js_identifier_ctx.h b/src/utils/js_identifier_ctx.h
-index b8d5121a2c..6ef1ce2b23 100644
---- a/src/utils/js_identifier_ctx.h
-+++ b/src/utils/js_identifier_ctx.h
-@@ -20,6 +20,7 @@
- #ifndef JS_IDENTIFIER_CTX
- #define JS_IDENTIFIER_CTX
- 
-+#include <cstdint>
- #include <list>
- #include <string>
- #include <unordered_map>
-diff --git a/src/packet_io/sfdaq_config.h b/src/packet_io/sfdaq_config.h
-index 990c45785b..f4c1042bc3 100644
---- a/src/packet_io/sfdaq_config.h
-+++ b/src/packet_io/sfdaq_config.h
-@@ -21,6 +21,7 @@
- #ifndef SFDAQ_CONFIG_H
- #define SFDAQ_CONFIG_H
- 
-+#include <cstdint>
- #include <string>
- #include <vector>
- 
-diff --git a/src/service_inspectors/wizard/magic.h b/src/service_inspectors/wizard/magic.h
-index fa24d0b5a4..b9477eb95c 100644
---- a/src/service_inspectors/wizard/magic.h
-+++ b/src/service_inspectors/wizard/magic.h
-@@ -21,6 +21,7 @@
- #define MAGIC_H
- 
- #include <cassert>
-+#include <cstdint>
- #include <string>
- #include <vector>
- 
diff --git a/package/snort3/Config.in b/package/snort3/Config.in
index 7171603aa3..8dae65381e 100644
--- a/package/snort3/Config.in
+++ b/package/snort3/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_SNORT3
 	select BR2_PACKAGE_LIBDNET
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_LUAJIT
-	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_PCRE2
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_PACKAGE_LIBTIRPC_RPCDB if BR2_PACKAGE_LIBTIRPC
 	select BR2_PACKAGE_OPENSSL
diff --git a/package/snort3/snort3.hash b/package/snort3/snort3.hash
index 7746547d18..599818ee24 100644
--- a/package/snort3/snort3.hash
+++ b/package/snort3/snort3.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  d787d954f21d4cd6a048e10b8c53c78cb6287ec448108fc573b951639c8947b3  snort3-3.1.40.0.tar.gz
+sha256  9465d19b0925088266504e8962e97e55359bafd6a19f66b4169dcd21ef1d8ec5  snort3-3.11.1.0.tar.gz
 
 # Hash for license files:
 sha256  3f1cbfb20bb2c608e1a474421880d08b8cba6abb00ab7736d22c481d71656a6d  COPYING
diff --git a/package/snort3/snort3.mk b/package/snort3/snort3.mk
index a76b831838..273aa56709 100644
--- a/package/snort3/snort3.mk
+++ b/package/snort3/snort3.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-SNORT3_VERSION = 3.1.40.0
+SNORT3_VERSION = 3.11.1.0
 SNORT3_SITE = $(call github,snort3,snort3,$(SNORT3_VERSION))
 SNORT3_LICENSE = GPL-2.0
 SNORT3_LICENSE_FILES = COPYING LICENSE
 
 SNORT3_DEPENDENCIES = \
-	host-pkgconf daq3 flex hwloc libdnet libpcap luajit openssl pcre zlib
+	host-pkgconf daq3 flex hwloc libdnet libpcap luajit openssl pcre2 zlib
 
 SNORT3_CONF_OPTS = \
 	-DENABLE_GDB=OFF \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
