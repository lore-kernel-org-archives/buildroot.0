Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFE6E69187
	for <buildroot@archiver.kernel.org>; Sun, 24 Nov 2024 22:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8B3B6155C;
	Sun, 24 Nov 2024 22:28:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aNpSruPAaS8U; Sun, 24 Nov 2024 22:28:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93CED60663
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93CED60663;
	Sun, 24 Nov 2024 22:28:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F1CF31
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 22:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86AD14286E
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 22:28:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z3HmH-jR2Lp5 for <buildroot@buildroot.org>;
 Sun, 24 Nov 2024 22:28:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.146;
 helo=smtpweb146.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DE69E428C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE69E428C4
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DE69E428C4
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 22:28:47 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id FL5wtCu9lNhthFL5xt2PkU; Sun, 24 Nov 2024 23:28:45 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 24 Nov 2024 23:28:43 +0100
Message-Id: <20241124222844.162887-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfIE3uhwKYZ9lMmJwOzVs2wSohr0Ku7IyTZx6+xEUqvuBppVs6GqpuGH/sqHJkgit4v0dV8trcZ/SGNxr8XnzfcVUPL83xLKXBh1pVoz99PI5ql7/jSzg
 9aAMV/pj6CMA8KhAjCBz+UH5koAXCiUZ69LPH0LYxKpItjKQWvuSwpiM62DA9odu8EipLnSN4U8mzcD/k3HPZPtXo96VjqY5mVtbB1D+IhoyxZ22W6y57FJP
 lC06Lan+nL50ZTlU2zB9+NPTRHKGNGC5TWBEb1eKy0fG/VdxchzSlvMSeKAny4bQZK3UbEfELKKv+CTRHe1VAQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1732487325; bh=VqSnAj9YTSFCLetaw+niX2vo41J1y+SjgFQymipN1T4=;
 h=From:To:Subject:Date:MIME-Version;
 b=aZxMSIC7bt+vId31ZhMNnffuB/n3Rg7tJJpLajCsjzyxtT711TeTXgFsYD3OW4bVX
 gczjPC9xPbB8fuNPboBRfe1Ra+lkoMOvJgicepzk0PCJcguYzqkMkKGOfvzJj/vga2
 J02g5IrwPF8WJwMgl6f2C7yQUsJqbBAmk09iVAyZ9WDTk+lDIfeg4LojlHTx+NDxtv
 iRPWrM/HrsEj8svHX/ilI6KDEXYBByY6jVDS59Feea3U73yfRs2/AxA8JnmQ+1VNQ2
 fb441mEaffTR01nwFQRlCNc+XSntx7o2OBjyBAHLq/4buM8fjNviFM7EdhbOclLhJ5
 fBc0X68iUlZhg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=aZxMSIC7
Subject: [Buildroot] [PATCH] package/esp-hosted: bump to version 2024-11-15
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

It builds up to Linux 6.11.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/esp-hosted/esp-hosted.hash | 2 +-
 package/esp-hosted/esp-hosted.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/esp-hosted/esp-hosted.hash b/package/esp-hosted/esp-hosted.hash
index ea18c243d1..ac0164c38c 100644
--- a/package/esp-hosted/esp-hosted.hash
+++ b/package/esp-hosted/esp-hosted.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  78ab4f10ddce76749d36511591a0a7bb2a982db96ac1ea1b02b5c35dab725d8c  esp-hosted-91b093365cc58214532b976dd8749f65523d1e6d.tar.gz
+sha256  7fd95a9b47c203a8bd0fdcab21f15c9d4cf1cad936f0206a94da0d932dd42206  esp-hosted-927a34f99724bb744efaf865a7c75cc1615f59a2.tar.gz
 sha256  ed57d96d27be775b22f9571d3724ef84e0d0b8f24b805ec7f87a32189de19a9c  LICENSE
diff --git a/package/esp-hosted/esp-hosted.mk b/package/esp-hosted/esp-hosted.mk
index 4efefc3023..f4382e7fee 100644
--- a/package/esp-hosted/esp-hosted.mk
+++ b/package/esp-hosted/esp-hosted.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ESP_HOSTED_VERSION = 91b093365cc58214532b976dd8749f65523d1e6d
+ESP_HOSTED_VERSION = 927a34f99724bb744efaf865a7c75cc1615f59a2
 ESP_HOSTED_SITE = $(call github,espressif,esp-hosted,$(ESP_HOSTED_VERSION))
 ESP_HOSTED_DEPENDENCIES = linux
 ESP_HOSTED_LICENSE = GPL-2.0
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
