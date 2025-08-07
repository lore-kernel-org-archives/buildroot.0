Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C795AC87FCB
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 01:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 381DF84A38;
	Thu,  7 Aug 2025 01:14:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EzSyqG0o1o-s; Thu,  7 Aug 2025 01:14:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59C7E84A34
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59C7E84A34;
	Thu,  7 Aug 2025 01:14:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AE2DD79
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 01:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C7D661BE6
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 01:14:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AnmkHrWzSSPR for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 01:14:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80A6D61195
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80A6D61195
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 01:14:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B77986FB3; Thu,  7 Aug 2025 01:14:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 03:02:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 945f4acbfff1ba28818a4343ec8d4b7127505e64
X-Git-Newrev: 1c7948af337275ba3ec5ca9d2797fc4ba493da62
X-Patchwork-Hint: ignore
Message-Id: <20250807011412.6B77986FB3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uuu: bump to version 1.5.219
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1c7948af337275ba3ec5ca9d2797fc4ba493da62
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.218
https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.219

This commit also removes the package patch included in this
new release.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
[Julien: remove the package patch included in this new release]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...0001-libuuu-sdps-fix-gcc15-compile-errors.patch | 33 ----------------------
 package/uuu/uuu.hash                               |  2 +-
 package/uuu/uuu.mk                                 |  2 +-
 3 files changed, 2 insertions(+), 35 deletions(-)

diff --git a/package/uuu/0001-libuuu-sdps-fix-gcc15-compile-errors.patch b/package/uuu/0001-libuuu-sdps-fix-gcc15-compile-errors.patch
deleted file mode 100644
index a3c1d85fc0..0000000000
--- a/package/uuu/0001-libuuu-sdps-fix-gcc15-compile-errors.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 142448e55386b88adf5b1d7e6206df1ca6784708 Mon Sep 17 00:00:00 2001
-From: Bruno Thomsen <bruno.thomsen@gmail.com>
-Date: Sat, 1 Mar 2025 14:32:41 +0100
-Subject: [PATCH] libuuu/sdps: fix gcc15 compile errors
-
-This gcc 15 error happens on Fedora 42.
-
-error: uint32_t does not name a type
-
-error: uint64_t does not name a type
-
-Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
-Upstream: https://github.com/nxp-imx/mfgtools/commit/142448e55386b88adf5b1d7e6206df1ca6784708
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
----
- libuuu/sdps.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libuuu/sdps.h b/libuuu/sdps.h
-index b82f9d71c981..667a477ee48f 100644
---- a/libuuu/sdps.h
-+++ b/libuuu/sdps.h
-@@ -30,6 +30,7 @@
- */
- 
- #include "cmd.h"
-+#include <cstdint>
- 
- class SDPSCmd : public CmdBase
- {
--- 
-2.43.0
-
diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
index 9f978f55cc..a56baaaef4 100644
--- a/package/uuu/uuu.hash
+++ b/package/uuu/uuu.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  c763b87ffdf10ac5499a0c319463759caa336bc6567b56d6d0ef448590c1a76d  uuu_source-uuu_1.5.201.tar.gz
+sha256  5940b1882628531b5786668552207576a5e27b7b890d67def2e22a760ebd5d91  uuu_source-uuu_1.5.219.tar.gz
 sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
index 93d0b97b13..18438963ad 100644
--- a/package/uuu/uuu.mk
+++ b/package/uuu/uuu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UUU_VERSION = 1.5.201
+UUU_VERSION = 1.5.219
 UUU_SOURCE = uuu_source-uuu_$(UUU_VERSION).tar.gz
 UUU_SITE = https://github.com/nxp-imx/mfgtools/releases/download/uuu_$(UUU_VERSION)
 UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
