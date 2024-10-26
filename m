Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFB7D0C604
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 20:05:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4C59403D5;
	Sat, 26 Oct 2024 20:05:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sKpeSeELa3zU; Sat, 26 Oct 2024 20:05:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5320A403CD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5320A403CD;
	Sat, 26 Oct 2024 20:05:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 160DC5C53
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03E3881432
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:05:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PK-MUih1q4F6 for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 20:05:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0787581434
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0787581434
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:05:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E5847840EE; Sat, 26 Oct 2024 20:05:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 22:04:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a51a55262d53a839fe53f546b1f854f81da49b33
X-Git-Newrev: bcde59be440e315c02296183fd916f720d02cbab
X-Patchwork-Hint: ignore
Message-Id: <20241026200500.E5847840EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyqt5-sip: bump version to
 12.15.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=bcde59be440e315c02296183fd916f720d02cbab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The versioning scheme of this package is not trivial: the PyQt5-sip
version number does not corresponds to the actual version tag name in
its Python-SIP source repository. For that reason, this commit adds a
comment explaining this peculiar mapping. This comment will help, in
future maintenance tasks.

To better understand the upstream changes in this package explained in
this commit log, it is worth mentioning that:
- PyQt5-sip 12.13.0 was generated with Python-SIP 6.7.12, and
- PyQt5-sip 12.15.0 was generated with Python-SIP 6.8.6.

The package license has changed to BSD-2-Clause, in upstream commits:
https://github.com/Python-SIP/sip/commit/0ba3b233ec8ed7f22f2f2f950b64f61b50ddfc00
https://github.com/Python-SIP/sip/commit/4dde1491f7b8ace15833cffb86bee82d60683968
https://github.com/Python-SIP/sip/commit/f32039b07c47280039dcdcd0f8a2b1323fda912e

This commit updates the _LICENSE and _LICENSE_FILES macro
accordingly. The license hash file is also updated. While at it, this
commit also adds the MD5 hash published upstream.

This commit also introduces minor improvements to better follow
Buildroot package conventions:
- the .mk file header is changed to lower case,
- hash file comments are updated,
- the locally calculated license file hash is changed from MD5 to
  SHA256.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyqt5-sip/python-pyqt5-sip.hash | 11 +++++------
 package/python-pyqt5-sip/python-pyqt5-sip.mk   | 20 +++++++++++++++-----
 2 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/package/python-pyqt5-sip/python-pyqt5-sip.hash b/package/python-pyqt5-sip/python-pyqt5-sip.hash
index fb4a8cb04d..909ee2ef33 100644
--- a/package/python-pyqt5-sip/python-pyqt5-sip.hash
+++ b/package/python-pyqt5-sip/python-pyqt5-sip.hash
@@ -1,7 +1,6 @@
-# from https://pypi.org/project/PyQt5-sip/12.30.0
-sha256  7f321daf84b9c9dbca61b80e1ef37bdaffc0e93312edae2cd7da25b953971d91  PyQt5_sip-12.13.0.tar.gz
+# From https://pypi.org/pypi/PyQt5-sip/json
+md5  9e0909e79f40619b0f2d3d3c33b4d4f7  PyQt5_sip-12.15.0.tar.gz
+sha256  d23fdfcf363b5cedd9d39f8a9c5710e7d52804f5b08a58e91c638b36eafcb702  PyQt5_sip-12.15.0.tar.gz
 
-# Hash for license files:
-md5  9cd437778ebd1c056a76b4ded73b3a6d  LICENSE
-md5  e91355d8a6f8bd8f7c699d62863c7303  LICENSE-GPL2
-md5  7ea41d866d6638e430db5287a3f66090  LICENSE-GPL3
+# Locally calculated
+sha256  3859cfca971e429d6b79bdfeb1dc9e43aa9592f7295bf28fdd62824097909383  LICENSE
diff --git a/package/python-pyqt5-sip/python-pyqt5-sip.mk b/package/python-pyqt5-sip/python-pyqt5-sip.mk
index e52081ab45..49762ec58c 100644
--- a/package/python-pyqt5-sip/python-pyqt5-sip.mk
+++ b/package/python-pyqt5-sip/python-pyqt5-sip.mk
@@ -1,14 +1,24 @@
 ################################################################################
 #
-# python-SIP-QT5
+# python-sip-qt5
 #
 ################################################################################
 
-PYTHON_PYQT5_SIP_VERSION = 12.13.0
-PYTHON_PYQT5_SIP_SITE = https://files.pythonhosted.org/packages/ee/81/fce2a475aa56c1f49707d9306b930695b6ff078c2242c9f2fd72a3214e1f
+# Note about the package version:
+# This module version corresponds in fact to the "sip" ABI
+# version (not the version of its generator). See:
+# https://github.com/Python-SIP/sip/blob/6.8.6/sipbuild/module/source/12/sip.h.in#L43
+# The source git repository of this module is located at:
+# https://github.com/Python-SIP/sip/tree/main/sipbuild/module/source
+# The Python-SIP version/tag which generated a given "sip" module is
+# recorded in the PyPI source file "sip.h", in the SIP_VERSION_STR
+# macro. For example, PyQt5-sip 12.15.0 was generated with Python-SIP
+# 6.8.6.
+PYTHON_PYQT5_SIP_VERSION = 12.15.0
+PYTHON_PYQT5_SIP_SITE = https://files.pythonhosted.org/packages/1b/15/78318d50f10062c428e97e7ce387e772616a4673c356018b905f247a6a85
 PYTHON_PYQT5_SIP_SOURCE = PyQt5_sip-$(PYTHON_PYQT5_SIP_VERSION).tar.gz
-PYTHON_PYQT5_SIP_LICENSE = SIP license or GPL-2.0 or GPL-3.0
-PYTHON_PYQT5_SIP_LICENSE_FILES = LICENSE LICENSE-GPL2 LICENSE-GPL3
+PYTHON_PYQT5_SIP_LICENSE = BSD-2-Clause
+PYTHON_PYQT5_SIP_LICENSE_FILES = LICENSE
 PYTHON_PYQT5_SIP_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
