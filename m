Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E73C3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 26 Jul 2024 14:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 316F460B2E;
	Fri, 26 Jul 2024 14:39:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TcfrcifYmdPs; Fri, 26 Jul 2024 14:39:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F88F60B31
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F88F60B31;
	Fri, 26 Jul 2024 14:39:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C55C91BF344
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 14:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF69340F4D
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 14:39:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3yDbKekRMz62 for <buildroot@lists.busybox.net>;
 Fri, 26 Jul 2024 14:39:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1093F40F3F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1093F40F3F
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1093F40F3F
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 14:39:10 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 133242C837A3;
 Fri, 26 Jul 2024 16:39:08 +0200 (CEST)
To: buildroot@buildroot.org
Date: Fri, 26 Jul 2024 16:39:06 +0200
Message-Id: <20240726143907.1345051-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1722004748; bh=fxmN4S2cFOjYJfziAGT2uWJBE3HdoE86oQaaQl/Qb9c=;
 h=From:To:Cc:Subject:Date;
 b=A9f6Y/Mt+Hu7vyWPf0QU2sKfXFnq6TLcl3jNtTewuRhq4uLNfF6mStmOHKWvjha1H
 ypH/U7tSRntENeP5EWq6sfR28e8jIbQxTOgUiRME5Yvz05aGuxmwIUeua0tvX3t7z6
 sb0VwmCE4XfZHmBLMtZal7UUpZ4Ljs/cNfW4VudQXL0x3saKQiyJG6eeqXspxqYcJY
 mM0l/edfeqmFTYeZSktQdvW12B1lNAA0gbX3YZ97MtqmgXx6+0Vi5g2tg08XPrIfKq
 B0wvcgv8OYgLFlZ6KTjMZrHgS6HL3dU4CTceBtmE9JES9CT2LSBlBb+OR2D8sLtdxr
 +LhPhj3xTYw3Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=A9f6Y/Mt
Subject: [Buildroot] [PATCH] package/sqlite: bump to 3.46.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://sqlite.org/releaselog/3_46_0.html

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index e7b5d2b224..5eae86f159 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  cd9c27841b7a5932c9897651e20b86c701dd740556989b01ca596fcfa3d49a0a  sqlite-autoconf-3450100.tar.gz
+sha256  6f8e6a7b335273748816f9b3b62bbdc372a889de8782d7f048c653a447417a7d  sqlite-autoconf-3460000.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 040d405b8a..8bd0a5cb4d 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.45.1
-SQLITE_TAR_VERSION = 3450100
+SQLITE_VERSION = 3.46.0
+SQLITE_TAR_VERSION = 3460000
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2024
 SQLITE_LICENSE = blessing
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
