Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A78F3C369CB
	for <buildroot@archiver.kernel.org>; Wed, 23 Apr 2025 18:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7262B40830;
	Wed, 23 Apr 2025 18:52:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2MdjU6YjtAeL; Wed, 23 Apr 2025 18:52:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 868B340719
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 868B340719;
	Wed, 23 Apr 2025 18:52:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 632FE19F
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 18:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 601B1607C8
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 18:52:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nk1lGFvugdPd for <buildroot@buildroot.org>;
 Wed, 23 Apr 2025 18:52:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.148;
 helo=smtpdh19-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CD8DC607C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD8DC607C6
Received: from smtpdh19-1.aruba.it (smtpdh19-1.aruba.it [62.149.155.148])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CD8DC607C6
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 18:52:30 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 7fCuuMDJjvoVF7fCuuZpTu; Wed, 23 Apr 2025 20:52:28 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pierre Floury <pierre.floury@gmail.com>
Date: Wed, 23 Apr 2025 20:52:27 +0200
Message-Id: <20250423185227.1313667-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfNl3WPjeXloQ1/t/dmLa/G4cVrrmwuwlA76CkoQASpDCSkFBWo0iifl4rsGc9GfOX8sBNz/pimsdF56GLy2PTIRzjIKS7yIZ8CAXvXMV7lcW8WAf0tm7
 2RvGGIDBLFHa5RipP3pZDsFlwXup4twuHangQ4paOTg9rC/9T0l0ox3lvxNUaeJLuFn+rDNY5P/ghDyny6dMj3cUu1E2ND6re6H7+f4Cj7qOxvbPwEUmoP1T
 0uYBN5bIQnM2KQGYLcY8UtAeOntUeXScWWItNxU+1N8wxrppuyZL5Y+2Xe/wilCNet0YCe5aI/PH6cFq9bF3pg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1745434348; bh=fuZH4OpjlOeBrbVkFRMBiKuhOEZCVdV7vjSGVPho4Aw=;
 h=From:To:Subject:Date:MIME-Version;
 b=K+/K868mykhj98TcdRkGFJ0DNQwrM8XZB5is1VnaEXjJ4aRD5mj8ESfhfdBwF+Lfq
 jxdBcW9dTSHpnGbYYjiQIt+kavIq0TMExMkUx25XrojVA9tJ453uY0BWRnTZbG9dUK
 UJwkqr9Kp7Rc5+YSzLLEFiQL4Wg2MdVHLhacCKda/fg4RvptZvez3D31eAwFVfywnt
 93c1Yt4aRteSx7L6jdSMvfNiHfQWsmG3BYKdt8vbejuto1N8p6wmZoLWtcIuCDrgVy
 T0Bl3ZJik/fCA24Cc1bzRNWPrb9lhrB6l1ipZ2ArfGSfN7SXradMHM9FSYORc7gofr
 S8poeWY89DKgw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=K+/K868m
Subject: [Buildroot] [PATCH] package/trace-cmd: bump to version 3.3.2
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
https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/tag/?h=trace-cmd-v3.3.2

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/trace-cmd/trace-cmd.hash | 2 +-
 package/trace-cmd/trace-cmd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/trace-cmd/trace-cmd.hash b/package/trace-cmd/trace-cmd.hash
index c1b52a5195..832dae693e 100644
--- a/package/trace-cmd/trace-cmd.hash
+++ b/package/trace-cmd/trace-cmd.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  2efe103389367e93c764c4a788880ba51018a65dec21b0411965a5f06a6338c1  trace-cmd-v3.3.1.tar.gz
+sha256  cf16c91c0c49893499710ab2f722fd7c5ffce27485d2f7509370836b168ecd45  trace-cmd-v3.3.2.tar.gz
 sha256  b1d04b850c1c7471b0f0896f6c6f0fcfc9f07e2dd183a5f5826af269fe9e88fb  COPYING
 sha256  70f297763149e72306919c924e164f83041d5e512868d4c8c1826c171b3e49f9  COPYING.LIB
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
index cf16ddcb17..ec8f5c4b59 100644
--- a/package/trace-cmd/trace-cmd.mk
+++ b/package/trace-cmd/trace-cmd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRACE_CMD_VERSION = 3.3.1
+TRACE_CMD_VERSION = 3.3.2
 TRACE_CMD_SOURCE = trace-cmd-v$(TRACE_CMD_VERSION).tar.gz
 TRACE_CMD_SITE = \
 	https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/snapshot
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
