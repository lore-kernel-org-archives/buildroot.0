Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 729AEC433FE
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 20:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A6CB60E09;
	Tue,  1 Nov 2022 20:47:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A6CB60E09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wXS5_It8ifZx; Tue,  1 Nov 2022 20:47:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D888760C06;
	Tue,  1 Nov 2022 20:47:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D888760C06
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E96811BF834
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C4A4F40514
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:47:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4A4F40514
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QhKRQEziM45Z for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 20:47:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 033D740503
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 033D740503
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 20:47:35 +0000 (UTC)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
 by mailout09.t-online.de (Postfix) with SMTP id 063E91C4ED;
 Tue,  1 Nov 2022 21:47:33 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.183.139]) by fwd80.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1opyAW-1un7w10; Tue, 1 Nov 2022 21:47:32 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:55662)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1opyAW-0001z4-1l;
 Tue, 01 Nov 2022 21:47:32 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Tue,  1 Nov 2022 21:47:31 +0100
Message-Id: <20221101204732.2726292-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1667335652-C0B261D1-0F883F3E/0/0 CLEAN NORMAL
X-TOI-MSGID: a7fdddd2-bcbc-4931-bc85-1feebece2f65
Subject: [Buildroot] [PATCH 1/2] package/intel-mediadriver: add option to
 enable non-free features
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/intel-mediadriver/Config.in            | 5 +++++
 package/intel-mediadriver/intel-mediadriver.mk | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/package/intel-mediadriver/Config.in b/package/intel-mediadriver/Config.in
index ad56590008..79511a8808 100644
--- a/package/intel-mediadriver/Config.in
+++ b/package/intel-mediadriver/Config.in
@@ -20,6 +20,11 @@ config BR2_PACKAGE_INTEL_MEDIADRIVER
 
 if BR2_PACKAGE_INTEL_MEDIADRIVER
 
+config BR2_PACKAGE_INTEL_MEDIADRIVER_NONFREE
+	bool "support non-free features"
+	help
+	  Enable support for non-free features
+
 config BR2_PACKAGE_INTEL_MEDIADRIVER_GEN8
 	bool "Gen8 support"
 	default y
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index d1a9ca7789..821c0920f4 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -42,4 +42,12 @@ else
 INTEL_MEDIADRIVER_CONF_OPTS += -DGEN8=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_INTEL_MEDIADRIVER_NONFREE),y)
+INTEL_MEDIADRIVER_CONF_OPTS += \
+	-DBUILD_CMRTLIB=OFF \
+	-DENABLE_NONFREE_KERNELS=ON \
+	-DBUILD_KERNELS=ON \
+	-DBYPASS_MEDIA_ULT=yes
+endif
+
 $(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
