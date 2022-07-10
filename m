Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17DA5C43334
	for <buildroot@archiver.kernel.org>; Sun, 10 Jul 2022 07:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7083D40535;
	Sun, 10 Jul 2022 07:25:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7083D40535
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jWqEDwwUy2Uk; Sun, 10 Jul 2022 07:25:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6AAC240407;
	Sun, 10 Jul 2022 07:25:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AAC240407
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E332B1BF372
 for <buildroot@lists.busybox.net>; Sun, 10 Jul 2022 07:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 74C5284038
 for <buildroot@lists.busybox.net>; Sun, 10 Jul 2022 07:25:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74C5284038
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dXr8dy4QRDw1 for <buildroot@lists.busybox.net>;
 Sun, 10 Jul 2022 07:25:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A08AC84034
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A08AC84034
 for <buildroot@buildroot.org>; Sun, 10 Jul 2022 07:25:36 +0000 (UTC)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
 by mailout03.t-online.de (Postfix) with SMTP id 4C8A730CF;
 Sun, 10 Jul 2022 09:25:33 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.11.100]) by fwd72.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1oARJs-4el0AD0; Sun, 10 Jul 2022 09:25:32 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:48174)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1oARJs-0000XR-0A;
 Sun, 10 Jul 2022 09:25:32 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 10 Jul 2022 09:25:31 +0200
Message-Id: <20220710072531.303298-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220710072531.303298-1-bernd.kuhls@t-online.de>
References: <20220710072531.303298-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1657437932-01439E5E-73DF0BFE/0/0 CLEAN NORMAL
X-TOI-MSGID: 97568b59-e296-4a4d-80fa-10f504f262a3
Subject: [Buildroot] [PATCH 2/2] package/Config.in: move pipewire to 'Audio
 and video applications'
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The previous location 'Libraries / Graphics' does not fit the purpose
of this package, we display it next to Pulseaudio instead.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 1c7467acb5..6f991849e4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -47,6 +47,8 @@ menu "Audio and video applications"
 	source "package/omxplayer/Config.in"
 	source "package/on2-8170-libs/Config.in"
 	source "package/opus-tools/Config.in"
+	source "package/pipewire/Config.in"
+	source "package/pipewire-media-session/Config.in"
 	source "package/pulseaudio/Config.in"
 	source "package/sox/Config.in"
 	source "package/squeezelite/Config.in"
@@ -1567,8 +1569,6 @@ menu "Graphics"
 	source "package/openjpeg/Config.in"
 	source "package/pango/Config.in"
 	source "package/pangomm/Config.in"
-	source "package/pipewire/Config.in"
-	source "package/pipewire-media-session/Config.in"
 	source "package/pixman/Config.in"
 	source "package/poppler/Config.in"
 	source "package/powervr/Config.in"
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
