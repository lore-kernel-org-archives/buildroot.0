Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECFCBC87FDA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2A94606CB;
	Thu,  7 Aug 2025 17:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id olcgY8CbPpUf; Thu,  7 Aug 2025 17:01:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 783DD60674
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 783DD60674;
	Thu,  7 Aug 2025 17:01:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 033C831
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64F1380C1C
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dw--H05L7_Mr for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:00:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0012180C19
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0012180C19
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F21FE86088; Thu,  7 Aug 2025 17:00:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 11:06:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: bc47ce6a422e2c6aa0ebe715efc77ae75df57f5e
X-Git-Newrev: 2d7bd5dfc26193a8353ab2bc4c0777abe7052d68
X-Patchwork-Hint: ignore
Message-Id: <20250807170021.F21FE86088@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/mosquitto: bump
 to version 2.0.22
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2d7bd5dfc26193a8353ab2bc4c0777abe7052d68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Drop the patch that was fixed in the v2.0.22, see the closed issues and PRs:
https://github.com/eclipse-mosquitto/mosquitto/issues/3246
https://github.com/eclipse-mosquitto/mosquitto/pull/3256
https://github.com/eclipse-mosquitto/mosquitto/pull/3227
https://github.com/eclipse-mosquitto/mosquitto/pull/3252

However, a new issue was reported by GasparQ, when WITH_TLS option is off.
https://github.com/eclipse-mosquitto/mosquitto/issues/3318

Fortunately, besmarsh had pushed a PR that fixed this issue.
https://github.com/eclipse-mosquitto/mosquitto/pull/3321

The patch file was quoted in this commit.

For more details of v2.0.22, see the changelog:
https://github.com/eclipse-mosquitto/mosquitto/blob/v2.0.22/ChangeLog.txt

Signed-off-by: Scott Fan <fancp2007@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 2c20a2541c9a9883d00bc39a5711fa312d915758)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0001-Fix-CMake-builds-with-WITH_TLS-OFF.patch  | 50 ++++++++++++++++++++++
 ...1-fix-compile-failed-when-WITH_TLS-is-off.patch | 35 ---------------
 package/mosquitto/mosquitto.hash                   |  4 +-
 package/mosquitto/mosquitto.mk                     |  2 +-
 4 files changed, 53 insertions(+), 38 deletions(-)

diff --git a/package/mosquitto/0001-Fix-CMake-builds-with-WITH_TLS-OFF.patch b/package/mosquitto/0001-Fix-CMake-builds-with-WITH_TLS-OFF.patch
new file mode 100644
index 0000000000..9445148f44
--- /dev/null
+++ b/package/mosquitto/0001-Fix-CMake-builds-with-WITH_TLS-OFF.patch
@@ -0,0 +1,50 @@
+From 1ecc94d7b4ff495afd7f32c42072cdf4ea5407aa Mon Sep 17 00:00:00 2001
+From: Ben Marsh <ben.marsh555@googlemail.com>
+Date: Mon, 21 Jul 2025 17:46:16 +0100
+Subject: [PATCH] Fix CMake builds with WITH_TLS=OFF
+
+Recent CMake changes caused CMake builds with the WITH_TLS option set to OFF to fail. The OpenSSL package is only found (find_package()) if WITH_TLS is ON, but linking to OpenSSL for the broker and library is not guarded by WITH_TLS. The build therefore fails.
+
+Guard linking to OpenSSL, only linking if WITH_TLS is set.
+
+Upstream: https://github.com/eclipse-mosquitto/mosquitto/pull/3321
+Signed-off-by: Scott Fan <fancp2007@gmail.com>
+---
+ lib/CMakeLists.txt | 4 +++-
+ src/CMakeLists.txt | 5 ++++-
+ 2 files changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/lib/CMakeLists.txt b/lib/CMakeLists.txt
+index 21b61497..e6b8235b 100644
+--- a/lib/CMakeLists.txt
++++ b/lib/CMakeLists.txt
+@@ -60,7 +60,9 @@ set(C_SRC
+ 	util_mosq.c util_topic.c util_mosq.h
+ 	will_mosq.c will_mosq.h)
+ 
+-set (LIBRARIES OpenSSL::SSL)
++if (WITH_TLS)
++	set (LIBRARIES OpenSSL::SSL)
++endif()
+ 
+ if (UNIX AND NOT APPLE AND NOT ANDROID)
+ 	find_library(LIBRT rt)
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index d4bae7cd..6fd0ee53 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -163,7 +163,10 @@ if (WITH_DLT)
+     set (MOSQ_LIBS ${MOSQ_LIBS} ${DLT_LIBRARIES})
+ endif (WITH_DLT)
+ 
+-set (MOSQ_LIBS ${MOSQ_LIBS} OpenSSL::SSL)
++if (WITH_TLS)
++	set (MOSQ_LIBS ${MOSQ_LIBS} OpenSSL::SSL)
++endif()
++
+ # Check for getaddrinfo_a
+ include(CheckLibraryExists)
+ check_library_exists(anl getaddrinfo_a  "" HAVE_GETADDRINFO_A)
+-- 
+2.43.0
+
diff --git a/package/mosquitto/0001-fix-compile-failed-when-WITH_TLS-is-off.patch b/package/mosquitto/0001-fix-compile-failed-when-WITH_TLS-is-off.patch
deleted file mode 100644
index 9c69c6a9c2..0000000000
--- a/package/mosquitto/0001-fix-compile-failed-when-WITH_TLS-is-off.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 47c015e0d3fb5c5c71a68fe21c8e5eb2a5fbfc1d Mon Sep 17 00:00:00 2001
-From: "chunbo.bai" <chunbo.bai@tcl.com>
-Date: Fri, 7 Mar 2025 14:16:45 +0800
-Subject: [PATCH] fix: compile failed when WITH_TLS is off
-
-Upstream: https://github.com/eclipse-mosquitto/mosquitto/pull/3227
-Signed-off-by: "chunbo.bai" <chunbo.bai@tcl.com>
-Signed-off-by: Scott Fan <fancp2007@gmail.com>
----
- src/conf.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/conf.c b/src/conf.c
-index 74ca66fcb..bfccf729c 100644
---- a/src/conf.c
-+++ b/src/conf.c
-@@ -2313,6 +2313,7 @@ static int config__check(struct mosquitto__config *config)
- 		}
- 	}
- 
-+#ifdef WITH_TLS
- 	/* Check for missing TLS cafile/capath/certfile/keyfile */
- 	for(int i=0; i<config->listener_count; i++){
- 		 bool cafile = !!config->listeners[i].cafile;
-@@ -2333,6 +2334,7 @@ static int config__check(struct mosquitto__config *config)
- 			 return MOSQ_ERR_INVAL;
- 		 }
- 	}
-+#endif
- 	return MOSQ_ERR_SUCCESS;
- }
- 
--- 
-2.43.0
-
diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index ff74d9c534..cf031f91e5 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking gpg signature
-# from https://mosquitto.org/files/source/mosquitto-2.0.21.tar.gz.asc
-sha256  7ad5e84caeb8d2bb6ed0c04614b2a7042def961af82d87f688ba33db857b899d  mosquitto-2.0.21.tar.gz
+# from https://mosquitto.org/files/source/mosquitto-2.0.22.tar.gz.asc
+sha256  2f752589ef7db40260b633fbdb536e9a04b446a315138d64a7ff3c14e2de6b68  mosquitto-2.0.22.tar.gz
 
 # License files
 sha256  d3c4ccace4e5d3cc89d34cf2a0bc85b8596bfc0a32b815d0d77f9b7c41b5350c  LICENSE.txt
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 900d1e65cb..8539f28d08 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 2.0.21
+MOSQUITTO_VERSION = 2.0.22
 MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-2.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v20 edl-v10
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
