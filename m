Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5D6C433F5
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 10:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37C8D428AD;
	Wed, 12 Jan 2022 10:37:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wqOOg5NZg_yA; Wed, 12 Jan 2022 10:37:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AF4C415FD;
	Wed, 12 Jan 2022 10:37:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 502BE1BF831
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 10:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DF646FB8B
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 10:37:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c_UD2yjhrUWN for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 10:37:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65CE46FB89
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 10:37:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4B7238349D; Wed, 12 Jan 2022 10:30:44 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 12 Jan 2022 11:36:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e1bbe25437f3120a26067e6f08e4258510f644a9
X-Git-Newrev: 4317b1f9f21eda6d01c10da1ed15a2d87cfc666c
X-Patchwork-Hint: ignore
Message-Id: <20220112103044.4B7238349D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/snappy: bump to version 1.1.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=4317b1f9f21eda6d01c10da1ed15a2d87cfc666c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Disable benchmarks through option added by
  https://github.com/google/snappy/commit/4ebd8b2f23dd4ab67ca695256a128cd796d39ce6
- Update indentation in hash file (two spaces)

https://github.com/google/snappy/releases/tag/1.1.9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...nline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch | 71 ++++++++++++++++++++++
 package/snappy/snappy.hash                         |  4 +-
 package/snappy/snappy.mk                           |  4 +-
 3 files changed, 75 insertions(+), 4 deletions(-)

diff --git a/package/snappy/0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch b/package/snappy/0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch
new file mode 100644
index 0000000000..bd2ef07794
--- /dev/null
+++ b/package/snappy/0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch
@@ -0,0 +1,71 @@
+From 0c716d435abe65250100c2caea0e5126ac4e14bd Mon Sep 17 00:00:00 2001
+From: "Georgi D. Sotirov" <gdsotirov@gmail.com>
+Date: Wed, 5 May 2021 14:16:46 +0300
+Subject: [PATCH] Add inline with SNAPPY_ATTRIBUTE_ALWAYS_INLINE
+
+Add inline with SNAPPY_ATTRIBUTE_ALWAYS_INLINE on AdvanceToNextTag to
+fix the following compilation errors and a warning with GCC:
+
+[  2%] Building CXX object CMakeFiles/snappy.dir/snappy.cc.o
+/usr/bin/c++   -DHAVE_CONFIG_H -Dsnappy_EXPORTS
+-I/tmp/snappy-1.1.9/build -I/tmp/snappy-1.1.9  -O3
+-march=i586 -mtune=i686 -Wall -Wextra -fno-exceptions -fno-rtti -O3
+-DNDEBUG -fPIC   -std=c++11 -o CMakeFiles/snappy.dir/snappy.cc.o -c
+/tmp/snappy-1.1.9/snappy.cc
+/tmp/snappy-1.1.9/snappy.cc:1017:8: warning: always_inline
+function might not be inlinable [-Wattributes]
+ size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
+        ^
+/tmp/snappy-1.1.9/snappy.cc: In function 'std::pair<const
+unsigned char*, int> snappy::DecompressBranchless(const uint8_t*, const
+uint8_t*, ptrdiff_t, T, ptrdiff_t) [with T = char*; uint8_t = unsigned
+char; ptrdiff_t = int]':
+/tmp/snappy-1.1.9/snappy.cc:1017:8: error: inlining failed in
+call to always_inline 'size_t snappy::AdvanceToNextTag(const uint8_t**,
+size_t*)': function body can be overwritten at link time
+/tmp/snappy-1.1.9/snappy.cc:1097:53: error: called from here
+         size_t tag_type = AdvanceToNextTag(&ip, &tag);
+                                                     ^
+/tmp/snappy-1.1.9/snappy.cc:1017:8: error: inlining failed in
+call to always_inline 'size_t snappy::AdvanceToNextTag(const uint8_t**,
+size_t*)': function body can be overwritten at link time
+ size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
+        ^
+/tmp/snappy-1.1.9/snappy.cc:1097:53: error: called from here
+         size_t tag_type = AdvanceToNextTag(&ip, &tag);
+                                                     ^
+/tmp/snappy-1.1.9/snappy.cc:1017:8: error: inlining failed in
+call to always_inline 'size_t snappy::AdvanceToNextTag(const uint8_t**,
+size_t*)': function body can be overwritten at link time
+ size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
+        ^
+/tmp/snappy-1.1.9/snappy.cc:1097:53: error: called from here
+         size_t tag_type = AdvanceToNextTag(&ip, &tag);
+                                                     ^
+CMakeFiles/snappy.dir/build.make:137: recipe for target
+'CMakeFiles/snappy.dir/snappy.cc.o' failed
+
+Just like with other functions using SNAPPY_ATTRIBUTE_ALWAYS_INLINE
+macro (i.e. __attribute__((always_inline)) ) it is necessary to use C++
+inline specifier.
+
+[Retrieved from:
+https://github.com/google/snappy/pull/128/commits/0c716d435abe65250100c2caea0e5126ac4e14bd]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ snappy.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/snappy.cc b/snappy.cc
+index 79dc0e8d..51157be2 100644
+--- a/snappy.cc
++++ b/snappy.cc
+@@ -1014,7 +1014,7 @@ void MemMove(ptrdiff_t dst, const void* src, size_t size) {
+ }
+ 
+ SNAPPY_ATTRIBUTE_ALWAYS_INLINE
+-size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
++inline size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
+   const uint8_t*& ip = *ip_p;
+   // This section is crucial for the throughput of the decompression loop.
+   // The latency of an iteration is fundamentally constrained by the
diff --git a/package/snappy/snappy.hash b/package/snappy/snappy.hash
index c08c5b7fe4..b49b0e7e3b 100644
--- a/package/snappy/snappy.hash
+++ b/package/snappy/snappy.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 16b677f07832a612b0836178db7f374e414f94657c138e6993cbfc5dcc58651f  snappy-1.1.8.tar.gz
-sha256 55172044f7e241207117448a4d9d6ba1d0925c8ad66b5d4c08c70adfa9cc3de6  COPYING
+sha256  75c1fbb3d618dd3a0483bff0e26d0a92b495bbe5059c8b4f1c962b478b6e06e7  snappy-1.1.9.tar.gz
+sha256  55172044f7e241207117448a4d9d6ba1d0925c8ad66b5d4c08c70adfa9cc3de6  COPYING
diff --git a/package/snappy/snappy.mk b/package/snappy/snappy.mk
index e1fa28fbce..d31dcdd5fe 100644
--- a/package/snappy/snappy.mk
+++ b/package/snappy/snappy.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-SNAPPY_VERSION = 1.1.8
+SNAPPY_VERSION = 1.1.9
 SNAPPY_SITE = $(call github,google,snappy,$(SNAPPY_VERSION))
 SNAPPY_LICENSE = BSD-3-Clause
 SNAPPY_LICENSE_FILES = COPYING
 SNAPPY_CPE_ID_VENDOR = google
 SNAPPY_INSTALL_STAGING = YES
-SNAPPY_CONF_OPTS = -DSNAPPY_BUILD_TESTS=OFF
+SNAPPY_CONF_OPTS = -DSNAPPY_BUILD_BENCHMARKS=OFF -DSNAPPY_BUILD_TESTS=OFF
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
