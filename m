Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3340C433F5
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 20:34:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BD7A60F9D
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 20:34:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6BD7A60F9D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 421958336D;
	Thu,  7 Oct 2021 20:34:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TSaS6KIzPdID; Thu,  7 Oct 2021 20:34:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B56983123;
	Thu,  7 Oct 2021 20:34:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1FCB21BF9C2
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 20:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0DD2C606FA
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 20:34:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J20AfjTWFKyW for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 20:34:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FA6660606
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 20:34:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 45E72934EA; Thu,  7 Oct 2021 20:31:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 7 Oct 2021 22:32:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cd5dc168e958a24cf3777d3936b3c69ce5f536b4
X-Git-Newrev: 24d608d27bd9ca656ef911ff791cd976bffffebb
X-Patchwork-Hint: ignore
Message-Id: <20211007203127.45E72934EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-meld3: drop package
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

commit: https://git.buildroot.net/buildroot/commit/?id=24d608d27bd9ca656ef911ff791cd976bffffebb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This project isn't maintained anymore:
https://github.com/Supervisor/meld3/commit/ed4e7b30eeae9e03170f388f5c6fc31aac21bf7d

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
[Peter: add Config.in.legacy entry]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                       |  7 +++++++
 package/Config.in                      |  1 -
 package/python-meld3/Config.in         |  8 --------
 package/python-meld3/python-meld3.hash |  6 ------
 package/python-meld3/python-meld3.mk   | 14 --------------
 5 files changed, 7 insertions(+), 29 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 9f1f7687fb..06bd962d9b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2021.11"
 
+config BR2_PACKAGE_PYTHON_MELD3
+	bool "python-meld3 package removed"
+	select BR2_LEGACY
+	help
+	  This package has been removed as it is unmaintained since
+	  April 2020.
+
 config BR2_PACKAGE_STRONGSWAN_EAP
 	bool "strongswan EAP plugins now individually selectable"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 2f83c87582..9fed0ab4cb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1073,7 +1073,6 @@ menu "External python modules"
 	source "package/python-markupsafe/Config.in"
 	source "package/python-matplotlib/Config.in"
 	source "package/python-mbstrdecoder/Config.in"
-	source "package/python-meld3/Config.in"
 	source "package/python-mimeparse/Config.in"
 	source "package/python-mistune/Config.in"
 	source "package/python-modbus-tk/Config.in"
diff --git a/package/python-meld3/Config.in b/package/python-meld3/Config.in
deleted file mode 100644
index 9366b3cda5..0000000000
--- a/package/python-meld3/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_PYTHON_MELD3
-	bool "python-meld3"
-	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3
-	help
-	  A HTML/XML templating system.
-
-	  https://github.com/supervisor/meld3
diff --git a/package/python-meld3/python-meld3.hash b/package/python-meld3/python-meld3.hash
deleted file mode 100644
index 69b303e60e..0000000000
--- a/package/python-meld3/python-meld3.hash
+++ /dev/null
@@ -1,6 +0,0 @@
-# md5, sha256 from https://pypi.org/pypi/meld3/json
-md5  1add16caefc9e6b82ef4f40532cb4918  meld3-2.0.1.tar.gz
-sha256  3ea266994f1aa83507679a67b493b852c232a7905e29440a6b868558cad5e775  meld3-2.0.1.tar.gz
-# Locally computed sha256 checksums
-sha256  5fe11cd858707131b6ec1338b5c2cd68dd1fdb875e3ec967149bc6fea858ecec  LICENSE.txt
-sha256  2422945b49554688d529e1f8d4ac6e0ab77a817e8889158e1e56cf963ecf5c4d  COPYRIGHT.txt
diff --git a/package/python-meld3/python-meld3.mk b/package/python-meld3/python-meld3.mk
deleted file mode 100644
index c7973d9c71..0000000000
--- a/package/python-meld3/python-meld3.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# python-meld3
-#
-################################################################################
-
-PYTHON_MELD3_VERSION = 2.0.1
-PYTHON_MELD3_SOURCE = meld3-$(PYTHON_MELD3_VERSION).tar.gz
-PYTHON_MELD3_SITE = https://files.pythonhosted.org/packages/53/af/5b8b67d04a36980de03505446d35db39c7b2a01b9bac1cb673434769ddb8
-PYTHON_MELD3_LICENSE = ZPL-2.1
-PYTHON_MELD3_LICENSE_FILES = COPYRIGHT.txt LICENSE.txt
-PYTHON_MELD3_SETUP_TYPE = setuptools
-
-$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
