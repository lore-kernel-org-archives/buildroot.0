Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E61C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 02:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78F33701E1;
	Tue, 21 Feb 2023 02:04:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78F33701E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1H0itPnuA-l5; Tue, 21 Feb 2023 02:04:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C0EB70270;
	Tue, 21 Feb 2023 02:04:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C0EB70270
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 961701BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E961070051
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E961070051
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id efHIoHdqj0Qx for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:53:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B5DA47002A
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:53:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5DA47002A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF6487FF06; Mon, 20 Feb 2023 20:53:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Feb 2023 15:08:49 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4ced0a528ddbffcc130997aaeee7598c82c6cd49
X-Git-Newrev: a850f632b9f76b8526f807468548c570b1dc2bd6
X-Patchwork-Hint: ignore
Message-Id: <20230220205301.AF6487FF06@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-pycrate: new
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

commit: https://git.buildroot.net/buildroot/commit/?id=a850f632b9f76b8526f807468548c570b1dc2bd6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Nasser Afshin <Afshin.Nasser@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  3 +++
 package/Config.in                          |  1 +
 package/python-pycrate/Config.in           |  6 ++++++
 package/python-pycrate/python-pycrate.hash |  5 +++++
 package/python-pycrate/python-pycrate.mk   | 20 ++++++++++++++++++++
 5 files changed, 35 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a429f81cc9..3d9c51a094 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2092,6 +2092,9 @@ N:	Murat Demirten <mdemirten@yh.com.tr>
 F:	package/jpeg-turbo/
 F:	package/libgeotiff/
 
+N:	Nasser Afshin <afshin.nasser@gmail.com>
+F:	package/python-pycrate/
+
 N:	Nathaniel Roach <nroach44@gmail.com>
 F:	package/bandwidthd/
 F:	package/libgudev/
diff --git a/package/Config.in b/package/Config.in
index e9746862b4..523cf7cbdf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1196,6 +1196,7 @@ menu "External python modules"
 	source "package/python-pycairo/Config.in"
 	source "package/python-pycares/Config.in"
 	source "package/python-pycparser/Config.in"
+	source "package/python-pycrate/Config.in"
 	source "package/python-pycryptodomex/Config.in"
 	source "package/python-pycups/Config.in"
 	source "package/python-pydal/Config.in"
diff --git a/package/python-pycrate/Config.in b/package/python-pycrate/Config.in
new file mode 100644
index 0000000000..193a973f7e
--- /dev/null
+++ b/package/python-pycrate/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PYCRATE
+	bool "python-pycrate"
+	help
+	  A software suite to handle various data formats.
+
+	  https://github.com/P1sec/pycrate/
diff --git a/package/python-pycrate/python-pycrate.hash b/package/python-pycrate/python-pycrate.hash
new file mode 100644
index 0000000000..e37fd6743a
--- /dev/null
+++ b/package/python-pycrate/python-pycrate.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pycrate/json
+md5  075622d5d573274cd4dbfe268ca52f7f  pycrate-0.5.5.tar.gz
+sha256  59f09331890a389a6b98412f19f4fb021c5a75a35ab07bf5ba0d1e299a0967af  pycrate-0.5.5.tar.gz
+# Locally computed
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  license.txt
diff --git a/package/python-pycrate/python-pycrate.mk b/package/python-pycrate/python-pycrate.mk
new file mode 100644
index 0000000000..6779433556
--- /dev/null
+++ b/package/python-pycrate/python-pycrate.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# python-pycrate
+#
+################################################################################
+
+PYTHON_PYCRATE_VERSION = 0.5.5
+PYTHON_PYCRATE_SOURCE = pycrate-$(PYTHON_PYCRATE_VERSION).tar.gz
+PYTHON_PYCRATE_SITE = https://files.pythonhosted.org/packages/25/8f/b3d7e0b541aa04b2f0f7aa694a6946b572bfa2e2627cf1f12b5416d633df
+PYTHON_PYCRATE_SETUP_TYPE = setuptools
+PYTHON_PYCRATE_EXTRA_DOWNLOADS = https://raw.githubusercontent.com/P1sec/pycrate/$(PYTHON_PYCRATE_VERSION)/license.txt
+PYTHON_PYCRATE_LICENSE = LGPL-2.1+
+PYTHON_PYCRATE_LICENSE_FILES = license.txt
+
+define PYTHON_PYCRATE_ADD_LICENSE_FILE
+	cp $(PYTHON_PYCRATE_DL_DIR)/license.txt $(@D)
+endef
+PYTHON_PYCRATE_POST_EXTRACT_HOOKS += PYTHON_PYCRATE_ADD_LICENSE_FILE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
