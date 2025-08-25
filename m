Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14FB0CA0FE9
	for <buildroot@archiver.kernel.org>; Mon, 25 Aug 2025 21:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2FFF42C46;
	Mon, 25 Aug 2025 21:59:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 02fSLNb4SHKR; Mon, 25 Aug 2025 21:59:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7EEB42C47
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7EEB42C47;
	Mon, 25 Aug 2025 21:59:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EE717CD
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 21:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFCE784402
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 21:59:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BswMFzfCIkHx for <buildroot@buildroot.org>;
 Mon, 25 Aug 2025 21:59:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.188;
 helo=smtpcmd15188.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 34B7684193
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34B7684193
Received: from smtpcmd15188.aruba.it (smtpcmd15188.aruba.it [62.149.156.188])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 34B7684193
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 21:59:29 +0000 (UTC)
Received: from localhost.localdomain ([95.168.107.28])
 by Aruba SMTP with ESMTPSA
 id qfDqunHLfX2UCqfDruS2PW; Mon, 25 Aug 2025 23:59:27 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 25 Aug 2025 23:59:24 +0200
Message-ID: <20250825215924.480927-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250825215924.480927-1-giulio.benetti@benettiengineering.com>
References: <20250825215924.480927-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfMpG8bLHbgeMVTQ3KbGdt/QxQ5dNdvY93lDnnpiNAJ8+ooZNJN4tYTotz3MB8TRxsJ2stpSIlub0UsGQ3lPWI+wMk+35qNoW4F7NrQTkjTl+4e+MTgNR
 yeqwbp+WeCEpy70YTPJcpdXhlBJFKBVdiSdXNafx0piv2dhJYWQILiMVzjfbibP2o4JrPAIgioi12n9aMdZI1ak929arZgP4wAKpdT3Tz4/TdiuBXq6Wyd2/
 54YZPbZRWm2vWrn4lYI62tDTP56G9aJMVzHtm3GPnW3UsOaHd92cAgfHpfZaE3zH
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1756159167; bh=xutV3nsp31Pem65wpdy5s7rOTFEGEPjSOSEd8bYrwrg=;
 h=From:To:Subject:Date:MIME-Version;
 b=RjH5x/yLnlELEu9pcpHSp+jErZdP7XrG0puNICO3wKjJex0M7Q/prYSQDH7f7Jo9a
 cUGWcEsl/VxEVOYlXjQe+MmuqQ3Y5+umjLEuKozFYLrBztrojCOKE4YLQh65FrXsUR
 +XcZ73zRyjgoWfRZAxy1Bry7EWC4Tgy59LqymznUUE51X3DP+lcoDukNxLq/4efSdP
 f5It09kQlucbKYcbSgu3dW3Q3DpoLWQ6a1eR+HLDpCPR46i9rt6prk8HMILcGQiToj
 RhSlFhbI8AWpDoBd8XoVcCNdQ6gUvounniA4tyYSacc0mset/ZaIZTne6zfZlPuuFT
 s+Vmk0IsSxZkw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=RjH5x/yL
Subject: [Buildroot] [for-next] package/cryptsetup: bump version to 2.8.1
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

For release note, see:
https://gitlab.com/cryptsetup/cryptsetup/-/blob/v2.8.1/docs/v2.8.1-ReleaseNotes

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/cryptsetup/cryptsetup.hash | 2 +-
 package/cryptsetup/cryptsetup.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
index f456451765..bd165f2356 100644
--- a/package/cryptsetup/cryptsetup.hash
+++ b/package/cryptsetup/cryptsetup.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.8/sha256sums.asc
-sha256  cc9e2d37c25a871cea37520b28d532207b0c1670fb10fc54d68071f63f5243a2  cryptsetup-2.8.0.tar.xz
+sha256  2c3379eb76597dcab50911449b013e2697c4bffcc716dbbf0d9b0e8fbbb46fb4  cryptsetup-2.8.1.tar.xz
 sha256  45670cce8b6a0ddd66c8016cd8ccef6cd71f35717cbacc7f1e895b3855207b33  COPYING
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  docs/licenses/COPYING.Apache-2.0
 sha256  28a9529c7d0bb4dc51f4bf5c116a3d16ef247a052f7591466768ddf563fd1cf5  docs/licenses/COPYING.CC-BY-SA-4.0
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 6d2536957d..ebe9c865b3 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CRYPTSETUP_VERSION_MAJOR = 2.8
-CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).0
+CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).1
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
 CRYPTSETUP_DEPENDENCIES = \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
