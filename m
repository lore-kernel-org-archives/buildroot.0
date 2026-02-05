Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99914E9129A
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 09:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 674528333F;
	Thu,  5 Feb 2026 09:27:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4SX25CteG65r; Thu,  5 Feb 2026 09:27:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67C66840E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770283654;
	bh=KT8aCc5EfJ+fF3jyODpJlii3H7vkowOZ4xYK2J4HqSk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LPUtXLefqC438kmKuBn/GtZ7pGBFZHPCitdWUsWJJJdZM7sgwna0LubEzbSGhOFmV
	 2Xir7m0AQzonpD0o8OrSdwxr688FpzoinM7WsSs5gLW4WEckM9Ly4/XR45K+f/NFfE
	 xD5ldZvsl4kwCilXiFNtcMEMTwXpjW53oxVDHRRxjDbPxnp8i45WmnRApFfT81FanR
	 LcX+9jrxmGnKAtrbISfW3WjLazjXVicgrHP655DELpzIReK78xCZeeBXwv61ibMeIo
	 YSryuckznI4vOotfS9DRhChVKdges357oKek2iwm/mX7emxAfcOOT7cErTNCrx0tr8
	 QsYt/oi8faFzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67C66840E1;
	Thu,  5 Feb 2026 09:27:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 482D4F5
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 09:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CCDC4074E
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 09:27:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V9i1t-lyvFIZ for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 09:27:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B0AC40088
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B0AC40088
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 09:27:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5ABDD869C7; Thu,  5 Feb 2026 09:27:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 5 Feb 2026 10:25:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b69fc85e6608afc2f62111e254416eaeb6fe0aab
X-Git-Newrev: 4a1061d28c418dacdfe57a13050503f59fc3e4f5
X-Patchwork-Hint: ignore
Message-Id: <20260205092731.5ABDD869C7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-pvr-waipu: bump version to
 21.12.6-Omega
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4a1061d28c418dacdfe57a13050503f59fc3e4f5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/flubshi/pvr.waipu/releases/tag/21.12.6-Omega

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi-pvr-waipu/kodi-pvr-waipu.hash | 2 +-
 package/kodi-pvr-waipu/kodi-pvr-waipu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
index d97f9ca7a9..96cfeb940b 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  28750b8513ca2df69d2d661a1d832689a1571b6793e98243eb29e3aed03c7f26  kodi-pvr-waipu-21.12.5-Omega.tar.gz
+sha256  80e4723a228b27447fe6e83c9e2aa4e9ebfc0d2a3618fbe0491b6d2440124b64  kodi-pvr-waipu-21.12.6-Omega.tar.gz
 sha256  4202d4fb329f58c83ba921b56d7071e37f7df3f15b3820a3a04ef8eee49f54d2  pvr.waipu/LICENSE.txt
diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
index 03525b295b..177c1236b1 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_WAIPU_VERSION = 21.12.5-Omega
+KODI_PVR_WAIPU_VERSION = 21.12.6-Omega
 KODI_PVR_WAIPU_SITE = $(call github,flubshi,pvr.waipu,$(KODI_PVR_WAIPU_VERSION))
 KODI_PVR_WAIPU_LICENSE = GPL-2.0+
 KODI_PVR_WAIPU_LICENSE_FILES = pvr.waipu/LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
