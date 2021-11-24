Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB621C433F5
	for <buildroot@archiver.kernel.org>; Wed, 24 Nov 2021 20:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65035400EF;
	Wed, 24 Nov 2021 20:59:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zcwK2DYx-Brb; Wed, 24 Nov 2021 20:59:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8335D401FB;
	Wed, 24 Nov 2021 20:59:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 468361BF286
 for <buildroot@lists.busybox.net>; Wed, 24 Nov 2021 20:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3700361BB7
 for <buildroot@lists.busybox.net>; Wed, 24 Nov 2021 20:59:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=heine.tech
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ELQdJ8DUcEhi for <buildroot@lists.busybox.net>;
 Wed, 24 Nov 2021 20:59:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 14FB260BC5
 for <buildroot@buildroot.org>; Wed, 24 Nov 2021 20:59:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 05AB5182200; Wed, 24 Nov 2021 21:59:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heine.tech; s=dkim;
 t=1637787568; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=GBz5T/O0M26LQS0Osn4zqQ4S783m8nP+IcXhLrBvYVQ=;
 b=Xm7/fbxCrHOvmjv4rcAQBnHfanRt3g2h2EltAo52C2KLRJk48ELHeVhNhoIsC8/6D663Bj
 cdLY6PRF/gc36Lvv3BRf30HMcqqIkQ2CTl+W3SSYJB1BjSz/e9BKK7e1EkZB+tl1T2biku
 OnjPctTgoW9gCplZ4A1kNF377wt/W8I=
To: buildroot@buildroot.org
Date: Wed, 24 Nov 2021 21:59:16 +0100
Message-Id: <20211124205919.25777-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.2
Subject: [Buildroot] [PATCH] package/grpc: bump version to 1.42.0
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Robert Rose <robertroyrose@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

* update patch 0001 to match changed target code

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 ...t-the-availability-of-pthread_setname_.patch | 17 ++++++++++++++++-
 package/grpc/grpc.hash                          |  2 +-
 package/grpc/grpc.mk                            |  2 +-
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/package/grpc/0001-Properly-detect-the-availability-of-pthread_setname_.patch b/package/grpc/0001-Properly-detect-the-availability-of-pthread_setname_.patch
index 32493ac1a0..92dc5a6c45 100644
--- a/package/grpc/0001-Properly-detect-the-availability-of-pthread_setname_.patch
+++ b/package/grpc/0001-Properly-detect-the-availability-of-pthread_setname_.patch
@@ -11,6 +11,14 @@ non-POSIX function in all cases.
 
 Upstream: https://github.com/grpc/grpc/pull/17610
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+
+[buildroot@heine.tech:
+  1.42.0 added new logic to handle older glibc without pthread_setname_np()
+  but is still not sufficient for all cases. So alter the patch to wrap all
+  this with our cmake based workaround.
+  See: https://github.com/grpc/grpc/pull/27540
+]
+Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
 ---
  CMakeLists.txt                            | 6 ++++++
  include/grpc/impl/codegen/port_platform.h | 2 ++
@@ -37,15 +45,22 @@ diff --git a/include/grpc/impl/codegen/port_platform.h b/include/grpc/impl/codeg
 index 4f213ff..55ecd9d 100644
 --- a/include/grpc/impl/codegen/port_platform.h
 +++ b/include/grpc/impl/codegen/port_platform.h
-@@ -168,7 +168,9 @@
+@@ -186,6 +186,7 @@
  #endif /* _LP64 */
  #ifdef __GLIBC__
  #define GPR_POSIX_CRASH_HANDLER 1
 +#if defined(HAVE_PTHREAD_SETNAME_NP)
+ #ifdef __GLIBC_PREREQ
+ #if __GLIBC_PREREQ(2, 12)
+ #define GPR_LINUX_PTHREAD_NAME 1
+@@ -194,6 +195,7 @@
+ // musl libc & others
  #define GPR_LINUX_PTHREAD_NAME 1
+ #endif
 +#endif /* HAVE_PTHREAD_SETNAME_NP */
  #include <linux/version.h>
  #else /* musl libc */
  #define GPR_MUSL_LIBC_COMPAT 1
+
 -- 
 2.26.63
diff --git a/package/grpc/grpc.hash b/package/grpc/grpc.hash
index 26d0d315d8..978d5e4fe3 100644
--- a/package/grpc/grpc.hash
+++ b/package/grpc/grpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e5fb30aae1fa1cffa4ce00aa0bbfab908c0b899fcf0bbc30e268367d660d8656  grpc-1.41.0.tar.gz
+sha256  b2f2620c762427bfeeef96a68c1924319f384e877bc0e084487601e4cc6e434c  grpc-1.42.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index 1bb4bd2b98..df23a4a3ff 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRPC_VERSION = 1.41.0
+GRPC_VERSION = 1.42.0
 GRPC_SITE = $(call github,grpc,grpc,v$(GRPC_VERSION))
 GRPC_LICENSE = Apache-2.0
 GRPC_LICENSE_FILES = LICENSE
-- 
2.34.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
