Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D54C54EE9
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 17:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 242544052C;
	Sun, 25 Sep 2022 17:19:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 242544052C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3wUSPOKfvZTx; Sun, 25 Sep 2022 17:19:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 225F940528;
	Sun, 25 Sep 2022 17:19:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 225F940528
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 329811BF48B
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 17:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B33E818A2
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 17:19:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B33E818A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mdCpgxUjumkE for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 17:19:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9194E813ED
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9194E813ED
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 17:19:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 8DFC7200006;
 Sun, 25 Sep 2022 17:19:42 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Sun, 25 Sep 2022 19:19:30 +0200
Message-Id: <20220925171932.1630739-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220925171932.1630739-1-thomas.petazzoni@bootlin.com>
References: <20220925171932.1630739-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664126383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3nMiXEvpu7PI8drsD5Ak7IeKC3/kXtXOkV+yYPdrOy4=;
 b=esloCMxqmbPurKWmhV0+N39P8XZrNni0grtNRezo5RCi8J4xFF2zR/rhM6XrE61SvC9VD5
 7bAXolcEB+kiMr6RUljaxd+GpiEhSDowaZPXFBmF0ylbaOWfo4os6H+FcCSNbUZCufbIIK
 XHNUGZlI4E7DOtIqaqwIm6SmeyWhUnEngpk2idHTaTGYd6FrX87nIwaeKqm5CbS8aWE9R+
 UzT18V5XjkL5CAOzrAw94RQ5HHz5f1x0aM2AOqMPVffn2t5JNDvuuSV9pmOUkG9+xGYm9c
 sa3wIfhPcbIDX7NY8ts8e3lHRyUzlCZv7OmALBMikmteSzjDNObr6xUCD482Kw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=esloCMxq
Subject: [Buildroot] [PATCH 2/4] package/nodejs: bump to v16.17.1
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
Cc: Alexandru Ardelean <ardeleanalex@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Daniel Price <daniel.price@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is currently the latest version in the v16.x branch.

Patch 0001-add-qemu-wrapper-support.patch needs some minor adaptations
to resolve conflicts with other unrelated upstream changes. The other
patches are simply refreshed.

The license file is updates due to:

 - Reformatting changes

 - Addition of the mention of some files being under GPLv3, but it's
   only the autoconf machinery: aclocal.m4 and config.guess, so it's
   not relevant to add in our LICENSE variable.

 - Addition of the mention of another file being under the MIT
   license (install-sh), and MIT is already listed, and this file is
   anyway only part of the autoconf machinery.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-add-qemu-wrapper-support.patch       | 28 +++++++++----------
 ...heck-if-uclibc-has-backtrace-support.patch |  6 ++--
 ...lude-obj-name-in-shared-intermediate.patch |  4 +--
 package/nodejs/nodejs.hash                    |  6 ++--
 package/nodejs/nodejs.mk                      |  2 +-
 5 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/package/nodejs/0001-add-qemu-wrapper-support.patch b/package/nodejs/0001-add-qemu-wrapper-support.patch
index 8d09601158..184f3d19b7 100644
--- a/package/nodejs/0001-add-qemu-wrapper-support.patch
+++ b/package/nodejs/0001-add-qemu-wrapper-support.patch
@@ -1,4 +1,4 @@
-From c6103ceab64b73c1a25ece3315ea8f52507c2bfe Mon Sep 17 00:00:00 2001
+From 1f6c55d7318e7075169004b4314708f4766ec193 Mon Sep 17 00:00:00 2001
 From: Adam Duskett <aduskett@gmail.com>
 Date: Mon, 27 Sep 2021 12:55:09 -0700
 Subject: [PATCH] add qemu-wrapper support
@@ -22,10 +22,10 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
  2 files changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/node.gyp b/node.gyp
-index 74e9f9cc2e..c3eaab6c92 100644
+index 97cdbb531d..db5cf51ce6 100644
 --- a/node.gyp
 +++ b/node.gyp
-@@ -295,7 +295,7 @@
+@@ -319,7 +319,7 @@
                'action_name': 'run_mkcodecache',
                'process_outputs_as_sources': 1,
                'inputs': [
@@ -34,17 +34,17 @@ index 74e9f9cc2e..c3eaab6c92 100644
                ],
                'outputs': [
                  '<(SHARED_INTERMEDIATE_DIR)/node_code_cache.cc',
-@@ -320,7 +320,7 @@
-               'action_name': 'node_mksnapshot',
-               'process_outputs_as_sources': 1,
-               'inputs': [
--                '<(node_mksnapshot_exec)',
-+                @MAYBE_WRAPPER@ '<(node_mksnapshot_exec)',
-               ],
-               'outputs': [
-                 '<(SHARED_INTERMEDIATE_DIR)/node_snapshot.cc',
+@@ -346,7 +346,7 @@
+                   'action_name': 'node_mksnapshot',
+                   'process_outputs_as_sources': 1,
+                   'inputs': [
+-                    '<(node_mksnapshot_exec)',
++                    @MAYBE_WRAPPER@ '<(node_mksnapshot_exec)',
+                     '<(node_snapshot_main)',
+                   ],
+                   'outputs': [
 diff --git a/tools/v8_gypfiles/v8.gyp b/tools/v8_gypfiles/v8.gyp
-index 39b96803c7..9321982ea4 100644
+index 73099a03e4..88ca91efb4 100644
 --- a/tools/v8_gypfiles/v8.gyp
 +++ b/tools/v8_gypfiles/v8.gyp
 @@ -68,7 +68,7 @@
@@ -83,7 +83,7 @@ index 39b96803c7..9321982ea4 100644
            ],
            'outputs': [
              '<(INTERMEDIATE_DIR)/snapshot.cc',
-@@ -1503,7 +1503,7 @@
+@@ -1505,7 +1505,7 @@
          {
            'action_name': 'run_gen-regexp-special-case_action',
            'inputs': [
diff --git a/package/nodejs/0002-check-if-uclibc-has-backtrace-support.patch b/package/nodejs/0002-check-if-uclibc-has-backtrace-support.patch
index 079bbb4366..367b9fb8d5 100644
--- a/package/nodejs/0002-check-if-uclibc-has-backtrace-support.patch
+++ b/package/nodejs/0002-check-if-uclibc-has-backtrace-support.patch
@@ -1,4 +1,4 @@
-From 7c69553d7275bbcaa88fada8ccd0d2d9f787e1ad Mon Sep 17 00:00:00 2001
+From f1a15cea9a47d0a9b0ae78fb22fef3a268e355ad Mon Sep 17 00:00:00 2001
 From: Martin Bark <martin@barkynet.com>
 Date: Sat, 4 Mar 2017 20:41:40 +0000
 Subject: [PATCH] check if uclibc has backtrace support
@@ -9,7 +9,7 @@ Signed-off-by: Martin Bark <martin@barkynet.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/deps/v8/src/base/debug/stack_trace_posix.cc b/deps/v8/src/base/debug/stack_trace_posix.cc
-index 87c0a73..d2c182a 100644
+index 270f1ca4e0..5227e88671 100644
 --- a/deps/v8/src/base/debug/stack_trace_posix.cc
 +++ b/deps/v8/src/base/debug/stack_trace_posix.cc
 @@ -25,7 +25,7 @@
@@ -22,5 +22,5 @@ index 87c0a73..d2c182a 100644
  #endif
  
 -- 
-2.7.4
+2.37.3
 
diff --git a/package/nodejs/0003-include-obj-name-in-shared-intermediate.patch b/package/nodejs/0003-include-obj-name-in-shared-intermediate.patch
index b439c66a0c..5b44e6c400 100644
--- a/package/nodejs/0003-include-obj-name-in-shared-intermediate.patch
+++ b/package/nodejs/0003-include-obj-name-in-shared-intermediate.patch
@@ -1,4 +1,4 @@
-From e6e691d093de440e0f408d48971e2b7332a07d58 Mon Sep 17 00:00:00 2001
+From af47d317e5ae12978c1cdc40627008ada144f98b Mon Sep 17 00:00:00 2001
 From: Min RK <benjaminrk@gmail.com>
 Date: Fri, 19 Feb 2021 11:57:04 +0100
 Subject: [PATCH] include obj name in shared intermediate
@@ -12,7 +12,7 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
  1 file changed, 7 insertions(+), 1 deletion(-)
 
 diff --git a/tools/gyp/pylib/gyp/generator/ninja.py b/tools/gyp/pylib/gyp/generator/ninja.py
-index d173bf2299..efaeee53ef 100644
+index 3db3771ac9..2e0a021703 100644
 --- a/tools/gyp/pylib/gyp/generator/ninja.py
 +++ b/tools/gyp/pylib/gyp/generator/ninja.py
 @@ -42,7 +42,7 @@ generator_default_variables = {
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 12ae449ab4..83e4c271ce 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From https://nodejs.org/dist/v16.16.0/SHASUMS256.txt
-sha256  145151eff3b2aa5ebe73384009c52271a83740ae687a93c98c628cd7d52736eb  node-v16.16.0.tar.xz
+# From https://nodejs.org/dist/v16.17.1/SHASUMS256.txt
+sha256  6721feb4152d56d2c6b358ce397abd5a7f1daf09ee2e25c5021b9b4d3f86a330  node-v16.17.1.tar.xz
 
 # Hash for license file
-sha256  6211cc77f9ceaf365db12faf050775b3a1e6da7a1eff3577ba006c4918103c33  LICENSE
+sha256  69090e865afa7c62715b97f0712632d2923bd7a5faba91f94e4e75a2f9219d5e  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index e9fe96812f..05456e3443 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 16.16.0
+NODEJS_VERSION = 16.17.1
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = \
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
