Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9917AC83F1A
	for <buildroot@archiver.kernel.org>; Sun, 20 Jul 2025 20:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 218A960E8E;
	Sun, 20 Jul 2025 20:08:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nsk5U9WwCv32; Sun, 20 Jul 2025 20:08:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FE7960B05
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FE7960B05;
	Sun, 20 Jul 2025 20:08:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EA07127
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 20:08:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0107440DEC
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 20:08:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3twA8xddo2YI for <buildroot@buildroot.org>;
 Sun, 20 Jul 2025 20:08:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.147;
 helo=smtpweb147.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CA37240D20
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA37240D20
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CA37240D20
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 20:08:34 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id daKlu23eK2QPudaKluPYEY; Sun, 20 Jul 2025 22:08:32 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 20 Jul 2025 22:08:30 +0200
Message-Id: <20250720200830.142282-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfG/Yb/eMDEQ1UHUk6jlRuMh7MryGIQ3tNChiel4aNoGN+FAChI9Y7Uq5/JEdoCE69xoAnONXgCsK21DXrAHfoMqLa6bQMNLjWdfJmNPJU2AbiAZfyyoc
 rHmxBczzeQLBDT2CQ65ZEZ5wi+zvGfF/h6W1NFGS6Z5Gv6qkGSrrOxvnUVuuoRbgZE2mvnfiV+mytN3dJVfOt5Qjy+6LA7sBsQbXxX4h0046IQ6dV2jbhaEy
 1rUe62t41gZ7XkjIH/o1yTumGwSGs+pvtYWcK0cWKjI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1753042112; bh=EXY5W6XUYQVcSBJFDzP4a3KyX56HusSTAiXZBAZhTOg=;
 h=From:To:Subject:Date:MIME-Version;
 b=E1eCW6y6iHLQOITYiOVF7zRSCeqGRQhxSbsx14QHnx72WbvWSedEXnV0y1N9vn19g
 IznVFunZC9h8MQ32sfcxvPNjzE0AGywQu6CkFPEt4W5sSROx/3+jpfCE8GxIvNEdE8
 n2eq00ieIg1HAwVUSmXPc/eCY/w8eGBgz1Ncf7J4L6lpO14ikrRpvy66vjwOxl/oUU
 e6d3mxNSPtH5M7BqrKpSqq2JvWa9Yzre1Aj4bqV5ps+E2P2nY7CQqLb4QnwXlO0hwS
 DGjYxRvMHzIkxweBFQT9Nu3gqm30TuJeomTM/py5lKJHV/u1oTdfaLySlDtSeQL0ch
 qCs3/P2cult2A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=E1eCW6y6
Subject: [Buildroot] [PATCH] package/harfbuzz: bump to version 11.3.0
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

Release Notes:
https://github.com/harfbuzz/harfbuzz/releases/tag/11.3.0

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.hash | 2 +-
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 0fb034cdb4..f38137eb9d 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  093714c8548a285094685f0bdc999e202d666b59eeb3df2ff921ab68b8336a49  harfbuzz-11.2.1.tar.xz
+sha256  ebf40a47704d529d27a5cdd5468c5172e1a20277a65f161a5af5157b241e1120  harfbuzz-11.3.0.tar.xz
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 888f343750..7eb9d697a4 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 11.2.1
+HARFBUZZ_VERSION = 11.3.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
