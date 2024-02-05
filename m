Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD85FC48295
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 13:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A082606E6;
	Mon,  5 Feb 2024 13:34:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A082606E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t_PPFH02hMT2; Mon,  5 Feb 2024 13:34:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5A2F61006;
	Mon,  5 Feb 2024 13:34:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5A2F61006
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F1BA71BF95D
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4A2B40AB6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:34:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4A2B40AB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qLaJ21mQSVWW for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 13:34:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF39240A87
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 13:34:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF39240A87
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 99DAC86C8F; Mon,  5 Feb 2024 13:34:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 14:33:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ae20955be340cbf9133c6a13a7695759aa4f464b
X-Git-Newrev: 5351578b9698021704df06e840047b0b0c7b372b
X-Patchwork-Hint: ignore
Message-Id: <20240205133402.99DAC86C8F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tcolorpy: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=5351578b9698021704df06e840047b0b0c7b372b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                            |  1 +
 package/python-tcolorpy/Config.in            |  7 +++++++
 package/python-tcolorpy/python-tcolorpy.hash |  5 +++++
 package/python-tcolorpy/python-tcolorpy.mk   | 14 ++++++++++++++
 4 files changed, 27 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index ca1368124f..7fc383da83 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1365,6 +1365,7 @@ menu "External python modules"
 	source "package/python-starlette/Config.in"
 	source "package/python-systemd/Config.in"
 	source "package/python-tabledata/Config.in"
+	source "package/python-tcolorpy/Config.in"
 	source "package/python-tempora/Config.in"
 	source "package/python-termcolor/Config.in"
 	source "package/python-terminaltables/Config.in"
diff --git a/package/python-tcolorpy/Config.in b/package/python-tcolorpy/Config.in
new file mode 100644
index 0000000000..e3e9058483
--- /dev/null
+++ b/package/python-tcolorpy/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_TCOLORPY
+	bool "python-tcolorpy"
+	help
+	  Tcolopy is a Python library to apply true color for
+	  terminal text.
+
+	  https://github.com/thombashi/tcolorpy
diff --git a/package/python-tcolorpy/python-tcolorpy.hash b/package/python-tcolorpy/python-tcolorpy.hash
new file mode 100644
index 0000000000..cf5ca0e5f3
--- /dev/null
+++ b/package/python-tcolorpy/python-tcolorpy.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/tcolorpy/json
+md5  ca571cccff812ecdc0c73968c9d24ebf  tcolorpy-0.1.4.tar.gz
+sha256  f0dceb1cb95e554cee63024b3cd2fd8d4628c568773de2d1e6b4f0478461901c  tcolorpy-0.1.4.tar.gz
+# Locally computed sha256 checksums
+sha256  f41a0456d5f2bba25fd4d7e50b51a95de304770ff1db5a79515d03397a914d8d  LICENSE
diff --git a/package/python-tcolorpy/python-tcolorpy.mk b/package/python-tcolorpy/python-tcolorpy.mk
new file mode 100644
index 0000000000..5c42320c17
--- /dev/null
+++ b/package/python-tcolorpy/python-tcolorpy.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-tcolorpy
+#
+################################################################################
+
+PYTHON_TCOLORPY_VERSION = 0.1.4
+PYTHON_TCOLORPY_SOURCE = tcolorpy-$(PYTHON_TCOLORPY_VERSION).tar.gz
+PYTHON_TCOLORPY_SITE = https://files.pythonhosted.org/packages/ba/e0/20b99847e76bb89784b68634399261d770b01054bca16cd19a06ac9c2e67
+PYTHON_TCOLORPY_SETUP_TYPE = setuptools
+PYTHON_TCOLORPY_LICENSE = MIT
+PYTHON_TCOLORPY_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
