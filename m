Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B09C3ABB2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 11:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8569740B3C;
	Mon, 16 Sep 2024 11:30:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2oov4H1TnyFF; Mon, 16 Sep 2024 11:30:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDC4140B65
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDC4140B65;
	Mon, 16 Sep 2024 11:30:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9F7691BF3AD
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 11:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A6C0403DE
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 11:30:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Glkp2rLZKL1V for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 11:30:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 784B2403D6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 784B2403D6
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 11:30:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 644C5838DF; Mon, 16 Sep 2024 11:30:22 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 13:27:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4c74afbcaabbe4ecd59d1af556c11f1352a6ac4a
X-Git-Newrev: 00514d75e0d14e57e5ae30a64cae52887a0f97e6
X-Patchwork-Hint: ignore
Message-Id: <20240916113022.644C5838DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sdbus-networkmanager: new
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4119116475192893501=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4119116475192893501==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=00514d75e0d14e57e5ae30a64cae52887a0f97e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
[yann.morin.1998@free.fr: add missing dependency on systemd]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                                 |  1 +
 package/Config.in                                          |  1 +
 package/python-sdbus-networkmanager/Config.in              | 12 ++++++++++++
 .../python-sdbus-networkmanager.hash                       |  5 +++++
 .../python-sdbus-networkmanager.mk                         | 14 ++++++++++++++
 5 files changed, 33 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4b0bde095f..57e59f907b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2760,6 +2760,7 @@ F:	package/python-pymupdf/
 F:	package/python-rsa/
 F:	package/python-s3transfer/
 F:	package/python-sdbus/
+F:	package/python-sdbus-networkmanager/
 F:	support/testing/tests/package/sample_python_jmespath.py
 F:	support/testing/tests/package/sample_python_pymupdf.py
 F:	support/testing/tests/package/sample_python_rsa.py
diff --git a/package/Config.in b/package/Config.in
index 2532f1a4c4..4c01f44641 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1361,6 +1361,7 @@ menu "External python modules"
 	source "package/python-schedule/Config.in"
 	source "package/python-scipy/Config.in"
 	source "package/python-sdbus/Config.in"
+	source "package/python-sdbus-networkmanager/Config.in"
 	source "package/python-sdnotify/Config.in"
 	source "package/python-secretstorage/Config.in"
 	source "package/python-see/Config.in"
diff --git a/package/python-sdbus-networkmanager/Config.in b/package/python-sdbus-networkmanager/Config.in
new file mode 100644
index 0000000000..a1e0133c94
--- /dev/null
+++ b/package/python-sdbus-networkmanager/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PYTHON_SDBUS_NETWORKMANAGER
+	bool "python-sdbus-networkmanager"
+	depends on BR2_PACKAGE_SYSTEMD
+	depends on BR2_PACKAGE_NETWORK_MANAGER # runtime
+	select BR2_PACKAGE_PYTHON_SDBUS # runtime
+	help
+	  NetworkManager binds for sdbus.
+
+	  https://github.com/igo95862/python-sdbus
+
+comment "python-sdbus-networkmanager needs systemd and network-manager"
+	depends on !BR2_PACKAGE_SYSTEMD || !BR2_PACKAGE_NETWORK_MANAGER
diff --git a/package/python-sdbus-networkmanager/python-sdbus-networkmanager.hash b/package/python-sdbus-networkmanager/python-sdbus-networkmanager.hash
new file mode 100644
index 0000000000..da65e3cda4
--- /dev/null
+++ b/package/python-sdbus-networkmanager/python-sdbus-networkmanager.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/sdbus-networkmanager/json
+md5  ce27908559f200219a090b61503c2ef6  sdbus-networkmanager-2.0.0.tar.gz
+sha256  3572ac3a8189c683ec0416acb148761773a8f0881ad3d78b6d6f6864eff9c50b  sdbus-networkmanager-2.0.0.tar.gz
+# Locally computed sha256 checksums
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/python-sdbus-networkmanager/python-sdbus-networkmanager.mk b/package/python-sdbus-networkmanager/python-sdbus-networkmanager.mk
new file mode 100644
index 0000000000..2ad93852fc
--- /dev/null
+++ b/package/python-sdbus-networkmanager/python-sdbus-networkmanager.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-sdbus-networkmanager
+#
+################################################################################
+
+PYTHON_SDBUS_NETWORKMANAGER_VERSION = 2.0.0
+PYTHON_SDBUS_NETWORKMANAGER_SOURCE = sdbus-networkmanager-$(PYTHON_SDBUS_NETWORKMANAGER_VERSION).tar.gz
+PYTHON_SDBUS_NETWORKMANAGER_SITE = https://files.pythonhosted.org/packages/31/ab/e864c6c2eb778c194cfb56cd9d98b5594dc00573210fdf6b44904745a0bf
+PYTHON_SDBUS_NETWORKMANAGER_SETUP_TYPE = setuptools
+PYTHON_SDBUS_NETWORKMANAGER_LICENSE = LGPL-2.1+
+PYTHON_SDBUS_NETWORKMANAGER_LICENSE_FILES = COPYING
+
+$(eval $(python-package))

--===============4119116475192893501==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4119116475192893501==--
