Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC9EC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A32C2606BF;
	Tue, 21 Feb 2023 01:19:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A32C2606BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rpGZvTt36nkJ; Tue, 21 Feb 2023 01:19:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EDF46F9C8;
	Tue, 21 Feb 2023 01:19:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EDF46F9C8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BB0ED1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB3FC6FBE2
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB3FC6FBE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id njVCguHJ4AbR for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07EBA6FBB4
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07EBA6FBB4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E695E828C8; Mon, 20 Feb 2023 20:52:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Jan 2023 23:24:06 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 498797acce390a8c91b6a3c306a4655e83ae9f6f
X-Git-Newrev: c4192ba970f33142c03792980e9f0625be07b31b
X-Patchwork-Hint: ignore
Message-Id: <20230220205242.E695E828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-uhid: new
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c4192ba970f33142c03792980e9f0625be07b31b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This package requires CONFIG_UHID kernel support.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/python-uhid/Config.in        |  6 ++++++
 package/python-uhid/python-uhid.hash |  5 +++++
 package/python-uhid/python-uhid.mk   | 20 ++++++++++++++++++++
 5 files changed, 33 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e942b4b3f2..c8bc5eee22 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1401,6 +1401,7 @@ F:	package/python-tinycss2/
 F:	package/python-tomli/
 F:	package/python-typeguard/
 F:	package/python-typing-inspect/
+F:	package/python-uhid/
 F:	package/python-weasyprint/
 F:	package/python-yarl/
 F:	package/python-zopfli/
diff --git a/package/Config.in b/package/Config.in
index eabb0d5201..24be67b925 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1313,6 +1313,7 @@ menu "External python modules"
 	source "package/python-typing-inspect/Config.in"
 	source "package/python-u-msgpack/Config.in"
 	source "package/python-ubjson/Config.in"
+	source "package/python-uhid/Config.in"
 	source "package/python-ujson/Config.in"
 	source "package/python-unittest-xml-reporting/Config.in"
 	source "package/python-urllib3/Config.in"
diff --git a/package/python-uhid/Config.in b/package/python-uhid/Config.in
new file mode 100644
index 0000000000..6fdff95144
--- /dev/null
+++ b/package/python-uhid/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_UHID
+	bool "python-uhid"
+	help
+	  Pure Python typed UHID wrapper.
+
+	  https://github.com/FFY00/python-uhid
diff --git a/package/python-uhid/python-uhid.hash b/package/python-uhid/python-uhid.hash
new file mode 100644
index 0000000000..3faf6d9f23
--- /dev/null
+++ b/package/python-uhid/python-uhid.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/uhid/json
+md5  1c62bbefe10923545bbdf42355d9be07  uhid-0.0.1.tar.gz
+sha256  3c782489890dbf33621fb2c30d1ac81fbc1b3ef1911ae7d4c73907cdc0f59aab  uhid-0.0.1.tar.gz
+# Locally computed sha256 checksums
+sha256  106a8f7c2c26bd2acc597c79a36a2fe3979f98a14dc14c6065b7dc9c58b27f33  LICENSE
diff --git a/package/python-uhid/python-uhid.mk b/package/python-uhid/python-uhid.mk
new file mode 100644
index 0000000000..215545b60f
--- /dev/null
+++ b/package/python-uhid/python-uhid.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# python-uhid
+#
+################################################################################
+
+PYTHON_UHID_VERSION = 0.0.1
+PYTHON_UHID_SOURCE = uhid-$(PYTHON_UHID_VERSION).tar.gz
+PYTHON_UHID_SITE = https://files.pythonhosted.org/packages/cb/44/6ebe9dceadc028507d16603e2bb542557a4c70c6032ef8ee507c3ce51283
+PYTHON_UHID_SETUP_TYPE = setuptools
+PYTHON_UHID_LICENSE = MIT
+PYTHON_UHID_LICENSE_FILES = LICENSE
+
+define PYTHON_UHID_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INPUT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_HID)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_UHID)
+endef
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
