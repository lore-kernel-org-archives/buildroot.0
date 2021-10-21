Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5896C433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 20:59:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 795CF60FF2
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 20:59:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 795CF60FF2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4708F82D0C;
	Thu, 21 Oct 2021 20:59:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ny-rXuHUP07J; Thu, 21 Oct 2021 20:59:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 727DE83168;
	Thu, 21 Oct 2021 20:59:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6B5BD1BF20B
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 20:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55C38400C9
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 20:59:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nRlG_mIiLkoQ for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 20:58:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42D51401BB
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 20:58:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id DDC8C883BF; Thu, 21 Oct 2021 20:55:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 21 Oct 2021 22:47:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8c17fd9a5ba8f02e39639b37e75e736bb6316bdb
X-Git-Newrev: 1665e0a79b617b4e6315ac5989e9ffa66eb0310f
X-Patchwork-Hint: ignore
Message-Id: <20211021205547.DDC8C883BF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyndiff: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1665e0a79b617b4e6315ac5989e9ffa66eb0310f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in                          |  1 +
 package/python-pyndiff/Config.in           |  9 +++++++++
 package/python-pyndiff/python-pyndiff.hash |  5 +++++
 package/python-pyndiff/python-pyndiff.mk   | 14 ++++++++++++++
 4 files changed, 29 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 3ccdf54b74..d40eb9dabc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1153,6 +1153,7 @@ menu "External python modules"
 	source "package/python-pymupdf/Config.in"
 	source "package/python-pymysql/Config.in"
 	source "package/python-pynacl/Config.in"
+	source "package/python-pyndiff/Config.in"
 	source "package/python-pyopenssl/Config.in"
 	source "package/python-pyparsing/Config.in"
 	source "package/python-pyparted/Config.in"
diff --git a/package/python-pyndiff/Config.in b/package/python-pyndiff/Config.in
new file mode 100644
index 0000000000..58ca35ba97
--- /dev/null
+++ b/package/python-pyndiff/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_PYNDIFF
+	bool "python-pyndiff"
+	select BR2_PACKAGE_PYTHON_XMLJSON # runtime
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
+	help
+	  Generate human-readable ndiff output when comparing 2 Nmap
+	  XML scan files.
+
+	  https://github.com/rackerlabs/pyndiff
diff --git a/package/python-pyndiff/python-pyndiff.hash b/package/python-pyndiff/python-pyndiff.hash
new file mode 100644
index 0000000000..0afecfb6e2
--- /dev/null
+++ b/package/python-pyndiff/python-pyndiff.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pyndiff/json
+md5  32a9f994509cb883bbfeb563171f2668  pyndiff-1.0.2.tar.gz
+sha256  8a519b18a7bbb315c043d4543719ce9fb6db8098bfcdd04cb8054b276cc91368  pyndiff-1.0.2.tar.gz
+# Locally computed sha256 checksums
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-pyndiff/python-pyndiff.mk b/package/python-pyndiff/python-pyndiff.mk
new file mode 100644
index 0000000000..e25374956c
--- /dev/null
+++ b/package/python-pyndiff/python-pyndiff.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pyndiff
+#
+################################################################################
+
+PYTHON_PYNDIFF_VERSION = 1.0.2
+PYTHON_PYNDIFF_SOURCE = pyndiff-$(PYTHON_PYNDIFF_VERSION).tar.gz
+PYTHON_PYNDIFF_SITE = https://files.pythonhosted.org/packages/83/3b/fb13918710c4fba40367140f22e3449998f4f66869a7564d0e547ad99ef8
+PYTHON_PYNDIFF_SETUP_TYPE = setuptools
+PYTHON_PYNDIFF_LICENSE = Apache-2.0
+PYTHON_PYNDIFF_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
