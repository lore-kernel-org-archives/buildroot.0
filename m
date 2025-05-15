Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FAA5C3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 15 May 2025 12:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E83C40D81;
	Thu, 15 May 2025 12:33:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id apYcXrgbqtxf; Thu, 15 May 2025 12:33:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4481140D1E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4481140D1E;
	Thu, 15 May 2025 12:33:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8390C13D
 for <buildroot@buildroot.org>; Thu, 15 May 2025 12:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68E7E408AC
 for <buildroot@buildroot.org>; Thu, 15 May 2025 12:33:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LOZPWQK_9ylN for <buildroot@buildroot.org>;
 Thu, 15 May 2025 12:33:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 580854060C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 580854060C
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 580854060C
 for <buildroot@buildroot.org>; Thu, 15 May 2025 12:33:44 +0000 (UTC)
Received: from 91-152-140-108.elisa-laajakaista.fi ([91.152.140.108]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uFWz4-008c52-LH; Thu, 15 May 2025 13:48:37 +0200
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 44f64e88;
 Thu, 15 May 2025 11:48:36 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 15 May 2025 14:48:34 +0300
Message-ID: <20250515114836.572631-2-aperez@igalia.com>
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
 bh=1atsuHz93SQtBbdeLKQa3q0rh2Xf43nHBHH+6ZwAU3I=; b=Pvo3NUsZ2Cs7WvqQ0L/5waPyau
 GY2UwDN6RKXyiAhNPQ6zMNHrolSTt0UTdKNfIVk1nnLGDdNokaLHN9qh7PXIrcdFOV4YSofMola2X
 WYub7JWH5yLbugQO5DE59ZLn/ebtSlzCjTAqQQWiK7mOAsbgKesp4jkQ5nuAU0cCrpyIMjeEwL4CZ
 ReV3lX7UgldXU8i722eiLdzMpci3sJxYvx42lfLaxnIWegQUR9Pt5AHK4YcWyV6Lkqk2gd6NKSXHn
 Qc4/AvEjsXT0d4PnrW6GS0EMbXMm+CGd7fOGrHobnCZTOcgmHShNzxBnTVkALeJ1Dsq1LJbicyeJL
 sJzKDz8g==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=Pvo3NUsZ
Subject: [Buildroot] [PATCH 1/2] package/libdex: bump to version 0.10.0
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

On top of a few small features, this release has a few build system
improvements, and in particular improves checking for libatomic and
libucontext.

https://gitlab.gnome.org/GNOME/libdex/-/blob/0.10.0/NEWS

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/libdex/libdex.hash | 4 ++--
 package/libdex/libdex.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libdex/libdex.hash b/package/libdex/libdex.hash
index d6fba67f32..fa6ff292a3 100644
--- a/package/libdex/libdex.hash
+++ b/package/libdex/libdex.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/libdex/0.8/libdex-0.8.1.sha256sum
-sha256  955475ad3e43aabd6f6f70435264b5ee77bd265bd95545211fee026b08d378a0  libdex-0.8.1.tar.xz
+# From https://download.gnome.org/sources/libdex/0.10/libdex-0.10.0.sha256sum
+sha256  98a69626aa7646ad455bea7a7f92d2a1ffa47e4559a154a1bfe98c16fa711ee1  libdex-0.10.0.tar.xz
 
 # License files
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libdex/libdex.mk b/package/libdex/libdex.mk
index 381c605b16..e400757c2a 100644
--- a/package/libdex/libdex.mk
+++ b/package/libdex/libdex.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # The middle number is even for stable releases, odd for development ones.
-LIBDEX_VERSION_MAJOR = 0.8
-LIBDEX_VERSION = $(LIBDEX_VERSION_MAJOR).1
+LIBDEX_VERSION_MAJOR = 0.10
+LIBDEX_VERSION = $(LIBDEX_VERSION_MAJOR).0
 LIBDEX_SOURCE = libdex-$(LIBDEX_VERSION).tar.xz
 LIBDEX_SITE = https://download.gnome.org/sources/libdex/$(LIBDEX_VERSION_MAJOR)
 LIBDEX_LICENSE = LGPL-2.1+
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
