Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5256FD2E9F2
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 13:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 101B180D67;
	Mon, 11 Nov 2024 13:36:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qm2uP145sMwn; Mon, 11 Nov 2024 13:36:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFBBB80D48
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFBBB80D48;
	Mon, 11 Nov 2024 13:36:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B6CCDB1
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 13:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3812360697
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 13:36:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JPcMDRmE-E1N for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 13:36:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E8CE6067A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E8CE6067A
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 13:36:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3A98886019; Mon, 11 Nov 2024 13:36:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Nov 2024 11:45:15 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 1992d651b8f76484d01868b1386a39df9c6502f0
X-Git-Newrev: 1e94d7913a67c904b18b484d5e935dfe6771ba2c
X-Patchwork-Hint: ignore
Message-Id: <20241111133629.3A98886019@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/python-pyqt5-sip:
 new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=1e94d7913a67c904b18b484d5e935dfe6771ba2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

This packages adds the PyQt5.sip module.

The official documentation [1] mentions that this module is needed
during PyQt5 runtime. It is currently compiled without any
dependencies to Qt or PyQt5, but it seems quite useless without it.
The module was introduced together with PyQt 5.11 [2].

[1] https://www.riverbankcomputing.com/static/Docs/PyQt5/installation.html#building-and-installing-from-source
[2] https://www.riverbankcomputing.com/static/Docs/PyQt5/incompatibilities.html#pyqt-v5-11

Signed-off-by: Ralf Dragon <hypnotoad@lindra.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 0281a71fe91ff0598be409b261cb38eda1d609a0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                     |  3 +++
 package/Config.in                              |  1 +
 package/python-pyqt5-sip/Config.in             |  7 +++++++
 package/python-pyqt5-sip/python-pyqt5-sip.hash |  7 +++++++
 package/python-pyqt5-sip/python-pyqt5-sip.mk   | 14 ++++++++++++++
 5 files changed, 32 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d5f5eb0f97..c362610071 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2704,6 +2704,9 @@ F:	package/gupnp-av/
 F:	package/let-me-create/
 F:	package/nanomsg/
 
+N:	Ralf Dragon <hypnotoad@lindra.de>
+F:	package/python-pyqt5-sip/
+
 N:	Ramon Fried <rfried.dev@gmail.com>
 F:	package/bitwise/
 
diff --git a/package/Config.in b/package/Config.in
index 74e63419d6..56158d5b07 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1305,6 +1305,7 @@ menu "External python modules"
 	source "package/python-pypng/Config.in"
 	source "package/python-pyqrcode/Config.in"
 	source "package/python-pyqt5/Config.in"
+	source "package/python-pyqt5-sip/Config.in"
 	source "package/python-pyratemp/Config.in"
 	source "package/python-pyroute2/Config.in"
 	source "package/python-pyrsistent/Config.in"
diff --git a/package/python-pyqt5-sip/Config.in b/package/python-pyqt5-sip/Config.in
new file mode 100644
index 0000000000..3eda2c8d1f
--- /dev/null
+++ b/package/python-pyqt5-sip/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_PYQT5_SIP
+	bool "python-pyqt5-sip"
+	help
+	  This is the PyQt5.sip module which is needed at runtime for
+	  the PyQt5 module from package python-pyqt5.
+
+	  https://pypi.org/project/PyQt5-sip/
diff --git a/package/python-pyqt5-sip/python-pyqt5-sip.hash b/package/python-pyqt5-sip/python-pyqt5-sip.hash
new file mode 100644
index 0000000000..fb4a8cb04d
--- /dev/null
+++ b/package/python-pyqt5-sip/python-pyqt5-sip.hash
@@ -0,0 +1,7 @@
+# from https://pypi.org/project/PyQt5-sip/12.30.0
+sha256  7f321daf84b9c9dbca61b80e1ef37bdaffc0e93312edae2cd7da25b953971d91  PyQt5_sip-12.13.0.tar.gz
+
+# Hash for license files:
+md5  9cd437778ebd1c056a76b4ded73b3a6d  LICENSE
+md5  e91355d8a6f8bd8f7c699d62863c7303  LICENSE-GPL2
+md5  7ea41d866d6638e430db5287a3f66090  LICENSE-GPL3
diff --git a/package/python-pyqt5-sip/python-pyqt5-sip.mk b/package/python-pyqt5-sip/python-pyqt5-sip.mk
new file mode 100644
index 0000000000..e52081ab45
--- /dev/null
+++ b/package/python-pyqt5-sip/python-pyqt5-sip.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-SIP-QT5
+#
+################################################################################
+
+PYTHON_PYQT5_SIP_VERSION = 12.13.0
+PYTHON_PYQT5_SIP_SITE = https://files.pythonhosted.org/packages/ee/81/fce2a475aa56c1f49707d9306b930695b6ff078c2242c9f2fd72a3214e1f
+PYTHON_PYQT5_SIP_SOURCE = PyQt5_sip-$(PYTHON_PYQT5_SIP_VERSION).tar.gz
+PYTHON_PYQT5_SIP_LICENSE = SIP license or GPL-2.0 or GPL-3.0
+PYTHON_PYQT5_SIP_LICENSE_FILES = LICENSE LICENSE-GPL2 LICENSE-GPL3
+PYTHON_PYQT5_SIP_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
