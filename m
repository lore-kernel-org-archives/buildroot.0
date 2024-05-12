Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70531C25B75
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 18:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 428D2605FD;
	Sun, 12 May 2024 18:16:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k7N8N6zIs9UG; Sun, 12 May 2024 18:16:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59C02607CE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59C02607CE;
	Sun, 12 May 2024 18:16:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ACBB21BF2F3
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 18:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 991BD83A7D
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 18:16:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cy8ADa6dhmF6 for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 18:16:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E026B83A66
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E026B83A66
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E026B83A66
 for <buildroot@buildroot.org>; Sun, 12 May 2024 18:16:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c36b.dip0.t-ipconnect.de [79.214.195.107])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 93073A4C48C3
 for <buildroot@buildroot.org>; Sun, 12 May 2024 20:13:57 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48974)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1s6Dhs-000000005zr-3ecV
 for buildroot@buildroot.org; Sun, 12 May 2024 18:13:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 12 May 2024 20:13:49 +0200
Message-Id: <20240512181356.2106142-15-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240512181356.2106142-1-bernd@kuhls.net>
References: <20240512181356.2106142-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1715537637;
 bh=cU2oCVPQE5NKwbeem+TMhWmzfWSyW2OWX2UJ7iz1P28=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=gnUwmMagRMIt71X38Gpw3fgXLsUTgkM0W4WobEyDeBfNqqxjWAJ1On2CgLyAS/Mev
 cKLJDYuH/5ks1Bc4iswmMpI3zy79c9mpxfZdOCTjZkPU74W3LrlOP0KNbydWCa5WQN
 biLOAwBa/rGbicnKfwnjSg4/wlT75uevb4oZgFj19TLu0VFVMLBzvAWS4IiA3Sk+G3
 BYHTGsu0nLrp4WXeZhlkimapcfRsqZKMzOzV2DcPWy4gKJuVFXEotSErhANvXfNBnR
 JQJvHz7Ai17mE96ogvjTomcGHTBROa8lI2kbkps2CSrMpPiIqsFS6BxfstrpxfOIK6
 KYRAfjRSneBMw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=gnUwmMag
Subject: [Buildroot] [PATCH 15/22] package/kodi-pvr-plutotv: bump version to
 21.3.0-Omega
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash | 2 +-
 package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
index 199777c255..bb4826ba66 100644
--- a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
+++ b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4503cbed48aefa06470a970d7030d67cbdc7236cabd8de15df4a3681827b32e7  kodi-pvr-plutotv-21.1.0-Omega.tar.gz
+sha256  fb026664222af3415bb805c4b2c19d1893f9e05a7d089c2d720a495131d1460d  kodi-pvr-plutotv-21.3.0-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
index e2a3a01116..885ef03e0d 100644
--- a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
+++ b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_PLUTOTV_VERSION = 21.1.0-Omega
+KODI_PVR_PLUTOTV_VERSION = 21.3.0-Omega
 KODI_PVR_PLUTOTV_SITE = $(call github,kodi-pvr,pvr.plutotv,$(KODI_PVR_PLUTOTV_VERSION))
 KODI_PVR_PLUTOTV_LICENSE = GPL-2.0+
 KODI_PVR_PLUTOTV_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
