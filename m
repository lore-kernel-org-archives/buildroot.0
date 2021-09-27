Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D98DC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 14:39:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2949060FC0
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 14:39:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2949060FC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00F7480C7B;
	Mon, 27 Sep 2021 14:39:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R88IKdQHu3If; Mon, 27 Sep 2021 14:39:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 445D980C37;
	Mon, 27 Sep 2021 14:39:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6BAA11BF275
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 14:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 574BD4067F
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 14:38:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I0w1gnWRNGDj for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 14:38:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8386840631
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 14:38:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 46E438D2AE; Mon, 27 Sep 2021 14:35:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 16:20:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e1319f20a54074212d97e251d7508a2ec3d3cf41
X-Git-Newrev: 9cedbcf494e647371f92368014d31091848772bb
X-Patchwork-Hint: ignore
Message-Id: <20210927143554.46E438D2AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/liburcu: bump to version 0.13.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=9cedbcf494e647371f92368014d31091848772bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update first patch due to
https://github.com/urcu/userspace-rcu/commit/3f0dd283a89ab114ffbf5c3dd46463217c6bb2ff

https://github.com/urcu/userspace-rcu/blob/v0.13.0/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...01-Only-blacklist-ARM-gcc-4.8.0-and-4.8.1.patch | 22 ++++++++++++----------
 package/liburcu/liburcu.hash                       |  4 ++--
 package/liburcu/liburcu.mk                         |  2 +-
 3 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/package/liburcu/0001-Only-blacklist-ARM-gcc-4.8.0-and-4.8.1.patch b/package/liburcu/0001-Only-blacklist-ARM-gcc-4.8.0-and-4.8.1.patch
index 658e1721f0..554c4aba1f 100644
--- a/package/liburcu/0001-Only-blacklist-ARM-gcc-4.8.0-and-4.8.1.patch
+++ b/package/liburcu/0001-Only-blacklist-ARM-gcc-4.8.0-and-4.8.1.patch
@@ -8,17 +8,19 @@ their latest releases based on gcc-4.8.2, then only blacklist gcc 4.8.0
 and 4.8.1.
 
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+[Fabrice: update for 0.13.0]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  urcu/compiler.h | 9 ++++++++-
  1 file changed, 8 insertions(+), 1 deletion(-)
 
-diff --git a/include/urcu/compiler.h b/include/urcu/compiler.h
+diff --git a/include/urcu/arch/arm.h b/include/urcu/arch/arm.h
 index 1e30903..56115f1 100644
---- a/include/urcu/compiler.h
-+++ b/include/urcu/compiler.h
+--- a/include/urcu/arch/arm.h
++++ b/include/urcu/arch/arm.h
 @@ -118,10 +118,17 @@
- 				+ __GNUC_PATCHLEVEL__)
-
+  */
+ 
  /*
 + * Official gcc releases from 4.8.0 to 4.8.2 have the following bug,
 + * however, many arm toolchain providers have the included the fix for
@@ -29,12 +31,12 @@ index 1e30903..56115f1 100644
 + *
   * http://gcc.gnu.org/bugzilla/show_bug.cgi?id=58854
   */
- # ifdef __ARMEL__
--#  if URCU_GCC_VERSION >= 40800 && URCU_GCC_VERSION <= 40802
-+#  if URCU_GCC_VERSION >= 40800 && URCU_GCC_VERSION <= 40801
- #   error Your gcc version produces clobbered frame accesses
- #  endif
+ #ifdef URCU_GCC_VERSION
+-# if URCU_GCC_VERSION >= 40800 && URCU_GCC_VERSION <= 40802
++# if URCU_GCC_VERSION >= 40800 && URCU_GCC_VERSION <= 40801
+ #  error Your gcc version produces clobbered frame accesses
  # endif
+ #endif
 --
 1.9.0
 
diff --git a/package/liburcu/liburcu.hash b/package/liburcu/liburcu.hash
index da7d12a76c..8ff11623d0 100644
--- a/package/liburcu/liburcu.hash
+++ b/package/liburcu/liburcu.hash
@@ -1,5 +1,5 @@
-# http://www.lttng.org/files/urcu/userspace-rcu-0.12.1.tar.bz2.sha256
-sha256  bbfaead0345642b97e0de90f889dfbab4b2643a6a5e5c6bb59cd0d26fc0bcd0e  userspace-rcu-0.12.1.tar.bz2
+# http://www.lttng.org/files/urcu/userspace-rcu-0.13.0.tar.bz2.sha256
+sha256  cbb20dbe1a892c2a4d8898bac4316176e585392693d498766ccbbc68cf20ba20  userspace-rcu-0.13.0.tar.bz2
 
 # Hash for license files
 sha256  36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  lgpl-2.1.txt
diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
index fa2ad0de83..c0a44764f1 100644
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBURCU_VERSION = 0.12.1
+LIBURCU_VERSION = 0.13.0
 LIBURCU_SITE = http://lttng.org/files/urcu
 LIBURCU_SOURCE = userspace-rcu-$(LIBURCU_VERSION).tar.bz2
 LIBURCU_LICENSE = LGPL-2.1+ (library), MIT-like (few source files listed in LICENSE), GPL-2.0+ (test), GPL-3.0 (few *.m4 files)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
