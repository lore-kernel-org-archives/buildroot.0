Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78DC4C36008
	for <buildroot@archiver.kernel.org>; Sat, 29 Mar 2025 22:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2521F40D81;
	Sat, 29 Mar 2025 22:18:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GJ23ULYD1iHd; Sat, 29 Mar 2025 22:18:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AFCF40D7D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AFCF40D7D;
	Sat, 29 Mar 2025 22:18:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C8C812A
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 22:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5DC6482094
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 22:18:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UJDT0O221N7W for <buildroot@buildroot.org>;
 Sat, 29 Mar 2025 22:18:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.146;
 helo=smtpcmd13146.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7DC528202A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DC528202A
Received: from smtpcmd13146.aruba.it (smtpcmd13146.aruba.it [62.149.156.146])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7DC528202A
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 22:18:19 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id yeVMtNPxV6z5ZyeVMtMuNk; Sat, 29 Mar 2025 23:18:17 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sat, 29 Mar 2025 23:18:15 +0100
Message-Id: <20250329221815.573118-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250329221815.573118-1-giulio.benetti@benettiengineering.com>
References: <20250329221815.573118-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPlI8xxiV7JT8z/HaaqcPLIO5Soj02KYRqZfmpmHRR0FQ8775SL704Sc9Eh/56Q+cVnjzKfyqt9cuCwWmvwbO5a85X8BSrVvv1whCuVvPEiXwUuQBpvW
 DCL23O6jV6iREeolo/BDd0uQVlh/ejjJir0KE4MTUFvrRqxT+tKU/vNmX2fdlrV1eOP4QZ/NZJF3+3Mu1hcPNLbsxOkRHy0p+OIQ6PoupRXkb8GoK1qaIoUx
 AUohPxbYCD1XbM6ZFMdEPYrdI/Ckkg8uWYEGTefHba0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1743286697; bh=BfQz5OQt4tPSaIQgsF5WWOuI93JBLtQB17umGGG1LQc=;
 h=From:To:Subject:Date:MIME-Version;
 b=LuZVxgIADp56udqDWFIaPkk4G2r3zrLHzvL7oPhlsnW4yEqkiAD+z4TTFIWbbdD92
 JyOxNsLFGI7GRf9CDWwBzmVn/mIWIJyu3lnV/6gbUrUDkgKEe4VoCevKNJRJr5cu14
 zknl5YWmaQUeAWNUY8CB/WQ0UhIfuCOFX1IGmrUn1FdQEsD0CJ1hOopSN0rMMDXOaC
 xZ7s5S23Rs4+jO6qakFot26MEMclV5Lkmb+w6YIZwFARt7F6lcHDj26FqrIgLIoGzx
 nynIzaiwKce6/7oZrh8n+SOKvVzKfksTVjiUSzsO6QP0mZy2u2o8WqqujOIcteqafj
 KG8nzKWsA1jqQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=LuZVxgIA
Subject: [Buildroot] [PATCH] package/libnvme: bump to version 1.12
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
https://github.com/linux-nvme/libnvme/releases/tag/v1.12

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnvme/libnvme.hash | 2 +-
 package/libnvme/libnvme.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libnvme/libnvme.hash b/package/libnvme/libnvme.hash
index 68546c76b4..ace82aaec8 100644
--- a/package/libnvme/libnvme.hash
+++ b/package/libnvme/libnvme.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  6d5d8ba2cc4c94a61a994c9f7f25b3b26ef973fb5c0daa37729890903f37a1f1  libnvme-1.11.1.tar.gz
+sha256  53791f2e75773ba95449fc98a3b8b444d984624322ec6980049fd4eb289123d5  libnvme-1.12.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libnvme/libnvme.mk b/package/libnvme/libnvme.mk
index fc7edda7ff..7ff7eef8e8 100644
--- a/package/libnvme/libnvme.mk
+++ b/package/libnvme/libnvme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNVME_VERSION = 1.11.1
+LIBNVME_VERSION = 1.12
 LIBNVME_SITE = $(call github,linux-nvme,libnvme,v$(LIBNVME_VERSION))
 LIBNVME_LICENSE = LGPL-2.1
 LIBNVME_LICENSE_FILES = COPYING
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
