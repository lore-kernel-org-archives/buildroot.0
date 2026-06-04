Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E09CD6E77
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDFD760F11;
	Fri,  5 Jun 2026 12:40:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qxx01gD52PL8; Fri,  5 Jun 2026 12:40:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9F4960EEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663256;
	bh=L98WZHC9FsqA/LWrks6tBjaB2ou1sLF6bZZifwBFgsQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YmrPiqfYhJU4yttOa/pXp1YTu7E9Lx8Tm4R6Ode37mzANUw+CX3LQvp5tpljKsCgb
	 orqxbUH/cRNVOMpgkgu+Nd9lxq9CQIXjjNc/1X+fJIxecSaso08LC0SND4HCVo9GOA
	 D9GpCxcKMi9Szl/Js6tuFzDfruSQzcaoJ5vy0f53B7oJMaK+xlruS01TzoF57ioVcW
	 ziAetIAZmN1H/epGqbzZ33tQjsjEmR1Da7iqI2Uc8l85ajvmRTQOYkXh95pZJNwY93
	 oJLG0pNc5mNl/8YAUybtzlpfw7zlJVXArA4oW6njv2/5puhvHkkaiziW8cVXsYmwkC
	 PVrHJFFDwYsWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9F4960EEE;
	Fri,  5 Jun 2026 12:40:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E854388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B781382037
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8PG-RDRgjlXX for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFAAC82038
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BFAAC82038
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E8E6887B39; Fri,  5 Jun 2026 12:38:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:26:20 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 7e305108826680fd776e4b77c5d5f11881b17c7b
X-Git-Newrev: 3edbe84c9364f6ef9ccb8d495117d959dc975fb2
X-Patchwork-Hint: ignore
Message-Id: <20260605123839.E8E6887B39@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/qt6/qt6base:
 remove SBOMs from target
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3edbe84c9364f6ef9ccb8d495117d959dc975fb2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

All Qt6 packages install their own SPDX SBOM in
$(TARGET_DIR)/usr/lib/qt6/sbom/. In the context of Buildroot having
such SBOMs on the target is not useful, and they take up some space,
so get rid of them.

We use a TARGET_FINALIZE_HOOKS (and not a POST_INSTALL_TARGET_HOOKS)
because it's not just qt6base that installs SBOMs, but all qt6
modules, so we want the cleanup to happen after they all got
installed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 160ef0b27a824fbd8f44a9514d5ad7762c3be560)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/qt6/qt6base/qt6base.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 5c939568ae..01661b7f01 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -431,5 +431,10 @@ define QT6BASE_RM_USR_MKSPECS
 endef
 QT6BASE_TARGET_FINALIZE_HOOKS += QT6BASE_RM_USR_MKSPECS
 
+define QT6BASE_RM_SBOMS
+	$(RM) -rf $(TARGET_DIR)/usr/lib/qt6/sbom/
+endef
+QT6BASE_TARGET_FINALIZE_HOOKS += QT6BASE_RM_SBOMS
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
