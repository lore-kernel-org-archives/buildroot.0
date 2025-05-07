Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A7CC3ABBF
	for <buildroot@archiver.kernel.org>; Wed,  7 May 2025 16:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E16E660E93;
	Wed,  7 May 2025 16:40:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rd9t4tqA1PlY; Wed,  7 May 2025 16:40:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3CB361004
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3CB361004;
	Wed,  7 May 2025 16:40:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C4B81EDF
 for <buildroot@buildroot.org>; Wed,  7 May 2025 16:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5CE140C7D
 for <buildroot@buildroot.org>; Wed,  7 May 2025 16:40:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VDt3hs96Vg0K for <buildroot@buildroot.org>;
 Wed,  7 May 2025 16:40:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECF0140C70
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECF0140C70
 for <buildroot@buildroot.org>; Wed,  7 May 2025 16:40:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D723E864FC; Wed,  7 May 2025 16:40:22 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 7 May 2025 18:30:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b8134a1195f5111d80cfa67104fca847f0881e63
X-Git-Newrev: da69e45341226510359f0563dd459c6e0b8f2e63
X-Patchwork-Hint: ignore
Message-Id: <20250507164022.D723E864FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/redis: bump to v8.0.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=da69e45341226510359f0563dd459c6e0b8f2e63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since 8.0.0, Redis now uses the fastfloat library as a bundled
dependency, and this library is written in C++ (even though the
rest of Redis is in plain C).

Therefore, we now require a toolchain with C++ support.

From https://github.com/redis/redis/blob/8.0.0/00-RELEASENOTES:

=======================================================
8.0 GA (v8.0.0)    Released Fri 2 May 2025 12:00:00 IST
=======================================================

This is the General Availability release of Redis Open Source 8.0.

Redis 8.0 deprecates previous Redis and Redis Stack versions.

Stand alone RediSearch, RedisJSON, RedisTimeSeries, and RedisBloom are no longer needed as they are now part of Redis.

- Name change: Redis Community Edition is now Redis Open Source
- License change: licensed under your choice of
  - (a) the Redis Source Available License 2.0 (RSALv2); or
  - (b) the Server Side Public License v1 (SSPLv1); or
  - (c) the GNU Affero General Public License (AGPLv3)
- Redis Query engine and 8 new data structures are now an integral part of Redis 8
  - (1) Redis Query Engine, which now supports both horizontal and vertical scaling for search, query and vector workloads
  - (2) JSON - a queryable JSON document
  - (3) Time series
  - (4-8) Five probabilistic data structures: Bloom filter, Cuckoo filter, Count-min sketch, Top-k, and t-digest
  - (9) Vector set [beta] - a data structure designed for Vector Similarity Search, inspired by Sorted set
  - These nine components are included in all binary distributions

  - See instructions in the README.md file on how to build from source with all these components
  - New configuration file: redis-full.conf - loads Redis with all these components,
    and contains new configuration parameters for Redis Query engine and the new data structures
  - New ACL categories: @search, @json, @timeseries, @bloom, @cuckoo, @cms, @topk, @tdigest
  - Commands are also included in the existing ACL categories (@read, @write, etc.)

- More than 30 performance and resource utilization improvements
- A new I/O threading implementation which enables throughput increase on multi-core environments
  (set with `io-threads` configuration parameter)
- An improved replication mechanism which is more performant and robust
- New hash commands - `HGETDEL`, `HGETEX`, `HSETEX`

For more details, see the release notes of 8.0-M01, 8.0-M02, 8.0-M03,8.0-M04, and 8.0-RC1

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/redis/Config.in  | 5 +++--
 package/redis/redis.hash | 4 ++--
 package/redis/redis.mk   | 8 +++++---
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/package/redis/Config.in b/package/redis/Config.in
index a2239b4a54..ed11ce8c2e 100644
--- a/package/redis/Config.in
+++ b/package/redis/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_REDIS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # _Atomic keyword
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthread_setname_np()
+	depends on BR2_INSTALL_LIBSTDCPP # fastfloat bundled dep is in C++
 	help
 	  Redis is an open source (BSD licensed), in-memory data
 	  structure store, used as a database, cache and message
@@ -15,8 +16,8 @@ config BR2_PACKAGE_REDIS
 
 	  http://www.redis.io
 
-comment "redis needs a toolchain w/ gcc>=4.9, dynamic library, nptl"
+comment "redis needs a toolchain w/ gcc>=4.9, dynamic library, nptl, C++"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index e01fc6a601..13845bd7a2 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  72c081e3b8cfae7144273d26d76736f08319000af46c01515cad5d29765cead5  redis-7.2.7.tar.gz
+sha256  cf395665ba5fcecc4ef7aed1d8ab19c268619d98595827565c82344160171262  redis-8.0.0.tar.gz
 
 # Locally calculated
-sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
+sha256  a797fcaa899397001f7fb0097583db96bcc74e9b0606c95435d8a293d84cdb76  LICENSE.txt
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 7eb30abc4c..7ef4401123 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,10 +4,12 @@
 #
 ################################################################################
 
-REDIS_VERSION = 7.2.7
+REDIS_VERSION = 8.0.0
 REDIS_SITE = http://download.redis.io/releases
-REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
-REDIS_LICENSE_FILES = COPYING
+REDIS_LICENSE = \
+	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
+	MIT and BSD family licenses (Bundled components)
+REDIS_LICENSE_FILES = LICENSE.txt
 REDIS_CPE_ID_VENDOR = redislabs
 REDIS_SELINUX_MODULES = redis
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
