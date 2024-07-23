Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA48C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 09:32:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71FD18108C;
	Tue, 23 Jul 2024 09:32:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NVk-vRmLUU2w; Tue, 23 Jul 2024 09:32:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2794811ED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2794811ED;
	Tue, 23 Jul 2024 09:32:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7BC011BF969
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 09:32:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69196600B9
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 09:32:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IRwgBolMLgSU for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 09:32:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87F5060073
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87F5060073
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 09:32:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 723298738E; Tue, 23 Jul 2024 09:32:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 11:32:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f7c48e2ca40fa3f5622210a8c553405d35364c6f
X-Git-Newrev: 3ebd06c0b13031191919caca07df86268cd758e4
X-Patchwork-Hint: ignore
Message-Id: <20240723093232.723298738E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cherrypy: bump to version
 18.9.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=3ebd06c0b13031191919caca07df86268cd758e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new host-python-setuptools-scm-git-archive build dependency.

Add new python-jaraco-collections runtime dependency.

Add new python-more-itertools runtime dependency.

Add new python-zc-lockfile runtime dependency.

Drop no longer required python-six and python-jaraco-classes runtime
dependencies.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cherrypy/Config.in            | 6 ++++--
 package/python-cherrypy/python-cherrypy.hash | 4 ++--
 package/python-cherrypy/python-cherrypy.mk   | 8 +++++---
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/package/python-cherrypy/Config.in b/package/python-cherrypy/Config.in
index 7548dcf91b..fd67872873 100644
--- a/package/python-cherrypy/Config.in
+++ b/package/python-cherrypy/Config.in
@@ -1,10 +1,12 @@
 config BR2_PACKAGE_PYTHON_CHERRYPY
 	bool "python-cherrypy"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-jaraco-collections -> python-jaraco-text -> python-inflect -> python-pydantic -> python-pydantic-core
 	select BR2_PACKAGE_PYTHON_CHEROOT # runtime
-	select BR2_PACKAGE_PYTHON_JARACO_CLASSES # runtime
+	select BR2_PACKAGE_PYTHON_JARACO_COLLECTIONS # runtime
+	select BR2_PACKAGE_PYTHON_MORE_ITERTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_PORTEND # runtime
+	select BR2_PACKAGE_PYTHON_ZC_LOCKFILE # runtime
 	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	help
 	  A minimalist web framework
diff --git a/package/python-cherrypy/python-cherrypy.hash b/package/python-cherrypy/python-cherrypy.hash
index cd8f8756d8..92697e5f06 100644
--- a/package/python-cherrypy/python-cherrypy.hash
+++ b/package/python-cherrypy/python-cherrypy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cherrypy/json
-md5  033c58bf3da497f283b039911d1c882b  CherryPy-18.8.0.tar.gz
-sha256  9b48cfba8a2f16d5b6419cc657e6d51db005ba35c5e3824e4728bb03bbc7ef9b  CherryPy-18.8.0.tar.gz
+md5  014dbd400aeda9d2b098ed01c95b4a30  CherryPy-18.9.0.tar.gz
+sha256  6b06c191ce71a86461f30572a1ab57ffc09f43143ba8e42c103c7b3347220eb1  CherryPy-18.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  45ade933c280ece37e3e01d3a91afeed9505746a456f72ad10b0897c49e65104  LICENSE.md
diff --git a/package/python-cherrypy/python-cherrypy.mk b/package/python-cherrypy/python-cherrypy.mk
index 9b6ad0e99a..244491a040 100644
--- a/package/python-cherrypy/python-cherrypy.mk
+++ b/package/python-cherrypy/python-cherrypy.mk
@@ -4,12 +4,14 @@
 #
 ################################################################################
 
-PYTHON_CHERRYPY_VERSION = 18.8.0
+PYTHON_CHERRYPY_VERSION = 18.9.0
 PYTHON_CHERRYPY_SOURCE = CherryPy-$(PYTHON_CHERRYPY_VERSION).tar.gz
-PYTHON_CHERRYPY_SITE = https://files.pythonhosted.org/packages/60/ea/6c4d16b0cd1f4f64a478bac8a37d75a585e854afb5693ce80a9711efdc4a
+PYTHON_CHERRYPY_SITE = https://files.pythonhosted.org/packages/bd/5f/e265a49883bfcfb7f2c3d3d9e96197cfe8136783e96c5ce20e201550aaa0
 PYTHON_CHERRYPY_LICENSE = BSD-3-Clause
 PYTHON_CHERRYPY_LICENSE_FILES = LICENSE.md
 PYTHON_CHERRYPY_SETUP_TYPE = setuptools
-PYTHON_CHERRYPY_DEPENDENCIES = host-python-setuptools-scm
+PYTHON_CHERRYPY_DEPENDENCIES = \
+	host-python-setuptools-scm \
+	host-python-setuptools-scm-git-archive
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
