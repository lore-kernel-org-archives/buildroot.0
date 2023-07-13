Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9641EC001B0
	for <buildroot@archiver.kernel.org>; Thu, 13 Jul 2023 21:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 249EB4212B;
	Thu, 13 Jul 2023 21:50:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 249EB4212B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8yJRSP7LLdXO; Thu, 13 Jul 2023 21:50:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC5784212D;
	Thu, 13 Jul 2023 21:50:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC5784212D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1AC621BF383
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 21:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8E06405BD
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 21:50:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8E06405BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vawEPoocAuw1 for <buildroot@lists.busybox.net>;
 Thu, 13 Jul 2023 21:50:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3E10405AE
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 21:50:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3E10405AE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C039D87022; Thu, 13 Jul 2023 21:50:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 13 Jul 2023 23:40:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d5ff6b96735217228e9962a02b0aaca94cb0f589
X-Git-Newrev: c46df9de21e718a9ed6a2df2bb945c386695d3bf
X-Patchwork-Hint: ignore
Message-Id: <20230713215053.C039D87022@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/redis-plus-plus: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=c46df9de21e718a9ed6a2df2bb945c386695d3bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Redis client written in C++

This is a C++ client library for Redis.  It's based on hiredis, and is
compatible with C++ 17, C++ 14, and C++ 11.

https://github.com/sewenew/redis-plus-plus

Signed-off-by: Prabhu Sannachi <prabhu.sannachi@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                   |  3 +++
 package/Config.in                            |  1 +
 package/redis-plus-plus/Config.in            | 15 +++++++++++++++
 package/redis-plus-plus/redis-plus-plus.hash |  3 +++
 package/redis-plus-plus/redis-plus-plus.mk   | 27 +++++++++++++++++++++++++++
 5 files changed, 49 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3638e4f99c..abea0bbb86 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2420,6 +2420,9 @@ F:	package/libdvbpsi/
 F:	package/mraa/
 F:	package/synergy/
 
+N:	Prabhu Sannachi <prabhu.sannachi@collins.com>
+F:	package/redis-plus-plus/
+
 N:	Rafal Susz <rafal.susz@gmail.com>
 F:	board/avnet/s6lx9_microboard/
 F:	configs/s6lx9_microboard_defconfig
diff --git a/package/Config.in b/package/Config.in
index 3125fdf632..3a7466d575 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1539,6 +1539,7 @@ if BR2_PACKAGE_POSTGRESQL
 	source "package/postgis/Config.in"
 endif
 	source "package/redis/Config.in"
+	source "package/redis-plus-plus/Config.in"
 	source "package/rocksdb/Config.in"
 	source "package/sqlcipher/Config.in"
 	source "package/sqlite/Config.in"
diff --git a/package/redis-plus-plus/Config.in b/package/redis-plus-plus/Config.in
new file mode 100644
index 0000000000..6a21aee2b3
--- /dev/null
+++ b/package/redis-plus-plus/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_REDIS_PLUS_PLUS
+	bool "redis-plus-plus"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_HIREDIS
+	help
+	  Redis client written in C++
+
+	  This is a C++ client library for Redis.
+	  It's based on hiredis, and is compatible
+	  with C++ 17, C++ 14, and C++ 11.
+
+	  https://github.com/sewenew/redis-plus-plus
+
+comment "redis-plus-plus needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/redis-plus-plus/redis-plus-plus.hash b/package/redis-plus-plus/redis-plus-plus.hash
new file mode 100644
index 0000000000..93e58e2535
--- /dev/null
+++ b/package/redis-plus-plus/redis-plus-plus.hash
@@ -0,0 +1,3 @@
+# Locally calculated:
+sha256  a49a72fef26ed39d36a278fcc4e4d92822e111697b5992d8f26f70d16edc6c1f  redis-plus-plus-1.3.5.tar.gz
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/redis-plus-plus/redis-plus-plus.mk b/package/redis-plus-plus/redis-plus-plus.mk
new file mode 100644
index 0000000000..ea0e182748
--- /dev/null
+++ b/package/redis-plus-plus/redis-plus-plus.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# redis-plus-plus
+#
+################################################################################
+
+REDIS_PLUS_PLUS_VERSION = 1.3.5
+REDIS_PLUS_PLUS_SITE = $(call github,sewenew,redis-plus-plus,$(REDIS_PLUS_PLUS_VERSION))
+REDIS_PLUS_PLUS_LICENSE = Apache-2.0
+REDIS_PLUS_PLUS_LICENSE_FILES = LICENSE
+REDIS_PLUS_PLUS_INSTALL_STAGING = YES
+REDIS_PLUS_PLUS_DEPENDENCIES = hiredis
+
+REDIS_PLUS_PLUS_CONF_OPTS = \
+	-DREDIS_PLUS_PLUS_BUILD_TEST=OFF
+
+# since version 1.3.0, by default, redis-plus-plus is built with the
+# -std=c++17 standard
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),)
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_5),y)
+REDIS_PLUS_PLUS_CONF_OPTS += -DREDIS_PLUS_PLUS_CXX_STANDARD=14
+else
+REDIS_PLUS_PLUS_CONF_OPTS += -DREDIS_PLUS_PLUS_CXX_STANDARD=11
+endif
+endif
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
