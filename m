Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A730DC3ABA2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 11:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7409E40B42;
	Mon, 16 Sep 2024 11:30:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IH3alk6wJ_T1; Mon, 16 Sep 2024 11:30:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A4DA40B38
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A4DA40B38;
	Mon, 16 Sep 2024 11:30:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 93E891BF3AD
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 11:30:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DFAE60610
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 11:30:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id prFT7g7nh6fU for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 11:30:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DEE260A6E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DEE260A6E
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 11:30:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 499E0838DD; Mon, 16 Sep 2024 11:30:22 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 13:18:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: abce4a2b365276a7fa081d327289e5e6d8bdca7e
X-Git-Newrev: bb0b46508790dbad7439add0698f317c6d17f1d6
X-Patchwork-Hint: ignore
Message-Id: <20240916113022.499E0838DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sdbus: new package
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2931668572332500267=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2931668572332500267==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=bb0b46508790dbad7439add0698f317c6d17f1d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/python-sdbus/Config.in         | 11 +++++++++++
 package/python-sdbus/python-sdbus.hash |  5 +++++
 package/python-sdbus/python-sdbus.mk   | 19 +++++++++++++++++++
 5 files changed, 37 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 929e9f895f..58d365ce8e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2759,6 +2759,7 @@ F:	package/python-jmespath/
 F:	package/python-pymupdf/
 F:	package/python-rsa/
 F:	package/python-s3transfer/
+F:	package/python-sdbus/
 F:	support/testing/tests/package/sample_python_jmespath.py
 F:	support/testing/tests/package/sample_python_pymupdf.py
 F:	support/testing/tests/package/sample_python_rsa.py
diff --git a/package/Config.in b/package/Config.in
index b48f9819df..2532f1a4c4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1360,6 +1360,7 @@ menu "External python modules"
 	source "package/python-scapy/Config.in"
 	source "package/python-schedule/Config.in"
 	source "package/python-scipy/Config.in"
+	source "package/python-sdbus/Config.in"
 	source "package/python-sdnotify/Config.in"
 	source "package/python-secretstorage/Config.in"
 	source "package/python-see/Config.in"
diff --git a/package/python-sdbus/Config.in b/package/python-sdbus/Config.in
new file mode 100644
index 0000000000..b2d3990ab4
--- /dev/null
+++ b/package/python-sdbus/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_SDBUS
+	bool "python-sdbus"
+	depends on BR2_PACKAGE_SYSTEMD # required to get sd-bus
+	help
+	  Modern Python D-Bus library. Based on sd-bus from
+	  libsystemd.
+
+	  https://github.com/igo95862/python-sdbus
+
+comment "python-sdbus needs systemd"
+	depends on !BR2_PACKAGE_SYSTEMD
diff --git a/package/python-sdbus/python-sdbus.hash b/package/python-sdbus/python-sdbus.hash
new file mode 100644
index 0000000000..13c8c2bb5f
--- /dev/null
+++ b/package/python-sdbus/python-sdbus.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/sdbus/json
+md5  46d3ea00a491c2eec2a25ccf61b8a77a  sdbus-0.12.0.tar.gz
+sha256  c3692d75704438a78adc1439350bc32f30d6b38ad344cfc94773db89c6ce4a89  sdbus-0.12.0.tar.gz
+# Locally computed sha256 checksums
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/python-sdbus/python-sdbus.mk b/package/python-sdbus/python-sdbus.mk
new file mode 100644
index 0000000000..0b3ea37b30
--- /dev/null
+++ b/package/python-sdbus/python-sdbus.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# python-sdbus
+#
+################################################################################
+
+PYTHON_SDBUS_VERSION = 0.12.0
+PYTHON_SDBUS_SOURCE = sdbus-$(PYTHON_SDBUS_VERSION).tar.gz
+PYTHON_SDBUS_SITE = https://files.pythonhosted.org/packages/8e/39/3d49f0d18dcba3344af756f31e4408e7de50b3df86fa3f3ea6f604402f16
+PYTHON_SDBUS_SETUP_TYPE = setuptools
+PYTHON_SDBUS_LICENSE = LGPL-2.1+
+PYTHON_SDBUS_LICENSE_FILES = COPYING
+PYTHON_SDBUS_DEPENDENCIES = systemd
+
+ifeq ($(BR2_STATIC_LIBS),y)
+PYTHON_SDBUS_ENV += PYTHON_SDBUS_USE_STATIC_LINK=1
+endif
+
+$(eval $(python-package))

--===============2931668572332500267==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2931668572332500267==--
