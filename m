Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE7AC3ABAD
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 772DE84797;
	Sun, 15 Sep 2024 21:39:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mwsc7geXbg5U; Sun, 15 Sep 2024 21:39:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E39C8478A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E39C8478A;
	Sun, 15 Sep 2024 21:39:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 85D711BF28B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D17FA608CB
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0hyYAYWyI-OS for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21C3D6089A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21C3D6089A
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1D640835CD; Sun, 15 Sep 2024 21:36:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 10:02:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9d713d2b7adf77954787ec66c19be773bf2a9621
X-Git-Newrev: b93a35dcef85e8e3d0e3471862e3f32903da6db0
X-Patchwork-Hint: ignore
Message-Id: <20240915213639.1D640835CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-daphne: bump to version
 4.1.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=b93a35dcef85e8e3d0e3471862e3f32903da6db0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop remove pytest runner patch and instead pass
--skip-dependency-check build option.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 .../0001-remove-pytest-runner-requirement.patch    | 27 ----------------------
 package/python-daphne/python-daphne.hash           |  4 ++--
 package/python-daphne/python-daphne.mk             |  5 ++--
 4 files changed, 5 insertions(+), 32 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index fda5a92bdf..c24b94a794 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1066,7 +1066,6 @@ package/pulseaudio/S50pulseaudio lib_sysv.ConsecutiveEmptyLines lib_sysv.EmptyLa
 package/pulseview/0001-Replace-obsolete-deprecated-Qt-methods.patch lib_patch.Upstream
 package/pulseview/0002-Fix-broken-build-due-to-C-template-behind-C-linkage.patch lib_patch.Upstream
 package/python-aiohttp-remotes/0001-Fix-flit_core-build-requires-backend.patch lib_patch.Upstream
-package/python-daphne/0001-remove-pytest-runner-requirement.patch lib_patch.Upstream
 package/python-pybind/0001-pybind11-commands.py-support-STAGING_DIR.patch lib_patch.Upstream
 package/python-pylibftdi/0001-do-not-use-find-library.patch lib_patch.Upstream
 package/python-pyqt5/0001-configure-skip-qtdetail.patch lib_patch.Upstream
diff --git a/package/python-daphne/0001-remove-pytest-runner-requirement.patch b/package/python-daphne/0001-remove-pytest-runner-requirement.patch
deleted file mode 100644
index 70cdb4f19d..0000000000
--- a/package/python-daphne/0001-remove-pytest-runner-requirement.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From f9d881cc55c89f51240f93308713216cfec793eb Mon Sep 17 00:00:00 2001
-From: Adam Duskett <Aduskett@gmail.com>
-Date: Sat, 3 Aug 2019 14:23:19 -0400
-Subject: [PATCH] remove pytest-runner requirement
-
-Setup does not actually require pytest-runner. As such, remove it.
-
-Signed-off-by: Adam Duskett <Aduskett@gmail.com>
----
- setup.py | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index 64e94f1..4e3abb0 100755
---- a/setup.py
-+++ b/setup.py
-@@ -23,7 +23,6 @@ setup(
-     include_package_data=True,
-     install_requires=["twisted[tls]>=22.4", "autobahn>=22.4.2", "asgiref>=3.5.2,<4"],
-     python_requires=">=3.7",
--    setup_requires=["pytest-runner"],
-     extras_require={"tests": ["hypothesis", "pytest", "pytest-asyncio", "django"]},
-     entry_points={
-         "console_scripts": ["daphne = daphne.cli:CommandLineInterface.entrypoint"]
--- 
-2.21.0
-
diff --git a/package/python-daphne/python-daphne.hash b/package/python-daphne/python-daphne.hash
index 90d053bff6..194b73a0e4 100644
--- a/package/python-daphne/python-daphne.hash
+++ b/package/python-daphne/python-daphne.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/daphne/json
-md5  f0dcc0618459ad7d25508704f9505b56  daphne-4.0.0.tar.gz
-sha256  cce9afc8f49a4f15d4270b8cfb0e0fe811b770a5cc795474e97e4da287497666  daphne-4.0.0.tar.gz
+md5  6a00ce30210105fcd0f756d4dc5505f9  daphne-4.1.2.tar.gz
+sha256  fcbcace38eb86624ae247c7ffdc8ac12f155d7d19eafac4247381896d6f33761  daphne-4.1.2.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-daphne/python-daphne.mk b/package/python-daphne/python-daphne.mk
index c08088278e..097a195821 100644
--- a/package/python-daphne/python-daphne.mk
+++ b/package/python-daphne/python-daphne.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-PYTHON_DAPHNE_VERSION = 4.0.0
+PYTHON_DAPHNE_VERSION = 4.1.2
 PYTHON_DAPHNE_SOURCE = daphne-$(PYTHON_DAPHNE_VERSION).tar.gz
-PYTHON_DAPHNE_SITE = https://files.pythonhosted.org/packages/d7/77/57b19d5caabf8537879aa4cf3a017b99d0b727f2521ffca7fd9140573509
+PYTHON_DAPHNE_SITE = https://files.pythonhosted.org/packages/1a/c1/aedf180beb12395835cba791ce7239b8880009d9d37564d72b7590cde605
 PYTHON_DAPHNE_SETUP_TYPE = setuptools
 # https://github.com/django/daphne/blob/master/LICENSE
 PYTHON_DAPHNE_LICENSE = BSD-3-Clause
 PYTHON_DAPHNE_LICENSE_FILES = LICENSE
+PYTHON_DAPHNE_BUILD_OPTS = --skip-dependency-check
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
