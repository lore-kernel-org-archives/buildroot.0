Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A990EC10F1A
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 10:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 415D442223;
	Sun, 12 May 2024 10:11:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 55tNsZclxHRQ; Sun, 12 May 2024 10:11:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AE57421D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AE57421D5;
	Sun, 12 May 2024 10:11:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4ED041BF86C
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 10:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 493D2840A6
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 10:11:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0oOk-tWrlADc for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 10:11:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F1B283F79
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F1B283F79
 for <buildroot@buildroot.org>; Sun, 12 May 2024 10:11:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3178B8707A; Sun, 12 May 2024 10:11:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 May 2024 12:06:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4c561a7adf95d33acddabcd72e6155c8c05bbbfe
X-Git-Newrev: 7760e9a1d8c53968b9d88d8dcac25306fa639bfa
X-Patchwork-Hint: ignore
Message-Id: <20240512101123.3178B8707A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-email-validator: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=7760e9a1d8c53968b9d88d8dcac25306fa639bfa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                          |  1 +
 package/python-email-validator/Config.in                   |  9 +++++++++
 package/python-email-validator/python-email-validator.hash |  5 +++++
 package/python-email-validator/python-email-validator.mk   | 14 ++++++++++++++
 4 files changed, 29 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 8aff995f63..053baa292f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1084,6 +1084,7 @@ menu "External python modules"
 	source "package/python-dpkt/Config.in"
 	source "package/python-dtschema/Config.in"
 	source "package/python-ecdsa/Config.in"
+	source "package/python-email-validator/Config.in"
 	source "package/python-engineio/Config.in"
 	source "package/python-entrypoints/Config.in"
 	source "package/python-esptool/Config.in"
diff --git a/package/python-email-validator/Config.in b/package/python-email-validator/Config.in
new file mode 100644
index 0000000000..3b1ffc905c
--- /dev/null
+++ b/package/python-email-validator/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_EMAIL_VALIDATOR
+	bool "python-email-validator"
+	select BR2_PACKAGE_PYTHON_DNSPYTHON # runtime
+	select BR2_PACKAGE_PYTHON_IDNA # runtime
+	help
+	  A robust email address syntax and deliverability validation
+	  library.
+
+	  https://github.com/JoshData/python-email-validator
diff --git a/package/python-email-validator/python-email-validator.hash b/package/python-email-validator/python-email-validator.hash
new file mode 100644
index 0000000000..4342f8d91b
--- /dev/null
+++ b/package/python-email-validator/python-email-validator.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/email-validator/json
+md5  a836759afeb7efdc5d493fbdf8a1bae6  email_validator-2.1.1.tar.gz
+sha256  200a70680ba08904be6d1eef729205cc0d687634399a5924d842533efb824b84  email_validator-2.1.1.tar.gz
+# Locally computed sha256 checksums
+sha256  672179752e109134a3fb2bdd0780b29fdb7a03974f0f586a13aead5129562d4c  LICENSE
diff --git a/package/python-email-validator/python-email-validator.mk b/package/python-email-validator/python-email-validator.mk
new file mode 100644
index 0000000000..8d82eb092f
--- /dev/null
+++ b/package/python-email-validator/python-email-validator.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-email-validator
+#
+################################################################################
+
+PYTHON_EMAIL_VALIDATOR_VERSION = 2.1.1
+PYTHON_EMAIL_VALIDATOR_SOURCE = email_validator-$(PYTHON_EMAIL_VALIDATOR_VERSION).tar.gz
+PYTHON_EMAIL_VALIDATOR_SITE = https://files.pythonhosted.org/packages/63/82/2914bff80ebee8c027802a664ad4b4caad502cd594e358f76aff395b5e56
+PYTHON_EMAIL_VALIDATOR_SETUP_TYPE = setuptools
+PYTHON_EMAIL_VALIDATOR_LICENSE = Unlicense
+PYTHON_EMAIL_VALIDATOR_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
