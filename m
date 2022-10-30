Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 874CBECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 20:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 186AF81287;
	Sun, 30 Oct 2022 20:50:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 186AF81287
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XxGJO5Vz5bDH; Sun, 30 Oct 2022 20:50:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 393FB81284;
	Sun, 30 Oct 2022 20:50:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 393FB81284
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 34F721BF387
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10E62400EC
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:50:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10E62400EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FxsjaYD8vbCP for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 20:50:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B9EF400DC
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 20:50:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B9EF400DC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 08C0F8767A; Sun, 30 Oct 2022 20:50:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 21:49:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5b3b2d80f4cf586d360ff696c3dacbd4cb48fdc4
X-Git-Newrev: 30df48b207e6c9f63f751d49e9e783fe5e0b6ecd
X-Patchwork-Hint: ignore
Message-Id: <20221030205021.08C0F8767A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-minimalmodbus: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=30df48b207e6c9f63f751d49e9e783fe5e0b6ecd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Easy-to-use Modbus RTU and Modbus ASCII implementation for Python.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                             |  1 +
 package/Config.in                                      |  1 +
 package/python-minimalmodbus/Config.in                 |  7 +++++++
 package/python-minimalmodbus/python-minimalmodbus.hash |  4 ++++
 package/python-minimalmodbus/python-minimalmodbus.mk   | 14 ++++++++++++++
 5 files changed, 27 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8dbd0e0ebb..1380ae6a98 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -173,6 +173,7 @@ F:	package/mono-gtksharp3/
 F:	package/monolite/
 F:	package/openjpeg/
 F:	package/python-can/
+F:	package/python-minimalmodbus/
 F:	package/python-pillow/
 F:	package/python-pydal/
 F:	package/python-spidev/
diff --git a/package/Config.in b/package/Config.in
index 1f4cfa7cfd..7ae354d6eb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1116,6 +1116,7 @@ menu "External python modules"
 	source "package/python-mbstrdecoder/Config.in"
 	source "package/python-memory-profiler/Config.in"
 	source "package/python-mimeparse/Config.in"
+	source "package/python-minimalmodbus/Config.in"
 	source "package/python-mistune/Config.in"
 	source "package/python-modbus-tk/Config.in"
 	source "package/python-more-itertools/Config.in"
diff --git a/package/python-minimalmodbus/Config.in b/package/python-minimalmodbus/Config.in
new file mode 100644
index 0000000000..fd0f33e0d4
--- /dev/null
+++ b/package/python-minimalmodbus/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_MINIMALMODBUS
+	bool "python-minimalmodbus"
+	select BR2_PACKAGE_PYTHON_SERIAL # runtime
+	help
+	  Easy-to-use Modbus RTU and Modbus ASCII implementation.
+
+	  https://minimalmodbus.readthedocs.io/
diff --git a/package/python-minimalmodbus/python-minimalmodbus.hash b/package/python-minimalmodbus/python-minimalmodbus.hash
new file mode 100644
index 0000000000..b29e83773b
--- /dev/null
+++ b/package/python-minimalmodbus/python-minimalmodbus.hash
@@ -0,0 +1,4 @@
+# sha256 from https://pypi.org/project/minimalmodbus
+sha256  cf873a2530be3f4b86467c3e4d47b5f69fd345d47451baca4adbf59e2ac36d00  minimalmodbus-2.0.1.tar.gz
+# Hash for license file
+sha256  abe787d472ae2069e935c84eb13fd770518dfb08b92d5f190f3cd7ff6d1f6f32  LICENSE
diff --git a/package/python-minimalmodbus/python-minimalmodbus.mk b/package/python-minimalmodbus/python-minimalmodbus.mk
new file mode 100644
index 0000000000..b463cf9ffe
--- /dev/null
+++ b/package/python-minimalmodbus/python-minimalmodbus.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-minimalmodbus
+#
+################################################################################
+
+PYTHON_MINIMALMODBUS_VERSION = 2.0.1
+PYTHON_MINIMALMODBUS_SOURCE = minimalmodbus-$(PYTHON_MINIMALMODBUS_VERSION).tar.gz
+PYTHON_MINIMALMODBUS_SITE = https://files.pythonhosted.org/packages/78/99/8cd22b4465e697bae2b02fd06aaccd4c5cdfbb18945d728db99f23d71df9
+PYTHON_MINIMALMODBUS_SETUP_TYPE = setuptools
+PYTHON_MINIMALMODBUS_LICENSE = Apache-2.0
+PYTHON_MINIMALMODBUS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
