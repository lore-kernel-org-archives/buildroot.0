Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C504C19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 14:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2B868146C;
	Sun,  7 Aug 2022 14:50:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2B868146C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a0FPZpMGf48f; Sun,  7 Aug 2022 14:50:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6EDF8145D;
	Sun,  7 Aug 2022 14:50:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6EDF8145D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EC8C31BF307
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 14:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5F0860736
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 14:49:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5F0860736
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ea7cUvKWfgFf for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 14:49:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2A9C60ADF
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 14:49:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2A9C60ADF
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4DBDB86F68; Sun,  7 Aug 2022 14:35:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Aug 2022 16:27:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fb97f4f354bd4e2fce270eebfba072c45a2a8a7c
X-Git-Newrev: 1b638e4817d8b1148eef60506e201b39141859d6
X-Patchwork-Hint: ignore
Message-Id: <20220807143537.4DBDB86F68@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-appdirs: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=1b638e4817d8b1148eef60506e201b39141859d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Required by python-twisted[conch], which is required by
python-crossbar.

Signed-off-by: Emile Cormier <emile.cormier.jr@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  3 +++
 package/Config.in                          |  1 +
 package/python-appdirs/Config.in           |  7 +++++++
 package/python-appdirs/python-appdirs.hash |  5 +++++
 package/python-appdirs/python-appdirs.mk   | 14 ++++++++++++++
 5 files changed, 30 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index edc02bf1c4..531839c817 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -777,6 +777,9 @@ N:	Eloi Bail <eloi.bail@savoirfairelinux.com>
 F:	package/bayer2rgb-neon/
 F:	package/gstreamer1/gst1-plugins-bayer2rgb-neon/
 
+N:	Emile Cormier <emile.cormier.jr@gmail.com>
+F:	package/python-appdirs/
+
 N:	Eric Le Bihan <eric.le.bihan.dev@free.fr>
 F:	docs/manual/adding-packages-meson.txt
 F:	package/adwaita-icon-theme/
diff --git a/package/Config.in b/package/Config.in
index 57733f80b5..2e1bf500e0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -942,6 +942,7 @@ menu "External python modules"
 	source "package/python-alembic/Config.in"
 	source "package/python-alsaaudio/Config.in"
 	source "package/python-ansicolors/Config.in"
+	source "package/python-appdirs/Config.in"
 	source "package/python-argh/Config.in"
 	source "package/python-argon2-cffi/Config.in"
 	source "package/python-argon2-cffi-bindings/Config.in"
diff --git a/package/python-appdirs/Config.in b/package/python-appdirs/Config.in
new file mode 100644
index 0000000000..5585759aa6
--- /dev/null
+++ b/package/python-appdirs/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_APPDIRS
+	bool "python-appdirs"
+	help
+	  A small Python module for determining appropriate platform-
+	  specific dirs, e.g. a "user data dir".
+
+	  http://github.com/ActiveState/appdirs
diff --git a/package/python-appdirs/python-appdirs.hash b/package/python-appdirs/python-appdirs.hash
new file mode 100644
index 0000000000..52689b8b2c
--- /dev/null
+++ b/package/python-appdirs/python-appdirs.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/appdirs/json
+md5  d6bca12613174185dd9abc8a29f4f012  appdirs-1.4.4.tar.gz
+sha256  7d5d0167b2b1ba821647616af46a749d1c653740dd0d2415100fe26e27afdf41  appdirs-1.4.4.tar.gz
+# Locally computed sha256 checksums
+sha256  36ddb4d0a745a93ab203203d7190814b1b89727d254caff48c7a7afbbd47000b  LICENSE.txt
diff --git a/package/python-appdirs/python-appdirs.mk b/package/python-appdirs/python-appdirs.mk
new file mode 100644
index 0000000000..222aadbb29
--- /dev/null
+++ b/package/python-appdirs/python-appdirs.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-appdirs
+#
+################################################################################
+
+PYTHON_APPDIRS_VERSION = 1.4.4
+PYTHON_APPDIRS_SOURCE = appdirs-$(PYTHON_APPDIRS_VERSION).tar.gz
+PYTHON_APPDIRS_SITE = https://files.pythonhosted.org/packages/d7/d8/05696357e0311f5b5c316d7b95f46c669dd9c15aaeecbb48c7d0aeb88c40
+PYTHON_APPDIRS_SETUP_TYPE = setuptools
+PYTHON_APPDIRS_LICENSE = MIT
+PYTHON_APPDIRS_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
