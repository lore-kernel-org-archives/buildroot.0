Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97CEC00140
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 11:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C39C61059;
	Sun, 31 Jul 2022 11:32:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C39C61059
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qLxQtANLiMVO; Sun, 31 Jul 2022 11:32:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D82460EC2;
	Sun, 31 Jul 2022 11:32:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D82460EC2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B1B681BF589
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 11:32:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8AF32828F2
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 11:32:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AF32828F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PIZvcBl_Qs11 for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 11:32:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CB3A828DA
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6CB3A828DA
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 11:32:54 +0000 (UTC)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
 by mailout12.t-online.de (Postfix) with SMTP id 54F8CF6C7;
 Sun, 31 Jul 2022 13:32:52 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.192.98]) by fwd88.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1oI7Bi-0YobvF0; Sun, 31 Jul 2022 13:32:50 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:46658)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1oI7Bh-0004ec-2r;
 Sun, 31 Jul 2022 13:32:49 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 31 Jul 2022 13:32:49 +0200
Message-Id: <20220731113249.93158-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1659267170-0144075D-108AFDB0/0/0 CLEAN NORMAL
X-TOI-MSGID: 3577f35e-6eb2-4c59-9c58-df78bd9dbfe8
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: ignore CVE-2021-38291
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixed in version 4.4.1 by
http://git.videolan.org/?p=ffmpeg.git;a=blob;f=Changelog;h=1845c0c85c56d300b6b2ffea43d4adc610caa2f5;hb=refs/heads/release/4.4#l160
http://git.videolan.org/?p=ffmpeg.git;a=commit;h=07dec5b0c383ebd6053bdf0a022dfe4aa01b9b70

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/ffmpeg.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 82d229903f..d43274c4a7 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -17,6 +17,8 @@ FFMPEG_LICENSE_FILES += COPYING.GPLv2
 endif
 
 FFMPEG_CPE_ID_VENDOR = ffmpeg
+# fixed in version 4.4.1
+FFMPEG_IGNORE_CVES += CVE-2021-38291
 
 FFMPEG_CONF_OPTS = \
 	--prefix=/usr \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
