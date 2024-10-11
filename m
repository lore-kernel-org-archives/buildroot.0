Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9CBD0EE34
	for <buildroot@archiver.kernel.org>; Fri, 11 Oct 2024 20:14:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64DE360AA7;
	Fri, 11 Oct 2024 20:14:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BSNJ8_NpECFP; Fri, 11 Oct 2024 20:14:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67F2B60AAD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67F2B60AAD;
	Fri, 11 Oct 2024 20:14:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 624D31BF354
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 20:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 515A160AAD
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 20:14:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GmnhEsGijh5M for <buildroot@lists.busybox.net>;
 Fri, 11 Oct 2024 20:14:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E3CE160AA7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3CE160AA7
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E3CE160AA7
 for <buildroot@buildroot.org>; Fri, 11 Oct 2024 20:14:51 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 6C4CCB0053E;
 Fri, 11 Oct 2024 22:14:47 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 11 Oct 2024 22:14:36 +0200
Message-ID: <20241011201436.535326-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1728677688;
 bh=HpGjYlKEbMHqWLomAFstZz5NuN5T1ddpYScvjePQhOQ=;
 h=From:To:Cc:Subject:Date:From;
 b=QqsgToWTYQEK3oRxjxuGxUXkd6PBV6LMxBAKBlUMcdEab3AlgZ/VEXuST58xWrVdq
 Y6QGSIJzP7SBfbtwpwRwRIEHcS4pWzM2qFHaSMfPaGlepylx9snoaiOARUMPI8hNXB
 9PR0qL5MZPN1NBRMD5azep4e1FFC9epWdrLtkkBrje6pFbzT7OY//sGW1UZ+TUjk66
 rxPBu+gVJjMyJGMfBj2VwcouXZk1GjxvUtm4YoUPou6/elJs2Jaf6DcdRFgwe93hdP
 yU6zktP/yP/BMGDc2x9IUUKDAM8qg5GaUi/O6R8uejrx8n+sJwf2ZwqjZS43X7ksdO
 xP5pcilFfozow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=QqsgToWT
Subject: [Buildroot] [PATCH 1/1] package/opencsd: bump to version 1.5.4
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log, see:
https://github.com/Linaro/OpenCSD/blob/v1.5.4/README.md?plain=1#L336

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/opencsd/opencsd.hash | 2 +-
 package/opencsd/opencsd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/opencsd/opencsd.hash b/package/opencsd/opencsd.hash
index 9800d21377..1cedb3c2f3 100644
--- a/package/opencsd/opencsd.hash
+++ b/package/opencsd/opencsd.hash
@@ -1,3 +1,3 @@
 # Locally Computed:
-sha256  86ee4248f26d768f60f4f4a09f62acaf63989a6448fe1f65a1539478123d95df  opencsd-1.5.3.tar.gz
+sha256  de4752f148e823c64aaf64f8db9691dea83577ae980a7a2bb80dad33985970c8  opencsd-1.5.4.tar.gz
 sha256  980eef4b0744e63834e3ec0d50c2a4ff6d81d7ec62dd8ba8c66acae0ec5a2e88  LICENSE
diff --git a/package/opencsd/opencsd.mk b/package/opencsd/opencsd.mk
index 42712133a3..83af20ade8 100644
--- a/package/opencsd/opencsd.mk
+++ b/package/opencsd/opencsd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENCSD_VERSION = 1.5.3
+OPENCSD_VERSION = 1.5.4
 OPENCSD_SITE = $(call github,Linaro,OpenCSD,v$(OPENCSD_VERSION))
 OPENCSD_LICENSE = BSD-3-Clause
 OPENCSD_LICENSE_FILES = LICENSE
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
