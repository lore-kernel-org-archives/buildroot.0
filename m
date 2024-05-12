Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74401C10F1A
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 10:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FFC14214C;
	Sun, 12 May 2024 10:11:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hfObn9RLbgQg; Sun, 12 May 2024 10:11:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE6F5421B8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE6F5421B8;
	Sun, 12 May 2024 10:11:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3E4771BF27A
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 10:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B5AA40175
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 10:11:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WZI0dXFb0OoJ for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 10:11:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50DE140104
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50DE140104
 for <buildroot@buildroot.org>; Sun, 12 May 2024 10:11:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A78F8707B; Sun, 12 May 2024 10:11:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 May 2024 12:10:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7760e9a1d8c53968b9d88d8dcac25306fa639bfa
X-Git-Newrev: 4d7cf1c1e2bbf4dde178cadf88f94afd226d75f4
X-Patchwork-Hint: ignore
Message-Id: <20240512101123.4A78F8707B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-fastui: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=4d7cf1c1e2bbf4dde178cadf88f94afd226d75f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                        |  1 +
 package/python-fastui/Config.in          |  9 +++++++++
 package/python-fastui/python-fastui.hash |  5 +++++
 package/python-fastui/python-fastui.mk   | 15 +++++++++++++++
 4 files changed, 30 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 053baa292f..c29b4a5101 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1093,6 +1093,7 @@ menu "External python modules"
 	source "package/python-falcon/Config.in"
 	source "package/python-fastapi/Config.in"
 	source "package/python-fastapi-sessions/Config.in"
+	source "package/python-fastui/Config.in"
 	source "package/python-filelock/Config.in"
 	source "package/python-fire/Config.in"
 	source "package/python-flask/Config.in"
diff --git a/package/python-fastui/Config.in b/package/python-fastui/Config.in
new file mode 100644
index 0000000000..9b73544dab
--- /dev/null
+++ b/package/python-fastui/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_FASTUI
+	bool "python-fastui"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-pydantic -> python-pydantic-core
+	select BR2_PACKAGE_PYTHON_EMAIL_VALIDATOR # runtime
+	select BR2_PACKAGE_PYTHON_PYDANTIC # runtime
+	help
+	  Build better UIs faster.
+
+	  https://github.com/pydantic/FastUI
diff --git a/package/python-fastui/python-fastui.hash b/package/python-fastui/python-fastui.hash
new file mode 100644
index 0000000000..50f49824e0
--- /dev/null
+++ b/package/python-fastui/python-fastui.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/fastui/json
+md5  c8e7d060c0ad3a7ad1237dac3555b83e  fastui-0.5.2.tar.gz
+sha256  854a7a7fce4c08efd9caff1a331d222007b3708b133d996528e3f40996c96091  fastui-0.5.2.tar.gz
+# Locally computed sha256 checksums
+sha256  1c39900853b2c98a5c98e1acc10e54ef06ba2693cdf85e8b28e3ede658888d79  LICENSE
diff --git a/package/python-fastui/python-fastui.mk b/package/python-fastui/python-fastui.mk
new file mode 100644
index 0000000000..e143c9978c
--- /dev/null
+++ b/package/python-fastui/python-fastui.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-fastui
+#
+################################################################################
+
+PYTHON_FASTUI_VERSION = 0.5.2
+PYTHON_FASTUI_SOURCE = fastui-$(PYTHON_FASTUI_VERSION).tar.gz
+PYTHON_FASTUI_SITE = https://files.pythonhosted.org/packages/64/11/515c9b5cb6e885f4ba8c325f75b95a754d99b8296bdc9f134dc90a79019f
+PYTHON_FASTUI_SETUP_TYPE = pep517
+PYTHON_FASTUI_LICENSE = MIT
+PYTHON_FASTUI_LICENSE_FILES = LICENSE
+PYTHON_FASTUI_DEPENDENCIES = host-python-hatchling
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
