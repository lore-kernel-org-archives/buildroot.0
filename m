Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90284C636CC
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 22:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25AE8813B2;
	Wed, 15 Feb 2023 22:23:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25AE8813B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mFSWU7NC7LDY; Wed, 15 Feb 2023 22:23:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E792813E9;
	Wed, 15 Feb 2023 22:23:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E792813E9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2FD891BF95C
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 22:23:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 171BD417C3
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 22:23:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 171BD417C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XnOETWK2ztIt for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 22:22:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E05DA417BC
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 22:22:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E05DA417BC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CA7BF85F32; Wed, 15 Feb 2023 22:22:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 15 Feb 2023 23:16:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3481674ee36fe9fa695e2e6c255bf02b5ab380b0
X-Git-Newrev: 8984b7581a7d534c9170061913b4840ed33d87c2
X-Patchwork-Hint: ignore
Message-Id: <20230215222258.CA7BF85F32@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-apispec: new package
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
Content-Type: multipart/mixed; boundary="===============8473327961617090229=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8473327961617090229==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=8984b7581a7d534c9170061913b4840ed33d87c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

--===============8473327961617090229==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8473327961617090229==--
