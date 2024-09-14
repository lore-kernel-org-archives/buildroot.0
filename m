Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A88CC3ABAD
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:38:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD42281E35;
	Sun, 15 Sep 2024 21:38:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vvj61T2De8LL; Sun, 15 Sep 2024 21:38:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61B4381E43
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61B4381E43;
	Sun, 15 Sep 2024 21:38:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 38BD81BF28B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E7D940A1F
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qdLkAF3XgB9C for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C331140A13
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C331140A13
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B698883685; Sun, 15 Sep 2024 21:36:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 23:55:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 358acad2af0d82c791192cd1edaf1da1f80eb00f
X-Git-Newrev: 264d3add74ffd5e1d084abace7e23bd1290daa5b
X-Patchwork-Hint: ignore
Message-Id: <20240915213637.B698883685@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-automat: bump to version
 24.8.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=264d3add74ffd5e1d084abace7e23bd1290daa5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop no longer required patch.

Drop no longer required python-six and python-attrs runtime
dependencies.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 .../0001-Remove-uneeded-dependency-to-wheel.patch  | 28 ----------------------
 package/python-automat/Config.in                   |  2 --
 package/python-automat/python-automat.hash         |  4 ++--
 package/python-automat/python-automat.mk           |  6 ++---
 5 files changed, 5 insertions(+), 36 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 49e47af4c1..fda5a92bdf 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1066,7 +1066,6 @@ package/pulseaudio/S50pulseaudio lib_sysv.ConsecutiveEmptyLines lib_sysv.EmptyLa
 package/pulseview/0001-Replace-obsolete-deprecated-Qt-methods.patch lib_patch.Upstream
 package/pulseview/0002-Fix-broken-build-due-to-C-template-behind-C-linkage.patch lib_patch.Upstream
 package/python-aiohttp-remotes/0001-Fix-flit_core-build-requires-backend.patch lib_patch.Upstream
-package/python-automat/0001-Remove-uneeded-dependency-to-wheel.patch lib_patch.Upstream
 package/python-daphne/0001-remove-pytest-runner-requirement.patch lib_patch.Upstream
 package/python-pybind/0001-pybind11-commands.py-support-STAGING_DIR.patch lib_patch.Upstream
 package/python-pylibftdi/0001-do-not-use-find-library.patch lib_patch.Upstream
diff --git a/package/python-automat/0001-Remove-uneeded-dependency-to-wheel.patch b/package/python-automat/0001-Remove-uneeded-dependency-to-wheel.patch
deleted file mode 100644
index 2be7ec6cda..0000000000
--- a/package/python-automat/0001-Remove-uneeded-dependency-to-wheel.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From d04d51d62a23370869ad466fa95b7d4ec2e0fa6e Mon Sep 17 00:00:00 2001
-From: Julien Olivain <ju.o@free.fr>
-Date: Mon, 14 Nov 2022 22:30:33 +0100
-Subject: [PATCH] Remove uneeded dependency to "wheel"
-
-Attempting to build Automat in Buildroot fails while trying
-to check for this undeeded dependency.
-
-Signed-off-by: Julien Olivain <ju.o@free.fr>
----
- setup.py | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index c2f9816..afa8012 100644
---- a/setup.py
-+++ b/setup.py
-@@ -15,7 +15,6 @@ setup(
-     packages=find_packages(exclude=[]),
-     package_dir={'automat': 'automat'},
-     setup_requires=[
--        'wheel',
-         'setuptools-scm',
-     ],
-     install_requires=[
--- 
-2.38.1
-
diff --git a/package/python-automat/Config.in b/package/python-automat/Config.in
index ee02d22b5b..7d3186f1ca 100644
--- a/package/python-automat/Config.in
+++ b/package/python-automat/Config.in
@@ -1,7 +1,5 @@
 config BR2_PACKAGE_PYTHON_AUTOMAT
 	bool "python-automat"
-	select BR2_PACKAGE_PYTHON_ATTRS # runtime
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  Self-service finite-state machines for the programmer on the
 	  go.
diff --git a/package/python-automat/python-automat.hash b/package/python-automat/python-automat.hash
index cfb16ac664..4edc9f3f09 100644
--- a/package/python-automat/python-automat.hash
+++ b/package/python-automat/python-automat.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/automat/json
-md5  b8064994239aabb172748f984489ce75  Automat-22.10.0.tar.gz
-sha256  e56beb84edad19dcc11d30e8d9b895f75deeb5ef5e96b84a467066b3b84bb04e  Automat-22.10.0.tar.gz
+md5  c023f8848366053a76f99cffba3ea34e  automat-24.8.1.tar.gz
+sha256  b34227cf63f6325b8ad2399ede780675083e439b20c323d376373d8ee6306d88  automat-24.8.1.tar.gz
 # Locally computed sha256 checksums
 sha256  b2201301678d0a937d938543827ca1360712eb34e23de8ee3f3bfffbd4c0e376  LICENSE
diff --git a/package/python-automat/python-automat.mk b/package/python-automat/python-automat.mk
index 101197b15b..85bc890fc5 100644
--- a/package/python-automat/python-automat.mk
+++ b/package/python-automat/python-automat.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AUTOMAT_VERSION = 22.10.0
-PYTHON_AUTOMAT_SOURCE = Automat-$(PYTHON_AUTOMAT_VERSION).tar.gz
-PYTHON_AUTOMAT_SITE = https://files.pythonhosted.org/packages/7a/7b/9c3d26d8a0416eefbc0428f168241b32657ca260fb7ef507596ff5c2f6c4
+PYTHON_AUTOMAT_VERSION = 24.8.1
+PYTHON_AUTOMAT_SOURCE = automat-$(PYTHON_AUTOMAT_VERSION).tar.gz
+PYTHON_AUTOMAT_SITE = https://files.pythonhosted.org/packages/8d/2d/ede4ad7fc34ab4482389fa3369d304f2fa22e50770af706678f6a332fa82
 PYTHON_AUTOMAT_SETUP_TYPE = setuptools
 PYTHON_AUTOMAT_LICENSE = MIT
 PYTHON_AUTOMAT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
