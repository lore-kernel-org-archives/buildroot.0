Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF96EC3ABAE
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B1DC81A8E;
	Sun, 15 Sep 2024 21:38:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JFWXDUWoek3G; Sun, 15 Sep 2024 21:38:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82A00840E1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82A00840E1;
	Sun, 15 Sep 2024 21:38:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 11AA41BF94D
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF2B980C4D
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MqDjXh4Tra8h for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDFF580B3C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDFF580B3C
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DB18383685; Sun, 15 Sep 2024 21:36:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 10:02:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 60585adf13c20753d4d97f6dc8d88b54ba4f2e28
X-Git-Newrev: 191e7685c8fb7d5740bcd054bbfcc36d289dfc47
X-Patchwork-Hint: ignore
Message-Id: <20240915213638.DB18383685@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cherrypy: bump to version
 18.10.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=191e7685c8fb7d5740bcd054bbfcc36d289dfc47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop no longer required host-python-setuptools-scm-git-archive
build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cherrypy/python-cherrypy.hash |  4 ++--
 package/python-cherrypy/python-cherrypy.mk   | 10 ++++------
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/python-cherrypy/python-cherrypy.hash b/package/python-cherrypy/python-cherrypy.hash
index 92697e5f06..73df447a44 100644
--- a/package/python-cherrypy/python-cherrypy.hash
+++ b/package/python-cherrypy/python-cherrypy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cherrypy/json
-md5  014dbd400aeda9d2b098ed01c95b4a30  CherryPy-18.9.0.tar.gz
-sha256  6b06c191ce71a86461f30572a1ab57ffc09f43143ba8e42c103c7b3347220eb1  CherryPy-18.9.0.tar.gz
+md5  3f7cf1b729467945218bf553f7232da8  cherrypy-18.10.0.tar.gz
+sha256  6c70e78ee11300e8b21c0767c542ae6b102a49cac5cfd4e3e313d7bb907c5891  cherrypy-18.10.0.tar.gz
 # Locally computed sha256 checksums
 sha256  45ade933c280ece37e3e01d3a91afeed9505746a456f72ad10b0897c49e65104  LICENSE.md
diff --git a/package/python-cherrypy/python-cherrypy.mk b/package/python-cherrypy/python-cherrypy.mk
index 244491a040..1f995ed1df 100644
--- a/package/python-cherrypy/python-cherrypy.mk
+++ b/package/python-cherrypy/python-cherrypy.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-PYTHON_CHERRYPY_VERSION = 18.9.0
-PYTHON_CHERRYPY_SOURCE = CherryPy-$(PYTHON_CHERRYPY_VERSION).tar.gz
-PYTHON_CHERRYPY_SITE = https://files.pythonhosted.org/packages/bd/5f/e265a49883bfcfb7f2c3d3d9e96197cfe8136783e96c5ce20e201550aaa0
+PYTHON_CHERRYPY_VERSION = 18.10.0
+PYTHON_CHERRYPY_SOURCE = cherrypy-$(PYTHON_CHERRYPY_VERSION).tar.gz
+PYTHON_CHERRYPY_SITE = https://files.pythonhosted.org/packages/93/e8/2f7ef142d1962d08a8885c4c9942212abecad6a80ccdd1620fd1f5c993fd
 PYTHON_CHERRYPY_LICENSE = BSD-3-Clause
 PYTHON_CHERRYPY_LICENSE_FILES = LICENSE.md
 PYTHON_CHERRYPY_SETUP_TYPE = setuptools
-PYTHON_CHERRYPY_DEPENDENCIES = \
-	host-python-setuptools-scm \
-	host-python-setuptools-scm-git-archive
+PYTHON_CHERRYPY_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
