Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B08C369D2
	for <buildroot@archiver.kernel.org>; Sun, 20 Apr 2025 21:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B00404073B;
	Sun, 20 Apr 2025 21:09:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hWPB7iIf66O4; Sun, 20 Apr 2025 21:09:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAA68406FD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAA68406FD;
	Sun, 20 Apr 2025 21:09:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E6CF1C0
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 21:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A55240A12
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 21:09:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4XRQG6I2AQJd for <buildroot@buildroot.org>;
 Sun, 20 Apr 2025 21:09:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DA6C40A05
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DA6C40A05
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 21:09:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4AA6E85DF7; Sun, 20 Apr 2025 21:09:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Apr 2025 23:06:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e3ba7978731e0b0afdbaee1b0d39ce17c6397883
X-Git-Newrev: d83cbb21cc9f7adc95efa788f021795e6dde85d8
X-Patchwork-Hint: ignore
Message-Id: <20250420210951.4AA6E85DF7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aniso8601: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=d83cbb21cc9f7adc95efa788f021795e6dde85d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A library for parsing ISO 8601 strings
https://bitbucket.org/nielsenb/aniso8601/src/master/

Signed-off-by: Daniel Crowe <daniel.crowe@maxmine.com.au>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/python-aniso8601/Config.in             |  6 ++++++
 package/python-aniso8601/python-aniso8601.hash |  5 +++++
 package/python-aniso8601/python-aniso8601.mk   | 14 ++++++++++++++
 5 files changed, 27 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3a921c8a74..11c490806c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -729,6 +729,7 @@ F:	package/meson-tools/
 F:	package/odroidc2-firmware/
 
 N:	Daniel Crowe <daniel.crowe@maxmine.com.au>
+F:	package/python-aniso8601/
 F:	package/python-cachelib/
 F:	package/python-flask-caching/
 
diff --git a/package/Config.in b/package/Config.in
index c29109aa7e..413d30174f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -996,6 +996,7 @@ menu "External python modules"
 	source "package/python-aiozipkin/Config.in"
 	source "package/python-alembic/Config.in"
 	source "package/python-alsaaudio/Config.in"
+	source "package/python-aniso8601/Config.in"
 	source "package/python-annotated-types/Config.in"
 	source "package/python-ansicolors/Config.in"
 	source "package/python-anyio/Config.in"
diff --git a/package/python-aniso8601/Config.in b/package/python-aniso8601/Config.in
new file mode 100644
index 0000000000..cea76eeff5
--- /dev/null
+++ b/package/python-aniso8601/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_ANISO8601
+	bool "python-aniso8601"
+	help
+	  A library for parsing ISO 8601 strings.
+
+	  https://bitbucket.org/nielsenb/aniso8601
diff --git a/package/python-aniso8601/python-aniso8601.hash b/package/python-aniso8601/python-aniso8601.hash
new file mode 100644
index 0000000000..c0e8f95f3b
--- /dev/null
+++ b/package/python-aniso8601/python-aniso8601.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/aniso8601/json
+md5  29acca96d02d182b7ff09f02047b84a8  aniso8601-10.0.0.tar.gz
+sha256  ff1d0fc2346688c62c0151547136ac30e322896ed8af316ef7602c47da9426cf  aniso8601-10.0.0.tar.gz
+# Locally computed sha256 checksums
+sha256  c3cca0b9a74fd29668bd99b5dcf0274d53be904de6778916dc852708f407b0f0  LICENSE
diff --git a/package/python-aniso8601/python-aniso8601.mk b/package/python-aniso8601/python-aniso8601.mk
new file mode 100644
index 0000000000..1bb6628953
--- /dev/null
+++ b/package/python-aniso8601/python-aniso8601.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-aniso8601
+#
+################################################################################
+
+PYTHON_ANISO8601_VERSION = 10.0.0
+PYTHON_ANISO8601_SOURCE = aniso8601-$(PYTHON_ANISO8601_VERSION).tar.gz
+PYTHON_ANISO8601_SITE = https://files.pythonhosted.org/packages/f3/3f/dc8a28fa6dc72c13d8c158b01f8975f240e9e72c336cc1ae00f424e2d7ce
+PYTHON_ANISO8601_SETUP_TYPE = setuptools
+PYTHON_ANISO8601_LICENSE = BSD-3-Clause
+PYTHON_ANISO8601_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
