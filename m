Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E15CC48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1EA2740A5D;
	Mon,  5 Feb 2024 10:40:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EA2740A5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uoeHptZLpyxB; Mon,  5 Feb 2024 10:40:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E4A840B12;
	Mon,  5 Feb 2024 10:40:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E4A840B12
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E56CE1BF954
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9BCE8236E
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:39:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9BCE8236E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uFoP9YP1YqlH for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:39:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B18D8220B
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:39:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B18D8220B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC31C86B02; Mon,  5 Feb 2024 10:39:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 11:39:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: db3aa2d36ded61436674e6e248f9988e1e59a750
X-Git-Newrev: 8129c3c2c5985d2e4eeae6cb05948601d0b59772
X-Patchwork-Hint: ignore
Message-Id: <20240205103946.EC31C86B02@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyudev: bump to version
 0.24.1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8129c3c2c5985d2e4eeae6cb05948601d0b59772
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop no longer required python-six runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-pyudev/Config.in          | 1 -
 package/python-pyudev/python-pyudev.hash | 4 ++--
 package/python-pyudev/python-pyudev.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-pyudev/Config.in b/package/python-pyudev/Config.in
index e0da067cc2..aa98c2cc61 100644
--- a/package/python-pyudev/Config.in
+++ b/package/python-pyudev/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_PYTHON_PYUDEV
 	bool "python-pyudev"
 	depends on BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  pyudev is a LGPL licenced, pure Python 2/3 binding to
 	  libudev, the device and hardware management and information
diff --git a/package/python-pyudev/python-pyudev.hash b/package/python-pyudev/python-pyudev.hash
index 014bf20933..72eb323e1f 100644
--- a/package/python-pyudev/python-pyudev.hash
+++ b/package/python-pyudev/python-pyudev.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyudev/json
-md5  17c0a41f0e4dfc016350806a0a60f630  pyudev-0.24.0.tar.gz
-sha256  b2a3afe1c99ea751f8296652557eac559874da2a1b1ec0625178706ec5a345f3  pyudev-0.24.0.tar.gz
+md5  fecaabe9eaa890d2173c7b49ab63a412  pyudev-0.24.1.tar.gz
+sha256  75e54d37218f5ac45b0da1f0fd9cc5e526a3cac3ef1cfad410cf7ab338b01471  pyudev-0.24.1.tar.gz
 # Locally computed sha256 checksums
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/python-pyudev/python-pyudev.mk b/package/python-pyudev/python-pyudev.mk
index 5d48cd4f7c..53d60572a8 100644
--- a/package/python-pyudev/python-pyudev.mk
+++ b/package/python-pyudev/python-pyudev.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYUDEV_VERSION = 0.24.0
+PYTHON_PYUDEV_VERSION = 0.24.1
 PYTHON_PYUDEV_SOURCE = pyudev-$(PYTHON_PYUDEV_VERSION).tar.gz
-PYTHON_PYUDEV_SITE = https://files.pythonhosted.org/packages/00/8d/810750cb2fc64d7e0dbefc106a9137b157616a95be3f0ea51ca3cf6c762a
+PYTHON_PYUDEV_SITE = https://files.pythonhosted.org/packages/20/b6/16961ac3575575260c72928f17df9c99c2a696871e486965ec6e2fa2aff4
 PYTHON_PYUDEV_LICENSE = LGPL-2.1+
 PYTHON_PYUDEV_LICENSE_FILES = COPYING
 PYTHON_PYUDEV_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
