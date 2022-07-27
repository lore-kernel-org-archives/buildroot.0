Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 992ADC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 14:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26409402C6;
	Wed, 27 Jul 2022 14:48:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26409402C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UGvDPmLK9qHU; Wed, 27 Jul 2022 14:48:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCAE04027C;
	Wed, 27 Jul 2022 14:48:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCAE04027C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 221831C1162
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 14:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E49AA41557
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 14:46:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E49AA41557
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lJm_Uqcx8U_O for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 14:46:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC66141513
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 14:46:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC66141513
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 80A4786692; Wed, 27 Jul 2022 14:32:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 16:44:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ff59cbf5362d5dc8e6131999a48ef08b7256a9ee
X-Git-Newrev: 72ac45aceab38ec128f029756c4151e9d9325585
X-Patchwork-Hint: ignore
Message-Id: <20220727143225.80A4786692@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/botan: bump to version 2.19.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=72ac45aceab38ec128f029756c4151e9d9325585
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop openssl dependency: "The OpenSSL provider was incompatible with
OpenSSL 3.0. It has been removed"

https://github.com/randombit/botan/blob/2.19.2/news.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/botan/Config.in  | 2 --
 package/botan/botan.hash | 2 +-
 package/botan/botan.mk   | 7 +------
 3 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/package/botan/Config.in b/package/botan/Config.in
index 635fe1836d..8f7f3f5c7a 100644
--- a/package/botan/Config.in
+++ b/package/botan/Config.in
@@ -20,8 +20,6 @@ config BR2_PACKAGE_BOTAN
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
 	select BR2_PACKAGE_BOOST_FILESYSTEM if BR2_PACKAGE_BOOST && BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	select BR2_PACKAGE_BOOST_SYSTEM if BR2_PACKAGE_BOOST && BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
-	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4 if BR2_PACKAGE_LIBOPENSSL
-	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 if BR2_PACKAGE_LIBOPENSSL
 	help
 	  Botan is a crypto library for C++
 
diff --git a/package/botan/botan.hash b/package/botan/botan.hash
index 2729cb493f..d768c669ea 100644
--- a/package/botan/botan.hash
+++ b/package/botan/botan.hash
@@ -1,4 +1,4 @@
 # From https://botan.randombit.net/releases/sha256sums.txt
-sha256  e26e00cfefda64082afdd540d3c537924f645d6a674afed2cd171005deff5560  Botan-2.19.1.tar.xz
+sha256  3af5f17615c6b5cd8b832d269fb6cb4d54ec64f9eb09ddbf1add5093941b4d75  Botan-2.19.2.tar.xz
 # Locally computed
 sha256  472faf6d2231130382779f96de506be19296473750356449fc426ddc9cb03b50  license.txt
diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 6095844b14..b26ee4c66e 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOTAN_VERSION = 2.19.1
+BOTAN_VERSION = 2.19.2
 BOTAN_SOURCE = Botan-$(BOTAN_VERSION).tar.xz
 BOTAN_SITE = http://botan.randombit.net/releases
 BOTAN_LICENSE = BSD-2-Clause
@@ -61,11 +61,6 @@ BOTAN_DEPENDENCIES += bzip2
 BOTAN_CONF_OPTS += --with-bzip2
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-BOTAN_DEPENDENCIES += openssl
-BOTAN_CONF_OPTS += --with-openssl
-endif
-
 ifeq ($(BR2_PACKAGE_SQLITE),y)
 BOTAN_DEPENDENCIES += sqlite
 BOTAN_CONF_OPTS += --with-sqlite
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
