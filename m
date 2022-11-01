Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 744B2C433FE
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 07:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF7A360BB2;
	Tue,  1 Nov 2022 07:22:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF7A360BB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N-XfLSnub_CK; Tue,  1 Nov 2022 07:22:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 145FC60B49;
	Tue,  1 Nov 2022 07:22:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 145FC60B49
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 12F0C1BF2BE
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 07:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF4C360B49
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 07:21:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF4C360B49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mqz93yxYa2JZ for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 07:21:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D89460881
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D89460881
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 07:21:58 +0000 (UTC)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
 by mailout02.t-online.de (Postfix) with SMTP id 9082726BF
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 08:21:55 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.197.145]) by fwd72.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1oplat-3AUonB0; Tue, 1 Nov 2022 08:21:55 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:41578)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1oplat-0008LV-0R
 for buildroot@buildroot.org; Tue, 01 Nov 2022 08:21:55 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Tue,  1 Nov 2022 08:21:55 +0100
Message-Id: <20221101072155.364312-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1667287315-01449CE0-635E65F1/0/0 CLEAN NORMAL
X-TOI-MSGID: e3c2f023-60d3-43ed-ba73-11a5eb19464a
Subject: [Buildroot] [PATCH 1/1] package/imagemagick: utilities need c++
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

See upstream commit:
https://github.com/ImageMagick/ImageMagick/commit/07f3b487f9860fd4eb9422f1a906d0fe83b6fd1c

Fixes:
http://autobuild.buildroot.net/results/29f/29ff3e568ddf40105aec1eded042388df138b7f9/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/imagemagick/imagemagick.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 6bdf24c1e8..e40ef56347 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -44,6 +44,10 @@ IMAGEMAGICK_CONF_OPTS = \
 	--without-x \
 	--with-gs-font-dir=/usr/share/fonts/gs
 
+ifeq ($(BR2_INSTALL_LIBSTDCPP),)
+IMAGEMAGICK_CONF_OPTS += --with-utilities=no
+endif
+
 IMAGEMAGICK_DEPENDENCIES = host-pkgconf
 
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
