Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40CADC433FE
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 19:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D54016FC67;
	Thu, 13 Jan 2022 19:43:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SeAuJkpJ_Hal; Thu, 13 Jan 2022 19:43:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 169106FC60;
	Thu, 13 Jan 2022 19:43:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C67831BF5B3
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 19:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4B2441642
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 19:43:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RyluCltWt2G9 for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 19:43:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F1CD9404CA
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 19:43:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id BCBCD8356E; Thu, 13 Jan 2022 19:37:13 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 13 Jan 2022 20:43:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b4e3ef223f72f035f4bf84cba85f0d0b924bf937
X-Git-Newrev: eee3a1ed92f47d833fe620b1e28cdbc35f5b1ae8
X-Patchwork-Hint: ignore
Message-Id: <20220113193713.BCBCD8356E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-hyperframe: bump to version
 6.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=eee3a1ed92f47d833fe620b1e28cdbc35f5b1ae8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update site in Config.in
- python 2.7 support has been dropped since version 6.0.0
- Update indentation in hash file (two spaces)

https://github.com/python-hyper/hyperframe/blob/v6.0.1/CHANGELOG.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-hyperframe/Config.in              | 3 ++-
 package/python-hyperframe/python-hyperframe.hash | 6 +++---
 package/python-hyperframe/python-hyperframe.mk   | 4 ++--
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-hyperframe/Config.in b/package/python-hyperframe/Config.in
index f3318a20e2..30457fe86e 100644
--- a/package/python-hyperframe/Config.in
+++ b/package/python-hyperframe/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_HYPERFRAME
 	bool "python-hyperframe"
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  HTTP/2 framing layer for Python.
 
-	  http://hyper.rtfd.org
+	  https://github.com/python-hyper/hyperframe/
diff --git a/package/python-hyperframe/python-hyperframe.hash b/package/python-hyperframe/python-hyperframe.hash
index 3e686a4aa2..b39ab51a72 100644
--- a/package/python-hyperframe/python-hyperframe.hash
+++ b/package/python-hyperframe/python-hyperframe.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/hyperframe/json
-md5	6919183242feb26d8bce3b4cba81defd  hyperframe-5.2.0.tar.gz
-sha256	a9f5c17f2cc3c719b917c4f33ed1c61bd1f8dfac4b1bd23b7c80b3400971b41f  hyperframe-5.2.0.tar.gz
+md5  153c064e8ac654aaf136b3388c36de48  hyperframe-6.0.1.tar.gz
+sha256  ae510046231dc8e9ecb1a6586f63d2347bf4c8905914aa84ba585ae85f28a914  hyperframe-6.0.1.tar.gz
 # Locally computed sha256 checksums
-sha256	763a9342a04df62046c9dc748a5287934eb0a5331c6863b3ca0aee20e18cb4ed  LICENSE
+sha256  763a9342a04df62046c9dc748a5287934eb0a5331c6863b3ca0aee20e18cb4ed  LICENSE
diff --git a/package/python-hyperframe/python-hyperframe.mk b/package/python-hyperframe/python-hyperframe.mk
index 7640ade5fd..4b13ca51a3 100644
--- a/package/python-hyperframe/python-hyperframe.mk
+++ b/package/python-hyperframe/python-hyperframe.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HYPERFRAME_VERSION = 5.2.0
+PYTHON_HYPERFRAME_VERSION = 6.0.1
 PYTHON_HYPERFRAME_SOURCE = hyperframe-$(PYTHON_HYPERFRAME_VERSION).tar.gz
-PYTHON_HYPERFRAME_SITE = https://files.pythonhosted.org/packages/e6/7f/9a4834af1010dc1d570d5f394dfd9323a7d7ada7d25586bd299fc4cb0356
+PYTHON_HYPERFRAME_SITE = https://files.pythonhosted.org/packages/5a/2a/4747bff0a17f7281abe73e955d60d80aae537a5d203f417fa1c2e7578ebb
 PYTHON_HYPERFRAME_SETUP_TYPE = setuptools
 PYTHON_HYPERFRAME_LICENSE = MIT
 PYTHON_HYPERFRAME_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
