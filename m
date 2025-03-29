Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C392AC36008
	for <buildroot@archiver.kernel.org>; Sat, 29 Mar 2025 20:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 843136086A;
	Sat, 29 Mar 2025 20:22:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hWvDIzSWszhg; Sat, 29 Mar 2025 20:22:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84DBE60AF6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84DBE60AF6;
	Sat, 29 Mar 2025 20:22:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 231C3121
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 20:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14E6E6086A
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 20:22:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tzivSLUyg-mY for <buildroot@buildroot.org>;
 Sat, 29 Mar 2025 20:22:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45F5F60AC1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45F5F60AC1
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 20:22:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 02915838C4; Sat, 29 Mar 2025 20:22:03 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 29 Mar 2025 16:55:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b974c91fe438541781c2df6f4fe0b8a48ab0a124
X-Git-Newrev: 9a9580622545db56e97fb8e9778f3a17dab9cbc3
X-Patchwork-Hint: ignore
Message-Id: <20250329202203.02915838C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/amazon-ecr-credential-helper: new
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9a9580622545db56e97fb8e9778f3a17dab9cbc3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Christian Stewart <christian@aperture.us>
[Julien: reflow Config.in help to fix check-package error]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/Config.in                                    |  1 +
 package/amazon-ecr-credential-helper/Config.in       |  9 +++++++++
 .../amazon-ecr-credential-helper.hash                |  2 ++
 .../amazon-ecr-credential-helper.mk                  | 20 ++++++++++++++++++++
 4 files changed, 32 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index d8751fc19f..69bf526dc9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2809,6 +2809,7 @@ endmenu
 
 menu "System tools"
 	source "package/acl/Config.in"
+	source "package/amazon-ecr-credential-helper/Config.in"
 	source "package/android-tools/Config.in"
 	source "package/atop/Config.in"
 	source "package/attr/Config.in"
diff --git a/package/amazon-ecr-credential-helper/Config.in b/package/amazon-ecr-credential-helper/Config.in
new file mode 100644
index 0000000000..93bfb51e4a
--- /dev/null
+++ b/package/amazon-ecr-credential-helper/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_AMAZON_ECR_CREDENTIAL_HELPER
+	bool "amazon-ecr-credential-helper"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	help
+	  The Amazon ECR Docker Credential Helper is a credential
+	  helper for the Docker daemon that makes it easier to use
+	  Amazon Elastic Container Registry.
+
+	  https://github.com/awslabs/amazon-ecr-credential-helper
diff --git a/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.hash b/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.hash
new file mode 100644
index 0000000000..6ebcd4e204
--- /dev/null
+++ b/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.hash
@@ -0,0 +1,2 @@
+# Localy computed
+sha256  53765b3e441a0e785131731d0cee4c0e2b2a22b90e523e9e4ec3e461c0ec5b05  amazon-ecr-credential-helper-v0.9.1-git4-go2.tar.gz
diff --git a/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.mk b/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.mk
new file mode 100644
index 0000000000..acfeea16fb
--- /dev/null
+++ b/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# amazon-ecr-credential-helper
+#
+################################################################################
+
+AMAZON_ECR_CREDENTIAL_HELPER_VERSION = v0.9.1
+AMAZON_ECR_CREDENTIAL_HELPER_SITE = https://github.com/awslabs/amazon-ecr-credential-helper
+AMAZON_ECR_CREDENTIAL_HELPER_SITE_METHOD = git
+
+AMAZON_ECR_CREDENTIAL_HELPER_LICENSE = Apache-2.0
+AMAZON_ECR_CREDENTIAL_HELPER_LICENSE_FILES = LICENSE
+
+AMAZON_ECR_CREDENTIAL_HELPER_SUBDIR = ecr-login
+
+AMAZON_ECR_CREDENTIAL_HELPER_GOMOD = ./cli
+AMAZON_ECR_CREDENTIAL_HELPER_BUILD_TARGETS = docker-credential-ecr-login
+AMAZON_ECR_CREDENTIAL_HELPER_INSTALL_BINS = docker-credential-ecr-login
+
+$(eval $(golang-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
