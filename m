Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 636BFFA3728
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 17:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BBB8408A1;
	Fri,  2 Jan 2026 17:16:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sh6mx7bcOXex; Fri,  2 Jan 2026 17:16:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D84BF4088A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767374209;
	bh=kPgInjF7/05vRVNPfKRIfrpxLxx6yHrhOnvAEXRWtmA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nUn2rN9V7ybX8swP1Rp0TN7rY1s/8xYD8ivZbrEZ/NlZLDPZioMeRLKosL1X18U7j
	 jU4zT5Bp9GbmXb12Dv7c5sSbRz/vcDDQHqgEgXj+qusL4+2PVJFPywFkK2bf7SntSA
	 A+98n04hFhfMIx5phEuRP8Yz21jsOim3A9Tj+fNI1fwcYzIwTdfnBA/V/cHzVrZNPQ
	 Jtmi1deqOz7MK7u2LwplsmV5vNFzLc3IpjlwEndPYi2HezLV2ZD2Sjapumo9z5VZw7
	 TJcktPs9wrXSOxF2PvtnawvOVz+lhGmaTPsHcD8XmUmjvksj01NnRCugTL9U9bIGvR
	 0sLzSPxmlLn7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D84BF4088A;
	Fri,  2 Jan 2026 17:16:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1523F19D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B04C607DA
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:16:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kmaAwjDowk_O for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 17:16:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 569DA60A7F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 569DA60A7F
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:16:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4654F87F83; Fri,  2 Jan 2026 17:16:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 18:12:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 26bc4b51a808d73c09598035aa94f9c37b273218
X-Git-Newrev: e58321b68045a3d6d829788b0904688c03a882e0
X-Patchwork-Hint: ignore
Message-Id: <20260102171641.4654F87F83@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-textual: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e58321b68045a3d6d829788b0904688c03a882e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/python-textual/Config.in           | 11 +++++++++++
 package/python-textual/python-textual.hash |  5 +++++
 package/python-textual/python-textual.mk   | 14 ++++++++++++++
 5 files changed, 32 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3b89a7c481..75502ec687 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1126,6 +1126,7 @@ F:	package/python-platformdirs/
 F:	package/python-pyasynchat/
 F:	package/python-pyasyncore/
 F:	package/python-rich/
+F:	package/python-textual/
 F:	support/testing/tests/package/sample_python_networkmanager_goi.py
 F:	support/testing/tests/package/sample_python_pyroute2.py
 F:	support/testing/tests/package/test_nftables.py
diff --git a/package/Config.in b/package/Config.in
index f4a2a3bb95..43926be751 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1439,6 +1439,7 @@ menu "External python modules"
 	source "package/python-termcolor/Config.in"
 	source "package/python-terminaltables/Config.in"
 	source "package/python-texttable/Config.in"
+	source "package/python-textual/Config.in"
 	source "package/python-tftpy/Config.in"
 	source "package/python-thrift/Config.in"
 	source "package/python-tinycss2/Config.in"
diff --git a/package/python-textual/Config.in b/package/python-textual/Config.in
new file mode 100644
index 0000000000..aecf050ec9
--- /dev/null
+++ b/package/python-textual/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_TEXTUAL
+	bool "python-textual"
+	select BR2_PACKAGE_PYTHON_MARKDOWN_IT_PY # runtime
+	select BR2_PACKAGE_PYTHON_PLATFORMDIRS # runtime
+	select BR2_PACKAGE_PYTHON_PYGMENTS # runtime
+	select BR2_PACKAGE_PYTHON_RICH # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
+	help
+	  Modern Text User Interface framework.
+
+	  https://github.com/Textualize/textual
diff --git a/package/python-textual/python-textual.hash b/package/python-textual/python-textual.hash
new file mode 100644
index 0000000000..692e0d757b
--- /dev/null
+++ b/package/python-textual/python-textual.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/textual/json
+md5  cb43b8d6d3903ca171330a626cfa05e5  textual-5.3.0.tar.gz
+sha256  1b6128b339adef2e298cc23ab4777180443240ece5c232f29b22960efd658d4d  textual-5.3.0.tar.gz
+# Locally computed sha256 checksums
+sha256  94f290a762376dfdb7768e42070618b0abfd2a2799eab1b1c097816c3a39eb57  LICENSE
diff --git a/package/python-textual/python-textual.mk b/package/python-textual/python-textual.mk
new file mode 100644
index 0000000000..49cccc299d
--- /dev/null
+++ b/package/python-textual/python-textual.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-textual
+#
+################################################################################
+
+PYTHON_TEXTUAL_VERSION = 5.3.0
+PYTHON_TEXTUAL_SOURCE = textual-$(PYTHON_TEXTUAL_VERSION).tar.gz
+PYTHON_TEXTUAL_SITE = https://files.pythonhosted.org/packages/ba/ce/f0f938d33d9bebbf8629e0020be00c560ddfa90a23ebe727c2e5aa3f30cf
+PYTHON_TEXTUAL_SETUP_TYPE = poetry
+PYTHON_TEXTUAL_LICENSE = MIT
+PYTHON_TEXTUAL_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
