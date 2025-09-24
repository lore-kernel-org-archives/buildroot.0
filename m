Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E32CAC5AE
	for <buildroot@archiver.kernel.org>; Wed, 24 Sep 2025 21:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82DE2610B5;
	Wed, 24 Sep 2025 21:54:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dOrlrpcL5PX1; Wed, 24 Sep 2025 21:54:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C489C610AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C489C610AE;
	Wed, 24 Sep 2025 21:54:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DB1AD177
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 21:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC20040F27
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 21:54:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PensdD4hdHIN for <buildroot@buildroot.org>;
 Wed, 24 Sep 2025 21:54:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AA47D40EB2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA47D40EB2
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AA47D40EB2
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 21:54:22 +0000 (UTC)
Received: from 91-153-34-249.elisa-laajakaista.fi ([91.153.34.249] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1v1XRL-00H4np-DK; Wed, 24 Sep 2025 23:54:19 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 74882082;
 Wed, 24 Sep 2025 21:54:18 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 25 Sep 2025 00:54:15 +0300
Message-ID: <20250924215418.1203802-1-aperez@igalia.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UU510ZywuoUaIwUGL6plP7AGnNU0UyiPEEYfn6WQDuY=; b=CqLqju5jNvwr6m21PSbCwX5akq
 e3o0QLXOM4OXQKnHh0XwLDjMdMGkRHKRTpO3FRdy0YV9WkTM4Qzqo2oK2kFUwgow03uYcGdU4/KQU
 10eGy/6gCcydpUaLx/YeFjFWN0RT2EyI+lUAKRLDzLueqOXZczMU619FS+gRxlLfNMa7A8zJ97uBB
 jdwiiABGMoOEJjUJqvxO86bgzbYghba/TDdvJulkSkiEi1EY9b/oceUvtmQSuA0fPKsN8ZhVnFTq9
 d7U9yObG0p7fLCwVrM8uaFX2feaqY2gTrwnqH9bRn9+xArvBfMmt03aiDgGInN+72Nv89dcqnbJF2
 Uc2iKScg==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=CqLqju5j
Subject: [Buildroot] [PATCH] package/sysprof: bump to version 49.0
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

Release notes:
https://gitlab.gnome.org/GNOME/sysprof/-/blob/49.0/NEWS

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/sysprof/sysprof.hash | 4 ++--
 package/sysprof/sysprof.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sysprof/sysprof.hash b/package/sysprof/sysprof.hash
index 5084ee2b11..d68981d31e 100644
--- a/package/sysprof/sysprof.hash
+++ b/package/sysprof/sysprof.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/sysprof/48/sysprof-48.0.sha256sum
-sha256  1b0f0380f2f30708ba87829321a06fee1db36dfa87797bbf07f0a7acf4498d18  sysprof-48.0.tar.xz
+# From https://download.gnome.org/sources/sysprof/49/sysprof-49.0.sha256sum
+sha256  ff04139637785c841948862087a4323b981680d942296409321b574fcb282878  sysprof-49.0.tar.xz
 
 # License files
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/sysprof/sysprof.mk b/package/sysprof/sysprof.mk
index f64f6d7120..92c840b795 100644
--- a/package/sysprof/sysprof.mk
+++ b/package/sysprof/sysprof.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSPROF_VERSION_MAJOR = 48
+SYSPROF_VERSION_MAJOR = 49
 SYSPROF_VERSION = $(SYSPROF_VERSION_MAJOR).0
 SYSPROF_SOURCE = sysprof-$(SYSPROF_VERSION).tar.xz
 SYSPROF_SITE = https://download.gnome.org/sources/sysprof/$(SYSPROF_VERSION_MAJOR)
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
