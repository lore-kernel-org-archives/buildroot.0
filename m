Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA3FCCD1A4
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 14:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 856E160D7C;
	Sat, 18 Oct 2025 14:38:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ggnMV96N2x8n; Sat, 18 Oct 2025 14:38:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77D0260D93
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77D0260D93;
	Sat, 18 Oct 2025 14:38:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6495A43F
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 14:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56EE1407B1
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 14:38:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fAcxUymwNzd7 for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 14:38:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CDEB407A2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CDEB407A2
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 14:38:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 85B1C87426; Sat, 18 Oct 2025 14:38:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 18 Oct 2025 16:38:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cc114f737614d801408ecf93bc5ae51bfb164fbe
X-Git-Newrev: 3963c3c06e3a4161e0ebb570db80ab0b297c9a6a
X-Patchwork-Hint: ignore
Message-Id: <20251018143836.85B1C87426@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-scp: new package
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6543162301698623453=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6543162301698623453==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3963c3c06e3a4161e0ebb570db80ab0b297c9a6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add python-scp as a new package. python-scp allows to send and receives
files in python through the scp1 protocol, on top of paramiko.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                         |  3 +++
 package/Config.in                  |  1 +
 package/python-scp/Config.in       |  7 +++++++
 package/python-scp/python-scp.hash |  5 +++++
 package/python-scp/python-scp.mk   | 14 ++++++++++++++
 5 files changed, 30 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2ba6096464..69f22259e8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -148,6 +148,9 @@ F:	configs/cubieboard2_defconfig
 N:	Alexey Lukyanchuk <skif@skif-web.ru>
 F:	package/zabbix/
 
+N: 	Alexis Lothoré <alexis.lothore@bootlin.com>
+F: 	package/python-scp
+
 N:	Alistair Francis <alistair@alistair23.me>
 F:	board/sifive/
 F:	boot/opensbi/
diff --git a/package/Config.in b/package/Config.in
index 43e7b36446..161d61728b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1384,6 +1384,7 @@ menu "External python modules"
 	source "package/python-scapy/Config.in"
 	source "package/python-schedule/Config.in"
 	source "package/python-scipy/Config.in"
+	source "package/python-scp/Config.in"
 	source "package/python-sdbus/Config.in"
 	source "package/python-sdbus-modemmanager/Config.in"
 	source "package/python-sdbus-networkmanager/Config.in"
diff --git a/package/python-scp/Config.in b/package/python-scp/Config.in
new file mode 100644
index 0000000000..1db0e910f4
--- /dev/null
+++ b/package/python-scp/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_SCP
+	bool "python-scp"
+	select BR2_PACKAGE_PYTHON_PARAMIKO # runtime
+	help
+	  scp module for paramiko.
+
+	  https://github.com/jbardin/scp.py
diff --git a/package/python-scp/python-scp.hash b/package/python-scp/python-scp.hash
new file mode 100644
index 0000000000..4ec4e6a41a
--- /dev/null
+++ b/package/python-scp/python-scp.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/scp/json
+md5  54c0e3b6cc52620ce3a81362fa8bb29d  scp-0.15.0.tar.gz
+sha256  f1b22e9932123ccf17eebf19e0953c6e9148f589f93d91b872941a696305c83f  scp-0.15.0.tar.gz
+# Locally computed sha256 checksums
+sha256  2455cf0fc78e13772bf10ef5f209e7eb8625706d671b2f420cc8add37d548c1c  LICENSE.txt
diff --git a/package/python-scp/python-scp.mk b/package/python-scp/python-scp.mk
new file mode 100644
index 0000000000..d223b16290
--- /dev/null
+++ b/package/python-scp/python-scp.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-scp
+#
+################################################################################
+
+PYTHON_SCP_VERSION = 0.15.0
+PYTHON_SCP_SOURCE = scp-$(PYTHON_SCP_VERSION).tar.gz
+PYTHON_SCP_SITE = https://files.pythonhosted.org/packages/d6/1c/d213e1c6651d0bd37636b21b1ba9b895f276e8057f882c9f944931e4f002
+PYTHON_SCP_SETUP_TYPE = setuptools
+PYTHON_SCP_LICENSE = LGPL-2.1+
+PYTHON_SCP_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))

--===============6543162301698623453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6543162301698623453==--
