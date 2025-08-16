Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C89CA0EE6
	for <buildroot@archiver.kernel.org>; Sat, 16 Aug 2025 13:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 623AD406D6;
	Sat, 16 Aug 2025 13:48:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id in_P-T13T0h5; Sat, 16 Aug 2025 13:48:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9195A4055A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9195A4055A;
	Sat, 16 Aug 2025 13:48:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E8335196
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 13:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE90861295
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 13:48:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kq6EIq5Ln46k for <buildroot@buildroot.org>;
 Sat, 16 Aug 2025 13:48:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B558C611B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B558C611B5
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B558C611B5
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 13:48:44 +0000 (UTC)
Received: from argo.fritz.box (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id C90A1E001BE;
 Sat, 16 Aug 2025 15:48:41 +0200 (CEST)
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: Florian Larysch <fl@n621.de>
Date: Sat, 16 Aug 2025 15:48:36 +0200
Message-ID: <20250816134837.9603-1-fl@n621.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1755352122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=7F+GAl+c7rUgwNH8Z8wJeQ9UbxqR6LEKXJnrD3JOCKs=;
 b=i1b/rnXo+AfMcc+xtTa4wMzpBIU5Nv3ms8oq+bbAUBLEG6OUaNjxLX/DUmR0ZvPzo24Ew3
 /36vkgkdcyPi8JJpgfhlNiS3JBxYJV5ODiusarNhfxAN2+rE/seKNbK2o45YOmL+8dnpp3
 0xRxYGxhZLnd5j4MSxFi5gef3m0KjHQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=i1b/rnXo
Subject: [Buildroot] [PATCH 1/1] package/ed: bump to version 1.22.1
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

In particular, the 1.21 release fixes C23 compilation issues caused by a
custom bool definition.

Release 1.21 also includes a change of the COPYRIGHT file, but it is
purely cosmetic.

Changelogs since 1.20.2:
1.21:   https://lists.gnu.org/archive/html/bug-ed/2025-01/msg00002.html
1.21.1: https://lists.gnu.org/archive/html/bug-ed/2025-03/msg00006.html
1.22:   https://lists.gnu.org/archive/html/bug-ed/2025-07/msg00008.html
1.22.1: https://lists.gnu.org/archive/html/bug-ed/2025-08/msg00010.html

Fixes: https://autobuild.buildroot.org/results/3d5/3d523440dc7bebe12fd95564e3c5b5e90bc39af9

Signed-off-by: Florian Larysch <fl@n621.de>
---
 package/ed/ed.hash | 6 +++---
 package/ed/ed.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ed/ed.hash b/package/ed/ed.hash
index d1d99309c6..44d5bc7653 100644
--- a/package/ed/ed.hash
+++ b/package/ed/ed.hash
@@ -1,4 +1,4 @@
-# From https://lists.gnu.org/archive/html/bug-ed/2024-04/msg00003.html
-sha256  65fec7318f48c2ca17f334ac0f4703defe62037bb13cc23920de077b5fa24523  ed-1.20.2.tar.lz
+# From https://lists.gnu.org/archive/html/bug-ed/2025-08/msg00010.html
+sha256  1af541116796d6b9e4b66ef9c45ddce0e15a19ed62bfca362ccd7d472cc1c8fb  ed-1.22.1.tar.lz
 # Locally calculated
-sha256  3d77c1a58fbde5ddba612d1fe09965e20a3804953eca12e8c1892298bb8a5eef  COPYING
+sha256  022e9c2e9cc1aac3622313df6f971fbb39c1d1b0cb45324c16b8a1fe231c5ea6  COPYING
diff --git a/package/ed/ed.mk b/package/ed/ed.mk
index 704744359a..10092d513f 100644
--- a/package/ed/ed.mk
+++ b/package/ed/ed.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ED_VERSION = 1.20.2
+ED_VERSION = 1.22.1
 ED_SITE = $(BR2_GNU_MIRROR)/ed
 ED_SOURCE = ed-$(ED_VERSION).tar.lz
 ED_LICENSE = GPL-2.0+
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
