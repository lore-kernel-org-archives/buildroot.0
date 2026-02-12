Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB9FEF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D93F41FAA;
	Fri, 13 Feb 2026 19:37:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SBaK4A9Ip4PS; Fri, 13 Feb 2026 19:37:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45FD941F5F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011469;
	bh=Lk6SYi2F51EpjbKbcko8NmMwDw2DhT9XZmjuaQRPk4I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XN/0qyHlhLGCDIxOfPKgnB3KY+0tq+eBtj5//dKMC2ZddScs6H/vfCoNyeO+p1sDQ
	 tRhJEpKyDF8w82mElOuKvQ3eOH9bObVvvjG90wmWOvFfa0CVZ+TNkM9yRpvQwt653u
	 ben3UX86SIqZksTFMXGagyNRy7357qnJf5V2XmB8k3g7KsEgzwRFSXRn2/KnRmsWyX
	 cRe7zrxvikYX+VEYExZPUOcfrTUYO/rz5FD1kl7TbtAvnKITzTCWhoovx23J+temgp
	 5eZqXqSMgXSRWzOLQ2fVyR1ODkosa3hS5Rt8kGimgWS4vGND9I9+GS+ib2TG7Vye/w
	 S6MsAprH9jH3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45FD941F5F;
	Fri, 13 Feb 2026 19:37:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DDABEC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B44741312
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v7QhjrTL-xr5 for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D72DB412CE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D72DB412CE
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CC2A783593; Fri, 13 Feb 2026 19:37:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:27:57 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: ba6335ebe87d7bdda19472df23d79b2e4fbebb5e
X-Git-Newrev: d54c761b89a5009dd9b3d3bc983b38f8e76bbbd1
X-Patchwork-Hint: ignore
Message-Id: <20260213193701.CC2A783593@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] opensbi: Add support for
 custom license files
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d54c761b89a5009dd9b3d3bc983b38f8e76bbbd1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

The OpenSBI package was not providing any license file when a custom
Linux version was selected.

Fix this by adding a Kconfig option to specify the license file,
with a default value set to the commonly used license paths.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
[Arnout: use a single Kconfig option with conditional prompt]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 399cc39621673c6b81c15c8d768ed1081648364f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
