Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA10C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 15:18:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2BD041782;
	Wed,  5 Feb 2025 15:18:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CXDkEdGlrtZE; Wed,  5 Feb 2025 15:18:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A47D6417B6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A47D6417B6;
	Wed,  5 Feb 2025 15:18:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C72712A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E423141782
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:18:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4jZxb_Y9Oegl for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 15:18:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB8464177F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB8464177F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:18:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D8FD2870AC; Wed,  5 Feb 2025 15:18:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Feb 2025 16:13:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ef354264cdb86169f019ca618ab542d3d8fe75cf
X-Git-Newrev: ebb65fcf2c96bddc17e82fa5128b73c18909ef13
X-Patchwork-Hint: ignore
Message-Id: <20250205151845.D8FD2870AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bmap-writer: bump to version 1.0.2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ebb65fcf2c96bddc17e82fa5128b73c18909ef13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch from libxml2 to tinyxml2

Add http(s)/ftp stream wrapper script

Signed-off-by: Ayoub Zaki <ayoub.zaki@embetrix.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bmap-writer/Config.in        | 2 +-
 package/bmap-writer/bmap-writer.hash | 2 +-
 package/bmap-writer/bmap-writer.mk   | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/bmap-writer/Config.in b/package/bmap-writer/Config.in
index b2e63c8381..5876a85927 100644
--- a/package/bmap-writer/Config.in
+++ b/package/bmap-writer/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_BMAP_WRITER
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # libarchive
 	select BR2_PACKAGE_LIBARCHIVE
-	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_TINYXML2
 	help
 	  bmap-writer is a command-line utility designed to
 	  efficiently write disk images to storage devices using block
diff --git a/package/bmap-writer/bmap-writer.hash b/package/bmap-writer/bmap-writer.hash
index c59c7a91cb..0b0e8de46a 100644
--- a/package/bmap-writer/bmap-writer.hash
+++ b/package/bmap-writer/bmap-writer.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  94fda8420fa82256bfd01a76dff18ae23c6be9be03cb641f9845164e9326de60  bmap-writer-0.0.3.tar.gz
+sha256  a86ade2c70304574f200c048bd8a728ed27b04b7ece62cf0f696366e37fed6e7  bmap-writer-1.0.2.tar.gz
 sha256  8b1ba204bb69a0ade2bfcf65ef294a920f6bb361b317dba43c7ef29d96332b9b  LICENSE
diff --git a/package/bmap-writer/bmap-writer.mk b/package/bmap-writer/bmap-writer.mk
index dc049c2b9b..19ccd3afbc 100644
--- a/package/bmap-writer/bmap-writer.mk
+++ b/package/bmap-writer/bmap-writer.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-BMAP_WRITER_VERSION = 0.0.3
+BMAP_WRITER_VERSION = 1.0.2
 BMAP_WRITER_SITE = $(call github,embetrix,bmap-writer,$(BMAP_WRITER_VERSION))
 BMAP_WRITER_LICENSE = GPL-3.0
 BMAP_WRITER_LICENSE_FILES = LICENSE
-BMAP_WRITER_DEPENDENCIES = host-pkgconf libarchive libxml2
-HOST_BMAP_WRITER_DEPENDENCIES = host-pkgconf host-libarchive host-libxml2
+BMAP_WRITER_DEPENDENCIES = host-pkgconf libarchive tinyxml2
+HOST_BMAP_WRITER_DEPENDENCIES = host-pkgconf host-libarchive host-tinyxml2
 
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
