Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56946C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 02:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1054C70240;
	Tue, 21 Feb 2023 02:02:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1054C70240
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gEDMUdQkqv66; Tue, 21 Feb 2023 02:02:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20BB370228;
	Tue, 21 Feb 2023 02:02:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20BB370228
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 764811BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7333970047
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7333970047
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id swlB5VURuHxA for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:53:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 442DE7000E
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:53:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 442DE7000E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 42A9581979; Mon, 20 Feb 2023 20:53:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 15 Feb 2023 23:16:09 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3481674ee36fe9fa695e2e6c255bf02b5ab380b0
X-Git-Newrev: 8984b7581a7d534c9170061913b4840ed33d87c2
X-Patchwork-Hint: ignore
Message-Id: <20230220205301.42A9581979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-apispec: new
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
Content-Type: multipart/mixed; boundary="===============0409931010519322496=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0409931010519322496==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=8984b7581a7d534c9170061913b4840ed33d87c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

apispec is a dependency of to-be-added python-flask-smorest.

Signed-off-by: Martin Hundebøll <martin@geanix.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  3 +++
 package/Config.in                          |  1 +
 package/python-apispec/Config.in           |  9 +++++++++
 package/python-apispec/python-apispec.hash |  5 +++++
 package/python-apispec/python-apispec.mk   | 14 ++++++++++++++
 5 files changed, 32 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 72a56deb4c..949eef8327 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1965,6 +1965,9 @@ F:	package/rpi-firmware/
 F:	package/tzdata/
 F:	package/zic/
 
+N:	Martin Hundebøll <martin@geanix.com>
+F:	package/python-apispec/
+
 N:	Martin Kepplinger <martink@posteo.de>
 F:	package/tslib/
 F:	package/x11r7/xdriver_xf86-input-tslib/
diff --git a/package/Config.in b/package/Config.in
index fff2fb7a93..de40f2d529 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -958,6 +958,7 @@ menu "External python modules"
 	source "package/python-alembic/Config.in"
 	source "package/python-alsaaudio/Config.in"
 	source "package/python-ansicolors/Config.in"
+	source "package/python-apispec/Config.in"
 	source "package/python-appdirs/Config.in"
 	source "package/python-argh/Config.in"
 	source "package/python-argon2-cffi/Config.in"
diff --git a/package/python-apispec/Config.in b/package/python-apispec/Config.in
new file mode 100644
index 0000000000..7a322c9969
--- /dev/null
+++ b/package/python-apispec/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_APISPEC
+	bool "python-apispec"
+	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
+	help
+	  A pluggable API specification generator. Currently supports
+	  the OpenAPI Specification (f.k.a. the Swagger
+	  specification).
+
+	  https://github.com/marshmallow-code/apispec
diff --git a/package/python-apispec/python-apispec.hash b/package/python-apispec/python-apispec.hash
new file mode 100644
index 0000000000..9d653cc8e8
--- /dev/null
+++ b/package/python-apispec/python-apispec.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/apispec/json
+md5   b4e90006a26215e2e0a6fe2629d12c10 apispec-6.0.2.tar.gz
+sha256  e76d80b739edef4be213092a6384ad7fd933ba7d64f6d5a0aff8d4da1bef7887  apispec-6.0.2.tar.gz
+# Locally computed sha256 checksums
+sha256  a452afcef750956a8396f7e7a6f913a117d28ef99a13170c29dc74c3b7a95f29  LICENSE
diff --git a/package/python-apispec/python-apispec.mk b/package/python-apispec/python-apispec.mk
new file mode 100644
index 0000000000..4674ce0c3d
--- /dev/null
+++ b/package/python-apispec/python-apispec.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-apispec
+#
+################################################################################
+
+PYTHON_APISPEC_VERSION = 6.0.2
+PYTHON_APISPEC_SOURCE = apispec-$(PYTHON_APISPEC_VERSION).tar.gz
+PYTHON_APISPEC_SITE = https://files.pythonhosted.org/packages/a7/2a/b42c17e0d653341b8f5916999892cd2d8489de127dac6118ae44531674f5
+PYTHON_APISPEC_SETUP_TYPE = setuptools
+PYTHON_APISPEC_LICENSE = MIT
+PYTHON_APISPEC_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))

--===============0409931010519322496==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0409931010519322496==--
