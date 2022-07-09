Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7954AC433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Jul 2022 07:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE2C74019E;
	Sat,  9 Jul 2022 07:07:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE2C74019E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MIsKa_0FsmI3; Sat,  9 Jul 2022 07:07:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C745040186;
	Sat,  9 Jul 2022 07:07:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C745040186
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 28D371BF5AA
 for <buildroot@lists.busybox.net>; Sat,  9 Jul 2022 07:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03902817A6
 for <buildroot@lists.busybox.net>; Sat,  9 Jul 2022 07:07:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03902817A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 11QUs5Y9keeB for <buildroot@lists.busybox.net>;
 Sat,  9 Jul 2022 07:07:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B047C8151E
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B047C8151E
 for <buildroot@buildroot.org>; Sat,  9 Jul 2022 07:07:13 +0000 (UTC)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
 by mailout05.t-online.de (Postfix) with SMTP id ADF2D1A24D;
 Sat,  9 Jul 2022 09:07:09 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.9.36]) by fwd88.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1oA4YX-1Ihqy10; Sat, 9 Jul 2022 09:07:09 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:33122)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1oA4YW-0004kL-KR;
 Sat, 09 Jul 2022 09:07:08 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat,  9 Jul 2022 09:07:08 +0200
Message-Id: <20220709070708.212797-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1657350429-01436587-3D08EE25/0/0 CLEAN NORMAL
X-TOI-MSGID: 5f7627e7-7ada-4928-aac6-b5c6928df1c6
Subject: [Buildroot] [PATCH 1/1] package/libvpx: vp8 encoder needs c++
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
Cc: Spenser Gilliland <spenser@gillilanding.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Encoding rate control interface for v8 is implemented in c++:
https://github.com/webmproject/libvpx/commit/65a1751e5b98bf7f1d21bcbfdef352af34fb205d
and was added to libvpx in v1.12.0 which was added to buildroot with
https://git.busybox.net/buildroot/commit/?id=e4ff284ba88ea0cb41c190165cb42a174c5faa23

Disable vp8 encoding when toolchain lacks c++.

Fixes:
http://autobuild.buildroot.net/results/a3524b954e53002973b423ce23b4c43ff5281ab5/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libvpx/libvpx.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libvpx/libvpx.mk b/package/libvpx/libvpx.mk
index 1845f2bc5e..c8a22b9ab2 100644
--- a/package/libvpx/libvpx.mk
+++ b/package/libvpx/libvpx.mk
@@ -21,11 +21,11 @@ LIBVPX_CONF_OPTS = \
 	--disable-docs \
 	--disable-unit-tests
 
-# vp9/ratectrl_rtc.cc
+# vp8/ratectrl_rtc.cc vp9/ratectrl_rtc.cc
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
-LIBVPX_CONF_OPTS += --enable-vp9-encoder
+LIBVPX_CONF_OPTS += --enable-vp8-encoder --enable-vp9-encoder
 else
-LIBVPX_CONF_OPTS += --disable-vp9-encoder
+LIBVPX_CONF_OPTS += --disable-vp8-encoder --disable-vp9-encoder
 endif
 
 # This is not a true autotools package.  It is based on the ffmpeg build system
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
