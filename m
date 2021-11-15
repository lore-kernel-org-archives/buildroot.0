Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE75C433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 477E081BF4;
	Mon,  6 Dec 2021 18:35:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 89IZBYMCYbMf; Mon,  6 Dec 2021 18:35:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B25C80DA0;
	Mon,  6 Dec 2021 18:35:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 248731BF983
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E79A41C23
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oeq-qZ3cbblr for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B55F41C3E
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C837781468; Mon,  6 Dec 2021 18:07:39 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 15 Nov 2021 23:14:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5fdcb18aecec28aedbacb86ecdcb29e59efcf56a
X-Git-Newrev: 6170020898ca154f9a8c83bf9068207ae958594b
X-Patchwork-Hint: ignore
Message-Id: <20211206180739.C837781468@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bdwgc: bump to 8.0.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=6170020898ca154f9a8c83bf9068207ae958594b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove patch (already in version)
- Change URL to Github releases
- Hash of the license file changed due to a copyright year update

Signed-off-by: Ivan Maidanski <ivmai@mail.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ed-reference-to-__data_start-linker-error.patch | 33 ----------------------
 package/bdwgc/Config.in                            |  2 +-
 package/bdwgc/bdwgc.hash                           |  4 +--
 package/bdwgc/bdwgc.mk                             |  4 +--
 4 files changed, 5 insertions(+), 38 deletions(-)

diff --git a/package/bdwgc/0001-Fix-undefined-reference-to-__data_start-linker-error.patch b/package/bdwgc/0001-Fix-undefined-reference-to-__data_start-linker-error.patch
deleted file mode 100644
index 81221c9f66..0000000000
--- a/package/bdwgc/0001-Fix-undefined-reference-to-__data_start-linker-error.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 301ef15aefa6764466c374d07efb511b1c3862cc Mon Sep 17 00:00:00 2001
-From: Nikita Ermakov <coffe92@gmail.com>
-Date: Wed, 20 May 2020 17:57:17 +0300
-Subject: [PATCH] Fix 'undefined reference to __data_start' linker error on
- RISC-V
-
-Issue #294 (bdwgc).
-
-* include/private/gcconfig.h [RISCV && LINUX] (__data_start): Add
-attribute(weak).
-
-(cherry picked from commit 538562ad01b181f4cc3913da1ac06a77945cd9b9)
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- include/private/gcconfig.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/private/gcconfig.h b/include/private/gcconfig.h
-index d9d45da1..d6cefa6f 100644
---- a/include/private/gcconfig.h
-+++ b/include/private/gcconfig.h
-@@ -2943,7 +2943,7 @@ EXTERN_C_BEGIN
- #   define ALIGNMENT (CPP_WORDSZ/8)
- #   ifdef LINUX
- #     define OS_TYPE "LINUX"
--      extern int __data_start[];
-+      extern int __data_start[] __attribute__((__weak__));
- #     define DATASTART ((ptr_t)__data_start)
- #     define LINUX_STACKBOTTOM
- #     define DYNAMIC_LOADING
--- 
-2.30.2
-
diff --git a/package/bdwgc/Config.in b/package/bdwgc/Config.in
index 95139efb93..aad2bc9ef2 100644
--- a/package/bdwgc/Config.in
+++ b/package/bdwgc/Config.in
@@ -7,4 +7,4 @@ config BR2_PACKAGE_BDWGC
 	  be used as a garbage collecting replacement for C 'malloc'
 	  or C++ 'new'.
 
-	  http://www.hboehm.info/gc/
+	  https://www.hboehm.info/gc/
diff --git a/package/bdwgc/bdwgc.hash b/package/bdwgc/bdwgc.hash
index 4d22131964..d0459969b5 100644
--- a/package/bdwgc/bdwgc.hash
+++ b/package/bdwgc/bdwgc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 436a0ddc67b1ac0b0405b61a9675bca9e075c8156f4debd1d06f3a56c7cd289d  gc-8.0.4.tar.gz
-sha256 aeeaabbf44e67d413e18719f0c6ac9c23387ab0b33e7a15ee46cf59ddef12cc7  README.QUICK
+sha256 3b4914abc9fa76593596773e4da671d7ed4d5390e3d46fbf2e5f155e121bea11  gc-8.0.6.tar.gz
+sha256 0aab7a56a92ed878c4a5464cf282d65f38bcdee64fe9cf213e26254bddb3f340  README.QUICK
diff --git a/package/bdwgc/bdwgc.mk b/package/bdwgc/bdwgc.mk
index 57dd82cab4..d1c9d4dfdc 100644
--- a/package/bdwgc/bdwgc.mk
+++ b/package/bdwgc/bdwgc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-BDWGC_VERSION = 8.0.4
+BDWGC_VERSION = 8.0.6
 BDWGC_SOURCE = gc-$(BDWGC_VERSION).tar.gz
-BDWGC_SITE = http://www.hboehm.info/gc/gc_source
+BDWGC_SITE = https://github.com/ivmai/bdwgc/releases/download/v$(BDWGC_VERSION)
 BDWGC_INSTALL_STAGING = YES
 BDWGC_LICENSE = bdwgc license
 BDWGC_LICENSE_FILES = README.QUICK
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
