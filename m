Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8115C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96C7542D99;
	Mon, 19 May 2025 10:44:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JKcp3ZW70RKJ; Mon, 19 May 2025 10:44:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC2F342D70
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC2F342D70;
	Mon, 19 May 2025 10:44:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 15567193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3F38411C7
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D4FooNsn_SL4 for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:39:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F54C40D84
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F54C40D84
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5DC9B8725C; Mon, 19 May 2025 10:39:46 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 29 Mar 2025 16:55:48 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 992d43b37356bb8b41fe3c42c5519d4d0bc77028
X-Git-Newrev: e679cd4974a9f58a211447f6903084f955f2820b
X-Patchwork-Hint: ignore
Message-Id: <20250519103946.5DC9B8725C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/docker-credential-acr-env: new package
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
