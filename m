Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBA3CCF9F8
	for <buildroot@archiver.kernel.org>; Wed,  5 Nov 2025 14:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9937F612DF;
	Wed,  5 Nov 2025 14:35:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OwSMk_mXbxSR; Wed,  5 Nov 2025 14:35:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14DC1610ED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14DC1610ED;
	Wed,  5 Nov 2025 14:35:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C68CB462
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 14:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7A0641118
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 14:35:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zU-CNQmjTzBO for <buildroot@buildroot.org>;
 Wed,  5 Nov 2025 14:35:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.116;
 helo=smtpcmd11116.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DABF041117
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DABF041117
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DABF041117
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 14:35:16 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id GebRvmGCyZDx1GebSv5p3o; Wed, 05 Nov 2025 15:35:14 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed,  5 Nov 2025 15:35:09 +0100
Message-ID: <20251105143509.415919-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfFW8XE+cQilWa5gaB/PPIPBNPZAW+EE9N8hcBXK6NK//YBc3vuoPyjjB0Hz1LCiP/q25f9XVBGn8ucRe4w0uMUets48jtzCcriBupNqWwciKEaniY/vA
 j2ub8QFqHIJFP4IB4dIxzXNbYX0QmlGlnoOnX39t9xz5o+MauopDJa+hkmfdd5sQioLsBkXTjV6Y6feSwFYhjKCNZtWajtROoD1/lE2kC+uwCH74Q/mKiF/R
 8rqXKfiB1T4j5la5WDlpOFVf8SzyzA7/vkEvyotM/wI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1762353314; bh=FyKs80jpgUPH+qI3K+dOC6pDtXhr1pmQoQxg1uxRnww=;
 h=From:To:Subject:Date:MIME-Version;
 b=gfb6TIdDFJTdR4e3qc0TJCPLCmyCpwgpKqkyaQMD0DFW5pLzhWveWVmteoRBZWG5O
 zL52yz9bnsh3jL7VQpbtwzHsLzTTuKrsa+9WBq9cfhEMrBRf27CpIFTVpuPg5w2Knx
 VEpCuuMABQtDoMJtusPXuX1VbYrBE9AOuvf2K2lrKRgXeX1vKyaMe7MKOfYWsx1kcR
 Zef3ZVBux4xgnepbtj9BxmUh1B4BSIGt0yZE4nM4qZ+yeaRuHVxvczBO0JjX1haGea
 tJo6edRIOkboYuIf8c2fBkGlhPf5F3D1omS4GCOnFIbQdsxggabjk5FK9SekDxZzf+
 TE32nU04qweUA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=gfb6TIdD
Subject: [Buildroot] [PATCH] package/harfbuzz: bump to version 12.2.0
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
https://github.com/harfbuzz/harfbuzz/releases/tag/12.2.0

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.hash | 2 +-
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 3b7be8c07b..dbe10255ec 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e5c81b7f6e0b102dfb000cfa424538b8e896ab78a2f4b8a5ec8cae62ab43369e  harfbuzz-12.1.0.tar.xz
+sha256  ecb603aa426a8b24665718667bda64a84c1504db7454ee4cadbd362eea64e545  harfbuzz-12.2.0.tar.xz
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index a21a7f4387..268e4ac5d0 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 12.1.0
+HARFBUZZ_VERSION = 12.2.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
