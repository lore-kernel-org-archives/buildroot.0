Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5877CF9C6C
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 18:04:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E15324052F;
	Sun, 22 Sep 2024 18:04:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KIhA3Ph_2g_8; Sun, 22 Sep 2024 18:04:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A0A240480
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A0A240480;
	Sun, 22 Sep 2024 18:04:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 658521BF44A
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 18:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61E07606B1
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 18:04:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pV7515mvdPrs for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 18:04:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AE4A605C2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AE4A605C2
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 18:04:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B70E83459; Sun, 22 Sep 2024 18:04:47 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 18:50:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 143b6331a9bffd9264794867c0c21aaf148242d7
X-Git-Newrev: d33b4a9bc9d70d3a51cdc70844d50b72f831fcfd
X-Patchwork-Hint: ignore
Message-Id: <20240922180447.0B70E83459@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pysnmp: bump to version
 7.1.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=d33b4a9bc9d70d3a51cdc70844d50b72f831fcfd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to date update:
https://github.com/lextudio/pysnmp/commit/fa9909cbbf9b25eb992a945715e2511a2ba2c905

Update license from BSD-3-Clause to BSD-2-Clause, the license
changed in 8122a1d85b6cc9f2adcb1243521c04ba4cae0510 but the commit
incorrectly indicated "no content changed" when updating the hash.

Add new python-pysnmpcrypto runtime dependency.

Drop no longer required python-pycryptodomex runtime dependency.

Migrate from setuptools to poetry build backend.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[yann.morin.1998@free.fr:
  - only list first-level dependency in rust arch support comment
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pysnmp/Config.in          | 5 +++--
 package/python-pysnmp/python-pysnmp.hash | 6 +++---
 package/python-pysnmp/python-pysnmp.mk   | 9 +++++----
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/package/python-pysnmp/Config.in b/package/python-pysnmp/Config.in
index a034b16852..0840a464e3 100644
--- a/package/python-pysnmp/Config.in
+++ b/package/python-pysnmp/Config.in
@@ -1,8 +1,9 @@
 config BR2_PACKAGE_PYTHON_PYSNMP
 	bool "python-pysnmp"
-	select BR2_PACKAGE_PYTHON_PYSMI # runtime
-	select BR2_PACKAGE_PYTHON_PYCRYPTODOMEX # runtime
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-pysnmpcrypto
 	select BR2_PACKAGE_PYTHON_PYASN1 # runtime
+	select BR2_PACKAGE_PYTHON_PYSMI # runtime
+	select BR2_PACKAGE_PYTHON_PYSNMPCRYPTO # runtime
 	help
 	  PySNMP is a cross-platform, pure-Python SNMP engine
 	  implementation.
diff --git a/package/python-pysnmp/python-pysnmp.hash b/package/python-pysnmp/python-pysnmp.hash
index 3b0af1af62..9136d23a14 100644
--- a/package/python-pysnmp/python-pysnmp.hash
+++ b/package/python-pysnmp/python-pysnmp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pysnmp/json
-md5  2222880259daf6e2cb322e938c818276  pysnmp-4.4.12.tar.gz
-sha256  0c3dbef2f958caca96071fe5c19de43e9c1b0484ab02a0cf08b190bcee768ba9  pysnmp-4.4.12.tar.gz
+md5  527c09f53ea7c28963e55b4c4b483ec2  pysnmp-7.1.3.tar.gz
+sha256  29853e4daca82992ae8b1932a4e32e1ec9df8234905b6d594d43773bdc72c4b4  pysnmp-7.1.3.tar.gz
 # Locally computed sha256 checksums
-sha256  d0b2edd772164395320fc5ad7dfaa9806fa038fb29762b347c549891d7a79237  LICENSE.rst
+sha256  4954453957449b5e6f797d070f4d91024dceb3e056c99d72350795b71db0fc70  LICENSE.rst
diff --git a/package/python-pysnmp/python-pysnmp.mk b/package/python-pysnmp/python-pysnmp.mk
index 520ce2877a..5db86bc976 100644
--- a/package/python-pysnmp/python-pysnmp.mk
+++ b/package/python-pysnmp/python-pysnmp.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_PYSNMP_VERSION = 4.4.12
+PYTHON_PYSNMP_VERSION = 7.1.3
 PYTHON_PYSNMP_SOURCE = pysnmp-$(PYTHON_PYSNMP_VERSION).tar.gz
-PYTHON_PYSNMP_SITE = https://files.pythonhosted.org/packages/4e/75/72f64c451bf5884715f84f8217b69b4025da0b67628d611cd14a5b7db217
-PYTHON_PYSNMP_SETUP_TYPE = setuptools
-PYTHON_PYSNMP_LICENSE = BSD-3-Clause
+PYTHON_PYSNMP_SITE = https://files.pythonhosted.org/packages/f3/0c/bb2ccb587b5e79036dd83aa5fe835c2bc460a3098c4060461e9d324c6670
+PYTHON_PYSNMP_SETUP_TYPE = pep517
+PYTHON_PYSNMP_LICENSE = BSD-2-Clause
 PYTHON_PYSNMP_LICENSE_FILES = LICENSE.rst
+PYTHON_PYSNMP_DEPENDENCIES = host-python-poetry-core
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
