Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,PDS_BTC_ID,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDA0AC433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 06:57:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D280611AF
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 06:57:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5D280611AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0333E40181;
	Fri, 10 Sep 2021 06:57:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SNk8Io9bMCE9; Fri, 10 Sep 2021 06:57:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E04940179;
	Fri, 10 Sep 2021 06:57:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 370C01BF352
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 06:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 267706063D
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 06:57:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JqN7oKzc3oHV for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 06:57:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1D85E60636
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 06:57:15 +0000 (UTC)
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
 by mailout02.t-online.de (Postfix) with SMTP id 493634951
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 08:55:39 +0200 (CEST)
Received: from fli4l.lan.fli4l ([84.161.183.251]) by fwd70.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mOaRh-1l4dmL0; Fri, 10 Sep 2021 08:55:33 +0200
Received: from [192.168.1.109] (port=36366 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.94.2)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mOaRh-00067z-1v
 for buildroot@buildroot.org; Fri, 10 Sep 2021 08:55:33 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Fri, 10 Sep 2021 08:55:31 +0200
Message-Id: <20210910065532.31730-4-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210910065532.31730-1-bernd.kuhls@t-online.de>
References: <20210910065532.31730-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1631256933-000010EC-C5D6AD83/0/0 CLEAN NORMAL
X-TOI-MSGID: b206a0bb-ef46-40ab-909e-64d4cb6049f1
Subject: [Buildroot] [PATCH 4/5] package/x11r7/xapp_xwd: bump version to
 1.0.8
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Release notes:
https://lists.x.org/archives/xorg-announce/2021-August/003102.html

Removed md5 and sha1 hashes, reformatted hashes, updated _SITE.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xwd/xapp_xwd.hash | 10 ++++------
 package/x11r7/xapp_xwd/xapp_xwd.mk   |  4 ++--
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_xwd/xapp_xwd.hash b/package/x11r7/xapp_xwd/xapp_xwd.hash
index 606618bcc6..7595286499 100644
--- a/package/x11r7/xapp_xwd/xapp_xwd.hash
+++ b/package/x11r7/xapp_xwd/xapp_xwd.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002876.html
-md5 11794a8eba6d295a192a8975287fd947  xwd-1.0.7.tar.bz2
-sha1 65ce0617be29687cf6082c3a0e85d15a0dcccda9  xwd-1.0.7.tar.bz2
-sha256 cd6815b8b9e0b98e284d3d732fb12162159cb9dcee4f45a7d4c0bd8b308a6794  xwd-1.0.7.tar.bz2
-sha512 6fdb0a115ae505169bbc7fcc45580daf26bced2e26e0bf9a877636016038931a8386e8edcbe015f4024be508d0461906adef4834cf22a445e3c282f0b8fad17e  xwd-1.0.7.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2021-August/003102.html
+sha256  fbaa2b34163714fe7be22b60920ea4683f63b355babb1781aec2e452a033031b  xwd-1.0.8.tar.bz2
+sha512  d2aaf42c60d20c4b09f4947d3702058dbfad4633b2c5c8ea62e8897fc9ced1ab3417ce99255a223286d21a731f543019470737e3074f1bc68033b4eb47bc773e  xwd-1.0.8.tar.bz2
 # Locally computed
-sha256 7cfda56afd92a1ecd2f23bd0064e01b5141053390d854785504adfe2c0fbd946 COPYING
+sha256  7cfda56afd92a1ecd2f23bd0064e01b5141053390d854785504adfe2c0fbd946  COPYING
diff --git a/package/x11r7/xapp_xwd/xapp_xwd.mk b/package/x11r7/xapp_xwd/xapp_xwd.mk
index 4d7ed0f877..1c5bd50166 100644
--- a/package/x11r7/xapp_xwd/xapp_xwd.mk
+++ b/package/x11r7/xapp_xwd/xapp_xwd.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XWD_VERSION = 1.0.7
+XAPP_XWD_VERSION = 1.0.8
 XAPP_XWD_SOURCE = xwd-$(XAPP_XWD_VERSION).tar.bz2
-XAPP_XWD_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XWD_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XWD_LICENSE = MIT
 XAPP_XWD_LICENSE_FILES = COPYING
 XAPP_XWD_DEPENDENCIES = xlib_libX11 xlib_libXmu xlib_libxkbfile
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
