Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A5CC7EE25
	for <buildroot@archiver.kernel.org>; Wed,  7 Jun 2023 17:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D48CA408CF;
	Wed,  7 Jun 2023 17:17:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D48CA408CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qEuo1JcIYpPG; Wed,  7 Jun 2023 17:17:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11DE2409E3;
	Wed,  7 Jun 2023 17:17:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11DE2409E3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D38471BF3D5
 for <buildroot@lists.busybox.net>; Wed,  7 Jun 2023 17:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD506400FE
 for <buildroot@lists.busybox.net>; Wed,  7 Jun 2023 17:17:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD506400FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nEsIonVyQjeo for <buildroot@lists.busybox.net>;
 Wed,  7 Jun 2023 17:17:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 791C640283
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 791C640283
 for <buildroot@buildroot.org>; Wed,  7 Jun 2023 17:17:12 +0000 (UTC)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
 by mailout01.t-online.de (Postfix) with SMTP id AAD09631C
 for <buildroot@buildroot.org>; Wed,  7 Jun 2023 19:17:09 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd83.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q6wmT-3X8bSr0; Wed, 7 Jun 2023 19:17:09 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:43290)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q6wmS-0006qc-2T
 for buildroot@buildroot.org; Wed, 07 Jun 2023 19:17:08 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Wed,  7 Jun 2023 19:17:08 +0200
Message-Id: <20230607171708.595774-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686158229-95268480-1F07816D/0/0 CLEAN NORMAL
X-TOI-MSGID: 5a9193b3-3483-4baf-92b7-8505ae60c16e
Subject: [Buildroot] [PATCH 1/1] package/libdeflate: force arm mode instead
 of Thumb mode
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

Fix the following build failure:

/tmp/ccGKQdKj.s: Assembler messages:
/tmp/ccGKQdKj.s:199: Error: invalid constant (7) after fixup
/tmp/ccGKQdKj.s:327: Error: invalid constant (0) after fixup
/tmp/ccGKQdKj.s:338: Error: invalid constant (1) after fixup
/tmp/ccGKQdKj.s:345: Error: invalid constant (20) after fixup
/tmp/ccGKQdKj.s:354: Error: invalid constant (20) after fixup
/tmp/ccGKQdKj.s:372: Error: invalid constant (20) after fixup
/tmp/ccGKQdKj.s:528: Error: invalid constant (3f) after fixup
/tmp/ccGKQdKj.s:531: Error: invalid constant (3f) after fixup
/tmp/ccGKQdKj.s:202: Error: invalid constant (20000) after fixup
/tmp/ccGKQdKj.s:482: Error: invalid constant (20000) after fixup
/tmp/ccGKQdKj.s:549: Error: invalid constant (20000) after fixup

Fixes:
http://autobuild.buildroot.net/results/0103d64a4a6a9b0a708bfb77bf1714edc7acc714/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libdeflate/libdeflate.mk | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/libdeflate/libdeflate.mk b/package/libdeflate/libdeflate.mk
index 67e97c6e5e..c09a033325 100644
--- a/package/libdeflate/libdeflate.mk
+++ b/package/libdeflate/libdeflate.mk
@@ -9,8 +9,17 @@ LIBDEFLATE_SITE = $(call github,ebiggers,libdeflate,v$(LIBDEFLATE_VERSION))
 LIBDEFLATE_LICENSE = MIT
 LIBDEFLATE_LICENSE_FILES = COPYING
 LIBDEFLATE_INSTALL_STAGING = YES
+
+LIBDEFLATE_CFLAGS = -D_DEFAULT_SOURCE
+
+# Thumb build is broken, build in ARM mode, since all architectures
+# that support Thumb1 also support ARM.
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+LIBDEFLATE_CFLAGS += -marm
+endif
+
 LIBDEFLATE_CONF_OPTS = \
-	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -D_DEFAULT_SOURCE"
+	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) $(LIBDEFLATE_CFLAGS)"
 
 ifeq ($(BR2_SHARED_LIBS),y)
 LIBDEFLATE_CONF_OPTS += \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
