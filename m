Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1EB2C433FE
	for <buildroot@archiver.kernel.org>; Thu, 24 Nov 2022 21:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 138208223E;
	Thu, 24 Nov 2022 21:36:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 138208223E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RiDQ6Jb1VhQb; Thu, 24 Nov 2022 21:35:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3699482233;
	Thu, 24 Nov 2022 21:35:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3699482233
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9D79C1BF311
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 21:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FFB082235
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 21:35:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FFB082235
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5L4FTklA6CoQ for <buildroot@lists.busybox.net>;
 Thu, 24 Nov 2022 21:35:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0FCF82233
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 21:35:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0FCF82233
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9F9D28459D; Thu, 24 Nov 2022 21:35:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Nov 2022 22:30:38 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4eb1dde125f2cc253b839fb833904b366f9d06c3
X-Git-Newrev: f3aaa6fd2aa5ba132ba6f95a12fc463ed6f4d850
X-Patchwork-Hint: ignore
Message-Id: <20221124213555.9F9D28459D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-smbprotocol:
 new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=f3aaa6fd2aa5ba132ba6f95a12fc463ed6f4d850
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                  |  1 +
 package/python-smbprotocol/Config.in               |  9 +++++++++
 package/python-smbprotocol/python-smbprotocol.hash |  6 ++++++
 package/python-smbprotocol/python-smbprotocol.mk   | 14 ++++++++++++++
 4 files changed, 30 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index eafc5ae5ff..cafd3b338c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1266,6 +1266,7 @@ menu "External python modules"
 	source "package/python-sip/Config.in"
 	source "package/python-six/Config.in"
 	source "package/python-slob/Config.in"
+	source "package/python-smbprotocol/Config.in"
 	source "package/python-smbus-cffi/Config.in"
 	source "package/python-smmap2/Config.in"
 	source "package/python-snappy/Config.in"
diff --git a/package/python-smbprotocol/Config.in b/package/python-smbprotocol/Config.in
new file mode 100644
index 0000000000..ae58a7d9a1
--- /dev/null
+++ b/package/python-smbprotocol/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_SMBPROTOCOL
+	bool "python-smbprotocol"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
+	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
+	select BR2_PACKAGE_PYTHON_PYSPNEGO # runtime
+	help
+	  Interact with a server using the SMB 2/3 Protocol.
+
+	  https://github.com/jborean93/smbprotocol
diff --git a/package/python-smbprotocol/python-smbprotocol.hash b/package/python-smbprotocol/python-smbprotocol.hash
new file mode 100644
index 0000000000..a46f9f635b
--- /dev/null
+++ b/package/python-smbprotocol/python-smbprotocol.hash
@@ -0,0 +1,6 @@
+# md5, sha256 from https://pypi.org/pypi/smbprotocol/json
+md5  a7474ab4cf8912dffaab56ad5067f429  smbprotocol-1.10.1.tar.gz
+sha256  b5bc9d4930ec947d42c21089a4d373b97e3f6488fd15d32d27189312fd8a04c9  smbprotocol-1.10.1.tar.gz
+
+# Locally computed
+sha256  4c3c550abc2b04c507ed0d641dd7e524eaff5bd06c7862af957301836d496d15  LICENSE
diff --git a/package/python-smbprotocol/python-smbprotocol.mk b/package/python-smbprotocol/python-smbprotocol.mk
new file mode 100644
index 0000000000..17c2b17dbc
--- /dev/null
+++ b/package/python-smbprotocol/python-smbprotocol.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-smbprotocol
+#
+################################################################################
+
+PYTHON_SMBPROTOCOL_VERSION = 1.10.1
+PYTHON_SMBPROTOCOL_SOURCE = smbprotocol-$(PYTHON_SMBPROTOCOL_VERSION).tar.gz
+PYTHON_SMBPROTOCOL_SITE = https://files.pythonhosted.org/packages/13/1a/73ad1883beebe4f6f47879cb9880690944faa00681141920c7a2219f6152
+PYTHON_SMBPROTOCOL_SETUP_TYPE = setuptools
+PYTHON_SMBPROTOCOL_LICENSE = MIT
+PYTHON_SMBPROTOCOL_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
