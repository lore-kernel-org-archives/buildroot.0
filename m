Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3727C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 15:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 702DE605CE;
	Mon, 19 May 2025 15:04:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cYaePMDsjyPq; Mon, 19 May 2025 15:04:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4AD060850
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4AD060850;
	Mon, 19 May 2025 15:04:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 236C2D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 15:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14E5C81F1C
 for <buildroot@buildroot.org>; Mon, 19 May 2025 15:04:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rsuPZ9wpwxaB for <buildroot@buildroot.org>;
 Mon, 19 May 2025 15:04:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0F86580ECC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F86580ECC
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0F86580ECC
 for <buildroot@buildroot.org>; Mon, 19 May 2025 15:04:15 +0000 (UTC)
Received: from charybdis.office.fixme.cloud (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id E2FF2E00243;
 Mon, 19 May 2025 17:04:13 +0200 (CEST)
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: Florian Larysch <fl@n621.de>
Date: Mon, 19 May 2025 17:04:07 +0200
Message-ID: <20250519150409.25390-2-fl@n621.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519150409.25390-1-fl@n621.de>
References: <20250519150409.25390-1-fl@n621.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1747667054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lI2vZc5nyOkFVAyLB9OT81+gHKQgcTocRoedNi7i7nE=;
 b=ExSwO1VD96QS8cJLT3O3MMGSD/VLtKmWyMyjOCLTZ79DibJsmL/q7h3LFZyFVRs0aJZxvb
 5aAWMw2M8pFd1AuxqkZ8oST2g1aZx78LRXktfsFu/EXk8CQ4N2olm2z9xzAMW28ngsC04z
 Wd2BGWb1pPZyjDzas8I3P4BUSy2mlUc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=ExSwO1VD
Subject: [Buildroot] [PATCH 1/2] package/casync-nano: bump to version 1.1.2
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

Fixes build issues when building against LibreSSL in particular:
https://github.com/florolf/casync-nano/releases/tag/v1.1.2

Signed-off-by: Florian Larysch <fl@n621.de>
---
 package/casync-nano/casync-nano.hash | 2 +-
 package/casync-nano/casync-nano.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/casync-nano/casync-nano.hash b/package/casync-nano/casync-nano.hash
index 1697fa93ef..e2aee71c20 100644
--- a/package/casync-nano/casync-nano.hash
+++ b/package/casync-nano/casync-nano.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  29ed8a767304e7e3032e66feea3d2dada7cc7db73344231a54bf080cc6e65ecf  casync-nano-1.1.1.tar.gz
+sha256  1a8ce3247985e05fbb08097966ff11fc2abd0a1f18fb7178e7397c2455b9500f  casync-nano-1.1.2.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/casync-nano/casync-nano.mk b/package/casync-nano/casync-nano.mk
index e492627fa3..fc3a80e4f4 100644
--- a/package/casync-nano/casync-nano.mk
+++ b/package/casync-nano/casync-nano.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CASYNC_NANO_VERSION = 1.1.1
+CASYNC_NANO_VERSION = 1.1.2
 CASYNC_NANO_SITE = $(call github,florolf,casync-nano,v$(CASYNC_NANO_VERSION))
 CASYNC_NANO_LICENSE = LGPL-2.1
 CASYNC_NANO_LICENSE_FILES = COPYING
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
