Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF4FC3ABAE
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E9458480F;
	Sun, 15 Sep 2024 21:40:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ULtfzb-UB-p9; Sun, 15 Sep 2024 21:40:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94FCC81E79
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94FCC81E79;
	Sun, 15 Sep 2024 21:40:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 478881BF94D
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B23B040A12
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YE-FSftzhlBg for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B996A40A35
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B996A40A35
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B57DD83683; Sun, 15 Sep 2024 21:36:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 10:35:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 069add3bcc5c6be3a88981852a2f13b9a012fdaf
X-Git-Newrev: fd35be957e813d478325500cd0033b6912e77c44
X-Patchwork-Hint: ignore
Message-Id: <20240915213640.B57DD83683@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-inflect: bump to version
 7.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=fd35be957e813d478325500cd0033b6912e77c44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop no longer required python-pydantic runtime dependency and
propagate reverse dependency removal.

Drop no longer required python-typing-extensions runtime dependency.

Add new python-more-itertools runtime dependency.

Add new python-typeguard runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cherrypy/Config.in           | 1 -
 package/python-inflect/Config.in            | 5 ++---
 package/python-inflect/python-inflect.hash  | 4 ++--
 package/python-inflect/python-inflect.mk    | 4 ++--
 package/python-jaraco-collections/Config.in | 1 -
 package/python-jaraco-text/Config.in        | 1 -
 6 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/package/python-cherrypy/Config.in b/package/python-cherrypy/Config.in
index fd67872873..24e244f3b3 100644
--- a/package/python-cherrypy/Config.in
+++ b/package/python-cherrypy/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_CHERRYPY
 	bool "python-cherrypy"
-	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-jaraco-collections -> python-jaraco-text -> python-inflect -> python-pydantic -> python-pydantic-core
 	select BR2_PACKAGE_PYTHON_CHEROOT # runtime
 	select BR2_PACKAGE_PYTHON_JARACO_COLLECTIONS # runtime
 	select BR2_PACKAGE_PYTHON_MORE_ITERTOOLS # runtime
diff --git a/package/python-inflect/Config.in b/package/python-inflect/Config.in
index daf6bd4a32..c2773aae45 100644
--- a/package/python-inflect/Config.in
+++ b/package/python-inflect/Config.in
@@ -1,8 +1,7 @@
 config BR2_PACKAGE_PYTHON_INFLECT
 	bool "python-inflect"
-	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-pydantic -> python-pydantic-core
-	select BR2_PACKAGE_PYTHON_PYDANTIC # runtime
-	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
+	select BR2_PACKAGE_PYTHON_MORE_ITERTOOLS # runtime
+	select BR2_PACKAGE_PYTHON_TYPEGUARD # runtime
 	help
 	  Correctly generate plurals, singular nouns, ordinals,
 	  indefinite articles; convert numbers to words.
diff --git a/package/python-inflect/python-inflect.hash b/package/python-inflect/python-inflect.hash
index 3faa4cc5a5..8b373b8a7e 100644
--- a/package/python-inflect/python-inflect.hash
+++ b/package/python-inflect/python-inflect.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/inflect/json
-md5  61c670cf5c4d09314f6a4d3b99d3b98d  inflect-7.0.0.tar.gz
-sha256  63da9325ad29da81ec23e055b41225795ab793b4ecb483be5dc1fa363fd4717e  inflect-7.0.0.tar.gz
+md5  7201084aafe65ed5925a8f055f9281a7  inflect-7.4.0.tar.gz
+sha256  904baa17cc2cb74827a6c27b95692e95670dadc72b208b3e8c1c05aeed47026b  inflect-7.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-inflect/python-inflect.mk b/package/python-inflect/python-inflect.mk
index cef4c06627..926f2c43ef 100644
--- a/package/python-inflect/python-inflect.mk
+++ b/package/python-inflect/python-inflect.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_INFLECT_VERSION = 7.0.0
+PYTHON_INFLECT_VERSION = 7.4.0
 PYTHON_INFLECT_SOURCE = inflect-$(PYTHON_INFLECT_VERSION).tar.gz
-PYTHON_INFLECT_SITE = https://files.pythonhosted.org/packages/9f/90/1d0a889847fdce963ebe9684de24a749e4fad627bf595e9f0d32730f85a8
+PYTHON_INFLECT_SITE = https://files.pythonhosted.org/packages/e1/dc/02614acece4d578e709c606594c989cfd9f15cf6401444e5603e60df9b26
 PYTHON_INFLECT_SETUP_TYPE = setuptools
 PYTHON_INFLECT_LICENSE = MIT
 PYTHON_INFLECT_LICENSE_FILES = LICENSE
diff --git a/package/python-jaraco-collections/Config.in b/package/python-jaraco-collections/Config.in
index a6fa721d4d..6cb1024b88 100644
--- a/package/python-jaraco-collections/Config.in
+++ b/package/python-jaraco-collections/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_JARACO_COLLECTIONS
 	bool "python-jaraco-collections"
-	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-jaraco-text -> python-inflect -> python-pydantic -> python-pydantic-core
 	select BR2_PACKAGE_PYTHON_JARACO_TEXT # runtime
 	help
 	  Collection objects similar to those in stdlib by jaraco.
diff --git a/package/python-jaraco-text/Config.in b/package/python-jaraco-text/Config.in
index 5044ea3233..9ce179b056 100644
--- a/package/python-jaraco-text/Config.in
+++ b/package/python-jaraco-text/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_JARACO_TEXT
 	bool "python-jaraco-text"
-	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-inflect -> python-pydantic -> python-pydantic-core
 	select BR2_PACKAGE_PYTHON_AUTOCOMMAND # runtime
 	select BR2_PACKAGE_PYTHON_INFLECT # runtime
 	select BR2_PACKAGE_PYTHON_JARACO_CONTEXT # runtime
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
