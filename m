Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B87C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3D8A707E3;
	Mon, 19 May 2025 10:53:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k-YciLyXxC01; Mon, 19 May 2025 10:53:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D54F707EC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D54F707EC;
	Mon, 19 May 2025 10:53:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C8CBE4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D503D423AA
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tWlV8ekAAT1B for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D53F40D6C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D53F40D6C
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4BFD3872E7; Mon, 19 May 2025 10:39:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Apr 2025 23:52:03 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 09bf1365f138ea22f2b9b64fc317ce6808d73d9a
X-Git-Newrev: da142cf50305af66c9fa8bbabbc0587be661f269
X-Patchwork-Hint: ignore
Message-Id: <20250519103953.4BFD3872E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-flask-caching:
 new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=da142cf50305af66c9fa8bbabbc0587be661f269
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Provides caching for python Flask applications
https://flask-caching.readthedocs.io/en/latest/

Signed-off-by: Daniel Crowe <daniel.crowe@maxmine.com.au>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                             |  1 +
 package/Config.in                                      |  1 +
 package/python-flask-caching/Config.in                 |  8 ++++++++
 package/python-flask-caching/python-flask-caching.hash |  6 ++++++
 package/python-flask-caching/python-flask-caching.mk   | 14 ++++++++++++++
 5 files changed, 30 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d0561a10de..73b24ca60a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -730,6 +730,7 @@ F:	package/odroidc2-firmware/
 
 N:	Daniel Crowe <daniel.crowe@maxmine.com.au>
 F:	package/python-cachelib/
+F:	package/python-flask-caching/
 
 N:	Daniel J. Leach <dleach@belcan.com>
 F:	package/dacapo/
diff --git a/package/Config.in b/package/Config.in
index 2d4ef81a2c..c29109aa7e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1117,6 +1117,7 @@ menu "External python modules"
 	source "package/python-fire/Config.in"
 	source "package/python-flask/Config.in"
 	source "package/python-flask-babel/Config.in"
+	source "package/python-flask-caching/Config.in"
 	source "package/python-flask-cors/Config.in"
 	source "package/python-flask-expects-json/Config.in"
 	source "package/python-flask-jsonrpc/Config.in"
diff --git a/package/python-flask-caching/Config.in b/package/python-flask-caching/Config.in
new file mode 100644
index 0000000000..ad8c617f7a
--- /dev/null
+++ b/package/python-flask-caching/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_FLASK_CACHING
+	bool "python-flask-caching"
+	select BR2_PACKAGE_PYTHON_CACHELIB # runtime
+	select BR2_PACKAGE_PYTHON_FLASK # runtime
+	help
+	  Adds caching support to Flask applications.
+
+	  https://github.com/pallets-eco/flask-caching
diff --git a/package/python-flask-caching/python-flask-caching.hash b/package/python-flask-caching/python-flask-caching.hash
new file mode 100644
index 0000000000..ee3f669934
--- /dev/null
+++ b/package/python-flask-caching/python-flask-caching.hash
@@ -0,0 +1,6 @@
+# md5, sha256 from https://pypi.org/pypi/flask-caching/json
+md5  026d06167ba7353ac65c861950ad5696  flask_caching-2.3.1.tar.gz
+sha256  65d7fd1b4eebf810f844de7de6258254b3248296ee429bdcb3f741bcbf7b98c9  flask_caching-2.3.1.tar.gz
+# Locally computed sha256 checksums
+sha256  1f3c445faa26eb32d90291228510e2d8594bd1fe15463f5d70c87d44f38872fd  LICENSE
+sha256  7729328f7b1ce664dbf630f077581cdfe97379b58b49e9a4f20c63912a5e5c09  docs/license.rst
diff --git a/package/python-flask-caching/python-flask-caching.mk b/package/python-flask-caching/python-flask-caching.mk
new file mode 100644
index 0000000000..db305d3dde
--- /dev/null
+++ b/package/python-flask-caching/python-flask-caching.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-flask-caching
+#
+################################################################################
+
+PYTHON_FLASK_CACHING_VERSION = 2.3.1
+PYTHON_FLASK_CACHING_SOURCE = flask_caching-$(PYTHON_FLASK_CACHING_VERSION).tar.gz
+PYTHON_FLASK_CACHING_SITE = https://files.pythonhosted.org/packages/e2/80/74846c8af58ed60972d64f23a6cd0c3ac0175677d7555dff9f51bf82c294
+PYTHON_FLASK_CACHING_SETUP_TYPE = setuptools
+PYTHON_FLASK_CACHING_LICENSE = BSD-3-Clause
+PYTHON_FLASK_CACHING_LICENSE_FILES = LICENSE docs/license.rst
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
