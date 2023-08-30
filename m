Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C35C6FA8F
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 20:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25720417F9;
	Wed, 30 Aug 2023 20:48:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25720417F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HNq0gJzel6xT; Wed, 30 Aug 2023 20:48:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65A8C417FD;
	Wed, 30 Aug 2023 20:48:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65A8C417FD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6C1361BF40B
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 20:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 462F161257
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 20:48:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 462F161257
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aNSL7TPDrM7U for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 20:48:02 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3728E61015
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 20:48:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3728E61015
Received: from fli4l.lan.fli4l (p5b3a0af8.dip0.t-ipconnect.de [91.58.10.248])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A602FA4C02CE
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 22:47:59 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41068)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qbS6Z-00075M-1Q
 for buildroot@buildroot.org; Wed, 30 Aug 2023 22:47:59 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 22:47:59 +0200
Message-Id: <20230830204759.1186064-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1693428479;
 bh=X8nUcoFbnPCF3VL5PwzjXb9wP7jKWx4pSKYpKcaKH3k=;
 h=From:To:Subject:Date:From;
 b=BYXBI1fbnaq3DmbPlFSfrLRxfAZsWHcPAtNV8RF5eqk0d8eahhn7Biw2/nid5K6ts
 6sWiLhIK2r1onyT49AwhcXflpby8uyCAHWMLpEjh7Py2o3hZI4rwHkv+Xa2m5dMhDa
 /rsY4FXf1BuieSOaoj6BWGcLzd5vofBUXwdDm7BdX2Yr+u4BQWmvVn/Y45QONA1LcC
 WGuogxOXkwwN5CntwuDFb0YHaueGwgkki83iw2d/RLXBrJrR7gr7RfwP+Nba35fxCj
 eHtLwQzZ0YAEqS5Sxl5Z3bEA1ax3ZM95CRnjflwHMps5umQRd23iSku71qS//L1FXM
 FPKO4tfP6R9/Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=BYXBI1fb
Subject: [Buildroot] [PATCH/next 1/1] package/transmission: bump version to
 4.0.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/transmission/transmission/releases/tag/4.0.4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/transmission/transmission.hash | 2 +-
 package/transmission/transmission.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/transmission/transmission.hash b/package/transmission/transmission.hash
index e6775c47e7..74b3a654b5 100644
--- a/package/transmission/transmission.hash
+++ b/package/transmission/transmission.hash
@@ -1,4 +1,4 @@
 # From https://transmissionbt.com/download
-sha256  b6b01fd58e42bb14f7aba0253db932ced050fcd2bba5d9f8469d77ddd8ad545a  transmission-4.0.3.tar.xz
+sha256  15f7b4318fdfbffb19aa8d9a6b0fd89348e6ef1e86baa21a0806ffd1893bd5a6  transmission-4.0.4.tar.xz
 # Locally calculated
 sha256  f56732960a61ecf3b9637404eef1a39221d2006336a98792b7b65a79f155449c  COPYING
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index 26deeefa34..efb46c0feb 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRANSMISSION_VERSION = 4.0.3
+TRANSMISSION_VERSION = 4.0.4
 TRANSMISSION_SOURCE = transmission-$(TRANSMISSION_VERSION).tar.xz
 TRANSMISSION_SITE = https://github.com/transmission/transmission/releases/download/$(TRANSMISSION_VERSION)
 TRANSMISSION_DEPENDENCIES = \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
