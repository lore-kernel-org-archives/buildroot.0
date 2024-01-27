Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77893C46CD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Jan 2024 18:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2377583DC3;
	Sat, 27 Jan 2024 18:05:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2377583DC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cq9rYO9aMIio; Sat, 27 Jan 2024 18:05:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60A6183DC6;
	Sat, 27 Jan 2024 18:05:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60A6183DC6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E1CD81BF388
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 18:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4C7883DC6
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 18:05:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4C7883DC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nc3H6RbkZ1k0 for <buildroot@lists.busybox.net>;
 Sat, 27 Jan 2024 18:05:39 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C4C2483DC3
 for <buildroot@buildroot.org>; Sat, 27 Jan 2024 18:05:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4C2483DC3
Received: from fli4l.lan.fli4l (p5b3a0164.dip0.t-ipconnect.de [91.58.1.100])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C1DE5A4C06CF
 for <buildroot@buildroot.org>; Sat, 27 Jan 2024 19:05:34 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40420)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rTn3e-0000000020E-0xFc
 for buildroot@buildroot.org; Sat, 27 Jan 2024 19:05:34 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 27 Jan 2024 19:05:34 +0100
Message-Id: <20240127180534.7078-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1706378734;
 bh=JvDUwGPMfikqzVW+QcSCG5hPS0yxRl2UbzAiEBw058A=;
 h=From:To:Subject:Date:From;
 b=Fb6QUUZQcBTJg3GORCK0Ky4h3gh+YEMtIoN5Ep/OQungPVLv0A2CcDXuuIYmxDdza
 NNvO8cpGTpBzajyvmqQWLh+1zmE73fwd2P7MyrauJcoHgdXcHKZCbKwMhS0d5m4OqG
 OZ/vtfb6D/u/hdSuF3uuLDPAu0FGB0+cJafXQebnnHcSdDyDLTd7PJ6EUZs5wSooS8
 lTAqjaf+vn++VHdE8aAciO+tzfR/xQyNQK299qYEGNFS0VVTmYQV2Ayr55mORgFTtv
 vpuhJWrRcP0QYga9WPxaA/G69HEsPyRFMrW5UFNhRmu53cB5toG9CZPbYCZForSAug
 YAtzyJlFCdz3Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=Fb6QUUZQ
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-mythtv: bump version to
 20.5.10-Nexus
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
index 3aad45f4f6..c61c391825 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c3eefdb9e12c4ca517709378bfe0b985b808d3dbd2ce75f234c78a88c3a1e411  kodi-pvr-mythtv-20.5.8-Nexus.tar.gz
+sha256  eb21e185d1333a8696565138bc58df3d37970c9a3615193396e9f296a56a24c4  kodi-pvr-mythtv-20.5.10-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
index bba881755d..66f1948741 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_MYTHTV_VERSION = 20.5.8-Nexus
+KODI_PVR_MYTHTV_VERSION = 20.5.10-Nexus
 KODI_PVR_MYTHTV_SITE = $(call github,janbar,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
 KODI_PVR_MYTHTV_LICENSE = GPL-2.0+
 KODI_PVR_MYTHTV_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
