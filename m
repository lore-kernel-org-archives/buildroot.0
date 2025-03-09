Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E3BC282D1
	for <buildroot@archiver.kernel.org>; Sun,  9 Mar 2025 10:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCB1D605EE;
	Sun,  9 Mar 2025 10:12:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dBBIaVEX7Ce2; Sun,  9 Mar 2025 10:12:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1A5460632
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1A5460632;
	Sun,  9 Mar 2025 10:12:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CD4C91E3
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 10:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B852A400E5
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 10:12:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mdiClk7mw7Wl for <buildroot@buildroot.org>;
 Sun,  9 Mar 2025 10:12:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 59B56400AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59B56400AC
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 59B56400AC
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 10:12:17 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id B973BB00585;
 Sun,  9 Mar 2025 11:12:11 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Bogdan Radulescu <bogdan@nimblex.net>,
	Julien Olivain <ju.o@free.fr>
Date: Sun,  9 Mar 2025 11:12:07 +0100
Message-ID: <20250309101207.86496-1-ju.o@free.fr>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741515134;
 bh=y38iV0xh6NmFQVNilRcaJLokAjWARc8AnAMmc9zBvbY=;
 h=From:To:Cc:Subject:Date:From;
 b=hF1qaYSEqBT9bXEDsSiH5OGi/879xyI3zgX3WH/x9iccDhiBTAUHR1nAB5ZinJr04
 qUY32tgGbgENfqsfetGzVjyCzF6D8DElIGLhtopxFhkg8IqhaxzzsqAr6wi7EGYm0V
 EUsbqEcKYgTbn6kYuopZk0kH0oxAgFudEVNKY5xof/fqUDu61umVNf88XlDzcV1d0G
 bQKlXMEe/9rRvhUD+KxQvLMGJzFAIrEbK6Ga7qjdxboi6xnq12Bpm+AhrZZXsd/Jqx
 KlKCwfVImG61QUPOzYbo2b3BQFxB1UA438mpjN+8d+sJbQSCTEtjKxkY+xsilxwMfO
 M1B1qpnGjIQeg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hF1qaYSE
Subject: [Buildroot] [PATCH next 1/1] package/ncdu: bump to version 1.22
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

For change log since 1.21, see:
https://dev.yorhel.nl/ncdu/changes

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/9354120019
---
 package/ncdu/ncdu.hash | 8 ++++----
 package/ncdu/ncdu.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/ncdu/ncdu.hash b/package/ncdu/ncdu.hash
index 40faf9bd0d..623b7d060b 100644
--- a/package/ncdu/ncdu.hash
+++ b/package/ncdu/ncdu.hash
@@ -1,10 +1,10 @@
 # From https://dev.yorhel.nl/ncdu
 # After checking pgp signature from:
-# https://dev.yorhel.nl/download/ncdu-1.21.tar.gz.asc
+# https://dev.yorhel.nl/download/ncdu-1.22.tar.gz.asc
 # With key 74460D32B80810EBA9AFA2E962394C698C2739FA
-md5  3d5f399a00ca2ac3ba319e8cb99118ab  ncdu-1.21.tar.gz
-sha1  98c365e681f2c42a54d6277bea041d5a7104d934  ncdu-1.21.tar.gz
-sha256  a894d3a9b46bce578a6039bef48f54533ec402fb589b0769bfbb1d1edf9601a6  ncdu-1.21.tar.gz
+md5  46245039bd07a40d7594a2053139e43f  ncdu-1.22.tar.gz
+sha1  6c686e7cc08b20562e46c6bfb306c1e15cbf01aa  ncdu-1.22.tar.gz
+sha256  0ad6c096dc04d5120581104760c01b8f4e97d4191d6c9ef79654fa3c691a176b  ncdu-1.22.tar.gz
 
 # computed locally
 sha256  a324e25fe6af7fa45286b34a516b4c5a11544344bc80efb74fc51033b2e76df4  COPYING
diff --git a/package/ncdu/ncdu.mk b/package/ncdu/ncdu.mk
index c8c691605a..6da9966481 100644
--- a/package/ncdu/ncdu.mk
+++ b/package/ncdu/ncdu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NCDU_VERSION = 1.21
+NCDU_VERSION = 1.22
 NCDU_SITE = https://dev.yorhel.nl/download
 
 NCDU_DEPENDENCIES = host-pkgconf ncurses
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
