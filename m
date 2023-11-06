Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2726C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 989A2402A2;
	Mon,  6 Nov 2023 22:24:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 989A2402A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KINrbFlwXjqR; Mon,  6 Nov 2023 22:24:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82C0040155;
	Mon,  6 Nov 2023 22:24:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82C0040155
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 604DE1BF271
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78ECD612C7
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:20:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78ECD612C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PlPZVNDdbiUo for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:20:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4127A612C2
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:20:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4127A612C2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2943686B7B; Mon,  6 Nov 2023 22:20:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 23:15:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 285b10cb80dc4b5de001a43f62da771a27a104be
X-Git-Newrev: 7e5958d07774f02b4360f04a4e373a76f0b9a011
X-Patchwork-Hint: ignore
Message-Id: <20231106222017.2943686B7B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-dnspython: bump to version
 2.4.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=7e5958d07774f02b4360f04a4e373a76f0b9a011
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch which is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 ...01-Remove-spurious-wheel-build-dependency.patch | 29 ----------------------
 package/python-dnspython/python-dnspython.hash     |  4 +--
 package/python-dnspython/python-dnspython.mk       |  4 +--
 4 files changed, 4 insertions(+), 34 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 8b591e5276..2feecbcb73 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1123,7 +1123,6 @@ package/python-crossbar/0001-Avoid-intentional-syntax-error.patch Upstream
 package/python-crossbar/0002-requirements-min.txt-drop-indirect-dependencies.patch Upstream
 package/python-crossbar/0003-crossbar-webservice-wap-use-markupsafe-instead-of-we.patch Upstream
 package/python-daphne/0001-remove-pytest-runner-requirement.patch Upstream
-package/python-dnspython/0001-Remove-spurious-wheel-build-dependency.patch Upstream
 package/python-m2crypto/0001-Mitigate-the-Bleichenbacher-timing-attacks-in-the-RSA-decryption-API-CVE-2020-25657.patch Upstream
 package/python-pybind/0001-pybind11-commands.py-support-STAGING_DIR.patch Upstream
 package/python-pylibftdi/0001-do-not-use-find-library.patch Upstream
diff --git a/package/python-dnspython/0001-Remove-spurious-wheel-build-dependency.patch b/package/python-dnspython/0001-Remove-spurious-wheel-build-dependency.patch
deleted file mode 100644
index b43217edad..0000000000
--- a/package/python-dnspython/0001-Remove-spurious-wheel-build-dependency.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 53b989e4ce32c941d748ad33502600497595914a Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Wed, 2 Nov 2022 14:01:58 -0600
-Subject: [PATCH] Remove spurious wheel build dependency
-
-Wheel isn't a build dependency so it shouldn't be in setup_requires.
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[james.hilliard1@gmail.com: backport from upstream commit
-53b989e4ce32c941d748ad33502600497595914a]
----
- setup.cfg | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/setup.cfg b/setup.cfg
-index 0abd270..2cb3e06 100644
---- a/setup.cfg
-+++ b/setup.cfg
-@@ -46,7 +46,7 @@ packages =
-     dns.rdtypes.CH
- python_requires = >=3.7
- test_suite = tests
--setup_requires = setuptools>=44; wheel; setuptools_scm[toml]>=3.4.3
-+setup_requires = setuptools>=44; setuptools_scm[toml]>=3.4.3
- 
- [options.extras_require]
- DOH = httpx>=0.21.1; h2>=4.1.0; requests; requests-toolbelt
--- 
-2.34.1
-
diff --git a/package/python-dnspython/python-dnspython.hash b/package/python-dnspython/python-dnspython.hash
index 29441b41ea..77ffb5dedc 100644
--- a/package/python-dnspython/python-dnspython.hash
+++ b/package/python-dnspython/python-dnspython.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dnspython/json
-md5  c7172f4115cd7b60fd5037cfcd8f9408  dnspython-2.2.1.tar.gz
-sha256  0f7569a4a6ff151958b64304071d370daa3243d15941a7beedf0c9fe5105603e  dnspython-2.2.1.tar.gz
+md5  fac4e1580e5e9dfee722cb97bc073722  dnspython-2.4.2.tar.gz
+sha256  8dcfae8c7460a2f84b4072e26f1c9f4101ca20c071649cb7c34e8b6a93d58984  dnspython-2.4.2.tar.gz
 # Locally computed sha256 checksums
 sha256  c3ea3ff5654b329c19d3bc5f7481af623c3dded4a6145585499f843ad3d741cd  LICENSE
diff --git a/package/python-dnspython/python-dnspython.mk b/package/python-dnspython/python-dnspython.mk
index 43030ae476..1459ec8881 100644
--- a/package/python-dnspython/python-dnspython.mk
+++ b/package/python-dnspython/python-dnspython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DNSPYTHON_VERSION = 2.2.1
+PYTHON_DNSPYTHON_VERSION = 2.4.2
 PYTHON_DNSPYTHON_SOURCE = dnspython-$(PYTHON_DNSPYTHON_VERSION).tar.gz
-PYTHON_DNSPYTHON_SITE = https://files.pythonhosted.org/packages/99/fb/e7cd35bba24295ad41abfdff30f6b4c271fd6ac70d20132fa503c3e768e0
+PYTHON_DNSPYTHON_SITE = https://files.pythonhosted.org/packages/65/2d/372a20e52a87b2ba0160997575809806111a72e18aa92738daccceb8d2b9
 PYTHON_DNSPYTHON_LICENSE = ISC
 PYTHON_DNSPYTHON_LICENSE_FILES = LICENSE
 PYTHON_DNSPYTHON_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
