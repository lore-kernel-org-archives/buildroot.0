Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED0FC4332F
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 17:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 708644010C;
	Wed, 29 Dec 2021 17:32:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OjWcpA1o8tmv; Wed, 29 Dec 2021 17:32:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 622A740168;
	Wed, 29 Dec 2021 17:32:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 359FA1BF36C
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 17:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2468060A4F
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 17:32:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id naW1HKCEzDDq for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 17:32:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78313607B5
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 17:32:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7312F82DA5; Wed, 29 Dec 2021 17:26:20 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 29 Dec 2021 18:31:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f5ec93be3c1d9deda2a7ad516c258128561f62e9
X-Git-Newrev: 87a9e75b79a28548bfee97156b5ab5b7544282e0
X-Patchwork-Hint: ignore
Message-Id: <20211229172620.7312F82DA5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cycler: bump to version
 0.11.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=87a9e75b79a28548bfee97156b5ab5b7544282e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- python 2 support has been dropped since
  https://github.com/matplotlib/cycler/commit/2a8831489b8ea05614459afb3135db3248890268
- Update indentation in hash file (two spaces)

https://github.com/matplotlib/cycler/releases/tag/v0.11.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cycler/Config.in          | 1 +
 package/python-cycler/python-cycler.hash | 7 ++++---
 package/python-cycler/python-cycler.mk   | 4 ++--
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-cycler/Config.in b/package/python-cycler/Config.in
index 813bc69dd4..39ff23e45f 100644
--- a/package/python-cycler/Config.in
+++ b/package/python-cycler/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_CYCLER
 	bool "python-cycler"
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  Creates a Cycler objects much like cycler, but
 	  includes input validation.
diff --git a/package/python-cycler/python-cycler.hash b/package/python-cycler/python-cycler.hash
index 8255458b26..cef416a86d 100644
--- a/package/python-cycler/python-cycler.hash
+++ b/package/python-cycler/python-cycler.hash
@@ -1,4 +1,5 @@
-# sha256 from https://pypi.org/project/cyclic/#files
-sha256	cd7b2d1018258d7247a71425e9f26463dfb444d411c39569972f4ce586b0c9d8  cycler-0.10.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/cycler/json
+md5  4d0c25f418956e91c47163179682e0ef  cycler-0.11.0.tar.gz
+sha256  9c87405839a19696e837b3b818fed3f5f69f16f1eec1a1ad77e043dcea9c772f  cycler-0.11.0.tar.gz
 # Locally computed sha256 checksums
-sha256	f1218143d766da3fea66f13396b7f15df46a83303f29bf96ba6e98eb4d42f408  LICENSE
+sha256  f1218143d766da3fea66f13396b7f15df46a83303f29bf96ba6e98eb4d42f408  LICENSE
diff --git a/package/python-cycler/python-cycler.mk b/package/python-cycler/python-cycler.mk
index fcdcb148a1..03155d7241 100644
--- a/package/python-cycler/python-cycler.mk
+++ b/package/python-cycler/python-cycler.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CYCLER_VERSION = 0.10.0
+PYTHON_CYCLER_VERSION = 0.11.0
 PYTHON_CYCLER_SOURCE = cycler-$(PYTHON_CYCLER_VERSION).tar.gz
-PYTHON_CYCLER_SITE = https://files.pythonhosted.org/packages/c2/4b/137dea450d6e1e3d474e1d873cd1d4f7d3beed7e0dc973b06e8e10d32488
+PYTHON_CYCLER_SITE = https://files.pythonhosted.org/packages/34/45/a7caaacbfc2fa60bee42effc4bcc7d7c6dbe9c349500e04f65a861c15eb9
 PYTHON_CYCLER_LICENSE = BSD-3-Clause
 PYTHON_CYCLER_LICENSE_FILES = LICENSE
 PYTHON_CYCLER_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
