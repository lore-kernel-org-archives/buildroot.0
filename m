Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99CDC433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 21:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A2FC814B6;
	Thu, 21 Apr 2022 21:04:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rzbgTslhnrCI; Thu, 21 Apr 2022 21:04:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 899F4814BB;
	Thu, 21 Apr 2022 21:04:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B5F821BF3E3
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 21:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD9BA83033
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 21:02:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dDR2mK7PNSgi for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 21:02:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71C7382FF9
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 21:02:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2F7B3840FF; Thu, 21 Apr 2022 20:52:06 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 21 Apr 2022 22:05:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6ab8b1e26386527659c27d9b194a0915e1ff6c34
X-Git-Newrev: c6addf4606c3a41cdad5c6ac4c6508b298b6e92a
X-Patchwork-Hint: ignore
Message-Id: <20220421205206.2F7B3840FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsigsegv: bump to version 2.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=c6addf4606c3a41cdad5c6ac4c6508b298b6e92a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump will fix the following build failure on or1k and microblazeel:

In file included from handler.c:20:
handler-unix.c: In function 'sigsegv_handler':
handler-unix.c:194:28: error: 'struct vma_struct' has no member named 'is_near_this'
  194 |                       : vma.is_near_this (addr, &vma))
      |                            ^

https://git.savannah.gnu.org/gitweb/?p=libsigsegv.git;a=blob;f=NEWS;h=4d012f8b6cd9b2c1eccbf266a10aae56b0e79978;hb=9ad117adabd223b79e037575e071855c2b8b35c0
https://git.savannah.gnu.org/gitweb/?p=libsigsegv.git;a=blob;f=ChangeLog;h=c52b227aae190ba9b161282efaa5f33cb4a127f9;hb=9ad117adabd223b79e037575e071855c2b8b35c0

Fixes:
 - http://autobuild.buildroot.org/results/c693fafb8f1f68be30a281313fb1f0890cc08b1e
 - http://autobuild.buildroot.org/results/ecde11129d102e3321b2aaef407697c29311c705

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libsigsegv/libsigsegv.hash | 4 ++--
 package/libsigsegv/libsigsegv.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libsigsegv/libsigsegv.hash b/package/libsigsegv/libsigsegv.hash
index c827e6b866..13978da398 100644
--- a/package/libsigsegv/libsigsegv.hash
+++ b/package/libsigsegv/libsigsegv.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/libsigsegv/libsigsegv-2.13.tar.gz.sig
-sha256  be78ee4176b05f7c75ff03298d84874db90f4b6c9d5503f0da1226b3a3c48119  libsigsegv-2.13.tar.gz
+# https://ftp.gnu.org/gnu/libsigsegv/libsigsegv-2.14.tar.gz.sig
+sha256  cdac3941803364cf81a908499beb79c200ead60b6b5b40cad124fd1e06caa295  libsigsegv-2.14.tar.gz
 # Locally calculated
 sha256  8f2983e9a940367f48999881c14775db725ee643bce1e2f1ba195eb629a33cde  COPYING
diff --git a/package/libsigsegv/libsigsegv.mk b/package/libsigsegv/libsigsegv.mk
index 87a5d7a124..98bcd55c8c 100644
--- a/package/libsigsegv/libsigsegv.mk
+++ b/package/libsigsegv/libsigsegv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSIGSEGV_VERSION = 2.13
+LIBSIGSEGV_VERSION = 2.14
 LIBSIGSEGV_SITE = $(BR2_GNU_MIRROR)/libsigsegv
 LIBSIGSEGV_INSTALL_STAGING = YES
 LIBSIGSEGV_CONF_ENV = sv_cv_fault_posix=yes
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
