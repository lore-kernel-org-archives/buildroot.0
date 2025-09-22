Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527BACAC592
	for <buildroot@archiver.kernel.org>; Mon, 22 Sep 2025 16:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1DAD42081;
	Mon, 22 Sep 2025 16:22:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JvD5XuBZDYZN; Mon, 22 Sep 2025 16:22:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4814742040
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4814742040;
	Mon, 22 Sep 2025 16:22:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 71141E7
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 16:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57263405D9
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 16:22:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JTPGaCmo9mXL for <buildroot@buildroot.org>;
 Mon, 22 Sep 2025 16:22:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A6E65404A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6E65404A2
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A6E65404A2
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 16:22:46 +0000 (UTC)
Received: from 91-153-34-249.elisa-laajakaista.fi ([91.153.34.249] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1v0jJK-00FozL-OU; Mon, 22 Sep 2025 18:22:42 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 3a26913b;
 Mon, 22 Sep 2025 16:22:41 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Mon, 22 Sep 2025 19:22:39 +0300
Message-ID: <20250922162241.289717-1-aperez@igalia.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WYcaMfzzR4TmtYJU1zHg2IFg5422vyKCIZaXkk8zJDg=; b=po4yc6pS7JnDeDHbz/NHpGsiyp
 KX0fLhUY3alnrOivk2mVqMUqKLwbcIt12zzco86ZjrHz0cMuGDajg0BtOkNE2tFpSD/wHkCV2B3pG
 bVjX0QLpaQlLAIoGAzf10rwWqtemVjXGQFmeFLsiE1ACBdwH6S6xCkC3yEJi2O/sybOexis7eGOFP
 wk8363juiJu1vpDZIgv8q7xtSOBUxevaob6OH0c1C3TVA8bHpCg47tNLwtoJ7BHr/QxXxHQFNlG62
 nvzSGPQpg/Zz59pVrAvXqUcLKJOlF+LYM/jXgv1/DE05A+NGcoWz9m/qLbRdNmNQxYb05Qxz9T6Zu
 NDAc2uJw==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=po4yc6pS
Subject: [Buildroot] [PATCH] package/libdex: bump to version 1.0.0
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

This is the first release considered feature-complete, and despite the
ceremonious version number, it mainly includes fixes and API additions
providing improved ergonomics.

  https://gitlab.gnome.org/GNOME/libdex/-/blob/1.0.0/NEWS

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/libdex/libdex.hash | 4 ++--
 package/libdex/libdex.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libdex/libdex.hash b/package/libdex/libdex.hash
index 6d78b0842a..2a2a7b62cc 100644
--- a/package/libdex/libdex.hash
+++ b/package/libdex/libdex.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/libdex/0.10/libdex-0.10.1.sha256sum
-sha256  7472e88090db2b228307505edeba4483e872681340cb0404ae64ac3da5bed0a6  libdex-0.10.1.tar.xz
+# From https://download.gnome.org/sources/libdex/1.0/libdex-1.0.0.sha256sum
+sha256  7b8f5c5db3796e14e12e10422e2356766ba830b92815fee70bbc867b5b207f5d  libdex-1.0.0.tar.xz
 
 # License files
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libdex/libdex.mk b/package/libdex/libdex.mk
index aea4c60ab7..839b0006f6 100644
--- a/package/libdex/libdex.mk
+++ b/package/libdex/libdex.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # The middle number is even for stable releases, odd for development ones.
-LIBDEX_VERSION_MAJOR = 0.10
-LIBDEX_VERSION = $(LIBDEX_VERSION_MAJOR).1
+LIBDEX_VERSION_MAJOR = 1.0
+LIBDEX_VERSION = $(LIBDEX_VERSION_MAJOR).0
 LIBDEX_SOURCE = libdex-$(LIBDEX_VERSION).tar.xz
 LIBDEX_SITE = https://download.gnome.org/sources/libdex/$(LIBDEX_VERSION_MAJOR)
 LIBDEX_LICENSE = LGPL-2.1+
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
