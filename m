Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20EA9C48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 09:12:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A393410AF;
	Sun,  3 Mar 2024 09:12:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8S8UKAcGCm3h; Sun,  3 Mar 2024 09:12:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45F84410DF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45F84410DF;
	Sun,  3 Mar 2024 09:12:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7C7091BF2BF
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 09:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75BF540606
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 09:12:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id id6aGVNP8nfd for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 09:12:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00B6C40136
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00B6C40136
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 09:12:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DDC1A87EEE; Sun,  3 Mar 2024 09:12:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Mar 2024 10:07:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: edde351cb8c13ffd54a369916da5f3f372edd4a2
X-Git-Newrev: b8707cee5e7e4af8fc2addd317b294e081db994f
X-Patchwork-Hint: ignore
Message-Id: <20240303091201.DDC1A87EEE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cheroot: drop
 host-python-setuptools-scm-git-archive
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

commit: https://git.buildroot.net/buildroot/commit/?id=b8707cee5e7e4af8fc2addd317b294e081db994f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop host-python-setuptools-scm-git-archive dependency

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
index 86e16f7db2..19aa7ae193 100644
--- a/package/python-cheroot/python-cheroot.mk
+++ b/package/python-cheroot/python-cheroot.mk
@@ -10,6 +10,6 @@ PYTHON_CHEROOT_SITE = https://files.pythonhosted.org/packages/08/7c/95c154177b16
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
