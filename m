Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91715E82CC8
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 19:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F38B409C3;
	Wed, 27 Sep 2023 19:17:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F38B409C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9CWJOZMBWw_L; Wed, 27 Sep 2023 19:17:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F1C7428EA;
	Wed, 27 Sep 2023 19:17:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F1C7428EA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DF5ED1BF990
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 19:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B90B86113C
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 19:17:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B90B86113C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kvoysE9B_wmg for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 19:16:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A13F660AB3
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 19:16:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A13F660AB3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E5DE82763; Wed, 27 Sep 2023 19:16:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 21:11:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 197d0a4cb26d1fca3b7efaf1682a36aaaec253a2
X-Git-Newrev: 7aa5e8f84fa47259db3b4f66edb452a94e8eca1e
X-Patchwork-Hint: ignore
Message-Id: <20230927191659.8E5DE82763@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/snappy: bump to version 1.1.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=7aa5e8f84fa47259db3b4f66edb452a94e8eca1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version)

https://github.com/google/snappy/blob/1.1.10/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |  1 -
 ...nline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch | 71 ----------------------
 package/snappy/snappy.hash                         |  2 +-
 package/snappy/snappy.mk                           |  2 +-
 4 files changed, 2 insertions(+), 74 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 1040dba905..2e24f4c27c 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1319,7 +1319,6 @@ package/smcroute/S41smcroute Indent NotExecutable Variables
 package/smstools3/0001-fix-Makefile.patch Upstream
 package/smstools3/0002-fix-build-with-gcc-10.x.patch Upstream
 package/smstools3/S50smsd Shellcheck Variables
-package/snappy/0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch Upstream
 package/snmppp/0001-fix-build-without-v3.patch Upstream
 package/snort/0001-configure.in-Avoid-path-poisoning-with-libpcap.patch Upstream
 package/snort/0002-configure.in-Allow-to-override-the-INADDR_NONE-check.patch Upstream
diff --git a/package/snappy/0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch b/package/snappy/0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch
deleted file mode 100644
index bd2ef07794..0000000000
--- a/package/snappy/0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 0c716d435abe65250100c2caea0e5126ac4e14bd Mon Sep 17 00:00:00 2001
-From: "Georgi D. Sotirov" <gdsotirov@gmail.com>
-Date: Wed, 5 May 2021 14:16:46 +0300
-Subject: [PATCH] Add inline with SNAPPY_ATTRIBUTE_ALWAYS_INLINE
-
-Add inline with SNAPPY_ATTRIBUTE_ALWAYS_INLINE on AdvanceToNextTag to
-fix the following compilation errors and a warning with GCC:
-
-[  2%] Building CXX object CMakeFiles/snappy.dir/snappy.cc.o
-/usr/bin/c++   -DHAVE_CONFIG_H -Dsnappy_EXPORTS
--I/tmp/snappy-1.1.9/build -I/tmp/snappy-1.1.9  -O3
--march=i586 -mtune=i686 -Wall -Wextra -fno-exceptions -fno-rtti -O3
--DNDEBUG -fPIC   -std=c++11 -o CMakeFiles/snappy.dir/snappy.cc.o -c
-/tmp/snappy-1.1.9/snappy.cc
-/tmp/snappy-1.1.9/snappy.cc:1017:8: warning: always_inline
-function might not be inlinable [-Wattributes]
- size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
-        ^
-/tmp/snappy-1.1.9/snappy.cc: In function 'std::pair<const
-unsigned char*, int> snappy::DecompressBranchless(const uint8_t*, const
-uint8_t*, ptrdiff_t, T, ptrdiff_t) [with T = char*; uint8_t = unsigned
-char; ptrdiff_t = int]':
-/tmp/snappy-1.1.9/snappy.cc:1017:8: error: inlining failed in
-call to always_inline 'size_t snappy::AdvanceToNextTag(const uint8_t**,
-size_t*)': function body can be overwritten at link time
-/tmp/snappy-1.1.9/snappy.cc:1097:53: error: called from here
-         size_t tag_type = AdvanceToNextTag(&ip, &tag);
-                                                     ^
-/tmp/snappy-1.1.9/snappy.cc:1017:8: error: inlining failed in
-call to always_inline 'size_t snappy::AdvanceToNextTag(const uint8_t**,
-size_t*)': function body can be overwritten at link time
- size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
-        ^
-/tmp/snappy-1.1.9/snappy.cc:1097:53: error: called from here
-         size_t tag_type = AdvanceToNextTag(&ip, &tag);
-                                                     ^
-/tmp/snappy-1.1.9/snappy.cc:1017:8: error: inlining failed in
-call to always_inline 'size_t snappy::AdvanceToNextTag(const uint8_t**,
-size_t*)': function body can be overwritten at link time
- size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
-        ^
-/tmp/snappy-1.1.9/snappy.cc:1097:53: error: called from here
-         size_t tag_type = AdvanceToNextTag(&ip, &tag);
-                                                     ^
-CMakeFiles/snappy.dir/build.make:137: recipe for target
-'CMakeFiles/snappy.dir/snappy.cc.o' failed
-
-Just like with other functions using SNAPPY_ATTRIBUTE_ALWAYS_INLINE
-macro (i.e. __attribute__((always_inline)) ) it is necessary to use C++
-inline specifier.
-
-[Retrieved from:
-https://github.com/google/snappy/pull/128/commits/0c716d435abe65250100c2caea0e5126ac4e14bd]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- snappy.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/snappy.cc b/snappy.cc
-index 79dc0e8d..51157be2 100644
---- a/snappy.cc
-+++ b/snappy.cc
-@@ -1014,7 +1014,7 @@ void MemMove(ptrdiff_t dst, const void* src, size_t size) {
- }
- 
- SNAPPY_ATTRIBUTE_ALWAYS_INLINE
--size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
-+inline size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
-   const uint8_t*& ip = *ip_p;
-   // This section is crucial for the throughput of the decompression loop.
-   // The latency of an iteration is fundamentally constrained by the
diff --git a/package/snappy/snappy.hash b/package/snappy/snappy.hash
index b49b0e7e3b..729d696d7e 100644
--- a/package/snappy/snappy.hash
+++ b/package/snappy/snappy.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  75c1fbb3d618dd3a0483bff0e26d0a92b495bbe5059c8b4f1c962b478b6e06e7  snappy-1.1.9.tar.gz
+sha256  49d831bffcc5f3d01482340fe5af59852ca2fe76c3e05df0e67203ebbe0f1d90  snappy-1.1.10.tar.gz
 sha256  55172044f7e241207117448a4d9d6ba1d0925c8ad66b5d4c08c70adfa9cc3de6  COPYING
diff --git a/package/snappy/snappy.mk b/package/snappy/snappy.mk
index d31dcdd5fe..c96dff35fa 100644
--- a/package/snappy/snappy.mk
+++ b/package/snappy/snappy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNAPPY_VERSION = 1.1.9
+SNAPPY_VERSION = 1.1.10
 SNAPPY_SITE = $(call github,google,snappy,$(SNAPPY_VERSION))
 SNAPPY_LICENSE = BSD-3-Clause
 SNAPPY_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
