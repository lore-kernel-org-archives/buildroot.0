Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDDE4C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 06:45:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B21961040
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 06:45:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5B21961040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29960607D5;
	Sun,  1 Aug 2021 06:45:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cyaHL_CO7qaq; Sun,  1 Aug 2021 06:45:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8228A607C8;
	Sun,  1 Aug 2021 06:45:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 32CD71BF86B
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 06:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21A7E8277E
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 06:45:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YE-Uw6godo5b for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 06:45:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 51A498276B
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 06:45:33 +0000 (UTC)
Received: from fwd07.aul.t-online.de (fwd07.aul.t-online.de [172.20.27.150])
 by mailout11.t-online.de (Postfix) with SMTP id 99E70DBB0
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 08:41:33 +0200 (CEST)
Received: from fli4l.lan.fli4l
 (XGZ9rMZGwhb-VMgBuq+180yFEhddGBGOPqtvAlBPCxkTlM8LZeljtLS+YCktCQngAq@[79.214.201.246])
 by fwd07.t-online.de with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mA5A7-0C84lE0; Sun, 1 Aug 2021 08:41:27 +0200
Received: from mahler.lan.fli4l ([192.168.1.1]:34238)
 by fli4l.lan.fli4l with esmtp (Exim 4.94.2)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mA5A6-0006H5-KO
 for buildroot@buildroot.org; Sun, 01 Aug 2021 08:41:26 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun,  1 Aug 2021 08:41:26 +0200
Message-Id: <20210801064126.15003-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-ID: XGZ9rMZGwhb-VMgBuq+180yFEhddGBGOPqtvAlBPCxkTlM8LZeljtLS+YCktCQngAq
X-TOI-EXPURGATEID: 150726::1627800087-00011901-286B4F18/0/0 CLEAN NORMAL
X-TOI-MSGID: e4df30d1-3b39-48cb-9286-108023205c8c
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-input-libinput:
 bump version to 1.1.0
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

Release notes:
https://lists.x.org/archives/xorg-announce/2021-June/003094.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-input-libinput.hash                        | 6 +++---
 .../xdriver_xf86-input-libinput.mk                          | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
index 2c4dafc8c7..3ee726bfdc 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2021-April/003083.html
-sha256  fddec49c115591918475155bf16aaf23017d7f814cee7823a0c11f867aca245b  xf86-input-libinput-1.0.1.tar.bz2
-sha512  bb3cc4e9507d5ff6e430aabb5c87e412e8bbc5fd18b85fa4826123cb6be2f8f41078863fda09304f9dbd1264bbf1c3c7d6c11700ede0a5db733fbd1a03ec915b  xf86-input-libinput-1.0.1.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2021-June/003094.html
+sha256  e11d2a41419124a6e9b148f1df181bf7819fc7398c8ee9a1b6390b0742c68d16  xf86-input-libinput-1.1.0.tar.bz2
+sha512  7def9a4834a9203d1672613b1a4b384a0eb3d664818865b375969bf9ca96c512b752859acc8916de9224f7e488f8d59953308e53b983dfa8031ca01fd707fa2b  xf86-input-libinput-1.1.0.tar.bz2
 
 # Locally computed
 sha256  4114220b281561e80f3422f0e7ae8d3e1fc85131ffc2e3b6265119e66f1adb27  COPYING
diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
index b949b54819..73cdad9b85 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 1.0.1
+XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 1.1.0
 XDRIVER_XF86_INPUT_LIBINPUT_SOURCE = xf86-input-libinput-$(XDRIVER_XF86_INPUT_LIBINPUT_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_LIBINPUT_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_LIBINPUT_LICENSE = MIT
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
