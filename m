Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48AB1D12676
	for <buildroot@archiver.kernel.org>; Tue,  2 Dec 2025 21:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 185A16132F;
	Tue,  2 Dec 2025 21:45:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c0h5Y5IV_eA5; Tue,  2 Dec 2025 21:45:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5B5560D92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764711905;
	bh=yjQ0kDhxfPHIfRL8d9PyaKzzgM2tN6QzPTWaotLT7Pw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cDpBs9A1iPmrt8aj4XbJJXIjSndcwvF9l1LFpjP7NXwei3zl3kibhycXbYEByoQIJ
	 SuzC2aUW8HTrgguFMU+vjA/JWepA6MtxwEMew2jInkDq+1qP0dM83FduI6HsRNIiBm
	 o3Yz7p+dBG0l21QaS0wHWyGIuhrWMNxlRVNRvr0+cZ1xKVeArCHw2Z7k0s3FoG2VQI
	 W7DayU0YJoFZhXy/P5e1gb0LwwaRZMscUKY+HxcjKwTkB2Vgn+gz1ssGu121+YZsly
	 kZTbXLe0jpJyPUu5+7rpd2VASFx9m2Mj7167o3/pFIUbJZgZ5Z4JXfZyybF1wuE+x6
	 VDZKSYcebPlzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5B5560D92;
	Tue,  2 Dec 2025 21:45:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 45FA7D3
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 21:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C94860D92
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 21:45:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1tnl_2YJFWcO for <buildroot@buildroot.org>;
 Tue,  2 Dec 2025 21:45:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75B9B60D74
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75B9B60D74
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 21:45:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 521EE86402; Tue,  2 Dec 2025 21:45:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Dec 2025 22:34:43 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6846a992fe8a87bdcf699405f410e32bb0fbef6f
X-Git-Newrev: cf7b7470da07ef154836833c25de52795bd4e389
X-Patchwork-Hint: ignore
Message-Id: <20251202214503.521EE86402@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/unionfs: bump version
 to 3.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=cf7b7470da07ef154836833c25de52795bd4e389
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://github.com/rpodgorny/unionfs-fuse/blob/master/NEWS

Version 3.0 added support for libfuse3.

Updated license hash due to copyright year bump:
https://github.com/rpodgorny/unionfs-fuse/commit/3fcbd11f78b9a9e02ea0e861d741840fe45dc9c8

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/unionfs/Config.in    |  8 ++++----
 package/unionfs/unionfs.hash |  4 ++--
 package/unionfs/unionfs.mk   | 12 ++++++++++--
 3 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/package/unionfs/Config.in b/package/unionfs/Config.in
index fe03b95f20..41210c2039 100644
--- a/package/unionfs/Config.in
+++ b/package/unionfs/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_UNIONFS
 	bool "unionfs (FUSE)"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse
-	depends on BR2_USE_MMU # libfuse
-	depends on !BR2_STATIC_LIBS # libfuse
-	select BR2_PACKAGE_LIBFUSE
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse, libfuse3
+	depends on BR2_USE_MMU # libfuse, libfuse3
+	depends on !BR2_STATIC_LIBS # libfuse, libfuse3
+	select BR2_PACKAGE_LIBFUSE3 if !BR2_PACKAGE_LIBFUSE
 	help
 	  A userspace unionfs implementation.
 
diff --git a/package/unionfs/unionfs.hash b/package/unionfs/unionfs.hash
index 7c4a9f4ffb..7ec654591d 100644
--- a/package/unionfs/unionfs.hash
+++ b/package/unionfs/unionfs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f56a5579d670e18e0667700bc599acbc0b8217ca1f76b2adb3dad7d2953c4049  LICENSE
-sha256  c705072a33a18cbc73ffe799331d43410b6deef5d6f2042038f8fd3ab17b6e2e  unionfs-2.1.tar.gz
+sha256  026f5302279110ceb7465e5c9e863cd0319ea0dc32ad253d162cf9db0f5e9a81  unionfs-3.7.tar.gz
+sha256  b03db54bff4b5ff9d1b4c7ef54513e52afaa32830f36a6da6db8c0fcd35a4431  LICENSE
diff --git a/package/unionfs/unionfs.mk b/package/unionfs/unionfs.mk
index 12cd368fe3..4909d80a70 100644
--- a/package/unionfs/unionfs.mk
+++ b/package/unionfs/unionfs.mk
@@ -4,10 +4,18 @@
 #
 ################################################################################
 
-UNIONFS_VERSION = 2.1
+UNIONFS_VERSION = 3.7
 UNIONFS_SITE = $(call github,rpodgorny,unionfs-fuse,v$(UNIONFS_VERSION))
-UNIONFS_DEPENDENCIES = libfuse host-pkgconf
+UNIONFS_DEPENDENCIES = host-pkgconf
 UNIONFS_LICENSE = BSD-3-Clause
 UNIONFS_LICENSE_FILES = LICENSE
 
+ifeq ($(BR2_PACKAGE_LIBFUSE3),y)
+UNIONFS_CONF_OPTS += -DWITH_LIBFUSE3=TRUE
+UNIONFS_DEPENDENCIES += libfuse3
+else
+UNIONFS_CONF_OPTS += -DWITH_LIBFUSE3=FALSE
+UNIONFS_DEPENDENCIES += libfuse
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
