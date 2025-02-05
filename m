Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71EDFC02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 10:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F2A841624;
	Wed,  5 Feb 2025 10:10:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bcabCP9XZr5k; Wed,  5 Feb 2025 10:10:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8C044163E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8C044163E;
	Wed,  5 Feb 2025 10:10:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DC8C412A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:10:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE0424037C
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:10:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KaI96NmE5INW for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 10:10:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A3EC40254
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A3EC40254
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:10:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1168286FC6; Wed,  5 Feb 2025 10:10:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Feb 2025 11:10:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 51e292cf67587f0e8ce666306d07309766595b9f
X-Git-Newrev: 02c765af35f9e09ef5cd8ace07d555fd90fd176f
X-Patchwork-Hint: ignore
Message-Id: <20250205101047.1168286FC6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bmap-writer: add initial package
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

commit: https://git.buildroot.net/buildroot/commit/?id=02c765af35f9e09ef5cd8ace07d555fd90fd176f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ayoub Zaki <ayoub.zaki@embetrix.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                           |  3 +++
 package/Config.in                    |  1 +
 package/Config.in.host               |  1 +
 package/bmap-writer/Config.in        | 19 +++++++++++++++++++
 package/bmap-writer/Config.in.host   | 12 ++++++++++++
 package/bmap-writer/bmap-writer.hash |  3 +++
 package/bmap-writer/bmap-writer.mk   | 15 +++++++++++++++
 7 files changed, 54 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 24fb3e07e0..6254f2e1db 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -304,6 +304,9 @@ F:	package/orbit/
 N:	Attila Wagner <attila.wagner@onyxinsight.com>
 F:	package/python-canopen/
 
+N:	Ayoub Zaki <ayoub.zaki@embetrix.com>
+F:	package/bmap-writer/
+
 N:	Bagas Sanjaya <bagasdotme@gmail.com>
 F:	package/git/
 
diff --git a/package/Config.in b/package/Config.in
index 83f69f9004..e501bca3aa 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -214,6 +214,7 @@ menu "Filesystem and flash utilities"
 	source "package/aufs-util/Config.in"
 	source "package/autofs/Config.in"
 	source "package/bmap-tools/Config.in"
+	source "package/bmap-writer/Config.in"
 	source "package/btrfs-progs/Config.in"
 	source "package/cifs-utils/Config.in"
 	source "package/cpio/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index 90b161eeab..bf04f5fa97 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -10,6 +10,7 @@ menu "Host utilities"
 	source "package/asn1c/Config.in.host"
 	source "package/babeltrace2/Config.in.host"
 	source "package/bmap-tools/Config.in.host"
+	source "package/bmap-writer/Config.in.host"
 	source "package/bootgen/Config.in.host"
 	source "package/btrfs-progs/Config.in.host"
 	source "package/cbootimage/Config.in.host"
diff --git a/package/bmap-writer/Config.in b/package/bmap-writer/Config.in
new file mode 100644
index 0000000000..b2e63c8381
--- /dev/null
+++ b/package/bmap-writer/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_BMAP_WRITER
+	bool "bmap-writer"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR # libarchive
+	select BR2_PACKAGE_LIBARCHIVE
+	select BR2_PACKAGE_LIBXML2
+	help
+	  bmap-writer is a command-line utility designed to
+	  efficiently write disk images to storage devices using block
+	  mapping (BMAP). It serves as a lightweight alternative to
+	  the Yocto BMAP tool, specifically for embedded
+	  systems. Unlike the Yocto BMAP tool, bmap-writer is C++
+	  based, does not require Python, and focuses solely on
+	  writing an image.
+
+	  https://github.com/embetrix/bmap-writer
+
+comment "bmap-writer needs a toolchain w/ C++, wchar"
+	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/bmap-writer/Config.in.host b/package/bmap-writer/Config.in.host
new file mode 100644
index 0000000000..a5365f47cf
--- /dev/null
+++ b/package/bmap-writer/Config.in.host
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_HOST_BMAP_WRITER
+	bool "host bmap-writer"
+	help
+	  bmap-writer is a command-line utility designed to
+	  efficiently write disk images to storage devices using block
+	  mapping (BMAP). It serves as a lightweight alternative to
+	  the Yocto BMAP tool, specifically for embedded
+	  systems. Unlike the Yocto BMAP tool, bmap-writer is C++
+	  based, does not require Python, and focuses solely on
+	  writing an image.
+
+	  https://github.com/embetrix/bmap-writer
diff --git a/package/bmap-writer/bmap-writer.hash b/package/bmap-writer/bmap-writer.hash
new file mode 100644
index 0000000000..c59c7a91cb
--- /dev/null
+++ b/package/bmap-writer/bmap-writer.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  94fda8420fa82256bfd01a76dff18ae23c6be9be03cb641f9845164e9326de60  bmap-writer-0.0.3.tar.gz
+sha256  8b1ba204bb69a0ade2bfcf65ef294a920f6bb361b317dba43c7ef29d96332b9b  LICENSE
diff --git a/package/bmap-writer/bmap-writer.mk b/package/bmap-writer/bmap-writer.mk
new file mode 100644
index 0000000000..dc049c2b9b
--- /dev/null
+++ b/package/bmap-writer/bmap-writer.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# bmap-writer
+#
+################################################################################
+
+BMAP_WRITER_VERSION = 0.0.3
+BMAP_WRITER_SITE = $(call github,embetrix,bmap-writer,$(BMAP_WRITER_VERSION))
+BMAP_WRITER_LICENSE = GPL-3.0
+BMAP_WRITER_LICENSE_FILES = LICENSE
+BMAP_WRITER_DEPENDENCIES = host-pkgconf libarchive libxml2
+HOST_BMAP_WRITER_DEPENDENCIES = host-pkgconf host-libarchive host-libxml2
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
