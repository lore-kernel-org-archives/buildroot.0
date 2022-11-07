Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB37C4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 11:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C89C981D73;
	Mon,  5 Dec 2022 11:56:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C89C981D73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H7jdMMylIn7l; Mon,  5 Dec 2022 11:56:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18E75813AE;
	Mon,  5 Dec 2022 11:56:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18E75813AE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6E1D71BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 905B44167B
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 905B44167B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B7rCcv-B3_KB for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE7224167A
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE7224167A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BBED185BA2; Mon,  5 Dec 2022 11:26:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 7 Nov 2022 23:20:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b43db8c4226015548c0e2898c230323255add7a8
X-Git-Newrev: 4f98d5dc255a3e3b296c8956ac20eba9944dabb2
X-Patchwork-Hint: ignore
Message-Id: <20221205112608.BBED185BA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyparted: bump to version
 3.12.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4f98d5dc255a3e3b296c8956ac20eba9944dabb2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Migrate from distutils to setuptools package infrastructure.

Switch to pypi sdist source.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyparted/python-pyparted.hash | 6 ++++--
 package/python-pyparted/python-pyparted.mk   | 7 ++++---
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/python-pyparted/python-pyparted.hash b/package/python-pyparted/python-pyparted.hash
index 0c3e4a15fd..a13276ce79 100644
--- a/package/python-pyparted/python-pyparted.hash
+++ b/package/python-pyparted/python-pyparted.hash
@@ -1,3 +1,5 @@
-# Locally computed
-sha256  d214288ae1a70b5925861ce01b3352378eb6b1419aa3b786f509e9ef2a501c02  python-pyparted-3.11.6.tar.gz
+# md5, sha256 from https://pypi.org/pypi/pyparted/json
+md5  97df779564210100ea3e4eda0d33f7b9  pyparted-3.12.0.tar.gz
+sha256  da985e116beb733371feb605b174db9eec8bd0eedffc8f739f8e603f51b521e7  pyparted-3.12.0.tar.gz
+# Locally computed sha256 checksums
 sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
diff --git a/package/python-pyparted/python-pyparted.mk b/package/python-pyparted/python-pyparted.mk
index 9d48fd9351..5e12995e2e 100644
--- a/package/python-pyparted/python-pyparted.mk
+++ b/package/python-pyparted/python-pyparted.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-PYTHON_PYPARTED_VERSION = 3.11.6
-PYTHON_PYPARTED_SITE = $(call github,rhinstaller,pyparted,v$(PYTHON_PYPARTED_VERSION))
-PYTHON_PYPARTED_SETUP_TYPE = distutils
+PYTHON_PYPARTED_VERSION = 3.12.0
+PYTHON_PYPARTED_SOURCE = pyparted-$(PYTHON_PYPARTED_VERSION).tar.gz
+PYTHON_PYPARTED_SITE = https://files.pythonhosted.org/packages/c2/d0/d32aa5758d6567eef620075f5c84f475c93bb1bf8da9d17051ce3ef055db
+PYTHON_PYPARTED_SETUP_TYPE = setuptools
 PYTHON_PYPARTED_LICENSE = GPL-2.0+
 PYTHON_PYPARTED_LICENSE_FILES = COPYING
 PYTHON_PYPARTED_DEPENDENCIES = parted
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
