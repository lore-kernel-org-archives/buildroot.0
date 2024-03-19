Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA64C54E60
	for <buildroot@archiver.kernel.org>; Tue, 19 Mar 2024 12:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6459D406E6;
	Tue, 19 Mar 2024 12:23:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1MpDaMZ1_EUY; Tue, 19 Mar 2024 12:23:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED7194070B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED7194070B;
	Tue, 19 Mar 2024 12:23:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1DAF61BF406
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 12:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E9F781E7F
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 12:23:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pnqgk4qD1w4f for <buildroot@lists.busybox.net>;
 Tue, 19 Mar 2024 12:23:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E04781E70
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E04781E70
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 12:23:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 54E7B835A0; Tue, 19 Mar 2024 12:23:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 19 Mar 2024 12:38:52 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 11eadeee2c53438727d708f8cce701c559ec8454
X-Git-Newrev: ebfc153e28bfe5dc55e742d883dcf5837d2ec47c
X-Patchwork-Hint: ignore
Message-Id: <20240319122332.54E7B835A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/python-cheroot:
 drop host-python-setuptools-scm-git-archive
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

commit: https://git.buildroot.net/buildroot/commit/?id=ebfc153e28bfe5dc55e742d883dcf5837d2ec47c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Drop host-python-setuptools-scm-git-archive dependency

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b8707cee5e7e4af8fc2addd317b294e081db994f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-setuptools-scm-v7-for-building-the-dists.patch | 101 +++++++++++++++++++++
 package/python-cheroot/python-cheroot.mk           |   2 +-
 2 files changed, 102 insertions(+), 1 deletion(-)

diff --git a/package/python-cheroot/0001-Use-setuptools-scm-v7-for-building-the-dists.patch b/package/python-cheroot/0001-Use-setuptools-scm-v7-for-building-the-dists.patch
new file mode 100644
index 0000000000..837f2804d2
--- /dev/null
+++ b/package/python-cheroot/0001-Use-setuptools-scm-v7-for-building-the-dists.patch
@@ -0,0 +1,101 @@
+From f0c51af263e20f332c6f675aa90ec6705ae4f5d1 Mon Sep 17 00:00:00 2001
+From: Serhii Abarovskyi <aserhii@protonmail.com>
+Date: Tue, 9 May 2023 18:33:54 +0300
+Subject: [PATCH] Use setuptools-scm v7+ for building the dists
+
+Since version 7, setuptools-scm has native support for git archive,
+so the setuptools-scm-git-archive project is obsolete
+and this patch removes it from the build dependencies.
+Close #515
+
+Upstream: https://github.com/cherrypy/cheroot/commit/f0c51af263e20f332c6f675aa90ec6705ae4f5d1
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ .git_archival.txt                       |  3 +++
+ pyproject.toml                          |  3 +--
+ requirements/dist-build-constraints.in  |  3 +--
+ requirements/dist-build-constraints.txt | 16 +++++++---------
+ setup.cfg                               |  3 +--
+ 5 files changed, 13 insertions(+), 15 deletions(-)
+
+diff --git a/.git_archival.txt b/.git_archival.txt
+index 95cb3eea4e..3994ec0a83 100644
+--- a/.git_archival.txt
++++ b/.git_archival.txt
+@@ -1 +1,4 @@
++node: $Format:%H$
++node-date: $Format:%cI$
++describe-name: $Format:%(describe:tags=true)$
+ ref-names: $Format:%D$
+diff --git a/pyproject.toml b/pyproject.toml
+index b1e5f60a80..88df57dcc1 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -6,8 +6,7 @@ requires = [
+     "setuptools>=34.4",
+ 
+     # Plugins
+-    "setuptools_scm[toml]>=3.5",
+-    "setuptools_scm_git_archive>=1.1",
++    "setuptools-scm >= 7.0.0",
+ ]
+ build-backend = "setuptools.build_meta"
+ 
+diff --git a/requirements/dist-build-constraints.in b/requirements/dist-build-constraints.in
+index 26b57228a9..a37baef1a9 100644
+--- a/requirements/dist-build-constraints.in
++++ b/requirements/dist-build-constraints.in
+@@ -5,8 +5,7 @@
+ setuptools >= 34.4
+ 
+ # Plugins
+-setuptools_scm[toml] >= 3.5
+-setuptools_scm_git_archive >= 1.1
++setuptools-scm[toml] >= 7.0.0
+ 
+ # Dynamic (coming from setuptools' PEP 517 build backend)
+ wheel
+diff --git a/requirements/dist-build-constraints.txt b/requirements/dist-build-constraints.txt
+index 525f2be30f..8bd4343ff6 100644
+--- a/requirements/dist-build-constraints.txt
++++ b/requirements/dist-build-constraints.txt
+@@ -1,18 +1,16 @@
+ #
+-# This file is autogenerated by pip-compile with python 3.10
+-# To update, run:
++# This file is autogenerated by pip-compile with Python 3.10
++# by the following command:
+ #
+ #    pip-compile --allow-unsafe --output-file=requirements/dist-build-constraints.txt --strip-extras requirements/dist-build-constraints.in
+ #
+-packaging==21.3
++packaging==23.1
+     # via setuptools-scm
+-pyparsing==3.0.6
+-    # via packaging
+-setuptools-scm==6.3.2
++setuptools-scm==7.1.0
+     # via -r requirements/dist-build-constraints.in
+-setuptools-scm-git-archive==1.1
+-    # via -r requirements/dist-build-constraints.in
+-tomli==2.0.0
++tomli==2.0.1
++    # via setuptools-scm
++typing-extensions==4.6.3
+     # via setuptools-scm
+ wheel==0.37.1
+     # via -r requirements/dist-build-constraints.in
+diff --git a/setup.cfg b/setup.cfg
+index 1f2b08f4c3..900c7b4feb 100644
+--- a/setup.cfg
++++ b/setup.cfg
+@@ -64,8 +64,7 @@ include_package_data = True
+ packages = find:
+ include_package_data = True
+ setup_requires = 
+-	setuptools_scm>=1.15.0
+-	setuptools_scm_git_archive>=1.0
++	setuptools_scm >= 7.0.0
+ install_requires = 
+ 	importlib_metadata; python_version < '3.8'
+ 	more_itertools >= 2.6
diff --git a/package/python-cheroot/python-cheroot.mk b/package/python-cheroot/python-cheroot.mk
index f75065c7da..571584d098 100644
--- a/package/python-cheroot/python-cheroot.mk
+++ b/package/python-cheroot/python-cheroot.mk
@@ -10,6 +10,6 @@ PYTHON_CHEROOT_SITE = https://files.pythonhosted.org/packages/8c/e7/8e6387d59a35
 PYTHON_CHEROOT_LICENSE = BSD-3-Clause
 PYTHON_CHEROOT_LICENSE_FILES = LICENSE.md
 PYTHON_CHEROOT_SETUP_TYPE = setuptools
-PYTHON_CHEROOT_DEPENDENCIES = host-python-setuptools-scm host-python-setuptools-scm-git-archive
+PYTHON_CHEROOT_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
