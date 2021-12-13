Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D61AEC433F5
	for <buildroot@archiver.kernel.org>; Mon, 13 Dec 2021 21:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96A7E402DD;
	Mon, 13 Dec 2021 21:16:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rCQULwAU5Qeh; Mon, 13 Dec 2021 21:16:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2DED402D3;
	Mon, 13 Dec 2021 21:16:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9092E1BF2B0
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 21:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C96760B49
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 21:15:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gDLPGQu7xWKY for <buildroot@lists.busybox.net>;
 Mon, 13 Dec 2021 21:15:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80B7160B4E
 for <buildroot@buildroot.org>; Mon, 13 Dec 2021 21:15:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A215B83799; Mon, 13 Dec 2021 21:09:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 13 Dec 2021 20:28:27 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 928bfe6045a2fad38bb29d4549fb2401c91fce2b
X-Git-Newrev: 027a12de4d824da4c972e67d3b1270d674886353
X-Patchwork-Hint: ignore
Message-Id: <20211213210951.A215B83799@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/ell: bump version
 to 0.38
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=027a12de4d824da4c972e67d3b1270d674886353
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

- remove 0001-build-Add-rawmemchr-to-missing.h.patch
  (upstream [1])

- remove 0002-ell-add-missing-include-in-dhcp-server.patch
  (upstream [2])

[1] https://git.kernel.org/pub/scm/libs/ell/ell.git/commit/?id=3916c1cc32be205e185a8a56de5cde1b9ec60e81
[2] https://git.kernel.org/pub/scm/libs/ell/ell.git/commit/?id=6dfff19d4716ba216de1a3298ed0f667d7782810

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 24575ad614fecc50bfa2c3d586104f7134a46770)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-build-Add-rawmemchr-to-missing.h.patch    | 47 ----------------------
 ...02-ell-add-missing-include-in-dhcp-server.patch | 26 ------------
 package/ell/ell.hash                               |  2 +-
 package/ell/ell.mk                                 |  2 +-
 4 files changed, 2 insertions(+), 75 deletions(-)

diff --git a/package/ell/0001-build-Add-rawmemchr-to-missing.h.patch b/package/ell/0001-build-Add-rawmemchr-to-missing.h.patch
deleted file mode 100644
index 3e00023001..0000000000
--- a/package/ell/0001-build-Add-rawmemchr-to-missing.h.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 3916c1cc32be205e185a8a56de5cde1b9ec60e81 Mon Sep 17 00:00:00 2001
-From: Denis Kenzior <denkenz@gmail.com>
-Date: Mon, 30 Nov 2020 13:00:11 -0600
-Subject: [PATCH] build: Add rawmemchr to missing.h
-
-For those systems (i.e. musl) that do not support this
-
-[Upstream: https://git.kernel.org/pub/scm/libs/ell/ell.git/patch/?id=3916c1cc32be205e185a8a56de5cde1b9ec60e81]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- configure.ac  |  1 +
- ell/missing.h | 10 ++++++++++
- 2 files changed, 11 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 1e5ead9..f34add1 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -98,6 +98,7 @@ AC_ARG_ENABLE(ubsan, AC_HELP_STRING([--enable-ubsan],
- ])
- 
- AC_CHECK_FUNCS(explicit_bzero)
-+AC_CHECK_FUNCS(rawmemchr)
- 
- AC_CHECK_FUNC(signalfd, dummy=yes,
- 			AC_MSG_ERROR(signalfd support is required))
-diff --git a/ell/missing.h b/ell/missing.h
-index 6b9b0fd..2a3e647 100644
---- a/ell/missing.h
-+++ b/ell/missing.h
-@@ -67,3 +67,13 @@ static inline void explicit_bzero(void *s, size_t n)
- #ifndef SO_BINDTOIFINDEX
- #define SO_BINDTOIFINDEX 62
- #endif
-+
-+#ifndef HAVE_RAWMEMCHR
-+static inline void *rawmemchr(const void *s, int c)
-+{
-+_Pragma("GCC diagnostic push")
-+_Pragma("GCC diagnostic ignored \"-Wstringop-overflow=\"")
-+	return memchr(s, c, (size_t) -1);
-+_Pragma("GCC diagnostic pop")
-+}
-+#endif
--- 
-2.29.2
-
diff --git a/package/ell/0002-ell-add-missing-include-in-dhcp-server.patch b/package/ell/0002-ell-add-missing-include-in-dhcp-server.patch
deleted file mode 100644
index a2ac7b0965..0000000000
--- a/package/ell/0002-ell-add-missing-include-in-dhcp-server.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 6dfff19d4716ba216de1a3298ed0f667d7782810 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?=C3=89rico=20Nogueira?= <ericonr@disroot.org>
-Date: Mon, 30 Nov 2020 18:40:33 -0300
-Subject: [PATCH] ell: add missing include in dhcp-server.
-
-[Upstream: https://git.kernel.org/pub/scm/libs/ell/ell.git/patch/?id=6dfff19d4716ba216de1a3298ed0f667d7782810]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- ell/dhcp-server.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/ell/dhcp-server.c b/ell/dhcp-server.c
-index c983ed4..144e83e 100644
---- a/ell/dhcp-server.c
-+++ b/ell/dhcp-server.c
-@@ -24,6 +24,7 @@
- #include <config.h>
- #endif
- 
-+#include <linux/types.h>
- #include <net/ethernet.h>
- #include <sys/socket.h>
- #include <arpa/inet.h>
--- 
-2.29.2
-
diff --git a/package/ell/ell.hash b/package/ell/ell.hash
index efd39b31db..cbefd79bb8 100644
--- a/package/ell/ell.hash
+++ b/package/ell/ell.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  c2b3848568c75bcf5a0e7d1f2efce4fdb2733d28226ed21c6a6542f0be05d784  ell-0.35-br1.tar.gz
+sha256  7767306f20db41c28b3138b5323bca05fef92238b6b61f81f66c2af684a13886  ell-0.38-br1.tar.gz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/ell/ell.mk b/package/ell/ell.mk
index 8aec067bc0..18f1cf2aac 100644
--- a/package/ell/ell.mk
+++ b/package/ell/ell.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELL_VERSION = 0.35
+ELL_VERSION = 0.38
 ELL_SITE = https://git.kernel.org/pub/scm/libs/ell/ell.git
 ELL_SITE_METHOD = git
 ELL_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
