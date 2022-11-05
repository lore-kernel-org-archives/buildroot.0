Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB52C4332F
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 07:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7BA440216;
	Sat,  5 Nov 2022 07:44:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7BA440216
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wpnQOl8jkeUA; Sat,  5 Nov 2022 07:44:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64739400F2;
	Sat,  5 Nov 2022 07:44:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64739400F2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 86A2C1BF21A
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 07:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61E7D40117
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 07:44:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61E7D40117
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TImvPkGHKlx6 for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 07:44:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4ECA4000B
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E4ECA4000B
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 07:44:52 +0000 (UTC)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
 by mailout05.t-online.de (Postfix) with SMTP id 35C4F177B5
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 08:44:50 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.183.139]) by fwd89.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1orDrA-0HhB8j0; Sat, 5 Nov 2022 08:44:44 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:47236)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1orDrA-0001cX-0x
 for buildroot@buildroot.org; Sat, 05 Nov 2022 08:44:44 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat,  5 Nov 2022 08:44:44 +0100
Message-Id: <20221105074444.13360-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1667634284-FB45E742-D096C500/0/0 CLEAN NORMAL
X-TOI-MSGID: f8572c65-ac20-4c7c-a6a6-1e4ca03de7fc
Subject: [Buildroot] [PATCH 1/1] package/alsa-utils: update dependency for
 topology support
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

This is a follow-up patch for

https://git.busybox.net/buildroot/commit/?id=28497102e1788df3628bd3324a3304a03c7942d0

which created a new option for topology support in alsa-lib, this
dependency was not ported over to alsa-utils.

Fixes:
http://autobuild.buildroot.net/results/a9c9f5157365efe8271bf69dab0d5a5532b196ea/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/alsa-utils/Config.in | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/alsa-utils/Config.in b/package/alsa-utils/Config.in
index 555f06fd21..8f2a661e3a 100644
--- a/package/alsa-utils/Config.in
+++ b/package/alsa-utils/Config.in
@@ -45,10 +45,7 @@ config BR2_PACKAGE_ALSA_UTILS_ALSAUCM
 
 config BR2_PACKAGE_ALSA_UTILS_ALSATPLG
 	bool "alsatplg"
-	depends on !BR2_STATIC_LIBS # dlfcn.h
-
-comment "alsatplg needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
+	depends on BR2_PACKAGE_ALSA_LIB_TOPOLOGY
 
 config BR2_PACKAGE_ALSA_UTILS_AMIDI
 	bool "amidi"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
