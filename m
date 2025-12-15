Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA71DD5B86D
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 21:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 809A881EC5;
	Mon, 15 Dec 2025 21:39:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cSlz2gvhfBpl; Mon, 15 Dec 2025 21:39:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FD8F821B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765834753;
	bh=bML+Llz2r7XZTFRobdJLG7idQVSayunnCsqjxTxLQ/o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MCyquz1rMePJ4Z1P86d9vrAgCJ8sVLOWixMyCd6gdDRSs4UG9AeSskCobS6oYKvbj
	 yJNfd7clgm4vdFHpEpBWl0WJhmB3r1194fUci57jvn++ahbFAXvZ4DEKbnZx9nsAvd
	 u+s1+WzOyBOUv3w+TPZC9rsqN73fIZN4qZO/AFrJyWZcDhx9HZhU3NsBkwtzJIOMSv
	 ieQoGVN4SkD/XoFnazGigFj3zoyPVd4SZwHpIgKxX7u28cXOGIg/aDM5KaEaoftPfX
	 uOKLvycoA7mupOgWAvGyMx+8Cy+5Kb+jxEDR0SQxvARargQKFEgvAc5Xmw7WX4n6cO
	 wkvbDTshH2iMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FD8F821B6;
	Mon, 15 Dec 2025 21:39:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 01503151
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 658BC40AE6
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:38:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bOUn2gkAvXNq for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 21:38:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A40784056B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A40784056B
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:38:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A324586FC5; Mon, 15 Dec 2025 21:38:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 22:37:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1986157bfc5aa6498aae7ce061f3f2bf8a1a3532
X-Git-Newrev: ed899d9f18bccb93d1ce92a4789a9b196bfb901b
X-Patchwork-Hint: ignore
Message-Id: <20251215213844.A324586FC5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pysmb: bump version to
 1.2.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=ed899d9f18bccb93d1ce92a4789a9b196bfb901b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/miketeo/pysmb/blob/pysmb-1.2.13/CHANGELOG

Added comments to Config.in computed by scanpypi.

Updated project URL, old URL is broken.

All hashes were computed by scanpypi.

Updated license hash due to copyright year bump:
https://github.com/miketeo/pysmb/commit/e9d59f356455ab29c03ccaa0a1e0219e3ad3c2e9

Updated _SITE to URL computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pysmb/Config.in         | 6 +++---
 package/python-pysmb/python-pysmb.hash | 8 +++++---
 package/python-pysmb/python-pysmb.mk   | 4 ++--
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/package/python-pysmb/Config.in b/package/python-pysmb/Config.in
index bb935dddf1..f9a3aab43c 100644
--- a/package/python-pysmb/Config.in
+++ b/package/python-pysmb/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_PYTHON_PYSMB
 	bool "python-pysmb"
 	depends on BR2_INSTALL_LIBSTDCPP
-	select BR2_PACKAGE_PYTHON_PYASN1
-	select BR2_PACKAGE_PYTHON_TQDM
+	select BR2_PACKAGE_PYTHON_PYASN1 # runtime
+	select BR2_PACKAGE_PYTHON_TQDM # runtime
 	help
 	  pysmb is an experimental SMB/CIFS library written in Python.
 	  It implements the client-side SMB/CIFS protocol (SMB1 and
@@ -10,7 +10,7 @@ config BR2_PACKAGE_PYTHON_PYSMB
 	  transfer files to/from SMB/CIFS shared folders like your
 	  Windows file sharing and Samba folders.
 
-	  https://miketeo.net/wp/index.php/projects/pysmb
+	  https://miketeo.net/blog/projects/pysmb
 
 comment "python-pysmb needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-pysmb/python-pysmb.hash b/package/python-pysmb/python-pysmb.hash
index cc4f553106..55374ca005 100644
--- a/package/python-pysmb/python-pysmb.hash
+++ b/package/python-pysmb/python-pysmb.hash
@@ -1,3 +1,5 @@
-# Locally computed
-sha256  a3897153177d4a88bd4086ed07890f0b4d1d8d1c99866392edc2ce744ce9c3f1  pysmb-1.2.10.tar.gz
-sha256  8c487d5c10f024e44a9cf1df21d1fd28a80bd2dfddd9f1dcd109a47d721f497f  LICENSE
+# md5, sha256 from https://pypi.org/pypi/pysmb/json
+md5  a719b8d2f333963ccc7cc71d4fdea184  pysmb-1.2.13.tar.gz
+sha256  89d37fc4f061acecf40e6864e555898f2ecc49994ec06949edbb94b94239a808  pysmb-1.2.13.tar.gz
+# Locally computed sha256 checksums
+sha256  d2ffe0ee7a0160534d80e21a8e531d78e67d9c29ca83b0c41ded5f7f6b50b551  LICENSE
diff --git a/package/python-pysmb/python-pysmb.mk b/package/python-pysmb/python-pysmb.mk
index b4d010e1b0..9c8da126c1 100644
--- a/package/python-pysmb/python-pysmb.mk
+++ b/package/python-pysmb/python-pysmb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYSMB_VERSION = 1.2.10
+PYTHON_PYSMB_VERSION = 1.2.13
 PYTHON_PYSMB_SOURCE = pysmb-$(PYTHON_PYSMB_VERSION).tar.gz
-PYTHON_PYSMB_SITE = https://miketeo.net/files/Projects/pysmb
+PYTHON_PYSMB_SITE = https://files.pythonhosted.org/packages/de/79/f9a2f2f3aea92ae5647079fcbf28e3969de9af7953bef10e31898fe435e2
 PYTHON_PYSMB_LICENSE = Libpng
 PYTHON_PYSMB_LICENSE_FILES = LICENSE
 PYTHON_PYSMB_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
