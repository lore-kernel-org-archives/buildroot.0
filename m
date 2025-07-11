Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11DFEC83F1B
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 13:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFB5781FAE;
	Fri, 11 Jul 2025 13:24:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6vUAEDbtqihe; Fri, 11 Jul 2025 13:24:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA0C881FB0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA0C881FB0;
	Fri, 11 Jul 2025 13:24:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D7AD1E1
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 13:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E79340026
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 13:24:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id smhfbsImmjSG for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 13:24:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3AAAC408B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AAAC408B7
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3AAAC408B7
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 13:24:38 +0000 (UTC)
Received: from 91-153-34-249.elisa-laajakaista.fi ([91.153.34.249] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uaDju-00FO85-A5; Fri, 11 Jul 2025 15:24:34 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 7567d31b;
 Fri, 11 Jul 2025 13:24:33 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 11 Jul 2025 16:24:31 +0300
Message-ID: <20250711132433.2813842-1-aperez@igalia.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FCQCFy012bZ+hKZYcWAvJKJ1zXKv16QCQiJZ48U/XRM=; b=ntm1CKgJ+JKS5hVAmcbqQvc8KV
 H3b6xvy1KsbyhVrcju1PJWdqviU9J/eqWzSAHl30cukY0vlxmi6KRTQ8i/icMC9mj7m2BU0dxjih0
 ZlyIIe6ujTusGQqzElOHqFqepX7ryotyoSEfpF9SZpZnlTovD+BL/evi4bYKSkWr7+8QhPs/T8Ve8
 zEdi9j1dtg1TVAu4syflb68hebM1LbqEnhbq9WXZXXSzK70njqEToED9dLDndqqoCTCkKxKvWlQGu
 9dibwCXoijX7TQvCueKe95aNgROQ8AQe7yh+vgQIM9iVHb8j0vhDcisRfPqrJ6El9UAh9UVilbJVU
 5hDnV3yA==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=ntm1CKgJ
Subject: [Buildroot] [PATCH 1/1] package/libmanette: bump to version 0.2.12
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

Bugfix release, mainly adds dead zone for the Steam Deck analog sticks.
Release notes:

  https://gitlab.gnome.org/GNOME/libmanette/-/blob/0.2.12/NEWS

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/libmanette/libmanette.hash | 4 ++--
 package/libmanette/libmanette.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libmanette/libmanette.hash b/package/libmanette/libmanette.hash
index 0ec6077c2c..dac0d3707e 100644
--- a/package/libmanette/libmanette.hash
+++ b/package/libmanette/libmanette.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/libmanette/0.2/libmanette-0.2.11.sha256sum
-sha256  b812b94e08632ba62a30960a8de29217a73a2fff5da2f12acc8a5d4771a49a70  libmanette-0.2.11.tar.xz
+# From https://download.gnome.org/sources/libmanette/0.2/libmanette-0.2.12.sha256sum
+sha256  48b349267180f1dc34d405a9e1e90ba16f054a19ce907930e679493d911ea1d8  libmanette-0.2.12.tar.xz
 
 # Locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libmanette/libmanette.mk b/package/libmanette/libmanette.mk
index 44beef836f..b67f2cc086 100644
--- a/package/libmanette/libmanette.mk
+++ b/package/libmanette/libmanette.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBMANETTE_VERSION_MAJOR = 0.2
-LIBMANETTE_VERSION = $(LIBMANETTE_VERSION_MAJOR).11
+LIBMANETTE_VERSION = $(LIBMANETTE_VERSION_MAJOR).12
 LIBMANETTE_SOURCE = libmanette-$(LIBMANETTE_VERSION).tar.xz
 LIBMANETTE_SITE = https://download.gnome.org/sources/libmanette/$(LIBMANETTE_VERSION_MAJOR)
 LIBMANETTE_LICENSE = LGPL-2.1+
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
