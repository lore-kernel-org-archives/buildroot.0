Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ECAEC36008
	for <buildroot@archiver.kernel.org>; Sat, 29 Mar 2025 20:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC19960AF6;
	Sat, 29 Mar 2025 20:22:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q5NrQHq7s-_R; Sat, 29 Mar 2025 20:22:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7341C60B2E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7341C60B2E;
	Sat, 29 Mar 2025 20:22:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E10E7121
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 20:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE815405ED
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 20:22:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MZK-YnBlQYyq for <buildroot@buildroot.org>;
 Sat, 29 Mar 2025 20:22:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DDAF40982
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DDAF40982
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 20:22:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 18976838C2; Sat, 29 Mar 2025 20:22:03 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 29 Mar 2025 16:55:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 992d43b37356bb8b41fe3c42c5519d4d0bc77028
X-Git-Newrev: e679cd4974a9f58a211447f6903084f955f2820b
X-Patchwork-Hint: ignore
Message-Id: <20250329202203.18976838C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docker-credential-acr-env: new
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

commit: https://git.buildroot.net/buildroot/commit/?id=e679cd4974a9f58a211447f6903084f955f2820b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Christian Stewart <christian@aperture.us>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/Config.in                                          |  1 +
 package/docker-credential-acr-env/Config.in                | 12 ++++++++++++
 .../docker-credential-acr-env.hash                         |  2 ++
 .../docker-credential-acr-env/docker-credential-acr-env.mk | 14 ++++++++++++++
 4 files changed, 29 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 83c6e3d67b..4b7e474cac 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2834,6 +2834,7 @@ menu "System tools"
 	source "package/docker-cli/Config.in"
 	source "package/docker-cli-buildx/Config.in"
 	source "package/docker-compose/Config.in"
+	source "package/docker-credential-acr-env/Config.in"
 	source "package/docker-credential-gcr/Config.in"
 	source "package/docker-engine/Config.in"
 	source "package/earlyoom/Config.in"
diff --git a/package/docker-credential-acr-env/Config.in b/package/docker-credential-acr-env/Config.in
new file mode 100644
index 0000000000..ddb101d52f
--- /dev/null
+++ b/package/docker-credential-acr-env/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_DOCKER_CREDENTIAL_ACR_ENV
+	bool "docker-credential-acr-env"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	help
+	  The ACR docker credential helper is an alternative to the
+	  existing file store based ACR helper [...] which relies
+	  on az command line and is not optimised for use in CI
+	  environments. Primary use case for this helper is for use
+	  with kaniko and other tools running in CI scenarios wishing
+	  to push to Azure Container Registry.
+
+	  https://github.com/chrismellard/docker-credential-acr-env/
diff --git a/package/docker-credential-acr-env/docker-credential-acr-env.hash b/package/docker-credential-acr-env/docker-credential-acr-env.hash
new file mode 100644
index 0000000000..eb1fdebbf8
--- /dev/null
+++ b/package/docker-credential-acr-env/docker-credential-acr-env.hash
@@ -0,0 +1,2 @@
+# Localy computed
+sha256  deff9d133fdd87b6cbe454e82e72eb7b124d1aea330c17236e804071a446b4ae  docker-credential-acr-env-0.7.0-git4-go2.tar.gz
diff --git a/package/docker-credential-acr-env/docker-credential-acr-env.mk b/package/docker-credential-acr-env/docker-credential-acr-env.mk
new file mode 100644
index 0000000000..31f895e0e3
--- /dev/null
+++ b/package/docker-credential-acr-env/docker-credential-acr-env.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# docker-credential-acr-env
+#
+################################################################################
+
+DOCKER_CREDENTIAL_ACR_ENV_VERSION = 0.7.0
+DOCKER_CREDENTIAL_ACR_ENV_SITE = https://github.com/chrismellard/docker-credential-acr-env
+DOCKER_CREDENTIAL_ACR_ENV_SITE_METHOD = git
+
+DOCKER_CREDENTIAL_ACR_ENV_LICENSE = Apache-2.0
+DOCKER_CREDENTIAL_ACR_ENV_LICENSE_FILES = LICENSE
+
+$(eval $(golang-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
