Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17328C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C15D48297F;
	Wed,  9 Feb 2022 21:54:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sFDGjI0G3HAo; Wed,  9 Feb 2022 21:54:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6EBE8294A;
	Wed,  9 Feb 2022 21:54:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 57AB21BF2F0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4DC2260E5F
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3o5yhMOxUr-o for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BADB60FF7
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 9AEF18323C; Wed,  9 Feb 2022 21:26:02 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:13:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: da9233cee3c93a7e903794008f35e87839aed746
X-Git-Newrev: e990a926797edadb6b0e8b94c85b9d52a79f47ae
X-Patchwork-Hint: ignore
Message-Id: <20220209212602.9AEF18323C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ipaddress: drop python2
 specific package
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

commit: https://git.buildroot.net/buildroot/commit/?id=e990a926797edadb6b0e8b94c85b9d52a79f47ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                               |  6 ++++++
 package/Config.in                              |  1 -
 package/python-ipaddress/Config.in             |  7 -------
 package/python-ipaddress/python-ipaddress.hash |  5 -----
 package/python-ipaddress/python-ipaddress.mk   | 14 --------------
 5 files changed, 6 insertions(+), 27 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index c78fb20756..14b26408fe 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_PACKAGE_PYTHON_IPADDRESS
+	bool "python-ipaddress removed"
+	select BR2_LEGACY
+	help
+	  Package was removed together with python 2.7 support.
+
 config BR2_PACKAGE_PYTHON_IPADDR
 	bool "python-ipaddr removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 611a8f6aa8..50c0e13510 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1058,7 +1058,6 @@ menu "External python modules"
 	source "package/python-iniparse/Config.in"
 	source "package/python-intelhex/Config.in"
 	source "package/python-iowait/Config.in"
-	source "package/python-ipaddress/Config.in"
 	source "package/python-ipdb/Config.in"
 	source "package/python-iptables/Config.in"
 	source "package/python-ipy/Config.in"
diff --git a/package/python-ipaddress/Config.in b/package/python-ipaddress/Config.in
deleted file mode 100644
index b2b9f0b1c3..0000000000
--- a/package/python-ipaddress/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_PYTHON_IPADDRESS
-	bool "python-ipaddress"
-	depends on BR2_PACKAGE_PYTHON
-	help
-	  Python 3.3's ipaddress for older Python versions.
-
-	  https://github.com/phihag/ipaddress
diff --git a/package/python-ipaddress/python-ipaddress.hash b/package/python-ipaddress/python-ipaddress.hash
deleted file mode 100644
index e61835e192..0000000000
--- a/package/python-ipaddress/python-ipaddress.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# md5, sha256 from https://pypi.org/pypi/ipaddress/json
-md5	aaee67a8026782af1831148beb0d9060  ipaddress-1.0.23.tar.gz
-sha256	b7f8e0369580bb4a24d5ba1d7cc29660a4a6987763faf1d8a8046830e020e7e2  ipaddress-1.0.23.tar.gz
-# Locally computed sha256 checksums
-sha256	38675419eb4a79ec616396d70f1254b3a433fb7088fb3f4cc9b6c0bcdcec6162  LICENSE
diff --git a/package/python-ipaddress/python-ipaddress.mk b/package/python-ipaddress/python-ipaddress.mk
deleted file mode 100644
index 8f1ad5ffc7..0000000000
--- a/package/python-ipaddress/python-ipaddress.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# python-ipaddress
-#
-################################################################################
-
-PYTHON_IPADDRESS_VERSION = 1.0.23
-PYTHON_IPADDRESS_SOURCE = ipaddress-$(PYTHON_IPADDRESS_VERSION).tar.gz
-PYTHON_IPADDRESS_SITE = https://files.pythonhosted.org/packages/b9/9a/3e9da40ea28b8210dd6504d3fe9fe7e013b62bf45902b458d1cdc3c34ed9
-PYTHON_IPADDRESS_LICENSE = Python-2.0
-PYTHON_IPADDRESS_LICENSE_FILES = LICENSE
-PYTHON_IPADDRESS_SETUP_TYPE = setuptools
-
-$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
