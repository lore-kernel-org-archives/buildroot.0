Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC76AD74940
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 21:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C60381359;
	Tue, 29 Oct 2024 21:27:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cMTIFU_2O5mv; Tue, 29 Oct 2024 21:27:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35E2681350
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35E2681350;
	Tue, 29 Oct 2024 21:27:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 039AE4EC0
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 21:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D98DE401BA
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 21:27:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 50akNo3lkTmy for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 21:27:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5FE2401B4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C5FE2401B4
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 21:27:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AE91984A17; Tue, 29 Oct 2024 21:27:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 29 Oct 2024 22:15:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 124d333462597895be0ed251c6040636d10b7d5d
X-Git-Newrev: eb11879804c1e9053e182144c077b3ff6ac6a50f
X-Patchwork-Hint: ignore
Message-Id: <20241029212717.AE91984A17@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-dotenv: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=eb11879804c1e9053e182144c077b3ff6ac6a50f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                        |  1 +
 package/python-dotenv/Config.in          |  7 +++++++
 package/python-dotenv/python-dotenv.hash |  5 +++++
 package/python-dotenv/python-dotenv.mk   | 13 +++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index f8d4e4d24c..e6180c8761 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1095,6 +1095,7 @@ menu "External python modules"
 	source "package/python-docopt/Config.in"
 	source "package/python-docutils/Config.in"
 	source "package/python-dominate/Config.in"
+	source "package/python-dotenv/Config.in"
 	source "package/python-dpkt/Config.in"
 	source "package/python-dtschema/Config.in"
 	source "package/python-ecdsa/Config.in"
diff --git a/package/python-dotenv/Config.in b/package/python-dotenv/Config.in
new file mode 100644
index 0000000000..f9b42bd28e
--- /dev/null
+++ b/package/python-dotenv/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_DOTENV
+	bool "python-dotenv"
+	help
+	  Read key-value pairs from a .env file and set them as
+	  environment variables.
+
+	  https://github.com/theskumar/python-dotenv
diff --git a/package/python-dotenv/python-dotenv.hash b/package/python-dotenv/python-dotenv.hash
new file mode 100644
index 0000000000..710922fba3
--- /dev/null
+++ b/package/python-dotenv/python-dotenv.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/python-dotenv/json
+md5  68abb78e05460ce558ca255de550e1ea  python-dotenv-1.0.1.tar.gz
+sha256  e324ee90a023d808f1959c46bcbc04446a10ced277783dc6ee09987c37ec10ca  python-dotenv-1.0.1.tar.gz
+# Locally computed sha256 checksums
+sha256  80619b7049f08c81683ad0e01f08f257a840652dd71ee83146d36658c7d2c2b9  LICENSE
diff --git a/package/python-dotenv/python-dotenv.mk b/package/python-dotenv/python-dotenv.mk
new file mode 100644
index 0000000000..324eea239e
--- /dev/null
+++ b/package/python-dotenv/python-dotenv.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-dotenv
+#
+################################################################################
+
+PYTHON_DOTENV_VERSION = 1.0.1
+PYTHON_DOTENV_SITE = https://files.pythonhosted.org/packages/bc/57/e84d88dfe0aec03b7a2d4327012c1627ab5f03652216c63d49846d7a6c58
+PYTHON_DOTENV_SETUP_TYPE = setuptools
+PYTHON_DOTENV_LICENSE = BSD-3-Clause
+PYTHON_DOTENV_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
