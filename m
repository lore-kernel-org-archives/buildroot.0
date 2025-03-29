Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D7FC36011
	for <buildroot@archiver.kernel.org>; Sat, 29 Mar 2025 20:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BAAC40930;
	Sat, 29 Mar 2025 20:22:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7bps7E25lStc; Sat, 29 Mar 2025 20:22:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BA06408F9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BA06408F9;
	Sat, 29 Mar 2025 20:22:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A30E19C
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 20:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E50FA405F7
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 20:22:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vElLdrEm0ilm for <buildroot@buildroot.org>;
 Sat, 29 Mar 2025 20:22:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1ED5A409E5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1ED5A409E5
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 20:22:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D6E8838C5; Sat, 29 Mar 2025 20:22:03 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 29 Mar 2025 16:55:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9a9580622545db56e97fb8e9778f3a17dab9cbc3
X-Git-Newrev: 992d43b37356bb8b41fe3c42c5519d4d0bc77028
X-Patchwork-Hint: ignore
Message-Id: <20250329202203.0D6E8838C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docker-credential-gcr: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=992d43b37356bb8b41fe3c42c5519d4d0bc77028
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Christian Stewart <christian@aperture.us>
[Julien: reflow Config.in help to fix check-package error]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/Config.in                                        |  1 +
 package/docker-credential-gcr/Config.in                  | 11 +++++++++++
 package/docker-credential-gcr/docker-credential-gcr.hash |  2 ++
 package/docker-credential-gcr/docker-credential-gcr.mk   | 16 ++++++++++++++++
 4 files changed, 30 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 69bf526dc9..83c6e3d67b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2834,6 +2834,7 @@ menu "System tools"
 	source "package/docker-cli/Config.in"
 	source "package/docker-cli-buildx/Config.in"
 	source "package/docker-compose/Config.in"
+	source "package/docker-credential-gcr/Config.in"
 	source "package/docker-engine/Config.in"
 	source "package/earlyoom/Config.in"
 	source "package/efibootmgr/Config.in"
diff --git a/package/docker-credential-gcr/Config.in b/package/docker-credential-gcr/Config.in
new file mode 100644
index 0000000000..1b24ff0e59
--- /dev/null
+++ b/package/docker-credential-gcr/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_DOCKER_CREDENTIAL_GCR
+	bool "docker-credential-gcr"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	help
+	  docker-credential-gcr is Google Container Registry's
+	  standalone, gcloud SDK-independent Docker credential
+	  helper. It allows for v18.03+ Docker clients to easily make
+	  authenticated requests to GCR's repositories (gcr.io,
+	  eu.gcr.io, etc.).
+
+	  https://github.com/GoogleCloudPlatform/docker-credential-gcr/
diff --git a/package/docker-credential-gcr/docker-credential-gcr.hash b/package/docker-credential-gcr/docker-credential-gcr.hash
new file mode 100644
index 0000000000..2796b5746c
--- /dev/null
+++ b/package/docker-credential-gcr/docker-credential-gcr.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  126fdbf7351d2c7aaee6c525d9660738519eae53eeef77920b105fd4d1bc5dbd  docker-credential-gcr-v2.1.26-git4-go2.tar.gz
diff --git a/package/docker-credential-gcr/docker-credential-gcr.mk b/package/docker-credential-gcr/docker-credential-gcr.mk
new file mode 100644
index 0000000000..658e9baf33
--- /dev/null
+++ b/package/docker-credential-gcr/docker-credential-gcr.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# docker-credential-gcr
+#
+################################################################################
+
+DOCKER_CREDENTIAL_GCR_VERSION = v2.1.26
+DOCKER_CREDENTIAL_GCR_SITE = https://github.com/GoogleCloudPlatform/docker-credential-gcr
+DOCKER_CREDENTIAL_GCR_SITE_METHOD = git
+
+DOCKER_CREDENTIAL_GCR_LICENSE = Apache-2.0
+DOCKER_CREDENTIAL_GCR_LICENSE_FILES = LICENSE
+
+DOCKER_CREDENTIAL_GCR_GOMOD = github.com/GoogleCloudPlatform/docker-credential-gcr/v2
+
+$(eval $(golang-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
