Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9476BC4332F
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 20:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 410FA410A4;
	Tue,  1 Nov 2022 20:47:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 410FA410A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4BKcPsk0Uxr7; Tue,  1 Nov 2022 20:47:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EB17409BE;
	Tue,  1 Nov 2022 20:47:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EB17409BE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 74A821BF834
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:47:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5051E60C06
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:47:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5051E60C06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZTyBUG3DFSPU for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 20:47:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 030AD60758
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 030AD60758
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 20:47:35 +0000 (UTC)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
 by mailout11.t-online.de (Postfix) with SMTP id 4958215DE4;
 Tue,  1 Nov 2022 21:47:33 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.183.139]) by fwd80.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1opyAW-1v4j450; Tue, 1 Nov 2022 21:47:33 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:55662)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1opyAW-0001z4-1v;
 Tue, 01 Nov 2022 21:47:32 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Tue,  1 Nov 2022 21:47:32 +0100
Message-Id: <20221101204732.2726292-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221101204732.2726292-1-bernd.kuhls@t-online.de>
References: <20221101204732.2726292-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1667335653-C0B261D1-1AB01A52/0/0 CLEAN NORMAL
X-TOI-MSGID: 9e90290e-6d25-439f-8b23-79043a08c4c5
Subject: [Buildroot] [PATCH v2 2/2] package/intel-mediadriver: add more
 options to disable Gen9/11/12 support
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

Gen10 was disabled by default upstream as it was never shipped:
https://github.com/intel/media-driver/commit/0ad37351305be5c5e7c622833f9d7093fb2639cc

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: resent as part of a patch series (Thomas)

 package/intel-mediadriver/Config.in            | 18 ++++++++++++++++++
 package/intel-mediadriver/intel-mediadriver.mk | 18 ++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/package/intel-mediadriver/Config.in b/package/intel-mediadriver/Config.in
index 79511a8808..880d8d3245 100644
--- a/package/intel-mediadriver/Config.in
+++ b/package/intel-mediadriver/Config.in
@@ -31,6 +31,24 @@ config BR2_PACKAGE_INTEL_MEDIADRIVER_GEN8
 	help
 	  Enable support for Gen8 GPUs (Coffee Lake)
 
+config BR2_PACKAGE_INTEL_MEDIADRIVER_GEN9
+	bool "Gen9 support"
+	default y
+	help
+	  Enable support for Gen9 GPUs
+
+config BR2_PACKAGE_INTEL_MEDIADRIVER_GEN11
+	bool "Gen11 support"
+	default y
+	help
+	  Enable support for Gen11 GPUs
+
+config BR2_PACKAGE_INTEL_MEDIADRIVER_GEN12
+	bool "Gen12 support"
+	default y
+	help
+	  Enable support for Gen12 GPUs
+
 endif # BR2_PACKAGE_INTEL_MEDIADRIVER
 
 comment "intel-mediadriver needs a toolchain w/ dynamic library, C++, NPTL"
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 821c0920f4..17217a8644 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -42,6 +42,24 @@ else
 INTEL_MEDIADRIVER_CONF_OPTS += -DGEN8=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_INTEL_MEDIADRIVER_GEN9),y)
+INTEL_MEDIADRIVER_CONF_OPTS += -DGEN9=ON
+else
+INTEL_MEDIADRIVER_CONF_OPTS += -DGEN9=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_INTEL_MEDIADRIVER_GEN11),y)
+INTEL_MEDIADRIVER_CONF_OPTS += -DGEN11=ON
+else
+INTEL_MEDIADRIVER_CONF_OPTS += -DGEN11=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_INTEL_MEDIADRIVER_GEN12),y)
+INTEL_MEDIADRIVER_CONF_OPTS += -DGEN12=ON
+else
+INTEL_MEDIADRIVER_CONF_OPTS += -DGEN12=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_INTEL_MEDIADRIVER_NONFREE),y)
 INTEL_MEDIADRIVER_CONF_OPTS += \
 	-DBUILD_CMRTLIB=OFF \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
