Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12404C2D0CD
	for <buildroot@archiver.kernel.org>; Thu, 15 May 2025 12:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2E88839DC;
	Thu, 15 May 2025 12:33:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PIRho3r6K9bw; Thu, 15 May 2025 12:33:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF5E983705
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF5E983705;
	Thu, 15 May 2025 12:33:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 58642119
 for <buildroot@buildroot.org>; Thu, 15 May 2025 12:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E7C1408AC
 for <buildroot@buildroot.org>; Thu, 15 May 2025 12:33:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id or-q2iJ8G1lU for <buildroot@buildroot.org>;
 Thu, 15 May 2025 12:33:42 +0000 (UTC)
X-Greylist: delayed 2698 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 15 May 2025 12:33:39 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C41DA4060C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C41DA4060C
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C41DA4060C
 for <buildroot@buildroot.org>; Thu, 15 May 2025 12:33:38 +0000 (UTC)
Received: from 91-152-140-108.elisa-laajakaista.fi ([91.152.140.108]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uFWz5-008c52-1s; Thu, 15 May 2025 13:48:38 +0200
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 9459e241;
 Thu, 15 May 2025 11:48:36 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 15 May 2025 14:48:35 +0300
Message-ID: <20250515114836.572631-3-aperez@igalia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515114836.572631-1-aperez@igalia.com>
References: <20250515114836.572631-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=k8M5YPZXPB53LmOlCCFHemETqKnLe+7gNyQpEm2/O30=; b=FjD32y822HGq2KlHrFguYWpqrJ
 f2U5MVn7onDxijpNE4q8+Vo1SAVNnGjYhtH0/5HBAESqlsg1V9J9xDwHcsJ68BK35g+qzbRSyi5mm
 K+d/zxUFZ7ZtPS/VXKAoeXk3CCgTc1WpFqUC26V5Qe6ORkGpLVg20PnGd/XvpBP9ZugNrc+JILIUi
 Jxd8BX7p0aZ3asvoQtnEx1ULe47qQlylfy91UYg9qKkID+0SNj7Act48Pg0VUH1wU0yCU4O+DliBG
 4cVzdKjbfPUxkjmUcdnZUR0bkT7c/OV0O+IdQSc1SSiJhKRVrfInVou/63aH+nz+i7/mwsZhb4+I+
 ZCHQuiMQ==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=FjD32y82
Subject: [Buildroot] [PATCH 2/2] package/sysprof: bump to version 48.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This new release includes a number of improvements. Release notes:

  https://gitlab.gnome.org/GNOME/sysprof/-/blob/48.0/NEWS

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/sysprof/sysprof.hash |  4 ++--
 package/sysprof/sysprof.mk   | 11 +++++++++--
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/package/sysprof/sysprof.hash b/package/sysprof/sysprof.hash
index 1d7373e16d..5084ee2b11 100644
--- a/package/sysprof/sysprof.hash
+++ b/package/sysprof/sysprof.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/sysprof/47/sysprof-47.2.sha256sum
-sha256  e4b5ede9fd978ec3f0d5a0d44d0429a6d201c362bf6cb4527319031ae462c54f  sysprof-47.2.tar.xz
+# From https://download.gnome.org/sources/sysprof/48/sysprof-48.0.sha256sum
+sha256  1b0f0380f2f30708ba87829321a06fee1db36dfa87797bbf07f0a7acf4498d18  sysprof-48.0.tar.xz
 
 # License files
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/sysprof/sysprof.mk b/package/sysprof/sysprof.mk
index 13b3de175e..abbddfb6e1 100644
--- a/package/sysprof/sysprof.mk
+++ b/package/sysprof/sysprof.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SYSPROF_VERSION_MAJOR = 47
-SYSPROF_VERSION = $(SYSPROF_VERSION_MAJOR).2
+SYSPROF_VERSION_MAJOR = 48
+SYSPROF_VERSION = $(SYSPROF_VERSION_MAJOR).0
 SYSPROF_SOURCE = sysprof-$(SYSPROF_VERSION).tar.xz
 SYSPROF_SITE = https://download.gnome.org/sources/sysprof/$(SYSPROF_VERSION_MAJOR)
 SYSPROF_LICENSE = GPL-3.0+
@@ -22,6 +22,13 @@ SYSPROF_CONF_OPTS = \
 	-Dtools=true \
 	-Dsystemdunitdir=/usr/lib/systemd/system
 
+ifeq ($(BR2_PACKAGE_ELFUTILS),y)
+SYSPROF_DEPENDENCIES += elfutils
+SYSPROF_CONF_OPTS += -Ddebuginfod=enabled
+else
+SYSPROF_CONF_OPTS += -Ddebuginfod=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 SYSPROF_DEPENDENCIES += systemd
 endif
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
