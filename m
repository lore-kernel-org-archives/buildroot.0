Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87DA2E8FDCD
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 15:26:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 542AC606CC;
	Sat, 27 Dec 2025 15:26:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YcHpLD6SbLdt; Sat, 27 Dec 2025 15:26:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8249E606DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766849211;
	bh=nruBNpkqLBEVRyKPhMJ0nzGaqonCDOLmLyzW5oJcxVw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mLnARkB4C9QvYSxe2f8D1Tc1N9Gf1dIfVaZo0AqK20aShhiWRN7W+40du1QKY0yUk
	 9Evz0kNwGGHc3F9yictUlu2F61fw7XewKQZTs8KJAWnFi7iisntLW8v4brEuyKU1mN
	 X4orlDx9pvzzgbRBH/wr7Rxj1VUeW8WaxbQZNZCzeMaYUybPvwYQRr0eJJbigPfLb2
	 S06kBC5igeloK0QKoh0cpn+xg+FkIIMEx3EkjgT0YHCJWf+vS72oFXADaAJr+vd/Oo
	 7kfpXHWSPL/NGgC5KBzAazDBNMT2f+ierFc/U+JwwCeEAfKltMCLdxCK8UfNFQl320
	 w+NZcV5u5vh5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8249E606DF;
	Sat, 27 Dec 2025 15:26:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A1EAD8
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:26:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E537C40690
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:26:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mjzVo6MHVWcO for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 15:26:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 151B94068F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 151B94068F
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:26:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE7A08775E; Sat, 27 Dec 2025 15:26:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Dec 2025 16:26:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0f938aed25199d779978afeff1f8078b7bd3611c
X-Git-Newrev: 2667cab664b568ff0619dacf5d0b38d5926aff61
X-Patchwork-Hint: ignore
Message-Id: <20251227152647.EE7A08775E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/Config.in: drop
 BR2_TOOLCHAIN_HAS_GCC_BUG_121567
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6568273459745747366=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6568273459745747366==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=2667cab664b568ff0619dacf5d0b38d5926aff61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GCC bug 121567 is actually a duplicate of GCC bug 81426, which already
existed upstream, and for which we already had
BR2_TOOLCHAIN_HAS_GCC_BUG_81246.

In addition, BR2_TOOLCHAIN_HAS_GCC_BUG_81246 is correctly defined as
affecting SuperH regardless of the optimization level. Indeed, when
BR2_TOOLCHAIN_HAS_GCC_BUG_121567 was introduced, it was thought that
only -O2 and -O3 levels are affected, but -Og, -O1 and -Ofast are also
affected, causing the python3 build to fail.

Fixes:

  https://autobuild.buildroot.net/results/aca1812415ee84eef223b0fdff88f31a39775294/ (-O1 build)

  https://autobuild.buildroot.net/results/3fd91ce3ff8727d2f9c12f6721df922c60282d70/ (-Ofast build)

  https://autobuild.buildroot.net/results/e5536dcf598a51f5006343513a76f4e223e80a55/ (-Og build)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python3/python3.mk |  2 +-
 toolchain/Config.in        | 13 +++----------
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 4e660ecee2..0690678c04 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -191,7 +191,7 @@ endif
 
 PYTHON3_CFLAGS = $(TARGET_CFLAGS)
 
-ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_121567),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_81426),y)
 PYTHON3_CFLAGS += -O0
 endif
 
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 8330e652c2..99337a1873 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -141,6 +141,9 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_68485
 	default y if BR2_microblaze
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81426
+# error: unable to find a register to spill in class ‘R0_REGS’
+# The bug exists at least since gcc 6.x, so we are assuming it affects
+# all GCC versions.
 config BR2_TOOLCHAIN_HAS_GCC_BUG_81426
 	bool
 	default y if BR2_sh
@@ -243,16 +246,6 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_111001
 		   BR2_OPTIMIZE_2 || \
 		   BR2_OPTIMIZE_3
 
-# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=121567
-# error: unable to find a register to spill in class ‘R0_REGS’
-# The bug exists at least since gcc 6.x, so we are assuming it affects
-# all GCC versions.
-config BR2_TOOLCHAIN_HAS_GCC_BUG_121567
-	bool
-	default y if BR2_sh
-	depends on BR2_OPTIMIZE_2 || \
-		   BR2_OPTIMIZE_3
-
 config BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	bool
 

--===============6568273459745747366==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6568273459745747366==--
