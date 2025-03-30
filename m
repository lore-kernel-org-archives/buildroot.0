Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A139EC28B20
	for <buildroot@archiver.kernel.org>; Sun, 30 Mar 2025 13:21:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C98F40747;
	Sun, 30 Mar 2025 13:21:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ARuPjD2UzyeR; Sun, 30 Mar 2025 13:21:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7778F4087A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7778F4087A;
	Sun, 30 Mar 2025 13:21:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FA74121
 for <buildroot@buildroot.org>; Sun, 30 Mar 2025 13:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1511F40897
 for <buildroot@buildroot.org>; Sun, 30 Mar 2025 13:21:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MUGbE5RbVzZE for <buildroot@buildroot.org>;
 Sun, 30 Mar 2025 13:21:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A862640725
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A862640725
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A862640725
 for <buildroot@buildroot.org>; Sun, 30 Mar 2025 13:21:01 +0000 (UTC)
Received: from home.juju.sh (unknown [82.64.214.120])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E1E02B0057C;
 Sun, 30 Mar 2025 15:20:56 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sun, 30 Mar 2025 15:20:51 +0200
Message-ID: <20250330132051.673201-1-ju.o@free.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743340858;
 bh=+GREbvxIIuzlHkseXZzRlOdDv4NJJuXy2Bg1uJAzEZo=;
 h=From:To:Cc:Subject:Date:From;
 b=q8ZgiOzwPgsRocr6ptVQDTO7l6ABcSzFS3ndqJg/FbZjVkYZi5YTymJ45dMHgVEXY
 2e35nX/JvBrOOxegx2MzKGt6k+pWSF2/sL6/JF6TDGNK1iSevhNVo3ynZlYePWeHrZ
 ndzcBAzFdRx307RPegIadJ8sWOOQ8TWXWP+sAEdbdaVsnZ54IPxfZ4WkCP0ICARaZP
 qFP/gQJMUy4qQf9VzrBTY3UiL/G8gnMmrmdeoEVj9ROtByBtLMdM/2yfvqou4nQtyB
 NqQe7h88vML1H+zwMwVVQWtC6KRD3m32Ad8S55lpGUQuBOvgzUds+blc4upcBwfwqY
 A4eSim+zbQblg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=q8ZgiOzw
Subject: [Buildroot] [PATCH 1/1] package/fwts: bump to version 25.03.00
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

See release announce:
https://lists.ubuntu.com/archives/fwts-devel/2025-March/013974.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/9568393971
---
 package/fwts/fwts.hash | 2 +-
 package/fwts/fwts.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fwts/fwts.hash b/package/fwts/fwts.hash
index 97b13b3db0..b578b96778 100644
--- a/package/fwts/fwts.hash
+++ b/package/fwts/fwts.hash
@@ -1,5 +1,5 @@
 # Hash from: https://fwts.ubuntu.com/release/SHA256SUMS
-sha256  c8bbf62f4bd80f17bb768bab3863ee93e195b2047d10637a3d03fe2086291bd7  fwts-V25.01.00.tar.gz
+sha256  6e4f795a7b5c7e549515901e197fedba200ee9fd06c8a62f9f49db24301f280b  fwts-V25.03.00.tar.gz
 
 # Hash for license file
 sha256  77a5f0ea48e53ee8d67aecc7759cf468bcd340c1caca711ed4307b477a93fb47  debian/copyright
diff --git a/package/fwts/fwts.mk b/package/fwts/fwts.mk
index 410ce063aa..dd1c16317f 100644
--- a/package/fwts/fwts.mk
+++ b/package/fwts/fwts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FWTS_VERSION = 25.01.00
+FWTS_VERSION = 25.03.00
 FWTS_SOURCE = fwts-V$(FWTS_VERSION).tar.gz
 FWTS_SITE = https://fwts.ubuntu.com/release
 FWTS_STRIP_COMPONENTS = 0
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
