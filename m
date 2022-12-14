Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F30C4332F
	for <buildroot@archiver.kernel.org>; Wed, 14 Dec 2022 21:51:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B004A60E72;
	Wed, 14 Dec 2022 21:51:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B004A60E72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xYfEo-3k552p; Wed, 14 Dec 2022 21:51:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AB0F60E57;
	Wed, 14 Dec 2022 21:51:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AB0F60E57
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AFE2A1BF3D2
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 21:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A94D41691
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 21:51:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A94D41691
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cyseVvdMmwsr for <buildroot@lists.busybox.net>;
 Wed, 14 Dec 2022 21:51:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39457408C6
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 39457408C6
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 21:51:21 +0000 (UTC)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
 by mailout03.t-online.de (Postfix) with SMTP id 14D3C1489B
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 22:50:40 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd87.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p5ZeB-1OHmUb0; Wed, 14 Dec 2022 22:50:39 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:38422)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p5ZeA-0005Zf-3B
 for buildroot@buildroot.org; Wed, 14 Dec 2022 22:50:39 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Wed, 14 Dec 2022 22:50:38 +0100
Message-Id: <20221214215038.4183461-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1671054639-39FE881E-BE4D20CF/0/0 CLEAN NORMAL
X-TOI-MSGID: 263ae8e7-b9a6-4abf-9662-e9e128058ad2
Subject: [Buildroot] [PATCH 1/1] package/libdrm: disable --as-needed linker
 flag for Codesourcery ARM 2014.05 toolchain
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

As similar patch was committed for mesa3d, see
https://git.busybox.net/buildroot/commit/?id=d3f576d2f37a05275c0d25f855dc24935ff5de5c
for details.

Fixes:
http://autobuild.buildroot.net/results/8b0/8b0b89100aeff554127387c78972ed3e1616c2c9/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libdrm/libdrm.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 56366b6c48..cfb0f730fb 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -19,6 +19,13 @@ LIBDRM_CONF_OPTS = \
 	-Dcairo-tests=disabled \
 	-Dman-pages=disabled
 
+# Codesourcery ARM 2014.05 fail to link libdrm.so with --as-needed
+# linker flag due to a linker bug between binutils 2.24 and 2.25
+# (2.24.51.20140217).
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM),y)
+LIBDRM_CONF_OPTS += -Db_asneeded=false
+endif
+
 ifeq ($(BR2_PACKAGE_LIBATOMIC_OPS),y)
 LIBDRM_DEPENDENCIES += libatomic_ops
 ifeq ($(BR2_sparc_v8)$(BR2_sparc_leon3),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
