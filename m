Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C82CC433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07CE641C64;
	Mon,  6 Dec 2021 18:42:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1F8eudhyWd4M; Mon,  6 Dec 2021 18:42:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6823C41C56;
	Mon,  6 Dec 2021 18:42:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 101811BF3F2
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD65841C31
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tEJHFBWhLplV for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0805741C72
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9465381503; Mon,  6 Dec 2021 18:07:42 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 22:56:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2a3edc5e00b38f4f927894d0911990c9060e4415
X-Git-Newrev: 721f05420cb5908aa19eef47f96418aa6cd04398
X-Patchwork-Hint: ignore
Message-Id: <20211206180742.9465381503@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnetconf2: bump version to 2.0.24
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
Content-Type: multipart/mixed; boundary="===============6816073771015475343=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6816073771015475343==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=721f05420cb5908aa19eef47f96418aa6cd04398
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-BUGFIX-netopeer2-build-fails-when-buildi.patch | 34 ++++++++++++++++++++++
 package/libnetconf2/libnetconf2.hash               |  2 +-
 package/libnetconf2/libnetconf2.mk                 |  2 +-
 3 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/package/libnetconf2/0001-libnetconf2-BUGFIX-netopeer2-build-fails-when-buildi.patch b/package/libnetconf2/0001-libnetconf2-BUGFIX-netopeer2-build-fails-when-buildi.patch
new file mode 100644
index 0000000000..c03fdc9999
--- /dev/null
+++ b/package/libnetconf2/0001-libnetconf2-BUGFIX-netopeer2-build-fails-when-buildi.patch
@@ -0,0 +1,34 @@
+From e06f291cc36c9e9a3c9c224e23109ac6dad4eb1c Mon Sep 17 00:00:00 2001
+From: Heiko Thiery <heiko.thiery@gmail.com>
+Date: Thu, 25 Nov 2021 12:29:47 +0100
+Subject: [PATCH] libnetconf2 BUGFIX netopeer2 build fails when building with
+ musl libc
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+/home/hthiery/sources/mainline/buildroot/output/host/x86_64-buildroot-linux-musl/sysroot/usr/include/libnetconf2/session_server.h:439:55: error: unknown type name ‘mode_t’
+  439 | int nc_server_endpt_set_perms(const char *endpt_name, mode_t mode, uid_t uid, gid_t gid);
+
+For musl libc the include "sys/types.h" is required.
+
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+---
+ src/session_server.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/session_server.h b/src/session_server.h
+index 4507eea..4779119 100644
+--- a/src/session_server.h
++++ b/src/session_server.h
+@@ -19,6 +19,7 @@
+ extern "C" {
+ #endif
+ 
++#include <sys/types.h>
+ #include <libyang/libyang.h>
+ #include <stdint.h>
+ 
+-- 
+2.30.2
+
diff --git a/package/libnetconf2/libnetconf2.hash b/package/libnetconf2/libnetconf2.hash
index 24cc3a5557..2dee93cc4c 100644
--- a/package/libnetconf2/libnetconf2.hash
+++ b/package/libnetconf2/libnetconf2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  66139fc9e68aa89c82235f4135dba9e44f5db663541279c14c74131e22b7f571  libnetconf2-1.1.43.tar.gz
+sha256  78ffa0bd85823abd321a1dbb09c1ead36612f2a12049638a14bb081567f86ade  libnetconf2-2.0.24.tar.gz
 sha256  bd962ab457c8a8cb8faaaa36c11484680f3c9a47dbc336507817ae8935384064  LICENSE
diff --git a/package/libnetconf2/libnetconf2.mk b/package/libnetconf2/libnetconf2.mk
index 40fa935bb1..33e1fadf76 100644
--- a/package/libnetconf2/libnetconf2.mk
+++ b/package/libnetconf2/libnetconf2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNETCONF2_VERSION = 1.1.43
+LIBNETCONF2_VERSION = 2.0.24
 LIBNETCONF2_SITE = $(call github,CESNET,libnetconf2,v$(LIBNETCONF2_VERSION))
 LIBNETCONF2_INSTALL_STAGING = YES
 LIBNETCONF2_LICENSE = BSD-3-Clause

--===============6816073771015475343==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6816073771015475343==--
