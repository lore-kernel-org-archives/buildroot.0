Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F09AC00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 19:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3359606A9;
	Tue, 26 Jul 2022 19:57:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3359606A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nxzAjy7osDxX; Tue, 26 Jul 2022 19:57:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5F16606B0;
	Tue, 26 Jul 2022 19:57:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5F16606B0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CDE851BF9B9
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 19:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6F8F6066D
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 19:57:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6F8F6066D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xA9MK10rUz2U for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 19:57:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D54AF60608
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 19:57:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D54AF60608
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6B5C285F9D; Tue, 26 Jul 2022 19:43:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 21:54:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fb51422780bf685303fbf412cc08fe38b16d9ea8
X-Git-Newrev: 70e37f806031c7bda3d49de6bf377ad3e7887e69
X-Patchwork-Hint: ignore
Message-Id: <20220726194331.6B5C285F9D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/*: use BR2_ENABLE_LTO to enable
 LTO instead of BR2_GCC_ENABLE_LTO
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

commit: https://git.buildroot.net/buildroot/commit/?id=70e37f806031c7bda3d49de6bf377ad3e7887e69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The BR2_GCC_ENABLE_LTO controls whether or not LTO is available in the
(internal) toolchain - it shouldn't be used to control whether packages
are built with LTO. Use the new BR2_ENABLE_LTO option instead.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fastd/fastd.mk         | 2 +-
 package/log4cplus/log4cplus.mk | 2 +-
 package/netdata/netdata.mk     | 2 +-
 package/rocksdb/rocksdb.mk     | 2 +-
 package/unbound/unbound.mk     | 2 +-
 package/valgrind/valgrind.mk   | 2 +-
 package/wireshark/wireshark.mk | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/fastd/fastd.mk b/package/fastd/fastd.mk
index 5cd6a909c3..6c496cf9ef 100644
--- a/package/fastd/fastd.mk
+++ b/package/fastd/fastd.mk
@@ -46,7 +46,7 @@ else
 FASTD_CONF_OPTS += -Dsystemd=disabled
 endif
 
-ifeq ($(BR2_GCC_ENABLE_LTO),y)
+ifeq ($(BR2_ENABLE_LTO),y)
 FASTD_CONF_OPTS += -Db_lto=true
 else
 FASTD_CONF_OPTS += -Db_lto=false
diff --git a/package/log4cplus/log4cplus.mk b/package/log4cplus/log4cplus.mk
index b2e9ac3ed1..2dab661654 100644
--- a/package/log4cplus/log4cplus.mk
+++ b/package/log4cplus/log4cplus.mk
@@ -11,7 +11,7 @@ LOG4CPLUS_LICENSE = Apache-2.0, BSD-2-Clause, BSD-like (threadpool)
 LOG4CPLUS_LICENSE_FILES = LICENSE
 LOG4CPLUS_INSTALL_STAGING = YES
 
-ifeq ($(BR2_GCC_ENABLE_LTO),y)
+ifeq ($(BR2_ENABLE_LTO),y)
 LOG4CPLUS_CONF_OPTS += --enable-lto
 else
 LOG4CPLUS_CONF_OPTS += --disable-lto
diff --git a/package/netdata/netdata.mk b/package/netdata/netdata.mk
index 04b146591f..9e661f4943 100644
--- a/package/netdata/netdata.mk
+++ b/package/netdata/netdata.mk
@@ -23,7 +23,7 @@ NETDATA_DEPENDENCIES = libuv util-linux zlib
 # provided by autoconf relies on wchar_t.
 NETDATA_CONF_ENV = ac_cv_prog_cc_c99=-std=gnu99
 
-ifeq ($(BR2_GCC_ENABLE_LTO),y)
+ifeq ($(BR2_ENABLE_LTO),y)
 NETDATA_CONF_OPTS += --enable-lto
 else
 NETDATA_CONF_OPTS += --disable-lto
diff --git a/package/rocksdb/rocksdb.mk b/package/rocksdb/rocksdb.mk
index c355d0012d..bed0634134 100644
--- a/package/rocksdb/rocksdb.mk
+++ b/package/rocksdb/rocksdb.mk
@@ -69,7 +69,7 @@ else
 ROCKSDB_MAKE_OPTS += ROCKSDB_DISABLE_ZSTD=1
 endif
 
-ifeq ($(BR2_GCC_ENABLE_LTO),y)
+ifeq ($(BR2_ENABLE_LTO),y)
 ROCKSDB_MAKE_OPTS += USE_LTO=1
 else
 ROCKSDB_MAKE_OPTS += USE_LTO=0
diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index 988508576b..8863d039bb 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -35,7 +35,7 @@ else
 UNBOUND_CONF_OPTS += --without-pthreads
 endif
 
-ifeq ($(BR2_GCC_ENABLE_LTO),y)
+ifeq ($(BR2_ENABLE_LTO),y)
 UNBOUND_CONF_OPTS += --enable-flto
 else
 UNBOUND_CONF_OPTS += --disable-flto
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index b4c4b8b5a2..17b131c3ec 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -52,7 +52,7 @@ VALGRIND_CONF_OPTS += \
 	--host=$(patsubst arm-%,armv7-%,$(GNU_TARGET_NAME))
 endif
 
-ifeq ($(BR2_GCC_ENABLE_LTO),y)
+ifeq ($(BR2_ENABLE_LTO),y)
 VALGRIND_CONF_OPTS += --enable-lto
 else
 VALGRIND_CONF_OPTS += --disable-lto
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 1a549f7037..e5d5e6f677 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -31,7 +31,7 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 WIRESHARK_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
 endif
 
-ifeq ($(BR2_GCC_ENABLE_LTO),y)
+ifeq ($(BR2_ENABLE_LTO),y)
 WIRESHARK_CONF_OPTS += -DENABLE_LTO=ON
 else
 WIRESHARK_CONF_OPTS += -DENABLE_LTO=OFF
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
