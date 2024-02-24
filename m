Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5343C48BF6
	for <buildroot@archiver.kernel.org>; Sat, 24 Feb 2024 08:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B09F782347;
	Sat, 24 Feb 2024 08:03:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wxlq7EK_KCH1; Sat, 24 Feb 2024 08:03:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCB7282358
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCB7282358;
	Sat, 24 Feb 2024 08:03:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2FCC91BF2FF
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 08:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A2BF82347
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 08:03:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V7IvH7em-ATv for <buildroot@lists.busybox.net>;
 Sat, 24 Feb 2024 08:03:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2E2AE822D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E2AE822D8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E2AE822D8
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 08:03:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0164.dip0.t-ipconnect.de [91.58.1.100])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CE43FA4C2A4C
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 09:03:00 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56012)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rdmzs-000000005zs-14rg
 for buildroot@buildroot.org; Sat, 24 Feb 2024 09:03:00 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 24 Feb 2024 09:02:59 +0100
Message-Id: <20240224080300.23278-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240224080300.23278-1-bernd@kuhls.net>
References: <20240224080300.23278-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1708761780;
 bh=aMg1Y81Rc6v7nMkRzxoIwj+xCAQ9dmTvcr9dCC5Mjig=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=abFI1x0dSe+OIXkrm+T6UVMcU6I9Tga6ef/MNpAZxijsCccWjZDYLUSidblVBFU6o
 RjNFzvRyRvFnOi4m5CrBcPWAgc/WGJtrHum30+gV2F1So67iWtzRaakpqpO9A7sYXp
 FkErApuJ4Ujdl8YuX8kgFpK2tp8GP1qyHNROspxkWY2Xr5ucK879b3XisUnThabe0K
 us05oFHwUL3PJSSSyCMSI9meAoAecpA/9VuOPMPLwyL8GqrtO8KVNG9hJ6jrxYFi+t
 iJYd3BGrRJYpOgRgK9qwIURNFKuKYZ5A4L2P5a0m/4pFPgGJL8lgX0SCgsYSJn32XE
 ZlYNe5u3UStZg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=abFI1x0d
Subject: [Buildroot] [PATCH 2/3] package/kodi-pvr-mythtv: bump version to
 20.6.8-Nexus
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
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash | 2 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
index c61c391825..77c4274843 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  eb21e185d1333a8696565138bc58df3d37970c9a3615193396e9f296a56a24c4  kodi-pvr-mythtv-20.5.10-Nexus.tar.gz
+sha256  64358b8af46d44e98da4bc111eacc294e679abc96662a2c5f14728f097f31f86  kodi-pvr-mythtv-20.6.8-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
index 66f1948741..7598f064e8 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_MYTHTV_VERSION = 20.5.10-Nexus
+KODI_PVR_MYTHTV_VERSION = 20.6.8-Nexus
 KODI_PVR_MYTHTV_SITE = $(call github,janbar,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
 KODI_PVR_MYTHTV_LICENSE = GPL-2.0+
 KODI_PVR_MYTHTV_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
