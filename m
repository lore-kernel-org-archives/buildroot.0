Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C63C83F34
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9E3460FC6;
	Thu, 17 Jul 2025 20:33:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RDbZWkS_SlqI; Thu, 17 Jul 2025 20:33:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E90676124D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E90676124D;
	Thu, 17 Jul 2025 20:33:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10DE2226
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CE9A41165
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:32:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R_BVRhO2wkpL for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:32:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE2FB41138
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE2FB41138
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:32:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EBAC686573; Thu, 17 Jul 2025 20:32:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 17 Jul 2025 22:24:23 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: b18a365e4976be1ca1861dfeefcb62c5845d26dd
X-Git-Newrev: 745acf6a8d5ef7e0056d46bf6d6d797f5a8d88a3
X-Patchwork-Hint: ignore
Message-Id: <20250717203256.EBAC686573@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/libcrossguid:
 bump version to v0.2.2-52-gca1bf4b
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=745acf6a8d5ef7e0056d46bf6d6d797f5a8d88a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Needed for kodi 22.x.

Added build fix for >= gcc-13.

Switched build system to cmake following upstream:
https://github.com/graeme-hill/crossguid/commit/13683c56e559f93d75f8640488aa3335f43443ed

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: use "git describe --tags --abbrev=40" format for _VERSION]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit c61d7d61b1e3fe143569938f7c63b01a24169830)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 .../0001-pr67-include-missing-cstdint.patch        | 31 ++++++++++++++++++++++
 package/libcrossguid/libcrossguid.hash             |  2 +-
 package/libcrossguid/libcrossguid.mk               | 19 +++----------
 3 files changed, 35 insertions(+), 17 deletions(-)

diff --git a/package/libcrossguid/0001-pr67-include-missing-cstdint.patch b/package/libcrossguid/0001-pr67-include-missing-cstdint.patch
new file mode 100644
index 0000000000..0986f4e9e5
--- /dev/null
+++ b/package/libcrossguid/0001-pr67-include-missing-cstdint.patch
@@ -0,0 +1,31 @@
+From 1eb9bea38c320b2b588635cffceaaa2a8d434780 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 25 Jan 2023 22:09:26 -0800
+Subject: [PATCH] include missing <cstdint>
+
+gcc 13 moved some includes around and as a result <cstdint> is no longer transitively
+included [1]. Explicitly include it for uint{32,64}_t.
+
+[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream: https://github.com/graeme-hill/crossguid/pull/67
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ include/crossguid/guid.hpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/crossguid/guid.hpp b/include/crossguid/guid.hpp
+index 61e0f17..70966f2 100644
+--- a/include/crossguid/guid.hpp
++++ b/include/crossguid/guid.hpp
+@@ -29,6 +29,7 @@ THE SOFTWARE.
+ #include <jni.h>
+ #endif
+ 
++#include <cstdint>
+ #include <functional>
+ #include <iostream>
+ #include <array>
diff --git a/package/libcrossguid/libcrossguid.hash b/package/libcrossguid/libcrossguid.hash
index 17dbe35c71..f65c25732d 100644
--- a/package/libcrossguid/libcrossguid.hash
+++ b/package/libcrossguid/libcrossguid.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  022c9f02cc36e865cd8fd0111a597ff2bd91988deeb348dbe2aba64aed1abd99  libcrossguid-8f399e8bd4252be9952f3dfa8199924cc8487ca4.tar.gz
+sha256  6be27e0b3a4907f0cd3cfadec255ee1b925569e1bd06e67a4d2f4267299b69c4  libcrossguid-v0.2.2-52-gca1bf4b810e2d188d04cb6286f957008ee1b7681.tar.gz
 sha256  779e58787f966a1552f68d5ec041513cef68785dae4a519dbda7bc0b86eda20e  LICENSE
diff --git a/package/libcrossguid/libcrossguid.mk b/package/libcrossguid/libcrossguid.mk
index 46d9a9dcc6..c77f21ab26 100644
--- a/package/libcrossguid/libcrossguid.mk
+++ b/package/libcrossguid/libcrossguid.mk
@@ -4,25 +4,12 @@
 #
 ################################################################################
 
-LIBCROSSGUID_VERSION = 8f399e8bd4252be9952f3dfa8199924cc8487ca4
+LIBCROSSGUID_VERSION = v0.2.2-52-gca1bf4b810e2d188d04cb6286f957008ee1b7681
 LIBCROSSGUID_SITE = $(call github,graeme-hill,crossguid,$(LIBCROSSGUID_VERSION))
 LIBCROSSGUID_LICENSE = MIT
 LIBCROSSGUID_LICENSE_FILES = LICENSE
 LIBCROSSGUID_INSTALL_STAGING = YES
-# only a static library
-LIBCROSSGUID_INSTALL_TARGET = NO
 LIBCROSSGUID_DEPENDENCIES = util-linux
+LIBCROSSGUID_CONF_OPTS = -DCROSSGUID_TESTS=OFF
 
-define LIBCROSSGUID_BUILD_CMDS
-	(cd $(@D); $(TARGET_CXX) $(TARGET_CXXFLAGS) -std=c++11 -DGUID_LIBUUID \
-		-c guid.cpp -o guid.o)
-	(cd $(@D); $(TARGET_AR) rvs libcrossguid.a guid.o)
-endef
-
-define LIBCROSSGUID_INSTALL_STAGING_CMDS
-	$(INSTALL) -D -m 644 $(@D)/libcrossguid.a \
-		$(STAGING_DIR)/usr/lib/libcrossguid.a
-	$(INSTALL) -D -m 644 $(@D)/guid.h $(STAGING_DIR)/usr/include/guid.h
-endef
-
-$(eval $(generic-package))
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
