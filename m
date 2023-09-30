Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F202EE748E5
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 20:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A485E60FDF;
	Sat, 30 Sep 2023 20:16:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A485E60FDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K5Q0ASVif1ro; Sat, 30 Sep 2023 20:16:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D500D60FEE;
	Sat, 30 Sep 2023 20:16:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D500D60FEE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EFC2D1BF3B0
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 20:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C8BB481EEC
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 20:16:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8BB481EEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wZrv155kQZIX for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 20:16:05 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A9E381EFE
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 20:16:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A9E381EFE
Received: from fli4l.lan.fli4l (p4fd6c587.dip0.t-ipconnect.de [79.214.197.135])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 15460A4C0FDB
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 22:16:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39716)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qmgNd-0004xo-28
 for buildroot@buildroot.org; Sat, 30 Sep 2023 22:16:01 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 22:16:01 +0200
Message-Id: <20230930201601.700941-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1696104962;
 bh=4hmyy7KQCRGwFf1QXmZf0zdM/ymzE5GOr2XliyykPcQ=;
 h=From:To:Subject:Date:From;
 b=lQCilqoTUgF3jJkGrtD356gYQso1+xpx3D5ybvNvGmPpzG6zgSvm5MNYS7nYX97w+
 /HP+qt5uYmUSe2f2bADN6NqqfocZ/SIsuL+EdVDkKZsmhpMH8XueVZrCFoPv8IIZQF
 M5tfKnPVHk3blnQLTe9CLEFRs5KJDb0go94rZIu67wtgFyiyJ+q6T49hwyEzzmaz8T
 c/CGsAVs4QalwzWuDNpUUSRhBxAEc4ZRcF1LmckPPPfxqAEcWvDROMZJ6wBj2YiJ5P
 gch8kFJ2Oi0oE0JTRGMKXhMZi8Vwko4KVZLD/4x+NhH58cKonfk4oJkeU1WA2LocQT
 lEldFF88dHswQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=lQCilqoT
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-waipu: bump version to
 20.10.0-Nexus
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
index 889840828b..d025beaa3b 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9395770ba48a57a89f32182a713e2a8441f234da093c10e92d6bbbe75a51e919  kodi-pvr-waipu-20.9.1-Nexus.tar.gz
+sha256  740f96e68c6c33cba18e482f90ff377e412f1bc2bb09313d342f783794da792f  kodi-pvr-waipu-20.10.0-Nexus.tar.gz
 sha256  4202d4fb329f58c83ba921b56d7071e37f7df3f15b3820a3a04ef8eee49f54d2  pvr.waipu/LICENSE.txt
diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
index ee109fb682..53e3f716d7 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_WAIPU_VERSION = 20.9.1-Nexus
+KODI_PVR_WAIPU_VERSION = 20.10.0-Nexus
 KODI_PVR_WAIPU_SITE = $(call github,flubshi,pvr.waipu,$(KODI_PVR_WAIPU_VERSION))
 KODI_PVR_WAIPU_LICENSE = GPL-2.0+
 KODI_PVR_WAIPU_LICENSE_FILES = pvr.waipu/LICENSE.txt
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
