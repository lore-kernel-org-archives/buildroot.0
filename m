Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7E3C433F5
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 16:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB5FF60EB1;
	Fri, 13 May 2022 16:54:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a4FXTuy5IMiQ; Fri, 13 May 2022 16:54:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACE5960C1F;
	Fri, 13 May 2022 16:54:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A76E91BF86B
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 16:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A38EA60C1F
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 16:54:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q8ZxQRTSyXtL for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 16:54:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF81B60C16
 for <buildroot@buildroot.org>; Fri, 13 May 2022 16:54:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 3C3DC85DFB; Fri, 13 May 2022 16:43:33 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 13 May 2022 18:53:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 761663b6760fa79ecd195ebadb5544178c88fe4f
X-Git-Newrev: 8e02f50f1d1f4f89d9cde0b10d8b1c2c4dd3affd
X-Patchwork-Hint: ignore
Message-Id: <20220513164333.3C3DC85DFB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnetconf2: bump version to 2.1.7
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
Content-Type: multipart/mixed; boundary="===============8981043207766689283=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8981043207766689283==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=8e02f50f1d1f4f89d9cde0b10d8b1c2c4dd3affd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch that is now fixed upstream.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...-BUGFIX-netopeer2-build-fails-when-buildi.patch | 34 ----------------------
 package/libnetconf2/libnetconf2.hash               |  2 +-
 package/libnetconf2/libnetconf2.mk                 |  2 +-
 3 files changed, 2 insertions(+), 36 deletions(-)

diff --git a/package/libnetconf2/0001-libnetconf2-BUGFIX-netopeer2-build-fails-when-buildi.patch b/package/libnetconf2/0001-libnetconf2-BUGFIX-netopeer2-build-fails-when-buildi.patch
deleted file mode 100644
index c03fdc9999..0000000000
--- a/package/libnetconf2/0001-libnetconf2-BUGFIX-netopeer2-build-fails-when-buildi.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From e06f291cc36c9e9a3c9c224e23109ac6dad4eb1c Mon Sep 17 00:00:00 2001
-From: Heiko Thiery <heiko.thiery@gmail.com>
-Date: Thu, 25 Nov 2021 12:29:47 +0100
-Subject: [PATCH] libnetconf2 BUGFIX netopeer2 build fails when building with
- musl libc
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-/home/hthiery/sources/mainline/buildroot/output/host/x86_64-buildroot-linux-musl/sysroot/usr/include/libnetconf2/session_server.h:439:55: error: unknown type name ‘mode_t’
-  439 | int nc_server_endpt_set_perms(const char *endpt_name, mode_t mode, uid_t uid, gid_t gid);
-
-For musl libc the include "sys/types.h" is required.
-
-Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
----
- src/session_server.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/session_server.h b/src/session_server.h
-index 4507eea..4779119 100644
---- a/src/session_server.h
-+++ b/src/session_server.h
-@@ -19,6 +19,7 @@
- extern "C" {
- #endif
- 
-+#include <sys/types.h>
- #include <libyang/libyang.h>
- #include <stdint.h>
- 
--- 
-2.30.2
-
diff --git a/package/libnetconf2/libnetconf2.hash b/package/libnetconf2/libnetconf2.hash
index 2dee93cc4c..1d4707f44b 100644
--- a/package/libnetconf2/libnetconf2.hash
+++ b/package/libnetconf2/libnetconf2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  78ffa0bd85823abd321a1dbb09c1ead36612f2a12049638a14bb081567f86ade  libnetconf2-2.0.24.tar.gz
+sha256  3044f36c117a5eaad01482d0caffc30cb2a87c66090d3cd9c946fef85b8a2394  libnetconf2-2.1.7.tar.gz
 sha256  bd962ab457c8a8cb8faaaa36c11484680f3c9a47dbc336507817ae8935384064  LICENSE
diff --git a/package/libnetconf2/libnetconf2.mk b/package/libnetconf2/libnetconf2.mk
index ddbb99b7ed..11a1995ea1 100644
--- a/package/libnetconf2/libnetconf2.mk
+++ b/package/libnetconf2/libnetconf2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNETCONF2_VERSION = 2.0.24
+LIBNETCONF2_VERSION = 2.1.7
 LIBNETCONF2_SITE = $(call github,CESNET,libnetconf2,v$(LIBNETCONF2_VERSION))
 LIBNETCONF2_INSTALL_STAGING = YES
 LIBNETCONF2_LICENSE = BSD-3-Clause

--===============8981043207766689283==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8981043207766689283==--
