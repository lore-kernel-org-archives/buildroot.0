Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89EF0C433EF
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 18:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0365582F03;
	Thu, 12 May 2022 18:27:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Q1GvyVINF85; Thu, 12 May 2022 18:27:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E2F882ECF;
	Thu, 12 May 2022 18:27:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 822991BF9CB
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 18:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 700C540133
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 18:27:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VmckVmr56jog for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 18:27:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8971C400FB
 for <buildroot@buildroot.org>; Thu, 12 May 2022 18:27:24 +0000 (UTC)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
 by mailout03.t-online.de (Postfix) with SMTP id C5654727C
 for <buildroot@buildroot.org>; Thu, 12 May 2022 20:27:20 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.203.41]) by fwd84.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1npDWy-2L167l0; Thu, 12 May 2022 20:27:20 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:48508)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1npDWy-000075-5d
 for buildroot@buildroot.org; Thu, 12 May 2022 20:27:20 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 20:27:20 +0200
Message-Id: <20220512182720.757182-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1652380040-00009E39-B4EC3437/0/0 CLEAN NORMAL
X-TOI-MSGID: a5ef355b-a300-43a9-8342-a4832e0e021e
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libXfont2: remove
 autoreconf
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

Forgotten in commit e6f8c403fe6c9909d2d3f5fd897c3057b7677192 which
removed 0001-configure-define-HAVE_LIBBSD-when-libbsd-was-found.patch

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libXfont2/xlib_libXfont2.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
index 6a71761f4e..fb0bba879c 100644
--- a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
+++ b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
@@ -12,8 +12,6 @@ XLIB_LIBXFONT2_LICENSE_FILES = COPYING
 XLIB_LIBXFONT2_CPE_ID_VENDOR = x
 XLIB_LIBXFONT2_CPE_ID_PRODUCT = libxfont
 XLIB_LIBXFONT2_INSTALL_STAGING = YES
-# 0001-configure-define-HAVE_LIBBSD-when-libbsd-was-found.patch
-XLIB_LIBXFONT2_AUTORECONF = YES
 XLIB_LIBXFONT2_DEPENDENCIES = \
 	freetype \
 	xlib_libfontenc \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
