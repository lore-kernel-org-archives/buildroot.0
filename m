Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD47D10376
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 21:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C989B811FF;
	Thu, 24 Oct 2024 21:09:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZUv80Mv00Ylj; Thu, 24 Oct 2024 21:09:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A117A81497
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A117A81497;
	Thu, 24 Oct 2024 21:09:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 24A5D2316
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 21:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09521404D8
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 21:09:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CNUf3r_PCkNG for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 21:09:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E50D7404E9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E50D7404E9
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 21:09:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D032483774; Thu, 24 Oct 2024 21:09:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Oct 2024 23:08:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 39f5e3adf8763981eeedb5bf8deb0b58344c16e8
X-Git-Newrev: d49813e762a4ac6a4cf4e219f9d7fbeb4aa93a85
X-Patchwork-Hint: ignore
Message-Id: <20241024210918.D032483774@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pysnmp: bump to version
 7.1.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=d49813e762a4ac6a4cf4e219f9d7fbeb4aa93a85
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop no longer required python-pysnmpcrypto runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pysnmp/Config.in          | 2 --
 package/python-pysnmp/python-pysnmp.hash | 4 ++--
 package/python-pysnmp/python-pysnmp.mk   | 4 ++--
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/python-pysnmp/Config.in b/package/python-pysnmp/Config.in
index 0840a464e3..0c63b57931 100644
--- a/package/python-pysnmp/Config.in
+++ b/package/python-pysnmp/Config.in
@@ -1,9 +1,7 @@
 config BR2_PACKAGE_PYTHON_PYSNMP
 	bool "python-pysnmp"
-	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-pysnmpcrypto
 	select BR2_PACKAGE_PYTHON_PYASN1 # runtime
 	select BR2_PACKAGE_PYTHON_PYSMI # runtime
-	select BR2_PACKAGE_PYTHON_PYSNMPCRYPTO # runtime
 	help
 	  PySNMP is a cross-platform, pure-Python SNMP engine
 	  implementation.
diff --git a/package/python-pysnmp/python-pysnmp.hash b/package/python-pysnmp/python-pysnmp.hash
index 9136d23a14..4e1df1e4ed 100644
--- a/package/python-pysnmp/python-pysnmp.hash
+++ b/package/python-pysnmp/python-pysnmp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pysnmp/json
-md5  527c09f53ea7c28963e55b4c4b483ec2  pysnmp-7.1.3.tar.gz
-sha256  29853e4daca82992ae8b1932a4e32e1ec9df8234905b6d594d43773bdc72c4b4  pysnmp-7.1.3.tar.gz
+md5  9d1ba65a734a613e68d616f3f4c24b6f  pysnmp-7.1.4.tar.gz
+sha256  4ec7fd78cb7437ad64644108dea603cad8e49f065da3dd3e0539dda68bad320c  pysnmp-7.1.4.tar.gz
 # Locally computed sha256 checksums
 sha256  4954453957449b5e6f797d070f4d91024dceb3e056c99d72350795b71db0fc70  LICENSE.rst
diff --git a/package/python-pysnmp/python-pysnmp.mk b/package/python-pysnmp/python-pysnmp.mk
index 5db86bc976..78f9eeb930 100644
--- a/package/python-pysnmp/python-pysnmp.mk
+++ b/package/python-pysnmp/python-pysnmp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYSNMP_VERSION = 7.1.3
+PYTHON_PYSNMP_VERSION = 7.1.4
 PYTHON_PYSNMP_SOURCE = pysnmp-$(PYTHON_PYSNMP_VERSION).tar.gz
-PYTHON_PYSNMP_SITE = https://files.pythonhosted.org/packages/f3/0c/bb2ccb587b5e79036dd83aa5fe835c2bc460a3098c4060461e9d324c6670
+PYTHON_PYSNMP_SITE = https://files.pythonhosted.org/packages/43/71/18a9d8c00efba166b66408040028f25a8ea20d2acc9cd89bd780369544b1
 PYTHON_PYSNMP_SETUP_TYPE = pep517
 PYTHON_PYSNMP_LICENSE = BSD-2-Clause
 PYTHON_PYSNMP_LICENSE_FILES = LICENSE.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
