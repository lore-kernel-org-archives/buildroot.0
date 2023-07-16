Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5672FEB64DA
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 07:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A890E409E0;
	Sun, 16 Jul 2023 07:54:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A890E409E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XcVCtyz9VKdW; Sun, 16 Jul 2023 07:54:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B138D409B0;
	Sun, 16 Jul 2023 07:54:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B138D409B0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1E3751BF2CC
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 07:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0545B40119
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 07:54:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0545B40119
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NW9HYt5r8Tly for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 07:54:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15DA2400DC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 15DA2400DC
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 07:54:41 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EAED4A4C0285;
 Sun, 16 Jul 2023 09:54:38 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50702)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qKwaU-0000JB-2L;
 Sun, 16 Jul 2023 09:54:38 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 09:54:38 +0200
Message-Id: <20230716075438.3026838-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689494078;
 bh=rB8JyOyx4zw92ezCJgY+Mkvd5aa/4NDj8MLo2cDJIIg=;
 h=From:To:Cc:Subject:Date:From;
 b=hNEe9QrumHKVoopjpcOT99CYDIZxfWIDgwqHjgebuhzi7RRVy+6a96NIHkVq+yjhF
 DmCqeyIqGYa3fA+CXvBO2Imnngo67evj5hrYTBnu7YQ/3Fm/RoLkNxsllXAQuHs0Pr
 f4rP/M6CXUIVLjsKnvgjji39fI0VuKeWLjYKo4wFBEqSNMFaswZlyLkU2j+CqsxsAt
 TFXC0LjshSY/FCMedrHEF0cVsgyjwGQ5vuoq6hWCE2JQUj0vYP15QKoPEvBXsD2Y58
 r/eTLUH54W+ap09V2IJl+rBhhpVBOJNazAvAdpFHF2QxE1oUMkmackTIouYruFOOvn
 DMM2/WTjq5QFw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=hNEe9Qru
Subject: [Buildroot] [PATCH 1/1] package/kodi: add optional dependency to
 clang
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
Cc: Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi/kodi.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 7cbc1df40a..54b7673150 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -93,6 +93,13 @@ KODI_CONF_OPTS += \
 	-DLIBDVDNAV_URL=$(KODI_DL_DIR)/kodi-libdvdnav-$(KODI_LIBDVDNAV_VERSION).tar.gz \
 	-DLIBDVDREAD_URL=$(KODI_DL_DIR)/kodi-libdvdread-$(KODI_LIBDVDREAD_VERSION).tar.gz
 
+ifeq ($(BR2_PACKAGE_CLANG),y)
+KODI_CONF_OPTS += -DCLANG_FORMAT_EXECUTABLE=$(HOST_DIR)/bin/clang-format
+KODI_DEPENDENCIES += clang
+else
+KODI_CONF_OPTS += -DCLANG_FORMAT_EXECUTABLE=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_KODI_RENDER_SYSTEM_GL),y)
 KODI_CONF_OPTS += -DAPP_RENDER_SYSTEM=gl
 KODI_DEPENDENCIES += libgl libglu
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
