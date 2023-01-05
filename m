Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7974C4708E
	for <buildroot@archiver.kernel.org>; Thu,  5 Jan 2023 19:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6673E606F9;
	Thu,  5 Jan 2023 19:18:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6673E606F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CAOsWzhDDNgi; Thu,  5 Jan 2023 19:18:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B471660608;
	Thu,  5 Jan 2023 19:18:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B471660608
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E7CDA1BF2C5
 for <buildroot@lists.busybox.net>; Thu,  5 Jan 2023 19:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8DA14007A
 for <buildroot@lists.busybox.net>; Thu,  5 Jan 2023 19:18:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8DA14007A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nhqXldTqqOf1 for <buildroot@lists.busybox.net>;
 Thu,  5 Jan 2023 19:18:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 947BE41A5A
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 947BE41A5A
 for <buildroot@buildroot.org>; Thu,  5 Jan 2023 19:18:17 +0000 (UTC)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
 by mailout08.t-online.de (Postfix) with SMTP id 6F549232F9;
 Thu,  5 Jan 2023 20:18:14 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.180.73]) by fwd80.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1pDVkk-4HW5tB0; Thu, 5 Jan 2023 20:18:14 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:39468)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pDVkj-0000id-2Q;
 Thu, 05 Jan 2023 20:18:13 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  5 Jan 2023 20:18:12 +0100
Message-Id: <20230105191813.3533745-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1672946294-C23211D1-9B6AB1E2/0/0 CLEAN NORMAL
X-TOI-MSGID: 3605d46f-831a-4120-8db9-9b0ef6f403c7
Subject: [Buildroot] [PATCH 1/2] package/freeswitch: ffmpeg's libavresample
 is an optional dependency
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See upstream commit from 2019:
https://github.com/signalwire/freeswitch/commit/e9c58084db249845af88011a1e3c5d7b9ec05a76#diff-2cd3a5516ad0fc3cba6d14d0ea3e72da43a2c2fc3c21eb7ade6c49d52136bbd2R43

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/freeswitch/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/freeswitch/Config.in b/package/freeswitch/Config.in
index bad101486c..1ab624c33c 100644
--- a/package/freeswitch/Config.in
+++ b/package/freeswitch/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_FREESWITCH
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # apr, included in freeswitch source
 	depends on BR2_USE_WCHAR # uses wchar_t
-	select BR2_PACKAGE_FFMPEG_AVRESAMPLE if BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_SWSCALE if BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_JPEG
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
