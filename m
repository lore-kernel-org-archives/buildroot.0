Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BAD4C83F1A
	for <buildroot@archiver.kernel.org>; Mon, 14 Jul 2025 13:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 097EC60A54;
	Mon, 14 Jul 2025 13:28:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B52mV_MnyT92; Mon, 14 Jul 2025 13:28:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31D9260854
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31D9260854;
	Mon, 14 Jul 2025 13:28:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A13225E
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 13:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E3D1412DA
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 13:28:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mZnfhjTOuhUN for <buildroot@buildroot.org>;
 Mon, 14 Jul 2025 13:28:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB863412D4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB863412D4
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 13:28:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA6D186517; Mon, 14 Jul 2025 13:28:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 14 Jul 2025 15:18:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 84077c777658d834ba8bb67582707f24d73cb914
X-Git-Newrev: 6c80b71c8c661ce62cfa800ed558dba31baa5dbb
X-Patchwork-Hint: ignore
Message-Id: <20250714132837.DA6D186517@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/chrony: bump to version 4.7
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6c80b71c8c661ce62cfa800ed558dba31baa5dbb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://chrony-project.org/news.html

Since this release, building without POSIX threads is no longer supported.
So add a depends on BR2_TOOLCHAIN_HAS_THREADS.

Signed-off-by: Scott Fan <fancp2007@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/chrony/Config.in   | 5 +++++
 package/chrony/chrony.hash | 4 ++--
 package/chrony/chrony.mk   | 2 +-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/chrony/Config.in b/package/chrony/Config.in
index 453e4f6c3f..d08b0ba6e9 100644
--- a/package/chrony/Config.in
+++ b/package/chrony/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_CHRONY
 	bool "chrony"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBCAP
 	help
 	  Chrony is a pair of programs which are used to maintain the
@@ -18,3 +19,7 @@ config BR2_PACKAGE_CHRONY_DEBUG_LOGGING
 	  not be compiled in.
 
 endif
+
+comment "chrony needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/chrony/chrony.hash b/package/chrony/chrony.hash
index 25535e723e..75555fed9e 100644
--- a/package/chrony/chrony.hash
+++ b/package/chrony/chrony.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://chrony-project.org/releases/chrony-4.6.1-tar-gz-asc.txt
-sha256  571ff73fbf0ae3097f0604eca2e00b1d8bb2e91affe1a3494785ff21d6199c5c  chrony-4.6.1.tar.gz
+# https://chrony-project.org/releases/chrony-4.7-tar-gz-asc.txt
+sha256  c0de41a8c051e5d32b101b5f7014b98ca978b18e592f30ce6840b6d4602d947b  chrony-4.7.tar.gz
 # Locally calculated
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index 642e1d8fd6..f2aca81d60 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHRONY_VERSION = 4.6.1
+CHRONY_VERSION = 4.7
 CHRONY_SITE = https://chrony-project.org/releases
 CHRONY_LICENSE = GPL-2.0
 CHRONY_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
