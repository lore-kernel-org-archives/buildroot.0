Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00B0C4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 21:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B70E4209D;
	Thu,  9 Nov 2023 21:50:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B70E4209D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 81YeWpkNyL1h; Thu,  9 Nov 2023 21:50:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4378F420A2;
	Thu,  9 Nov 2023 21:50:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4378F420A2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1271F1BF990
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 21:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EDF6041E8E
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 21:50:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDF6041E8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y0HMBCD1aZcq for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 21:50:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13C8E41FF5
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 21:50:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13C8E41FF5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 01C2C86EBB; Thu,  9 Nov 2023 21:50:33 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 9 Nov 2023 22:49:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e759e927b344d3b12e7d5224c750b1755d9068b4
X-Git-Newrev: c0799123742eb9b60ca109c0ea0cb1728c22bf0a
X-Patchwork-Hint: ignore
Message-Id: <20231109215033.01C2C86EBB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyxb: Drop package
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

commit: https://git.buildroot.net/buildroot/commit/?id=c0799123742eb9b60ca109c0ea0cb1728c22bf0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The last time python-pyxb was updated according to pypi.org is in 2017.
As there are no maintainers listed for the package, and the package uses
distutils which has been removed in Python 3.12.0, remove the package.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                     |  7 +++++++
 package/Config.in                    |  1 -
 package/python-pyxb/Config.in        |  8 --------
 package/python-pyxb/python-pyxb.hash |  4 ----
 package/python-pyxb/python-pyxb.mk   | 14 --------------
 5 files changed, 7 insertions(+), 27 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 6fef2318b0..312d53943c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2023.11"
 
+config BR2_PACKAGE_PYTHON_PYXB
+	bool "python-pyxb removed"
+	select BR2_LEGACY
+	help
+	  python-pyxb has been removed due to being abandoned and
+	  distutils no longer being supported in python 3.12.0.
+
 config BR2_PACKAGE_OPENJDK_VERSION_11
 	bool "openjdk 11 has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 56e793ceae..dac5058bbe 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1269,7 +1269,6 @@ menu "External python modules"
 	source "package/python-pytz/Config.in"
 	source "package/python-pyudev/Config.in"
 	source "package/python-pyusb/Config.in"
-	source "package/python-pyxb/Config.in"
 	source "package/python-pyyaml/Config.in"
 	source "package/python-pyzmq/Config.in"
 	source "package/python-qrcode/Config.in"
diff --git a/package/python-pyxb/Config.in b/package/python-pyxb/Config.in
deleted file mode 100644
index 6555ed80b6..0000000000
--- a/package/python-pyxb/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_PYTHON_PYXB
-	bool "python-pyxb"
-	help
-	  PyXB is a pure Python package that generates Python code for
-	  classes that correspond to data structures defined by
-	  XMLSchema.
-
-	  http://pyxb.sourceforge.net/
diff --git a/package/python-pyxb/python-pyxb.hash b/package/python-pyxb/python-pyxb.hash
deleted file mode 100644
index f24cd42e5a..0000000000
--- a/package/python-pyxb/python-pyxb.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# md5 from https://pypi.python.org/pypi/PyXB/json, sha256 locally computed
-md5  4303573fc7094ce4664c5b71cd4bdb48  PyXB-1.2.6.tar.gz
-sha256  2a00f38dd1d87b88f92d79bc5a09718d730419b88e814545f472bbd5a3bf27b4  PyXB-1.2.6.tar.gz
-sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-pyxb/python-pyxb.mk b/package/python-pyxb/python-pyxb.mk
deleted file mode 100644
index 6af10b51e7..0000000000
--- a/package/python-pyxb/python-pyxb.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# python-pyxb
-#
-################################################################################
-
-PYTHON_PYXB_VERSION = 1.2.6
-PYTHON_PYXB_SOURCE = PyXB-$(PYTHON_PYXB_VERSION).tar.gz
-PYTHON_PYXB_SITE = https://pypi.python.org/packages/e3/09/4fdb190ea2b7cb43d6d3e745276ee69f4d6181be70fcbfda7df3c5f72f0e
-PYTHON_PYXB_LICENSE = Apache-2.0
-PYTHON_PYXB_LICENSE_FILES = LICENSE
-PYTHON_PYXB_SETUP_TYPE = distutils
-
-$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
