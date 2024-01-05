Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B8FC3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 18:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D71483D60;
	Fri,  5 Jan 2024 18:38:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D71483D60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BDECAcxqnLhg; Fri,  5 Jan 2024 18:38:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 741BB83C92;
	Fri,  5 Jan 2024 18:38:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 741BB83C92
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 366701BF389
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 18:38:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0DACC4015F
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 18:38:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DACC4015F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vgugAuMeUwAZ for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 18:38:46 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ED11D4369F
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 18:38:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED11D4369F
Received: from fli4l.lan.fli4l (p5b3a0630.dip0.t-ipconnect.de [91.58.6.48])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E9436A4C042B
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 19:38:28 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40472)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rLp5Q-000000006Kl-1xF4
 for buildroot@buildroot.org; Fri, 05 Jan 2024 19:38:28 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  5 Jan 2024 19:38:28 +0100
Message-Id: <20240105183828.11548-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240105183828.11548-1-bernd@kuhls.net>
References: <20240105183828.11548-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1704479908;
 bh=dCjkfVPtkMlVUozXt3XEkdTgDAOLdsveZQbBDuU6gFI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=MVnREmyl32vQMgyMRwk9/GMiLS9R6WrzgCQ+/v8IsoLygBqu87UAoQafpBvgz0EZ3
 EqaFCuWvYbU0QIphulem2RqZm/vZRmUTYydoJ/NK1jeuB44SG2x+1UbRCSVyxDUmeS
 K8ko+IaMidfGPw2+MEjif2Wmx7bE1mC1r1ZJur7GTPSQ+yIEbw1TijMkXO2o3h6QYJ
 /enaYYlpBkRXiDIkEqOQSfVNIoaxLd5kCwC488lBMpBZrVIM1XjhFeef2ApVsjHt9g
 do3x6Dr/B1feeehzk4v3IPrhrPDowP/Pe8d4ty5GUpKeO3BZJJUaqR5ttUwf9cZ5RJ
 xtjSO3M5HFWQA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=MVnREmyl
Subject: [Buildroot] [PATCH 2/2] package/kodi-pvr-waipu: bump version to
 20.11.0-Nexus
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
 package/kodi-pvr-waipu/kodi-pvr-waipu.hash | 2 +-
 package/kodi-pvr-waipu/kodi-pvr-waipu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
index a7092fa4b8..e0b4dc482c 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2326c3ed0e57ef8020c1041ea6f25fa325c619588c24c71b5963d8dda1c97604  kodi-pvr-waipu-20.10.2-Nexus.tar.gz
+sha256  f43a7ac762b2c8bb7c2a66dc7d2a577fad92119bb4418867ce22369b96b18f8c  kodi-pvr-waipu-20.11.0-Nexus.tar.gz
 sha256  4202d4fb329f58c83ba921b56d7071e37f7df3f15b3820a3a04ef8eee49f54d2  pvr.waipu/LICENSE.txt
diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
index 0da4620f8e..02614552f0 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_WAIPU_VERSION = 20.10.2-Nexus
+KODI_PVR_WAIPU_VERSION = 20.11.0-Nexus
 KODI_PVR_WAIPU_SITE = $(call github,flubshi,pvr.waipu,$(KODI_PVR_WAIPU_VERSION))
 KODI_PVR_WAIPU_LICENSE = GPL-2.0+
 KODI_PVR_WAIPU_LICENSE_FILES = pvr.waipu/LICENSE.txt
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
