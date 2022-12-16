Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89028C4332F
	for <buildroot@archiver.kernel.org>; Fri, 16 Dec 2022 14:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15DB3404EB;
	Fri, 16 Dec 2022 14:22:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15DB3404EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wVcsrVmK9erc; Fri, 16 Dec 2022 14:22:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5EBA6404CF;
	Fri, 16 Dec 2022 14:22:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EBA6404CF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E7CE61BF973
 for <buildroot@lists.busybox.net>; Fri, 16 Dec 2022 14:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C363C82120
 for <buildroot@lists.busybox.net>; Fri, 16 Dec 2022 14:22:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C363C82120
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zB_8w3PgAKUL for <buildroot@lists.busybox.net>;
 Fri, 16 Dec 2022 14:22:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC3968211B
 for <buildroot@buildroot.org>; Fri, 16 Dec 2022 14:22:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC3968211B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CA97E8677A; Fri, 16 Dec 2022 14:22:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Dec 2022 15:17:02 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 137a8dbee0599cb1bd7c9d7bf596f0e8bac7d9bd
X-Git-Newrev: d937041b8f541a5943125e1e94b4697a09e2ff13
X-Patchwork-Hint: ignore
Message-Id: <20221216142239.CA97E8677A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/botan: bump to
 version 2.19.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=d937041b8f541a5943125e1e94b4697a09e2ff13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Drop openssl dependency: "The OpenSSL provider was incompatible with
OpenSSL 3.0. It has been removed"

https://github.com/randombit/botan/blob/2.19.2/news.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 72ac45aceab38ec128f029756c4151e9d9325585)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
index f56eebbb29..b0ebe594b1 100644
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
@@ -62,11 +62,6 @@ BOTAN_DEPENDENCIES += bzip2
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
