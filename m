Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0689ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 09:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EAB984338;
	Sun, 11 Sep 2022 09:05:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EAB984338
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pZcU1Jch-qlh; Sun, 11 Sep 2022 09:05:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 814A684323;
	Sun, 11 Sep 2022 09:05:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 814A684323
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 077821BF990
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25C5881396
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25C5881396
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oKwzxs7CW6OC for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFE3183EDA
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFE3183EDA
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id EA02B83518; Sun, 11 Sep 2022 08:48:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 24 Aug 2022 12:07:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bf85b8e267b5fbbf817408d93435504ab458c01e
X-Git-Newrev: f0520470951528eb07710338e7427a1fd0159b48
X-Patchwork-Hint: ignore
Message-Id: <20220911084826.EA02B83518@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-libevdev: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=f0520470951528eb07710338e7427a1fd0159b48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-libevdev is needed for libinput replay command:

$ libinput replay recording.yml
Error: No module named 'libevdev'
One or more python modules are missing. Please install those modules and re-run this tool.

Indeed only libinput-replay tool is a python script
(like libinput-analyze-recording, libinput-measure-fuzz...)

python-libevdev itself requires a kernel built with
CONFIG_INPUT_UINPUT option enabled, enable this option if a kernel is
built by Buildroot.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/python-libevdev/Config.in            |  7 +++++++
 package/python-libevdev/python-libevdev.hash |  5 +++++
 package/python-libevdev/python-libevdev.mk   | 20 ++++++++++++++++++++
 5 files changed, 34 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 55b23ebef2..07d719984a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2584,6 +2584,7 @@ F:	package/ogre/
 F:	package/openpowerlink/
 F:	package/physfs/
 F:	package/piglit/
+F:	package/python-libevdev/
 F:	package/qemu/
 F:	package/solarus/
 F:	package/stress-ng/
diff --git a/package/Config.in b/package/Config.in
index 802fb5da30..4bfc12d1d1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1095,6 +1095,7 @@ menu "External python modules"
 	source "package/python-kiwisolver/Config.in"
 	source "package/python-lark/Config.in"
 	source "package/python-libconfig/Config.in"
+	source "package/python-libevdev/Config.in"
 	source "package/python-libusb1/Config.in"
 	source "package/python-lmdb/Config.in"
 	source "package/python-lockfile/Config.in"
diff --git a/package/python-libevdev/Config.in b/package/python-libevdev/Config.in
new file mode 100644
index 0000000000..2d6aa49ce0
--- /dev/null
+++ b/package/python-libevdev/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_LIBEVDEV
+	bool "python-libevdev"
+	select BR2_PACKAGE_LIBEVDEV # runtime
+	help
+	  Python wrapper for libevdev.
+
+	  https://gitlab.freedesktop.org/libevdev/python-libevdev
diff --git a/package/python-libevdev/python-libevdev.hash b/package/python-libevdev/python-libevdev.hash
new file mode 100644
index 0000000000..2799078cc8
--- /dev/null
+++ b/package/python-libevdev/python-libevdev.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/libevdev/json
+md5  34b48098c1fba26de79a0d67a17a588a  libevdev-0.11.tar.gz
+sha256  e9ca006a4df2488a60bd9a740011ee948d81904be2364f017e560169508f560f  libevdev-0.11.tar.gz
+# Locally computed sha256 checksums
+sha256  a547b196da4e5bb9588a6e24f1f36ae9e2349ca5375e2cf9c315186e237d9f6d  COPYING
diff --git a/package/python-libevdev/python-libevdev.mk b/package/python-libevdev/python-libevdev.mk
new file mode 100644
index 0000000000..e5256064c9
--- /dev/null
+++ b/package/python-libevdev/python-libevdev.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# python-libevdev
+#
+################################################################################
+
+PYTHON_LIBEVDEV_VERSION = 0.11
+PYTHON_LIBEVDEV_SOURCE = libevdev-$(PYTHON_LIBEVDEV_VERSION).tar.gz
+PYTHON_LIBEVDEV_SITE = https://files.pythonhosted.org/packages/b0/49/2fe589ce1fa6ca0f05ae0b1717923650f2cc6eec6307c71fbc7789738902
+PYTHON_LIBEVDEV_SETUP_TYPE = setuptools
+PYTHON_LIBEVDEV_LICENSE = MIT
+PYTHON_LIBEVDEV_LICENSE_FILES = COPYING
+
+# Requires a kernel built with user level driver support (uinput).
+define PYTHON_LIBEVDEV_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INPUT_MISC)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INPUT_UINPUT)
+endef
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
