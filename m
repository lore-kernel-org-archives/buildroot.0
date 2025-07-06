Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 426E2C83F05
	for <buildroot@archiver.kernel.org>; Sun,  6 Jul 2025 10:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E81A76062D;
	Sun,  6 Jul 2025 10:07:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zsMt_unjWGrX; Sun,  6 Jul 2025 10:07:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E24360756
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E24360756;
	Sun,  6 Jul 2025 10:07:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2607819C
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 10:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 181FE80A47
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 10:07:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zp-ca0fh_vS6 for <buildroot@buildroot.org>;
 Sun,  6 Jul 2025 10:07:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0D3BF8098B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D3BF8098B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D3BF8098B
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 10:07:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c4c9.dip0.t-ipconnect.de [79.214.196.201])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 668A7A4C38D3
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 12:07:32 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53886)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uYMHU-000000006w8-0dBF
 for buildroot@buildroot.org; Sun, 06 Jul 2025 10:07:31 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  6 Jul 2025 12:07:31 +0200
Message-Id: <20250706100731.799929-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250706100731.799929-1-bernd@kuhls.net>
References: <20250706100731.799929-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1751796452;
 bh=t0gN04QxbwwW5TWf/4ZdCt1watDm+Ra2TLbw67W1q6w=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=buIghIiT6U2LMmCkd04hs+1FWqmKCFLjiMTwn1KRuenuJ32BCYhJSvy510WGODZ4D
 3ekGB7mMXA+IyJtfMMLs0Yd2XkbNyN8rb1e/G6lFRD+2/v4qNwAFg+hEVB/SlQ9BmG
 frYlURW9c838rVSLIb6PZ0/fJvOuDawye89icf6FaSzCW6xvq2IVk/W1yIvAuIlwES
 r3G8B3zrW+BuYQFnUHKkgNhIgh+idS5tjBpNk7UkKk0pEClsutdmQQFopslH9HiUEm
 f400vU9L0ZMOhEMYlDRLf1WZQaLpFd+oRpstMKPpZMAJIJl1MdJpsy1/hHXs8Oyxz3
 q7ubgRVFJd7aw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=buIghIiT
Subject: [Buildroot] [PATCH 2/2] package/kodi-pvr-waipu: bump version to
 21.12.2-Omega
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-waipu/kodi-pvr-waipu.hash | 2 +-
 package/kodi-pvr-waipu/kodi-pvr-waipu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
index 06dc097faf..0cb98553cd 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  79a9b67719241ee8e1faf0ace894d03ace062518e460c63fabb67ef7ea7c0d8d  kodi-pvr-waipu-21.12.1-Omega.tar.gz
+sha256  394100cd8161d610b45ed8c6bccdc4fe72f2fecff1548339e75c846d38e0d969  kodi-pvr-waipu-21.12.2-Omega.tar.gz
 sha256  4202d4fb329f58c83ba921b56d7071e37f7df3f15b3820a3a04ef8eee49f54d2  pvr.waipu/LICENSE.txt
diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
index f0bf14e5cc..b2d2707c10 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_WAIPU_VERSION = 21.12.1-Omega
+KODI_PVR_WAIPU_VERSION = 21.12.2-Omega
 KODI_PVR_WAIPU_SITE = $(call github,flubshi,pvr.waipu,$(KODI_PVR_WAIPU_VERSION))
 KODI_PVR_WAIPU_LICENSE = GPL-2.0+
 KODI_PVR_WAIPU_LICENSE_FILES = pvr.waipu/LICENSE.txt
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
