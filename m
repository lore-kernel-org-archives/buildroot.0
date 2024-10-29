Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D44EDD74941
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 21:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 946058133A;
	Tue, 29 Oct 2024 21:27:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2YKCZyS1fdAK; Tue, 29 Oct 2024 21:27:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C9B08134A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C9B08134A;
	Tue, 29 Oct 2024 21:27:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A5736494E
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 21:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1D4781342
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 21:27:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lnfAYmY5GOUi for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 21:27:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD06E8133A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD06E8133A
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 21:27:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B95A684A19; Tue, 29 Oct 2024 21:27:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 29 Oct 2024 22:19:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb11879804c1e9053e182144c077b3ff6ac6a50f
X-Git-Newrev: bde7b963e539c288b15fa09e5346b84bf9bb2e46
X-Patchwork-Hint: ignore
Message-Id: <20241029212717.B95A684A19@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pydantic-settings: new
 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=bde7b963e539c288b15fa09e5346b84bf9bb2e46
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                         |  1 +
 package/python-pydantic-settings/Config.in                |  9 +++++++++
 .../python-pydantic-settings.hash                         |  5 +++++
 .../python-pydantic-settings/python-pydantic-settings.mk  | 15 +++++++++++++++
 4 files changed, 30 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index e6180c8761..b1e999a63b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1297,6 +1297,7 @@ menu "External python modules"
 	source "package/python-pydal/Config.in"
 	source "package/python-pydantic/Config.in"
 	source "package/python-pydantic-core/Config.in"
+	source "package/python-pydantic-settings/Config.in"
 	source "package/python-pydevmem/Config.in"
 	source "package/python-pydyf/Config.in"
 	source "package/python-pyelftools/Config.in"
diff --git a/package/python-pydantic-settings/Config.in b/package/python-pydantic-settings/Config.in
new file mode 100644
index 0000000000..0e8dbc29b5
--- /dev/null
+++ b/package/python-pydantic-settings/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_PYDANTIC_SETTINGS
+	bool "python-pydantic-settings"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-pydantic -> python-pydantic-core
+	select BR2_PACKAGE_PYTHON_DOTENV # runtime
+	select BR2_PACKAGE_PYTHON_PYDANTIC # runtime
+	help
+	  Settings management using Pydantic.
+
+	  https://github.com/pydantic/pydantic-settings
diff --git a/package/python-pydantic-settings/python-pydantic-settings.hash b/package/python-pydantic-settings/python-pydantic-settings.hash
new file mode 100644
index 0000000000..1a45f34cea
--- /dev/null
+++ b/package/python-pydantic-settings/python-pydantic-settings.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pydantic-settings/json
+md5  38eecfeda26d332803c540fd86105509  pydantic_settings-2.5.2.tar.gz
+sha256  f90b139682bee4d2065273d5185d71d37ea46cfe57e1b5ae184fc6a0b2484ca0  pydantic_settings-2.5.2.tar.gz
+# Locally computed sha256 checksums
+sha256  eb355a753e020346d33d83bf9769135b89fc610568ac531a01c295bcee7fd998  LICENSE
diff --git a/package/python-pydantic-settings/python-pydantic-settings.mk b/package/python-pydantic-settings/python-pydantic-settings.mk
new file mode 100644
index 0000000000..36add45527
--- /dev/null
+++ b/package/python-pydantic-settings/python-pydantic-settings.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-pydantic-settings
+#
+################################################################################
+
+PYTHON_PYDANTIC_SETTINGS_VERSION = 2.5.2
+PYTHON_PYDANTIC_SETTINGS_SOURCE = pydantic_settings-$(PYTHON_PYDANTIC_SETTINGS_VERSION).tar.gz
+PYTHON_PYDANTIC_SETTINGS_SITE = https://files.pythonhosted.org/packages/68/27/0bed9dd26b93328b60a1402febc780e7be72b42847fa8b5c94b7d0aeb6d1
+PYTHON_PYDANTIC_SETTINGS_SETUP_TYPE = pep517
+PYTHON_PYDANTIC_SETTINGS_LICENSE = MIT
+PYTHON_PYDANTIC_SETTINGS_LICENSE_FILES = LICENSE
+PYTHON_PYDANTIC_SETTINGS_DEPENDENCIES = host-python-hatchling
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
