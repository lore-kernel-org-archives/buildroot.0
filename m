Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2473C433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 22:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F3B560B69;
	Tue, 28 Dec 2021 22:03:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9pk3uotRcCoq; Tue, 28 Dec 2021 22:03:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 062E660B5B;
	Tue, 28 Dec 2021 22:03:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0CF4F1BF39D
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 22:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA7D4405AE
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 22:03:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N1i3nzTRRZBc for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 22:03:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9E97D400BA
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 22:03:11 +0000 (UTC)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
 by mailout10.t-online.de (Postfix) with SMTP id 678AB15AAA;
 Tue, 28 Dec 2021 23:03:08 +0100 (CET)
Received: from fli4l.lan.fli4l ([91.58.0.156]) by fwd82.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1n2KYg-0Qh7NB0; Tue, 28 Dec 2021 23:03:02 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35604)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1n2KYg-00059G-Bc;
 Tue, 28 Dec 2021 23:03:02 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Tue, 28 Dec 2021 23:03:02 +0100
Message-Id: <20211228220302.2886460-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1640728982-0000B8A1-1FB721D5/0/0 CLEAN NORMAL
X-TOI-MSGID: 8e456ac5-6235-457e-aa05-35f7f0df786b
Subject: [Buildroot] [PATCH 1/1] package/vlc: needs host-gettext
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
Cc: Simon Dawson <spdawson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Build fails on systems without /usr/bin/msgfmt

Fixes:
http://autobuild.buildroot.net/results/3c9/3c9893dd92d784a0520a287c4d4a5e760393c95f/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vlc/vlc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 06fc650f6f..fe338fcbe8 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -11,7 +11,7 @@ VLC_LICENSE = GPL-2.0+, LGPL-2.1+
 VLC_LICENSE_FILES = COPYING COPYING.LIB
 VLC_CPE_ID_VENDOR = videolan
 VLC_CPE_ID_PRODUCT = vlc_media_player
-VLC_DEPENDENCIES = host-pkgconf
+VLC_DEPENDENCIES = host-gettext host-pkgconf
 VLC_AUTORECONF = YES
 
 # Install vlc libraries in staging.
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
