Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18CFC71136
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 08:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BC8C83544;
	Thu, 12 Jun 2025 08:40:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zV3t0SM6VXcz; Thu, 12 Jun 2025 08:40:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EBCD82076
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EBCD82076;
	Thu, 12 Jun 2025 08:40:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C8B0E1BD
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2225421AB
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D-udbFbSt90e for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 08:38:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08C3742142
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08C3742142
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 06EE680FF9; Thu, 12 Jun 2025 08:38:32 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 1 Jun 2025 18:07:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 577c08ca25f6d892db6bc37fcc7f1e9d7a330046
X-Git-Newrev: c80d4ca76d53e3dc50f3201c59b4f277e749d0e0
X-Patchwork-Hint: ignore
Message-Id: <20250612083832.06EE680FF9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sdbus-modemmanager: new
 package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c80d4ca76d53e3dc50f3201c59b4f277e749d0e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                                 |  1 +
 package/Config.in                                          |  1 +
 package/python-sdbus-modemmanager/Config.in                | 12 ++++++++++++
 .../python-sdbus-modemmanager.hash                         |  5 +++++
 .../python-sdbus-modemmanager/python-sdbus-modemmanager.mk | 14 ++++++++++++++
 5 files changed, 33 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5987eef735..4a64d4a017 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2284,6 +2284,7 @@ F:	package/python-pydantic-settings/
 F:	package/python-ruamel-yaml-clib/
 F:	package/python-typing-inspection/
 F:	package/python-tzlocal/
+F:	package/python-sdbus-modemmanager/
 F:	package/python-waitress/
 F:	support/testing/tests/package/test_python_fastapi.py
 F:	support/testing/tests/package/test_python_pydantic.py
diff --git a/package/Config.in b/package/Config.in
index ac8951abc2..6e9846cee5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1389,6 +1389,7 @@ menu "External python modules"
 	source "package/python-schedule/Config.in"
 	source "package/python-scipy/Config.in"
 	source "package/python-sdbus/Config.in"
+	source "package/python-sdbus-modemmanager/Config.in"
 	source "package/python-sdbus-networkmanager/Config.in"
 	source "package/python-sdnotify/Config.in"
 	source "package/python-secretstorage/Config.in"
diff --git a/package/python-sdbus-modemmanager/Config.in b/package/python-sdbus-modemmanager/Config.in
new file mode 100644
index 0000000000..bf2759b4fc
--- /dev/null
+++ b/package/python-sdbus-modemmanager/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PYTHON_SDBUS_MODEMMANAGER
+	bool "python-sdbus-modemmanager"
+	depends on BR2_PACKAGE_SYSTEMD
+	depends on BR2_PACKAGE_MODEM_MANAGER # runtime
+	select BR2_PACKAGE_PYTHON_SDBUS # runtime
+	help
+	  ModemManager bindings for sdbus.
+
+	  https://github.com/zhanglongqi/python-sdbus-modemmanager
+
+comment "python-sdbus-modemmanager needs systemd and modem-manager"
+	depends on !BR2_PACKAGE_SYSTEMD || !BR2_PACKAGE_MODEM_MANAGER
diff --git a/package/python-sdbus-modemmanager/python-sdbus-modemmanager.hash b/package/python-sdbus-modemmanager/python-sdbus-modemmanager.hash
new file mode 100644
index 0000000000..980568cb0d
--- /dev/null
+++ b/package/python-sdbus-modemmanager/python-sdbus-modemmanager.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/sdbus-modemmanager/json
+md5  720d59e444d84d77c184bc73844cfebd  sdbus_modemmanager-1.0.2.tar.gz
+sha256  80ed83a158eeb8d9b0e0c1e5110c5f71307df87523245e4d0e79ebe200932fc6  sdbus_modemmanager-1.0.2.tar.gz
+# Locally computed sha256 checksums
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/python-sdbus-modemmanager/python-sdbus-modemmanager.mk b/package/python-sdbus-modemmanager/python-sdbus-modemmanager.mk
new file mode 100644
index 0000000000..2821453270
--- /dev/null
+++ b/package/python-sdbus-modemmanager/python-sdbus-modemmanager.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-sdbus-modemmanager
+#
+################################################################################
+
+PYTHON_SDBUS_MODEMMANAGER_VERSION = 1.0.2
+PYTHON_SDBUS_MODEMMANAGER_SOURCE = sdbus_modemmanager-$(PYTHON_SDBUS_MODEMMANAGER_VERSION).tar.gz
+PYTHON_SDBUS_MODEMMANAGER_SITE = https://files.pythonhosted.org/packages/af/99/a17942d9abda13ad1f27f39e900e39852a6215b70e30b682b777dfeff818
+PYTHON_SDBUS_MODEMMANAGER_SETUP_TYPE = setuptools
+PYTHON_SDBUS_MODEMMANAGER_LICENSE = LGPL-2.1+
+PYTHON_SDBUS_MODEMMANAGER_LICENSE_FILES = COPYING.LESSER
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
