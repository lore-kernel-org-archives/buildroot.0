Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A640FE8FDAC
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 18:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C75E407DD;
	Fri, 26 Dec 2025 18:21:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b_c0NfQz8ugl; Fri, 26 Dec 2025 18:21:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 105B9407EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766773268;
	bh=9GF0rDmTiXq8mfXEtH5T9uPZ3kZ6iYosrfMKpgqJNIQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mYKmQJvIkFqbZnHRqQHQtT7syu04v3QFsbPEwyEIYnsKZUTZbYDYT3laDc5CntWNx
	 BXpfl9z4PybvQyw6DEuip+A9gOHtBiEUEVzAkPuwB/IcbaVpyek6nto2MviMQfwnew
	 ZiAgKK7Na8F04IeJlw7qBRLRJc6w1qAHTT++D94uzAjNwIMx1KvKEaQn9uIpd6fdzT
	 u37kUcdVgwuryxvJNGB/wxtoSswIxtIyuHR+3D2Jy7nQEJSyYePNTiZt6jlJya+yAF
	 HgY1Y0pPn7RlWfQjAe1CZTONSESZkmZ4wHhkKyJ4BeDGYWL+7hOZrVhKy86oY3k7mx
	 Eo3boonYyd6mg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 105B9407EA;
	Fri, 26 Dec 2025 18:21:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 11907EC
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14A0E80C70
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WP-E9Kn1HrMa for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 18:20:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADE4580ACE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ADE4580ACE
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AAC80876F8; Fri, 26 Dec 2025 18:20:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Dec 2025 17:39:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 01c4206895faf3bc3a3c95da6610a72f57a053c6
X-Git-Newrev: 1c483596f00cfa5a30092d4cdaffb3706312a8a9
X-Patchwork-Hint: ignore
Message-Id: <20251226182054.AAC80876F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/physfs: bump version to 3.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=1c483596f00cfa5a30092d4cdaffb3706312a8a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/icculus/physfs/releases/tag/release-3.2.0

Added upstream patch to fix cmake 4 compatibility.

Updated license hash due to coypright year bumps:
https://github.com/icculus/physfs/commits/release-3.2.0/LICENSE.txt

Switched _SITE to github.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...1-cmake-bump-minimum-CMake-version-to-3.5.patch | 27 ++++++++++++++++++++++
 package/physfs/physfs.hash                         |  4 ++--
 package/physfs/physfs.mk                           |  5 ++--
 3 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/package/physfs/0001-cmake-bump-minimum-CMake-version-to-3.5.patch b/package/physfs/0001-cmake-bump-minimum-CMake-version-to-3.5.patch
new file mode 100644
index 0000000000..49db2061c5
--- /dev/null
+++ b/package/physfs/0001-cmake-bump-minimum-CMake-version-to-3.5.patch
@@ -0,0 +1,27 @@
+From f7d24ce8486d9229207cca1ff98858fe60ffe583 Mon Sep 17 00:00:00 2001
+From: Anonymous Maarten <anonymous.maarten@gmail.com>
+Date: Thu, 27 Apr 2023 22:39:41 +0200
+Subject: [PATCH] cmake: bump minimum CMake version to 3.5 in anticipation of
+ CMake 3.27
+
+Upstream: https://github.com/icculus/physfs/commit/f7d24ce8486d9229207cca1ff98858fe60ffe583
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[rebased for 3.2.0]
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index dfe127a7..1194449e 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -11,7 +11,7 @@
+ 
+ set(PHYSFS_VERSION 3.2.0)
+ 
+-cmake_minimum_required(VERSION 3.0)
++cmake_minimum_required(VERSION 3.5)
+ 
+ project(PhysicsFS VERSION ${PHYSFS_VERSION} LANGUAGES C )
+ 
diff --git a/package/physfs/physfs.hash b/package/physfs/physfs.hash
index a56e7dccef..f2eea58453 100644
--- a/package/physfs/physfs.hash
+++ b/package/physfs/physfs.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  304df76206d633df5360e738b138c94e82ccf086e50ba84f456d3f8432f9f863  physfs-3.0.2.tar.bz2
-sha256  d80c0b09a1c98c61667ea044eefa2fd98fb70bd5fe12c49ff52b1fc2289a6583  LICENSE.txt
+sha256  1991500eaeb8d5325e3a8361847ff3bf8e03ec89252b7915e1f25b3f8ab5d560  physfs-3.2.0.tar.gz
+sha256  111b286674ab4720fd1b693ef8628a94bca8f06484d5fe3d75bd6db22fdc1cb2  LICENSE.txt
diff --git a/package/physfs/physfs.mk b/package/physfs/physfs.mk
index 9a3bd441a9..bfcb578521 100644
--- a/package/physfs/physfs.mk
+++ b/package/physfs/physfs.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-PHYSFS_VERSION = 3.0.2
-PHYSFS_SOURCE = physfs-$(PHYSFS_VERSION).tar.bz2
-PHYSFS_SITE = https://icculus.org/physfs/downloads
+PHYSFS_VERSION = 3.2.0
+PHYSFS_SITE = $(call github,icculus,physfs,release-$(PHYSFS_VERSION))
 
 PHYSFS_LICENSE = Zlib
 PHYSFS_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
