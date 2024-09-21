Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C169CF9C64
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 21:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCA66608E0;
	Sat, 21 Sep 2024 21:10:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ad4TUz-DJy6T; Sat, 21 Sep 2024 21:10:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92C0861601
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92C0861601;
	Sat, 21 Sep 2024 21:10:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 15E2E1BF473
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 21:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F97C60606
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 21:07:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g1-fytHpHTXF for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 21:07:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2B946075A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2B946075A
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 21:07:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BCB3E84150; Sat, 21 Sep 2024 21:07:42 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 22:53:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 805b820a5ab4a78ee3b18f11e15d506a49274c4f
X-Git-Newrev: f408d01c97650a19fff1ffad3c8253dced257afa
X-Patchwork-Hint: ignore
Message-Id: <20240921210742.BCB3E84150@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pylibfdt: bump to version
 1.7.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=f408d01c97650a19fff1ffad3c8253dced257afa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We need to pass the --skip-dependency-check build option as we do
not provide the swig dependency as a python package but rather
as a normal installed package.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pylibfdt/python-pylibfdt.hash | 8 ++++----
 package/python-pylibfdt/python-pylibfdt.mk   | 6 ++++--
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/python-pylibfdt/python-pylibfdt.hash b/package/python-pylibfdt/python-pylibfdt.hash
index 82527e727e..38a07742b6 100644
--- a/package/python-pylibfdt/python-pylibfdt.hash
+++ b/package/python-pylibfdt/python-pylibfdt.hash
@@ -1,6 +1,6 @@
-# md5, sha256 from https://pypi.python.org/pypi/pylibfdt/json
-md5  353ee3063d0b10e94d165e032897d34e  pylibfdt-1.7.0.post1.tar.gz
-sha256  2d048f9f8ce9a0527d497f423dea1f1135f9811c05b009cc5d5753771c1f9ba1  pylibfdt-1.7.0.post1.tar.gz
-# Locally computed
+# md5, sha256 from https://pypi.org/pypi/pylibfdt/json
+md5  8b137ca636ab30a8fa10c35c419bf3ec  pylibfdt-1.7.1.tar.gz
+sha256  254224035abd85d1409bfa59967ed249103e7bcf0d3a638aea64454e2f776e97  pylibfdt-1.7.1.tar.gz
+# Locally computed sha256 checksums
 sha256  6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  BSD-2-Clause
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  GPL
diff --git a/package/python-pylibfdt/python-pylibfdt.mk b/package/python-pylibfdt/python-pylibfdt.mk
index 9591439b01..494d030288 100644
--- a/package/python-pylibfdt/python-pylibfdt.mk
+++ b/package/python-pylibfdt/python-pylibfdt.mk
@@ -4,14 +4,16 @@
 #
 ################################################################################
 
-PYTHON_PYLIBFDT_VERSION = 1.7.0.post1
+PYTHON_PYLIBFDT_VERSION = 1.7.1
 PYTHON_PYLIBFDT_SOURCE = pylibfdt-$(PYTHON_PYLIBFDT_VERSION).tar.gz
-PYTHON_PYLIBFDT_SITE = https://files.pythonhosted.org/packages/96/5c/77ef0f0459e0b13f39ecc22e21ad4ac9fbe741e8a7cd70702ac8165f80e2
+PYTHON_PYLIBFDT_SITE = https://files.pythonhosted.org/packages/1f/99/26fa7008cc0020da5c6407c48b34de21b3613232bd8875814016aec3ead5
 PYTHON_PYLIBFDT_SETUP_TYPE = pep517
 PYTHON_PYLIBFDT_LICENSE = BSD-2-Clause or GPL-2.0+
 PYTHON_PYLIBFDT_LICENSE_FILES = BSD-2-Clause GPL
 PYTHON_PYLIBFDT_DEPENDENCIES = host-python-setuptools-scm host-swig
+PYTHON_PYLIBFDT_BUILD_OPTS = --skip-dependency-check
 HOST_PYTHON_PYLIBFDT_DEPENDENCIES = host-python-setuptools-scm host-swig
+HOST_PYTHON_PYLIBFDT_BUILD_OPTS = --skip-dependency-check
 
 $(eval $(python-package))
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
