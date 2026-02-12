Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B65EF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B9D08452C;
	Fri, 13 Feb 2026 19:35:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9I8GEWs2e4FG; Fri, 13 Feb 2026 19:35:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 978F284580
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011340;
	bh=kBJ0hDXCljqc9HpOfOxOXizFKn5U07XUs6uxj85hSww=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JUgtCfYi1IX9bDgfrWDc+SuoVnJT0yhcYjFuDPpUQCEkel26RO+lTg9mdvo+jO9hF
	 CuOkY2O0sTDU+OxzBjVryJP3E5UksF+OsXSNUjRNniSlFM+Dp5dwcVspGSnzhFcYF4
	 5jy75omtO0oXu7pKBTuZmK6n+LIHkpvg6iKe/sttOQSKCA0tXTDXA8s88rBwUFIcUd
	 i461tx/pGpGaMAPGSUtRvNmBigkKYSV3hbW1VwD5BfJ6Lz+NVm2m+NCWRhHCZnM6Hw
	 /7fFilHiyxIDAlt4GoXuGe9I2EVJYA4QTvlYE4LN5aXMfSoKJ/LKhOURrXGEKJ6oXA
	 bqJji0EcLN8ng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 978F284580;
	Fri, 13 Feb 2026 19:35:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 134DF69
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D432844E6
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c_jixsHhXhR0 for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16E528451C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16E528451C
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0BC3285F11; Fri, 13 Feb 2026 19:35:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:27:55 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d09650eb9575a49e9b7246d47ae521014d69d8c3
X-Git-Newrev: 5fae877bc1b7fd12cdf84486f20e22d3c2f0d363
X-Patchwork-Hint: ignore
Message-Id: <20260213193527.0BC3285F11@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] opensbi: Add support for
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5fae877bc1b7fd12cdf84486f20e22d3c2f0d363
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
index 98d6103ed6..d6b09795cb 100644
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
