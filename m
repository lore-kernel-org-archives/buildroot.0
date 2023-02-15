Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3DEFC677F1
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 02:02:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84D4870139;
	Tue, 21 Feb 2023 02:02:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84D4870139
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MOM1xi65Km3D; Tue, 21 Feb 2023 02:02:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F9F7700D9;
	Tue, 21 Feb 2023 02:02:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F9F7700D9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 919C91BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E47270045
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E47270045
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z-dERMiYTaJA for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:53:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53AB0610E5
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:53:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53AB0610E5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4FD2A828C8; Mon, 20 Feb 2023 20:53:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 15 Feb 2023 23:16:55 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8984b7581a7d534c9170061913b4840ed33d87c2
X-Git-Newrev: 8c41d4836999fa691c5952bd476182bf93647e7c
X-Patchwork-Hint: ignore
Message-Id: <20230220205301.4FD2A828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-webargs: new
 package
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
Content-Type: multipart/mixed; boundary="===============6713044988050563889=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6713044988050563889==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=8c41d4836999fa691c5952bd476182bf93647e7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

webargs is a dependency of to-be-added python-flask-smorest.

Signed-off-by: Martin Hundebøll <martin@geanix.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/python-webargs/Config.in           | 11 +++++++++++
 package/python-webargs/python-webargs.hash |  5 +++++
 package/python-webargs/python-webargs.mk   | 14 ++++++++++++++
 5 files changed, 32 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 949eef8327..7335e70d15 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1967,6 +1967,7 @@ F:	package/zic/
 
 N:	Martin Hundebøll <martin@geanix.com>
 F:	package/python-apispec/
+F:	package/python-webargs/
 
 N:	Martin Kepplinger <martink@posteo.de>
 F:	package/tslib/
diff --git a/package/Config.in b/package/Config.in
index de40f2d529..747fac54bf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1341,6 +1341,7 @@ menu "External python modules"
 	source "package/python-wcwidth/Config.in"
 	source "package/python-weasyprint/Config.in"
 	source "package/python-web2py/Config.in"
+	source "package/python-webargs/Config.in"
 	source "package/python-webencodings/Config.in"
 	source "package/python-webob/Config.in"
 	source "package/python-webpy/Config.in"
diff --git a/package/python-webargs/Config.in b/package/python-webargs/Config.in
new file mode 100644
index 0000000000..f2332d3b70
--- /dev/null
+++ b/package/python-webargs/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_WEBARGS
+	bool "python-webargs"
+	select BR2_PACKAGE_PYTHON_MARSHMALLOW # runtime
+	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
+	help
+	  Declarative parsing and validation of HTTP request objects,
+	  with built-in support for popular web frameworks, including
+	  Flask, Django, Bottle, Tornado, Pyramid, Falcon, and
+	  aiohttp.
+
+	  https://github.com/marshmallow-code/webargs
diff --git a/package/python-webargs/python-webargs.hash b/package/python-webargs/python-webargs.hash
new file mode 100644
index 0000000000..619b584807
--- /dev/null
+++ b/package/python-webargs/python-webargs.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/webargs/json
+md5   9fff29294a5db748eca791da2b93e370  webargs-8.2.0.tar.gz
+sha256  99d68940c452e07726485a15fef43f12f8ae6c0c5b391bcba76065d4527fb85d  webargs-8.2.0.tar.gz
+# Locally computed sha256 checksums
+sha256  5973e5dcc20b65e4eb4b4acdf273bb78a18522914ab626f496f1b070f7e6294d  LICENSE
diff --git a/package/python-webargs/python-webargs.mk b/package/python-webargs/python-webargs.mk
new file mode 100644
index 0000000000..e048d8a4ac
--- /dev/null
+++ b/package/python-webargs/python-webargs.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-webargs
+#
+################################################################################
+
+PYTHON_WEBARGS_VERSION = 8.2.0
+PYTHON_WEBARGS_SOURCE = webargs-$(PYTHON_WEBARGS_VERSION).tar.gz
+PYTHON_WEBARGS_SITE = https://files.pythonhosted.org/packages/4b/7d/fece8e6547b3edde8953b1c84a63da02e1a88efcb9d7d485e4d1b25d9c47
+PYTHON_WEBARGS_SETUP_TYPE = setuptools
+PYTHON_WEBARGS_LICENSE = MIT
+PYTHON_WEBARGS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))

--===============6713044988050563889==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6713044988050563889==--
