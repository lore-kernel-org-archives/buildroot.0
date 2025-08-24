Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A576CA0EFC
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 08:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CCF26172C;
	Sun, 24 Aug 2025 08:05:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B5_npi6Wf-0Z; Sun, 24 Aug 2025 08:05:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAE6E61721
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAE6E61721;
	Sun, 24 Aug 2025 08:05:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7561E1D9
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 08:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7288A41B71
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 08:05:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OZ9tiJwcWLEV for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 08:05:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.128;
 helo=smtpcmd11128.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C33B341B6B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C33B341B6B
Received: from smtpcmd11128.aruba.it (smtpcmd11128.aruba.it [62.149.156.128])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C33B341B6B
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 08:05:09 +0000 (UTC)
Received: from localhost.localdomain ([95.168.107.28])
 by Aruba SMTP with ESMTPSA
 id q5isuKRGztr9dq5isuLWlb; Sun, 24 Aug 2025 10:05:07 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Sun, 24 Aug 2025 10:05:05 +0200
Message-ID: <20250824080505.421340-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfNnWOQQhNkjrzNFXjmsAErXPUfYzHI2sMgLaq1jWyUx3LIOHHt5JhrrWHmQpf/+Ns+hxGH32Lr4hXruIlM3ajyze8wKpi/d2abSerSlATLjsOXsghdzX
 GMB5ZRuIGa+WnIne2BfxppP+VUcd7lCzKeMEIg6z8+pAxBIXjtfPwSdPLN3kursl49TNBrhGk7OAo/DXPHKaFMwS0PkoItLLI5UMMNRLBzyqhd6AR0uGcHVc
 86CJTzH3SKCLX/LE643x1s8e4LS1y/XJgnz/gYAihtfPV4HnGtrNyevf/iUap44Vw74G95COibMVar4sOdMmfA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1756022707; bh=rE+BC24meW/1LtNUnXt0dobW528zdY+5VW1HDRbQdzU=;
 h=From:To:Subject:Date:MIME-Version;
 b=S9wd/0hY66Duw4HlyK0/fo0olYmUGhOYDGXElkeumjbLgfGrte+LLLkOApmpsLL+M
 v5j1UgCsQzqds7Ksonea9lRghVW+u34oYOyLYLY4UpusTUmmCWZwNQixrIOIARBP2w
 Ne5jaHKpvDSOSegxV6RSev9t5wmD29aJ6WQlqEhfP6906qSQBjv8aaUmP5aRzlfIS8
 0P3XSO4XdmscnqsnjIDw7fNdjqUS1Wp9GrQKGdJw9kaYueSfJ4kUjwnRYZw9kFFMxJ
 TXh4cBt7IAEf1K9K0lAd7i8v/COgFWP45Nfg15AgZb7YJzFAt0YeQLOYTkOpvRX/vX
 kJ6isVIKyQObQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=S9wd/0hY
Subject: [Buildroot] [for-next] package/mongoose: bump to version 7.19
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

https://github.com/cesanta/mongoose/releases/tag/7.19

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/mongoose/mongoose.hash | 2 +-
 package/mongoose/mongoose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mongoose/mongoose.hash b/package/mongoose/mongoose.hash
index 1a8774b056..b2375309d9 100644
--- a/package/mongoose/mongoose.hash
+++ b/package/mongoose/mongoose.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  8b661e8aceb00528fc21993afe218b1da0f0154575a61b63ce0791ad8b66b112  mongoose-7.18.tar.gz
+sha256  7ae38c9d673559d1d9c1bd72c0bdd4a98a2cae995e87cae98b4604d5951762b8  mongoose-7.19.tar.gz
 sha256  9abc2509d90c01ff2a0c91abf73582cdbcf1d2dbcc0b7973097eced43cf4cdd4  LICENSE
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index c74330e5fd..abc95dd311 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGOOSE_VERSION = 7.18
+MONGOOSE_VERSION = 7.19
 MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
 MONGOOSE_LICENSE = GPL-2.0
 MONGOOSE_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
