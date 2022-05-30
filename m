Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F768C433EF
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 19:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27125840E7;
	Mon, 30 May 2022 19:29:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id suSCeAV3CWcM; Mon, 30 May 2022 19:29:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00C92840DD;
	Mon, 30 May 2022 19:29:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 581121BF2AB
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 19:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 471E941B7C
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 19:29:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NXRWmPGoJSOP for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 19:29:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4985741B56
 for <buildroot@buildroot.org>; Mon, 30 May 2022 19:29:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7D5BC86793; Mon, 30 May 2022 19:17:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 30 May 2022 21:22:06 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d35ba174095b86a0cf724179f7d4e8d0e3d9c127
X-Git-Newrev: 8131ef6554aa34b388de33b6e340b125620c0c78
X-Patchwork-Hint: ignore
Message-Id: <20220530191750.7D5BC86793@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-kflash: new
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

commit: https://git.buildroot.net/buildroot/commit/?id=8131ef6554aa34b388de33b6e340b125620c0c78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add the kflash Kendryte K210 UART ISP Utility as a host package to allow
users to program their board boot ROM or SRAM with built images.

The kflash utility is available through the pypi.org python package
index. The project is homepage is: https://github.com/vowstar/kflash.py.

Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                               |  3 +++
 package/Config.in.host                   |  1 +
 package/python-kflash/Config.in.host     |  7 +++++++
 package/python-kflash/python-kflash.hash |  5 +++++
 package/python-kflash/python-kflash.mk   | 15 +++++++++++++++
 5 files changed, 31 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 435fa28478..096ca94f4e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -630,6 +630,9 @@ N:	Damien Lanson <damien@kal-host.com>
 F:	package/libvdpau/
 F:	package/log4cpp/
 
+N:	Damien Le Moal <damien.lemoal@wdc.com>
+F:	package/python-kflash/
+
 N:	Daniel Nicoletti <dantti12@gmail.com>
 F:	package/cutelyst/
 
diff --git a/package/Config.in.host b/package/Config.in.host
index cd1c34b5a3..8d2a8f4801 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -72,6 +72,7 @@ menu "Host utilities"
 	source "package/pwgen/Config.in.host"
 	source "package/python-cython/Config.in.host"
 	source "package/python-greenlet/Config.in.host"
+	source "package/python-kflash/Config.in.host"
 	source "package/python-lxml/Config.in.host"
 	source "package/python-six/Config.in.host"
 	source "package/python-xlrd/Config.in.host"
diff --git a/package/python-kflash/Config.in.host b/package/python-kflash/Config.in.host
new file mode 100644
index 0000000000..0be8c18f15
--- /dev/null
+++ b/package/python-kflash/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_PYTHON_KFLASH
+	bool "host python-kflash"
+	depends on BR2_RISCV_64 && !BR2_USE_MMU
+	help
+	  Kendryte UART ISP Utility - programming code to k210.
+
+	  https://github.com/vowstar/kflash.py
diff --git a/package/python-kflash/python-kflash.hash b/package/python-kflash/python-kflash.hash
new file mode 100644
index 0000000000..722c4e879b
--- /dev/null
+++ b/package/python-kflash/python-kflash.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/kflash/json
+md5  85549bcc1faa0f2cd5ebe3b04759e7fa  kflash-1.1.5.tar.gz
+sha256  40a0976b52942c7a3bdfa2d9e2bdc8d7526cf6deb0759c8384281240c8fb404e  kflash-1.1.5.tar.gz
+# Locally computed sha256 checksums
+sha256  c48133d7a08d743c2c01c6190fc1860f7d73777afa2199ed8d0a035b754d8bf9  LICENSE
diff --git a/package/python-kflash/python-kflash.mk b/package/python-kflash/python-kflash.mk
new file mode 100644
index 0000000000..adbf6b30b0
--- /dev/null
+++ b/package/python-kflash/python-kflash.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-kflash
+#
+################################################################################
+
+PYTHON_KFLASH_VERSION = 1.1.5
+PYTHON_KFLASH_SOURCE = kflash-$(PYTHON_KFLASH_VERSION).tar.gz
+PYTHON_KFLASH_SITE = https://files.pythonhosted.org/packages/c4/b3/1c25a92922bfd3dbc05d972352c071167cad035c615f6f068f75c2f0fd01
+PYTHON_KFLASH_SETUP_TYPE = setuptools
+PYTHON_KFLASH_LICENSE = MIT
+PYTHON_KFLASH_LICENSE_FILES = LICENSE
+HOST_PYTHON_KFLASH_DEPENDENCIES = host-python-pyelftools host-python-serial
+
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
