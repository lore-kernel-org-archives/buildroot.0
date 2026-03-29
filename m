Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85E6F3D61D
	for <buildroot@archiver.kernel.org>; Sun, 29 Mar 2026 18:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 654F440A59;
	Sun, 29 Mar 2026 18:01:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pL66fHlnDUwg; Sun, 29 Mar 2026 18:01:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 958CF409CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774807302;
	bh=TAWIKFM1+act76ORJ7onaAWlNaY23l+3QPdWGF7pM9s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Gtc9C1dm+vll2VqG0ewSBXhLz2nueT2R/JasYVLiWpFvcw7hfOk0STDQ6eicXltiU
	 2wPbc/9TmAWOJgBl6pv6OVC6LayHts5vMf/ZC98b+qLltVsT2gM73hOXnRrra1tjzM
	 Vkk/uJMvTVTf30vuhsWQD6LxjiK/8ym8fwo1Ib0bRyiJgBr5LusqejhvVp7h0h6O0v
	 5erz1NqDsaxT5yz0gkPXxa2rS49Vz1LbYe5V4PJeBNpxIeHQa1GRCvjXeoQUUr86g1
	 bVAV6M4qE5r7gCotjuBECjO232M/ZyZbIvhYMKglRgR5p9oyBwj02XuafupyTD0SVu
	 P9KBZzFqTt46g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 958CF409CE;
	Sun, 29 Mar 2026 18:01:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D34CD10F
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 18:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4E786084D
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 18:01:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ivbUGzy8669U for <buildroot@buildroot.org>;
 Sun, 29 Mar 2026 18:01:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 943D860709
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 943D860709
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 18:01:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E48247FD77; Sun, 29 Mar 2026 18:01:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 29 Mar 2026 20:00:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aa2d71ac38711b3e13505f48bc2b466c708991b9
X-Git-Newrev: c8dc265a9f0b641c1c5cd2e136234989f7145942
X-Patchwork-Hint: ignore
Message-Id: <20260329180139.E48247FD77@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sbctl: new package
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c8dc265a9f0b641c1c5cd2e136234989f7145942
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

sbctl intends to be a user-friendly secure boot key manager
capable of setting up secure boot, offer key management
capabilities, and keep track of files that needs to be
signed in the boot chain.

Signed-off-by: Hendrik De Vloed <hendrik.devloed@dekimo.com>
Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/Config.in        |  1 +
 package/sbctl/Config.in  | 16 ++++++++++++++++
 package/sbctl/sbctl.hash |  3 +++
 package/sbctl/sbctl.mk   | 14 ++++++++++++++
 4 files changed, 34 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 50cfbfccc1..a2b0d885a7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2873,6 +2873,7 @@ menu "System tools"
 	source "package/s6-linux-utils/Config.in"
 	source "package/s6-portable-utils/Config.in"
 	source "package/s6-rc/Config.in"
+	source "package/sbctl/Config.in"
 	source "package/scrub/Config.in"
 	source "package/scrypt/Config.in"
 	source "package/sdbus-cpp/Config.in"
diff --git a/package/sbctl/Config.in b/package/sbctl/Config.in
new file mode 100644
index 0000000000..9c6d2e5858
--- /dev/null
+++ b/package/sbctl/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_SBCTL
+	bool "sbctl"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS # pcsc-lite
+	depends on BR2_USE_MMU # pcsc-lite
+	depends on !BR2_STATIC_LIBS # pcsc-lite
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pcsc-lite
+	select BR2_PACKAGE_HOST_GO
+	select BR2_PACKAGE_PCSC_LITE # yubikey
+	help
+	  sbctl intends to be a user-friendly secure boot key manager
+	  capable of setting up secure boot, offer key management
+	  capabilities, and keep track of files that needs to be
+	  signed in the boot chain.
+
+	  https://github.com/Foxboron/sbctl
diff --git a/package/sbctl/sbctl.hash b/package/sbctl/sbctl.hash
new file mode 100644
index 0000000000..50a4fe35c1
--- /dev/null
+++ b/package/sbctl/sbctl.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  640041d66a5040af15a4f152bd1d548813a5fe32341d61826f3d36948a0a5903  sbctl-0.18-go2.tar.gz
+sha256  aa55890164499f96de74b061b04ebc17da026d5962ae9d39180f4ba2833db9fb  LICENSE
diff --git a/package/sbctl/sbctl.mk b/package/sbctl/sbctl.mk
new file mode 100644
index 0000000000..4fdc080943
--- /dev/null
+++ b/package/sbctl/sbctl.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# sbctl
+#
+################################################################################
+
+SBCTL_VERSION = 0.18
+SBCTL_SITE = $(call github,foxboron,sbctl,$(SBCTL_VERSION))
+SBCTL_LICENSE = MIT
+SBCTL_LICENSE_FILES = LICENSE
+SBCTL_BUILD_TARGETS = cmd/sbctl
+SBCTL_DEPENDENCIES = pcsc-lite
+
+$(eval $(golang-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
