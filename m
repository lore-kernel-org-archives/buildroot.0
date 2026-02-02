Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB5BE7DF13
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 17:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AABE605EC;
	Mon,  2 Feb 2026 17:44:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tOWjkPXY_QJ6; Mon,  2 Feb 2026 17:44:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CAF96076C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770054247;
	bh=vjfbedmhCkV6ANd5bRTr0GVAaaqMztqeG0oT1MaYeBE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HGpHyegJWHhFkl0ztbOLQqcvM/ydxch5RmANJVZkvsg5oOI4H//9nF3n//4mFfd7h
	 Rzrut3ppZVUew6Aim2resZuBopyi5IucI3vUy+SqeCZT00I8MhTeH0a6Su1lAESSZk
	 qZbv+DKE/gcVm9YTakd6Fa+GpWdv/SKRj+b9m2PwaSbLfk4tUJ0dQrE8prpeMnen6L
	 ORxAuEFj5V6mrS1ynCWXIvQVnba9lOf6ZkmPMUAKHq0/rPbyv+MidPrKRNb6IcCz8z
	 KCzbL8Og3NAvYVDQ62mFiNrY8kFClMThmFlvuiVkvgUJvMLYlCVASJK0R7IlltEK4b
	 ODRy3mzsODBkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CAF96076C;
	Mon,  2 Feb 2026 17:44:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 91FD234E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C4814036F
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:44:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ij-OdRwS6p3o for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 17:44:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C987640344
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C987640344
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:44:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD4FC8645D; Mon,  2 Feb 2026 17:44:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 18:43:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 71e8ca62ddf898c6278ec5d89af32afebf54ac9d
X-Git-Newrev: 399cc39621673c6b81c15c8d768ed1081648364f
X-Patchwork-Hint: ignore
Message-Id: <20260202174403.AD4FC8645D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] opensbi: Add support for custom license
 files
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=399cc39621673c6b81c15c8d768ed1081648364f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The OpenSBI package was not providing any license file when a custom
Linux version was selected.

Fix this by adding a Kconfig option to specify the license file,
with a default value set to the commonly used license paths.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
[Arnout: use a single Kconfig option with conditional prompt]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 boot/opensbi/Config.in  | 8 ++++++++
 boot/opensbi/opensbi.mk | 4 +---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/boot/opensbi/Config.in b/boot/opensbi/Config.in
index 9c6047df5e..986e380b48 100644
--- a/boot/opensbi/Config.in
+++ b/boot/opensbi/Config.in
@@ -64,6 +64,14 @@ config BR2_TARGET_OPENSBI_VERSION
 	default BR2_TARGET_OPENSBI_CUSTOM_REPO_VERSION \
 		if BR2_TARGET_OPENSBI_CUSTOM_GIT
 
+config BR2_TARGET_OPENSBI_LICENSE_FILES
+	string "OpenSBI license files" if BR2_TARGET_OPENSBI_CUSTOM_GIT || \
+		   BR2_TARGET_OPENSBI_CUSTOM_TARBALL
+	default "COPYING.BSD"
+	help
+	  A space-separated list of license files related to the OpenSBI
+	  package.
+
 config BR2_TARGET_OPENSBI_PLAT
 	string "OpenSBI Platform"
 	default ""
diff --git a/boot/opensbi/opensbi.mk b/boot/opensbi/opensbi.mk
index 0142769a12..f9f550176f 100644
--- a/boot/opensbi/opensbi.mk
+++ b/boot/opensbi/opensbi.mk
@@ -20,9 +20,7 @@ OPENSBI_SITE = $(call github,riscv-software-src,opensbi,v$(OPENSBI_VERSION))
 endif
 
 OPENSBI_LICENSE = BSD-2-Clause
-ifeq ($(BR2_TARGET_OPENSBI_LATEST_VERSION),y)
-OPENSBI_LICENSE_FILES = COPYING.BSD
-endif
+OPENSBI_LICENSE_FILES = $(call qstrip,$(BR2_TARGET_OPENSBI_LICENSE_FILES))
 OPENSBI_INSTALL_TARGET = NO
 OPENSBI_INSTALL_STAGING = YES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
