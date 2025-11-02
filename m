Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBC6CCFA02
	for <buildroot@archiver.kernel.org>; Sun,  2 Nov 2025 16:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97DFE6F592;
	Sun,  2 Nov 2025 16:05:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7mSBoVdZFvju; Sun,  2 Nov 2025 16:05:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 608736F580
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 608736F580;
	Sun,  2 Nov 2025 16:05:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AB76F222
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 16:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5E9884AF4
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 16:05:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dqSzcZ_mcVOY for <buildroot@buildroot.org>;
 Sun,  2 Nov 2025 16:05:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B516D84AF2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B516D84AF2
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 16:05:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8BAD983A20; Sun,  2 Nov 2025 16:05:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 2 Nov 2025 16:58:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 821c2ab16f42bed52baec3876c4156284186a44a
X-Git-Newrev: d5ef3c3ecbfea9104d6317204c6df9676f4e424a
X-Patchwork-Hint: ignore
Message-Id: <20251102160505.8BAD983A20@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/live555: bump version to 2025.10.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=d5ef3c3ecbfea9104d6317204c6df9676f4e424a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added -std=c++20 to enable std::atomic_flag::test which was introduced
in gcc 11.1:
https://gcc.gnu.org/onlinedocs/libstdc++/manual/status.html#status.iso.2020
(see P1135R6)

For older compilers -DNO_STD_LIB=1 can be used to enable a code path
without std::atomic_flag::test, copied from:
https://github.com/DragonFlyBSD/DeltaPorts/commit/cfc388e6a6bf011e28f0cbebaeae74d2bb516a02

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/live555/live555.hash | 6 +++---
 package/live555/live555.mk   | 9 ++++++++-
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/package/live555/live555.hash b/package/live555/live555.hash
index d4fa93d029..f0a56bda32 100644
--- a/package/live555/live555.hash
+++ b/package/live555/live555.hash
@@ -1,5 +1,5 @@
-# From http://www.live555.com/liveMedia/public/live555-latest-md5.txt
-md5  3c1992b0e9b871bcad7491a3da541781  live.2021.05.03.tar.gz
+# From http://www.live555.com/liveMedia/public/live555-latest-sha1.txt
+sha1  483146b15c5fdb973b88fc318f2772f022253563  live.2025.10.13.tar.gz
 # Locally generated
-sha256  ae73241f9cc4ab740d60737c0438d62a7635af3822de5d84acf275793de42029  live.2021.05.03.tar.gz
+sha256  44eb6ae4ae02ef68a5028d9fc8b70c45b9ba45c058f846b68bc4d32c74355f49  live.2025.10.13.tar.gz
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING.LESSER
diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index 1e1531ee53..6d12d1c17c 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIVE555_VERSION = 2021.05.03
+LIVE555_VERSION = 2025.10.13
 LIVE555_SOURCE = live.$(LIVE555_VERSION).tar.gz
 # upstream site removes older versions, use videolan.org instead
 LIVE555_SITE = https://download.videolan.org/contrib/live555
@@ -29,6 +29,13 @@ LIVE555_LIBRARY_LINK = $(TARGET_CC) -o
 LIVE555_CFLAGS += -fPIC
 endif
 
+# "struct std::atomic_flag" has no member named "test"
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_11),y)
+LIVE555_CFLAGS += -std=c++20
+else
+LIVE555_CFLAGS += -DNO_STD_LIB=1
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIVE555_DEPENDENCIES += host-pkgconf openssl
 LIVE555_CONSOLE_LIBS = `$(PKG_CONFIG_HOST_BINARY) --libs openssl`
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
