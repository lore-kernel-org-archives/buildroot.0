Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB71C6FA8B
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 20:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AFA361085;
	Wed, 21 Sep 2022 20:23:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AFA361085
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jgFy1l6dLwxA; Wed, 21 Sep 2022 20:23:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83C2061076;
	Wed, 21 Sep 2022 20:23:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83C2061076
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 178451BF34B
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6914416BC
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:22:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6914416BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tLvm_m_niDpi for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 20:22:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9183D415E1
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 20:22:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9183D415E1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7C84A85D43; Wed, 21 Sep 2022 20:22:40 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 21 Sep 2022 22:19:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a9ee25b01b741ad4f68575974c89c65146ab87f2
X-Git-Newrev: 2ee3c844dbbfb1771d82727a1b5d8fda21b6472d
X-Patchwork-Hint: ignore
Message-Id: <20220921202240.7C84A85D43@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/i2pd: bump to version 2.43.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=2ee3c844dbbfb1771d82727a1b5d8fda21b6472d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version)

https://github.com/PurpleI2P/i2pd/releases/tag/2.43.0
https://github.com/PurpleI2P/i2pd/releases/tag/2.42.1
https://github.com/PurpleI2P/i2pd/releases/tag/2.42.0
https://github.com/PurpleI2P/i2pd/releases/tag/2.41.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...libi2pd-Fix-the-build-with-LibreSSL-3-5-2.patch | 27 ----------------------
 package/i2pd/i2pd.hash                             |  4 ++--
 package/i2pd/i2pd.mk                               |  2 +-
 3 files changed, 3 insertions(+), 30 deletions(-)

diff --git a/package/i2pd/0001-libi2pd-Fix-the-build-with-LibreSSL-3-5-2.patch b/package/i2pd/0001-libi2pd-Fix-the-build-with-LibreSSL-3-5-2.patch
deleted file mode 100644
index e9f905b7ee..0000000000
--- a/package/i2pd/0001-libi2pd-Fix-the-build-with-LibreSSL-3-5-2.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 0a1e302e8a242bbd1d39556e5ef05aced1b3b504 Mon Sep 17 00:00:00 2001
-From: orbea <orbea@riseup.net>
-Date: Sun, 8 May 2022 22:50:44 -0700
-Subject: [PATCH] libi2pd: Fix the build with LibreSSL 3.5.2
-
-[Retrieved from:
-https://github.com/PurpleI2P/i2pd/commit/0a1e302e8a242bbd1d39556e5ef05aced1b3b504]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- libi2pd/Crypto.h | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/libi2pd/Crypto.h b/libi2pd/Crypto.h
-index b02778141..726bd0a1e 100644
---- a/libi2pd/Crypto.h
-+++ b/libi2pd/Crypto.h
-@@ -29,7 +29,9 @@
- #include "CPU.h"
- 
- // recognize openssl version and features
--#if ((OPENSSL_VERSION_NUMBER < 0x010100000) || defined(LIBRESSL_VERSION_NUMBER)) // 1.0.2 and below or LibreSSL
-+#if (defined(LIBRESSL_VERSION_NUMBER) && (LIBRESSL_VERSION_NUMBER >= 0x3050200fL)) // LibreSSL 3.5.2 and above
-+#   define LEGACY_OPENSSL 0
-+#elif ((OPENSSL_VERSION_NUMBER < 0x010100000) || defined(LIBRESSL_VERSION_NUMBER)) // 1.0.2 and below or LibreSSL
- #   define LEGACY_OPENSSL 1
- #   define X509_getm_notBefore X509_get_notBefore
- #   define X509_getm_notAfter X509_get_notAfter
diff --git a/package/i2pd/i2pd.hash b/package/i2pd/i2pd.hash
index 99c474a2e5..98c0db243d 100644
--- a/package/i2pd/i2pd.hash
+++ b/package/i2pd/i2pd.hash
@@ -1,4 +1,4 @@
-# From https://github.com/PurpleI2P/i2pd/releases/download/2.40.0/SHA512SUMS
-sha512  58d10417f3fd2c2fb427fb88b30ccd3e03053c84aa7ac6d3e346c388f2376d1768846bec5ee8d5134dd62d5712b20f890af11083634f94095b1117f6494c25fd  i2pd-2.40.0.tar.gz
+# From https://github.com/PurpleI2P/i2pd/releases/download/2.43.0/SHA512SUMS
+sha512  7247850cd47cccc540346b4a1becc6dba5f40bcb333cd722e9fc59fd8b0beddee700376829d29add05cea6b84bb34303ed37e01914a1a41cf8cd94fe5c826e4a  i2pd-2.43.0.tar.gz
 # Locally computed:
 sha256  9c87aff490b272254d716475e3c4973f5f64af1d18f9f6962c1e61e252e1ad9a  LICENSE
diff --git a/package/i2pd/i2pd.mk b/package/i2pd/i2pd.mk
index 2b5c6a1f54..b99212be47 100644
--- a/package/i2pd/i2pd.mk
+++ b/package/i2pd/i2pd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-I2PD_VERSION = 2.40.0
+I2PD_VERSION = 2.43.0
 I2PD_SITE = $(call github,PurpleI2P,i2pd,$(I2PD_VERSION))
 I2PD_LICENSE = BSD-3-Clause
 I2PD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
