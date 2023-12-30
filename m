Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F5CCC46CD2
	for <buildroot@archiver.kernel.org>; Sat, 30 Dec 2023 17:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB35D60797;
	Sat, 30 Dec 2023 17:50:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB35D60797
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4dlyRQBH5_1s; Sat, 30 Dec 2023 17:50:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E91C60A67;
	Sat, 30 Dec 2023 17:50:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E91C60A67
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1A7801BF40B
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 17:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF701415CB
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 17:50:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF701415CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZAh5X3UicfWD for <buildroot@lists.busybox.net>;
 Sat, 30 Dec 2023 17:50:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E339A41583
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 17:50:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E339A41583
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D102783910; Sat, 30 Dec 2023 17:50:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 Dec 2023 18:49:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2d61c7dba8d016d91b1fe1c33bcaae8b161de46f
X-Git-Newrev: 699888a49ba14873408bc6dbb34f56d2c29c3692
X-Patchwork-Hint: ignore
Message-Id: <20231230175053.D102783910@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libhttpserver: bump to version
 0.19.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=699888a49ba14873408bc6dbb34f56d2c29c3692
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

C++17 is mandatory since
https://github.com/etr/libhttpserver/commit/17772843eac42bbd15e13659f96596d59e622872

https://github.com/etr/libhttpserver/releases/tag/0.19.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libhttpserver/Config.in          | 6 +++---
 package/libhttpserver/libhttpserver.hash | 2 +-
 package/libhttpserver/libhttpserver.mk   | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libhttpserver/Config.in b/package/libhttpserver/Config.in
index dcdf30566d..3120059a08 100644
--- a/package/libhttpserver/Config.in
+++ b/package/libhttpserver/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBHTTPSERVER
 	bool "libhttpserver"
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++11 PR59526
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBMICROHTTPD
@@ -12,6 +12,6 @@ config BR2_PACKAGE_LIBHTTPSERVER
 
 	  https://github.com/etr/libhttpserver
 
-comment "libhttpserver needs a toolchain w/ C++, threads, gcc >= 5"
+comment "libhttpserver needs a toolchain w/ C++, threads, gcc >= 7"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
diff --git a/package/libhttpserver/libhttpserver.hash b/package/libhttpserver/libhttpserver.hash
index 19ad63bde2..03ebdc4a76 100644
--- a/package/libhttpserver/libhttpserver.hash
+++ b/package/libhttpserver/libhttpserver.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  1dfe548ac2add77fcb6c05bd00222c55650ffd02b209f4e3f133a6e3eb29c89d  libhttpserver-0.18.2.tar.gz
+sha256  b108769ed68d72c58961c517ab16c3a64e4efdc4c45687723bb45bb9e04c5193  libhttpserver-0.19.0.tar.gz
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING.LESSER
diff --git a/package/libhttpserver/libhttpserver.mk b/package/libhttpserver/libhttpserver.mk
index bd3ecbd416..54774e763b 100644
--- a/package/libhttpserver/libhttpserver.mk
+++ b/package/libhttpserver/libhttpserver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHTTPSERVER_VERSION = 0.18.2
+LIBHTTPSERVER_VERSION = 0.19.0
 LIBHTTPSERVER_SITE = $(call github,etr,libhttpserver,$(LIBHTTPSERVER_VERSION))
 LIBHTTPSERVER_LICENSE = LGPL-2.1+
 LIBHTTPSERVER_LICENSE_FILES = COPYING.LESSER
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
