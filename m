Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9361C83F1A
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 14:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EA2D83DB5;
	Fri, 11 Jul 2025 14:21:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NOTSzgWO_984; Fri, 11 Jul 2025 14:21:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60DE783C73
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60DE783C73;
	Fri, 11 Jul 2025 14:21:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 26F32199
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 14:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CF3C83C1C
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 14:21:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PwBOTYbu3FzO for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 14:21:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B7C17820DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7C17820DC
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B7C17820DC
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 14:21:08 +0000 (UTC)
Received: from 91-153-34-249.elisa-laajakaista.fi ([91.153.34.249] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uaEcb-00FPHi-Rt; Fri, 11 Jul 2025 16:21:05 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id d6f2bf30;
 Fri, 11 Jul 2025 14:21:05 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 11 Jul 2025 17:21:03 +0300
Message-ID: <20250711142105.2822708-1-aperez@igalia.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=v1Djijkm9Y/BDbfEn0BZSFrrUlJDL780t5fZ5i2dXsk=; b=rG8T4tAx0Xlb/0ul/EqJPx9qxk
 e2y1hoQQo6ijQ2b080qCGXUNh5UIz24CBytzXzB5hChc2s4Zse0FyUGUQZegNlaY+v/3Btd8oVAGh
 1CtXf3GYzWIF+1XUixgiJDALHNI7EAL2ZI1crwnCaoTnn+nyLYnFkPJXdX5xaBWcv6s1MgmoguILI
 x3HaqRD1gFTqzODhr/oxaSgpAk0J4JIxT7+QHwY7OwRlxoGHIswuFDplt/g46H6nl/+gO66ouYV28
 HzxB5/u2i5Tz/MzOZAzQXUUwUnnmdawhl3lDpmsnLoJ+ACYhBeq1mEBBEEXtbXD/n+WYJO7lfwFDd
 yw+BakmA==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=rG8T4tAx
Subject: [Buildroot] [PATCH 1/1] package/libdex: bump to version 0.10.1
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

This is a bugfix release which includes a few improvements and fixes
leaks of Unix signal futures. Release notes:

  https://gitlab.gnome.org/GNOME/libdex/-/blob/0.10.1/NEWS

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/libdex/libdex.hash | 4 ++--
 package/libdex/libdex.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libdex/libdex.hash b/package/libdex/libdex.hash
index fa6ff292a3..6d78b0842a 100644
--- a/package/libdex/libdex.hash
+++ b/package/libdex/libdex.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/libdex/0.10/libdex-0.10.0.sha256sum
-sha256  98a69626aa7646ad455bea7a7f92d2a1ffa47e4559a154a1bfe98c16fa711ee1  libdex-0.10.0.tar.xz
+# From https://download.gnome.org/sources/libdex/0.10/libdex-0.10.1.sha256sum
+sha256  7472e88090db2b228307505edeba4483e872681340cb0404ae64ac3da5bed0a6  libdex-0.10.1.tar.xz
 
 # License files
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libdex/libdex.mk b/package/libdex/libdex.mk
index e400757c2a..aea4c60ab7 100644
--- a/package/libdex/libdex.mk
+++ b/package/libdex/libdex.mk
@@ -6,7 +6,7 @@
 
 # The middle number is even for stable releases, odd for development ones.
 LIBDEX_VERSION_MAJOR = 0.10
-LIBDEX_VERSION = $(LIBDEX_VERSION_MAJOR).0
+LIBDEX_VERSION = $(LIBDEX_VERSION_MAJOR).1
 LIBDEX_SOURCE = libdex-$(LIBDEX_VERSION).tar.xz
 LIBDEX_SITE = https://download.gnome.org/sources/libdex/$(LIBDEX_VERSION_MAJOR)
 LIBDEX_LICENSE = LGPL-2.1+
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
