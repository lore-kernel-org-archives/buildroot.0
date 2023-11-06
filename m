Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FEDFC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 267AA410BA;
	Mon,  6 Nov 2023 22:22:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 267AA410BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SgmpDOOF4F2Q; Mon,  6 Nov 2023 22:22:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 458C442138;
	Mon,  6 Nov 2023 22:22:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 458C442138
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 23FC01BF271
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACE2C41690
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:20:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACE2C41690
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e--0IniGQ04O for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:20:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 657F3415C8
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:20:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 657F3415C8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 524B186B7E; Mon,  6 Nov 2023 22:20:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 23:15:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8916b4ad20f71f8494ccdc3dae4d8e54b1857e44
X-Git-Newrev: cf056a5e765d9d0061279979f0c8ab55a0032082
X-Patchwork-Hint: ignore
Message-Id: <20231106222017.524B186B7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-flask-babel: bump to
 version 4.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=cf056a5e765d9d0061279979f0c8ab55a0032082
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new python-pytz runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-flask-babel/Config.in               | 1 +
 package/python-flask-babel/python-flask-babel.hash | 9 ++++-----
 package/python-flask-babel/python-flask-babel.mk   | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-flask-babel/Config.in b/package/python-flask-babel/Config.in
index 272d9ef1c1..1248783e80 100644
--- a/package/python-flask-babel/Config.in
+++ b/package/python-flask-babel/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_PYTHON_FLASK_BABEL
 	select BR2_PACKAGE_PYTHON_FLASK # runtime
 	select BR2_PACKAGE_PYTHON_BABEL # runtime
 	select BR2_PACKAGE_PYTHON_JINJA2 # runtime
+	select BR2_PACKAGE_PYTHON_PYTZ # runtime
 	help
 	  Flask-Babel is an extension to Flask that adds i18n and l10n
 	  support to any Flask application with the help of babel,
diff --git a/package/python-flask-babel/python-flask-babel.hash b/package/python-flask-babel/python-flask-babel.hash
index eae77ff51d..b946561308 100644
--- a/package/python-flask-babel/python-flask-babel.hash
+++ b/package/python-flask-babel/python-flask-babel.hash
@@ -1,6 +1,5 @@
-# From: https://pypi.org/project/flask-babel/#copy-hash-modal-02f7b566-78ef-46b7-be0e-da35593e2dc2
-md5  ad0a1b69044dde430ad9319d3a2f7b47  flask_babel-3.1.0.tar.gz
-sha256  be015772c5d7f046f3b99c508dcf618636eb93d21b713b356db79f3e79f69f39  flask_babel-3.1.0.tar.gz
-
-# License files
+# md5, sha256 from https://pypi.org/pypi/flask-babel/json
+md5  62116080b8d3a446e1f0f07cbaf74dc1  flask_babel-4.0.0.tar.gz
+sha256  dbeab4027a3f4a87678a11686496e98e1492eb793cbdd77ab50f4e9a2602a593  flask_babel-4.0.0.tar.gz
+# Locally computed sha256 checksums
 sha256  a526100a7047237360a394ba4f70ae801b50ff9b8c9b9e73e7795480a59f6b7e  LICENSE
diff --git a/package/python-flask-babel/python-flask-babel.mk b/package/python-flask-babel/python-flask-babel.mk
index 34c9559d1c..b3ecdf6cf6 100644
--- a/package/python-flask-babel/python-flask-babel.mk
+++ b/package/python-flask-babel/python-flask-babel.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_BABEL_VERSION = 3.1.0
+PYTHON_FLASK_BABEL_VERSION = 4.0.0
 PYTHON_FLASK_BABEL_SOURCE = flask_babel-$(PYTHON_FLASK_BABEL_VERSION).tar.gz
-PYTHON_FLASK_BABEL_SITE = https://files.pythonhosted.org/packages/35/83/f31a4ff688168f9c8a73d80ebfc785dcd7703474a0802b25a78d54edd07c
+PYTHON_FLASK_BABEL_SITE = https://files.pythonhosted.org/packages/58/1a/4c65e3b90bda699a637bfb7fb96818b0a9bbff7636ea91aade67f6020a31
 PYTHON_FLASK_BABEL_LICENSE = BSD-3-Clause
 PYTHON_FLASK_BABEL_SETUP_TYPE = setuptools
 PYTHON_FLASK_BABEL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
