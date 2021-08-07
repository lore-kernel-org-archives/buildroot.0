Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C052C4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 10:21:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A92A610FF
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 10:21:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7A92A610FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 381B183981;
	Sat,  7 Aug 2021 10:21:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KwvmRPnGDmEZ; Sat,  7 Aug 2021 10:21:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85D06835F2;
	Sat,  7 Aug 2021 10:21:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F36F81BF2F6
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 10:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFF04401C6
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 10:21:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cZ7fu3BRR4Rz for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 10:21:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C3CFC4000B
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 10:21:19 +0000 (UTC)
Received: from fwd09.aul.t-online.de (fwd09.aul.t-online.de [172.20.27.151])
 by mailout07.t-online.de (Postfix) with SMTP id 3D93A18005
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 12:21:17 +0200 (CEST)
Received: from fli4l.lan.fli4l
 (SgDb2+ZFQh8r40Qv-SOwqxVYGSO4d0NqP36Dg+At6SFicd81PRk+YzdLTRQEPv6Qpw@[79.214.200.2])
 by fwd09.t-online.de with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mCJRy-2NgMW80; Sat, 7 Aug 2021 12:21:06 +0200
Received: from mahler.lan.fli4l ([192.168.1.1]:50960)
 by fli4l.lan.fli4l with esmtp (Exim 4.94.2)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mCJRy-0000Q3-1M
 for buildroot@buildroot.org; Sat, 07 Aug 2021 12:21:06 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat,  7 Aug 2021 12:21:06 +0200
Message-Id: <20210807102106.714972-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-ID: SgDb2+ZFQh8r40Qv-SOwqxVYGSO4d0NqP36Dg+At6SFicd81PRk+YzdLTRQEPv6Qpw
X-TOI-EXPURGATEID: 150726::1628331666-00002D5B-6670567A/0/0 CLEAN NORMAL
X-TOI-MSGID: 9ec9964b-696a-403b-9a61-8fd08351cbf8
Subject: [Buildroot] [PATCH 1/1] package/kodi: add comment that OpenGLES
 support also needs udev
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

For reference:
https://git.buildroot.net/buildroot/tree/package/kodi/Config.in#n26

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 074a457d1b..bbdef8aefe 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -49,7 +49,7 @@ config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_X11
 	select BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
 	select BR2_PACKAGE_XLIB_LIBXRANDR
 
-comment "kodi needs an OpenGL EGL backend with OpenGL or GLES support"
+comment "kodi needs an OpenGL EGL backend with OpenGL or GLES/udev support"
 	depends on !BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
 
 menuconfig BR2_PACKAGE_KODI
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
