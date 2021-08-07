Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,TVD_SPACE_RATIO,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF3A7C4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 10:16:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C42960EE1
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 10:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6C42960EE1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FF3C606C6;
	Sat,  7 Aug 2021 10:16:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A2FUnMfhUxLj; Sat,  7 Aug 2021 10:16:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 819BB6060A;
	Sat,  7 Aug 2021 10:16:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3D0681BF2F6
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 10:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A52C82C21
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 10:16:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JAA_S56Ztz_J for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 10:16:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F033282BA1
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 10:16:11 +0000 (UTC)
Received: from fwd07.aul.t-online.de (fwd07.aul.t-online.de [172.20.27.150])
 by mailout05.t-online.de (Postfix) with SMTP id 6084515B5
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 12:16:08 +0200 (CEST)
Received: from fli4l.lan.fli4l
 (ZwKCHrZGghr-bT1ux55ciXC7CCbHpmQmb0qasM2aKJQVeArfMnSbnoqSvZmJauBZPz@[79.214.200.2])
 by fwd07.t-online.de with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mCJN9-120GmW0; Sat, 7 Aug 2021 12:16:07 +0200
Received: from mahler.lan.fli4l ([192.168.1.1]:50956)
 by fli4l.lan.fli4l with esmtp (Exim 4.94.2)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mCJN3-000804-Gn
 for buildroot@buildroot.org; Sat, 07 Aug 2021 12:16:01 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat,  7 Aug 2021 12:16:01 +0200
Message-Id: <20210807101601.703294-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-ID: ZwKCHrZGghr-bT1ux55ciXC7CCbHpmQmb0qasM2aKJQVeArfMnSbnoqSvZmJauBZPz
X-TOI-EXPURGATEID: 150726::1628331367-00011901-B90B327C/0/0 CLEAN NORMAL
X-TOI-MSGID: b7bf3c2b-571d-4f8c-9ef5-c1b73bcd84b4
Subject: [Buildroot] [PATCH 1/1] package/kodi-inputstream-adaptive: bump
 version to 2.6.23-Matrix
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

Changelog of this bugfix release:
https://github.com/xbmc/inputstream.adaptive/blob/Matrix/inputstream.adaptive/addon.xml.in#L18

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash    | 2 +-
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index 1abf28d89e..ef2435cae9 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  48eea3785dc820ee48cf652483ff91a1589d0fabe3f61c740e04595b5a020288  kodi-inputstream-adaptive-2.6.22-Matrix.tar.gz
+sha256  eeb68250725c4e6c990fdb24365188733b6ef944965792bb5b0e42ce306ad836  kodi-inputstream-adaptive-2.6.23-Matrix.tar.gz
 sha256  89931c1fb1f3716694175763cf3221cfcd63d6935031cf6b4512d17ffe5d9860  LICENSE.GPL
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index 1d95b8e97a..8e2c1d2a8a 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_ADAPTIVE_VERSION = 2.6.22-Matrix
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = 2.6.23-Matrix
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = GPL-2.0+
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE_FILES = LICENSE.GPL
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
