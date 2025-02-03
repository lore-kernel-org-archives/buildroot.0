Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08E7C02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 14:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B26C782077;
	Mon,  3 Feb 2025 14:15:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z5gaLFs_A_cI; Mon,  3 Feb 2025 14:15:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB2A182090
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB2A182090;
	Mon,  3 Feb 2025 14:15:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B23F81A1
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 14:14:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93A1B60BDC
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 14:14:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TT9mhqAXmJCG for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 14:14:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9148C60B6A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9148C60B6A
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9148C60B6A
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 14:14:58 +0000 (UTC)
Received: from localhost.localdomain (unknown [109.89.232.55])
 (Authenticated sender: vjardin@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id E005A19F742;
 Mon,  3 Feb 2025 15:14:52 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Cc: romain.naour@gmail.com,
	Vincent Jardin <vjardin@free.fr>
Date: Mon,  3 Feb 2025 15:14:25 +0100
Message-ID: <20250203141425.48418-1-vjardin@free.fr>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1738592095;
 bh=bb57kAUSPWRZECVWWgnghCkkm8C+BFfscYy/4QOjyb8=;
 h=From:To:Cc:Subject:Date:From;
 b=OJ/TY606hqWOtHXcDUXPsPO+k4TbcDC4JGtVy1SRBBEXB+jcitSc0ZRjlhU+i3gdk
 Qqm0p7SXl1a7PUSZPPvnxamOJsq5LJ1QpLyvfzdyZwSIj69EERPxza4onK6Z3QJy7p
 Z9W6EZXayBrSjJvyu71HuKmKSA2WQzLJl9uy2iYLR35smlGc66TpnaNedJkY/sFmNO
 AhjmCDH/FRSrGZyhwuU4sRys3odJh5ZEdnNosw1JkUwhg7K3MHdxeAi4MtmQ3xO74+
 rPoeaeoEDrKe2kcNoBKgd8z+Udc9QgVFDiTMXIVXxXe+rMc0u3ufaXK51ae+7mQCdu
 kumG/Tqd5QFQA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=OJ/TY606
Subject: [Buildroot] [PATCH v1 1/1] package/libbpf: bump to version 1.5.0
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

Changelog: https://github.com/libbpf/libbpf/releases/tag/v1.5.0

Signed-off-by: Vincent Jardin <vjardin@free.fr>
Signed-off-by: Vincent Jardin <vjardin@vjardin@free.fr>
---
 package/libbpf/libbpf.hash | 2 +-
 package/libbpf/libbpf.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libbpf/libbpf.hash b/package/libbpf/libbpf.hash
index 75f2b1695c..f5ecc59cd8 100644
--- a/package/libbpf/libbpf.hash
+++ b/package/libbpf/libbpf.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  5da826c968fdb8a2f714701cfef7a4b7078be030cf58b56143b245816301cbb8  libbpf-1.1.0.tar.gz
+sha256  53492aff6dd47e4da04ef5e672d753b9743848bdb38e9d90eafbe190b7983c44  libbpf-1.5.0.tar.gz
 sha256  847f4addbd56e2d5be20c4ea0845e972672fc07b755fadaae5f7abd35d71e349  LICENSE
 sha256  e1638b9a0c68ca90fad3df1d6b4e430804d2fbdc15e58d02cffddfae38953bbf  LICENSE.BSD-2-Clause
 sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LICENSE.LGPL-2.1
diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
index ef33542f2d..7fa541ad24 100644
--- a/package/libbpf/libbpf.mk
+++ b/package/libbpf/libbpf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBPF_VERSION = 1.1.0
+LIBBPF_VERSION = 1.5.0
 LIBBPF_SITE = $(call github,libbpf,libbpf,v$(LIBBPF_VERSION))
 LIBBPF_LICENSE = GPL-2.0, LGPL-2.1, BSD-2-Clause
 LIBBPF_LICENSE_FILES = LICENSE LICENSE.BSD-2-Clause LICENSE.LGPL-2.1
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
