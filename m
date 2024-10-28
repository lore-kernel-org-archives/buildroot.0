Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4012DD33993
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 14:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00E39402CC;
	Mon, 28 Oct 2024 14:41:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ifGSsm8F3nq1; Mon, 28 Oct 2024 14:41:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA693402EB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA693402EB;
	Mon, 28 Oct 2024 14:41:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2179F5C1E
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1CBEF60596
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:40:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9JNZtQibjZhJ for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 14:40:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02C9A605C2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02C9A605C2
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:40:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F3EB78430D; Mon, 28 Oct 2024 14:40:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Oct 2024 14:48:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 28cf4322eec86845928d6acca6341ae0ecb5e97d
X-Git-Newrev: 52ed5993486ba0a8a5e165954b789f21b0e2169c
X-Patchwork-Hint: ignore
Message-Id: <20241028144052.F3EB78430D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-legacy-cgi: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=52ed5993486ba0a8a5e165954b789f21b0e2169c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                |  1 +
 package/python-legacy-cgi/Config.in              |  7 +++++++
 package/python-legacy-cgi/python-legacy-cgi.hash |  5 +++++
 package/python-legacy-cgi/python-legacy-cgi.mk   | 15 +++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 0e311ad55c..a4fcc56947 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1193,6 +1193,7 @@ menu "External python modules"
 	source "package/python-kiwisolver/Config.in"
 	source "package/python-kmod/Config.in"
 	source "package/python-lark/Config.in"
+	source "package/python-legacy-cgi/Config.in"
 	source "package/python-libconf/Config.in"
 	source "package/python-libconfig/Config.in"
 	source "package/python-libevdev/Config.in"
diff --git a/package/python-legacy-cgi/Config.in b/package/python-legacy-cgi/Config.in
new file mode 100644
index 0000000000..f21706ed96
--- /dev/null
+++ b/package/python-legacy-cgi/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_LEGACY_CGI
+	bool "python-legacy-cgi"
+	help
+	  Fork of the standard library cgi and cgitb modules, being
+	  deprecated in PEP-594.
+
+	  https://github.com/jackrosenthal/legacy-cgi
diff --git a/package/python-legacy-cgi/python-legacy-cgi.hash b/package/python-legacy-cgi/python-legacy-cgi.hash
new file mode 100644
index 0000000000..063483a1e8
--- /dev/null
+++ b/package/python-legacy-cgi/python-legacy-cgi.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/legacy-cgi/json
+md5  82a61ea4905ec03f07cf24c586623fa7  legacy_cgi-2.6.1.tar.gz
+sha256  f2ada99c747c3d72a473a6aaff6259a61f226b06fe9f3106e495ab83fd8f7a42  legacy_cgi-2.6.1.tar.gz
+# Locally computed sha256 checksums
+sha256  f03e17cd594c2085f66a454e695c7ebe5b4d3c0eff534f4f194abc2fd164621b  LICENSE
diff --git a/package/python-legacy-cgi/python-legacy-cgi.mk b/package/python-legacy-cgi/python-legacy-cgi.mk
new file mode 100644
index 0000000000..63a6b1c971
--- /dev/null
+++ b/package/python-legacy-cgi/python-legacy-cgi.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-legacy-cgi
+#
+################################################################################
+
+PYTHON_LEGACY_CGI_VERSION = 2.6.1
+PYTHON_LEGACY_CGI_SOURCE = legacy_cgi-$(PYTHON_LEGACY_CGI_VERSION).tar.gz
+PYTHON_LEGACY_CGI_SITE = https://files.pythonhosted.org/packages/48/96/ff14ad0f759f2297a2e61db9c5384d248a6b38c6c1d4452c07d7419676a2
+PYTHON_LEGACY_CGI_SETUP_TYPE = pep517
+PYTHON_LEGACY_CGI_LICENSE = PSF-2.0
+PYTHON_LEGACY_CGI_LICENSE_FILES = LICENSE
+PYTHON_LEGACY_CGI_DEPENDENCIES = host-python-poetry-core
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
