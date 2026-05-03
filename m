Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C0DDCD342F
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F80061595;
	Sun,  3 May 2026 14:51:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a4GS07NaWipx; Sun,  3 May 2026 14:51:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85A1F615E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819903;
	bh=FnjV6gAip/oHUcBAyUgWHZqC2GQGX14OGqeSCg8IxgQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=muNc1+bPWCDcPsiz9aGTXmR9gCS4NPfXoEvRdf7/fL7y4knpzJILcgbVxhZyeUTXD
	 uvYYicZmPs4Hj2EpGVk6wBD9MLMZ0sHhqe5GypKjsVuIgSmCACzihBwoQ1MRanXvL3
	 5Naq5wRK3eeQeLJgYCasT31vrNLy1RbctxKAAgUbchf0uadITJwvbOKtd4H6HmROSC
	 rt/MKwY+TbObS6dwDxo+BdxzyKbRUMkSV9LgcrpH4B71TE60ih/VCFo5ADoJbVMe2o
	 19gcRZac9pYUWBSEqAWSD7fceKRKtTLPYqLoS44ORLTLCVTgqaauGNov4W7jYg8Bnb
	 BHbhJIAJHYz5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85A1F615E1;
	Sun,  3 May 2026 14:51:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 27C4747E
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2A774072A
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qZZ_10iB2nKu for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB35D406FA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB35D406FA
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A6D1183FAE; Sun,  3 May 2026 14:50:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3330201b41a87ec7deaffbe0809707419d70241c
X-Git-Newrev: 17a9767dcd391902bb5db72ce03ee336c454af9d
X-Patchwork-Hint: ignore
Message-Id: <20260503145050.A6D1183FAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-unittest-xml-reporting:
 bump version to 4.0.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/17a9767dcd391902bb5db72ce03ee336c454af9d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/xmlrunner/unittest-xml-reporting/releases/tag/4.0.0

Added dependency to host-python-setuptools-scm and removed patch which
is not needed anymore due to the removal of setup.py in upstream commit
https://github.com/xmlrunner/unittest-xml-reporting/commit/63519096e5fec64b888831bce60dbdb02a66a910

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...op-data_files-installs-LICENSE-to-incorre.patch | 40 ----------------------
 .../python-unittest-xml-reporting.hash             |  4 +--
 .../python-unittest-xml-reporting.mk               |  7 ++--
 3 files changed, 6 insertions(+), 45 deletions(-)

diff --git a/package/python-unittest-xml-reporting/0001-setup.py-drop-data_files-installs-LICENSE-to-incorre.patch b/package/python-unittest-xml-reporting/0001-setup.py-drop-data_files-installs-LICENSE-to-incorre.patch
deleted file mode 100644
index 4bc005f448..0000000000
--- a/package/python-unittest-xml-reporting/0001-setup.py-drop-data_files-installs-LICENSE-to-incorre.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 662cd67695c31126d72035a818b0f5f1da5a31ca Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sat, 17 Aug 2024 12:24:28 +0200
-Subject: [PATCH] setup.py: drop data_files, installs LICENSE to incorrect
- place
-
-As reported in issue
-https://github.com/xmlrunner/unittest-xml-reporting/issues/284, the
-data_files statement in the setup() calls installs the LICENSE file in
-the wrong place: in /usr/LICENSE, or even /LICENSE depending on the
-configuration.
-
-So let's drop this, and let setuptools install the LICENSE file
-automatically: since setuptools v56, the license_files attribute is
-automatically assigned to a default value, which includes "LICENSE",
-so there is in fact nothing to do to the get the LICENSE file
-installed at the correct location. See
-https://setuptools.pypa.io/en/latest/history.html#v56-0-0.
-
-Upstream: https://github.com/xmlrunner/unittest-xml-reporting/pull/287
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- setup.py | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index c524ed4..afa5925 100755
---- a/setup.py
-+++ b/setup.py
-@@ -27,7 +27,6 @@ setup(
-     description = 'unittest-based test runner with Ant/JUnit like XML reporting.',
-     long_description = long_description,
-     long_description_content_type = 'text/markdown',
--    data_files = [('', ['LICENSE'])],
-     install_requires = ['lxml'],
-     license = 'BSD',
-     platforms = ['Any'],
--- 
-2.46.0
-
diff --git a/package/python-unittest-xml-reporting/python-unittest-xml-reporting.hash b/package/python-unittest-xml-reporting/python-unittest-xml-reporting.hash
index 674a533e6a..753c5ef0cb 100644
--- a/package/python-unittest-xml-reporting/python-unittest-xml-reporting.hash
+++ b/package/python-unittest-xml-reporting/python-unittest-xml-reporting.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/unittest-xml-reporting/json
-md5  f12aeab63ff44e295526e103313d66c8  unittest-xml-reporting-3.2.0.tar.gz
-sha256  edd8d3170b40c3a81b8cf910f46c6a304ae2847ec01036d02e9c0f9b85762d28  unittest-xml-reporting-3.2.0.tar.gz
+md5  fe1f9cceab8940e22d8d2bc968098597  unittest_xml_reporting-4.0.0.tar.gz
+sha256  bfa1ed65e9e6f33c161d04470d89050458cfb65a5a5d0358834ef7ce037d9136  unittest_xml_reporting-4.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  0596648105bee470f9cafd62753b931efe52392096439d88e2564cf7d7cf0e68  LICENSE
diff --git a/package/python-unittest-xml-reporting/python-unittest-xml-reporting.mk b/package/python-unittest-xml-reporting/python-unittest-xml-reporting.mk
index 05bbed79a8..364099f707 100644
--- a/package/python-unittest-xml-reporting/python-unittest-xml-reporting.mk
+++ b/package/python-unittest-xml-reporting/python-unittest-xml-reporting.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-PYTHON_UNITTEST_XML_REPORTING_VERSION = 3.2.0
-PYTHON_UNITTEST_XML_REPORTING_SOURCE = unittest-xml-reporting-$(PYTHON_UNITTEST_XML_REPORTING_VERSION).tar.gz
-PYTHON_UNITTEST_XML_REPORTING_SITE = https://files.pythonhosted.org/packages/ed/40/3bf1afc96e93c7322520981ac4593cbb29daa21b48d32746f05ab5563dca
+PYTHON_UNITTEST_XML_REPORTING_VERSION = 4.0.0
+PYTHON_UNITTEST_XML_REPORTING_SOURCE = unittest_xml_reporting-$(PYTHON_UNITTEST_XML_REPORTING_VERSION).tar.gz
+PYTHON_UNITTEST_XML_REPORTING_SITE = https://files.pythonhosted.org/packages/42/6b/5847d0e6e95d08e056f23b3f8cd95bede2d3ade10a1c1a9d5b50916454e1
+PYTHON_UNITTEST_XML_REPORTING_DEPENDENCIES = host-python-setuptools-scm
 PYTHON_UNITTEST_XML_REPORTING_SETUP_TYPE = setuptools
 PYTHON_UNITTEST_XML_REPORTING_LICENSE = BSD-2-Clause
 PYTHON_UNITTEST_XML_REPORTING_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
