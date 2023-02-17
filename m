Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F22C05027
	for <buildroot@archiver.kernel.org>; Fri, 17 Feb 2023 14:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66E00405D4;
	Fri, 17 Feb 2023 14:12:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66E00405D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t_bH_o2iMQwh; Fri, 17 Feb 2023 14:12:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8896E40530;
	Fri, 17 Feb 2023 14:12:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8896E40530
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 270671BF34A
 for <buildroot@lists.busybox.net>; Fri, 17 Feb 2023 14:12:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0614A82018
 for <buildroot@lists.busybox.net>; Fri, 17 Feb 2023 14:12:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0614A82018
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3rJ6uYAOL4Ve for <buildroot@lists.busybox.net>;
 Fri, 17 Feb 2023 14:12:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1500F82006
 for <buildroot@buildroot.org>; Fri, 17 Feb 2023 14:12:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1500F82006
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EF90C85FD9; Fri, 17 Feb 2023 14:12:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Feb 2023 15:08:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4ced0a528ddbffcc130997aaeee7598c82c6cd49
X-Git-Newrev: a850f632b9f76b8526f807468548c570b1dc2bd6
X-Patchwork-Hint: ignore
Message-Id: <20230217141250.EF90C85FD9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pycrate: new package
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
