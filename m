Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A5BC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 20:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C3C7612DC;
	Thu,  9 May 2024 20:18:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dKWyJYIJUVBl; Thu,  9 May 2024 20:18:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2BB8612E6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2BB8612E6;
	Thu,  9 May 2024 20:18:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E6B721BF98E
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D34B183FC3
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:18:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aeqqiD3nY-6W for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 20:18:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0973D83FBD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0973D83FBD
 for <buildroot@buildroot.org>; Thu,  9 May 2024 20:18:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 00CC886D97; Thu,  9 May 2024 20:18:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 22:13:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 415398960f3d1c48d3610ce1b47bb8d37d17bfa3
X-Git-Newrev: 4432b0879022a611a0e23374a287191001ba4a7c
X-Patchwork-Hint: ignore
Message-Id: <20240509201804.00CC886D97@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-hid: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=4432b0879022a611a0e23374a287191001ba4a7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A python wrapper for the hidapi library.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/python-hid/Config.in       | 15 +++++++++++++++
 package/python-hid/python-hid.hash |  5 +++++
 package/python-hid/python-hid.mk   | 14 ++++++++++++++
 5 files changed, 36 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2054b8be4d..8ebeae1af1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2506,6 +2506,7 @@ F:	package/python-cached-property/
 F:	package/python-docker/
 F:	package/python-dockerpty/
 F:	package/python-docker-pycreds/
+F:	package/python-hid/
 F:	package/python-psutil/
 F:	package/python-request-id/
 F:	package/python-semver/
diff --git a/package/Config.in b/package/Config.in
index f803ecaed8..deb5d5e10f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1121,6 +1121,7 @@ menu "External python modules"
 	source "package/python-gunicorn/Config.in"
 	source "package/python-h11/Config.in"
 	source "package/python-h2/Config.in"
+	source "package/python-hid/Config.in"
 	source "package/python-hiredis/Config.in"
 	source "package/python-hkdf/Config.in"
 	source "package/python-hpack/Config.in"
diff --git a/package/python-hid/Config.in b/package/python-hid/Config.in
new file mode 100644
index 0000000000..3a9e16c9f4
--- /dev/null
+++ b/package/python-hid/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_PYTHON_HID
+	bool "python-hid"
+	depends on BR2_PACKAGE_HAS_UDEV # hidapi
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # hidapi
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # hidapi
+	select BR2_PACKAGE_HIDAPI
+	help
+	  ctypes bindings for hidapi.
+
+	  https://github.com/apmorton/pyhidapi
+
+comment "python-hid needs udev /dev management and a toolchain w/ NPTL, gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+		!BR2_PACKAGE_HAS_UDEV || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/python-hid/python-hid.hash b/package/python-hid/python-hid.hash
new file mode 100644
index 0000000000..d03757771b
--- /dev/null
+++ b/package/python-hid/python-hid.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/hid/json
+md5  1954df0dce4e15afd89197e898039e92  hid-1.0.6.tar.gz
+sha256  48d764d7ae9746ba123b96dbf457893ca80268b7791c4b1d2e051310eeb83860  hid-1.0.6.tar.gz
+# Locally computed sha256 checksums
+sha256  5524b425acacdfedeca3f959980f0cd38b00176ebbb292e4a96c520d6074353d  LICENSE
diff --git a/package/python-hid/python-hid.mk b/package/python-hid/python-hid.mk
new file mode 100644
index 0000000000..2f65bd1412
--- /dev/null
+++ b/package/python-hid/python-hid.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-hid
+#
+################################################################################
+
+PYTHON_HID_VERSION = 1.0.6
+PYTHON_HID_SOURCE = hid-$(PYTHON_HID_VERSION).tar.gz
+PYTHON_HID_SITE = https://files.pythonhosted.org/packages/50/b8/5f470948262b6cdda8e1b2382b19f67c57eacda1e07a14322807b911e0ce
+PYTHON_HID_SETUP_TYPE = setuptools
+PYTHON_HID_LICENSE = MIT
+PYTHON_HID_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
