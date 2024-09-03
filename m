Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD5B4CD3446
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 16:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52525606B8;
	Tue,  3 Sep 2024 16:06:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zvg1FEnDSFy9; Tue,  3 Sep 2024 16:06:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F2F160701
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F2F160701;
	Tue,  3 Sep 2024 16:06:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6F4571BF373
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 16:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D26F805A2
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 16:06:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EgHkCYvrztjm for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 16:06:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.126.187;
 helo=mout.kundenserver.de;
 envelope-from=nicolas.cavallari@green-communications.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2CBAA80E70
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CBAA80E70
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2CBAA80E70
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 16:06:11 +0000 (UTC)
Received: from evilbit.green-communications.fr ([88.171.60.104]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis)
 id 1MtfRv-1rvD5x20vH-0161g7; Tue, 03 Sep 2024 18:01:06 +0200
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
To: buildroot@buildroot.org
Date: Tue,  3 Sep 2024 18:00:31 +0200
Message-ID: <20240903160038.19535-2-nicolas.cavallari@green-communications.fr>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240903160038.19535-1-nicolas.cavallari@green-communications.fr>
References: <20240903160038.19535-1-nicolas.cavallari@green-communications.fr>
MIME-Version: 1.0
X-Provags-ID: V03:K1:/QJ7HlqX80zNh2y+1UBzaFOXpas4UkSB+9yqtQrM566ldct0dcK
 gjfaZaVrlHdTA7UF/Feiku2mJ1UWKli1JRAGpN8Je4jQp0tLVSEhzOH36oA/EbmjHpEOxyr
 KAfJrJ/cPqQ29h0nOg94j9lPlzf4TrLftP6OUIY4nn2XDeA17MnzIdsEGT1Dplnz551cmQ4
 ha4Tg7DnYd49z4Zyt/UBw==
UI-OutboundReport: notjunk:1;M01:P0:p5UGjk+8Eqs=;6Oc6wTT5gUFbJYHigaP3mpdZd/d
 H2/kUYzP0kpa5ogZcxoYsVWSzK8ZaJPFvHoozavVmanFeTs/MdE9lpq8kY/47ymOAqcu91ODY
 oMwDnItpfbaFTBsCH03+5eE1Ev7r+UM2I6zjonMoBcWedLRMQjelO86GJzIxKuaJbExGXiZDp
 Nm8gsD5DGEPqitaw+WVby5BKQZVfVz2vaMIWUQg9F8DqGRcozdT1kzf8K2NawSK7se4mjXeuv
 7LHvA8Y6tcwO5N6wvaDxZm3QVMIkNZXkygPJoNBRkuI4eHSfVMxR4jcK1m+om0ow7jriwF6S8
 dvX88bvpC89/KfsV68UU8r8GDefstaNhVZp6aKD6p2JlH5Y9V+jal3ZnCj22Ps4AqYPDsrOdd
 a/JbbT1BdLPGHya+6m2goF3HtVUqf6tT5A4VSsHZRJbyeiqKFsEVQV0FLgRlsS/X+n96eTqAG
 j/ZYEYPcEjjbi9YEYDmU7wfLaLlUJEhCOyAV0aUlPogrtEvS7F98xAD2ZoDSqmR3jVjYfXRQv
 k4c/8Qen/zD3VMIdvoEJsUXlAXHR2+6gcvTa8HHQ9ltrWyuzSkJh2gzx2+YHnjValoSOC37Bo
 KKFLt4ZT+aHWTDJSXQkIKi9RV1qTdRyHXGKbZZomP9FqyDz678NCii3iu4jhgWDxteHim0ol3
 5GetkCbLE0qLkZmOtdqM++CeNM0VUrqGUxuRR2hYgiREkE1bBSeeaqBKQ4bJdcfk+uRqkjHPu
 7dDfxzTfjWpSpCmQN5FP9psFAyleFHmDw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Subject: [Buildroot] [PATCH 2/2] package/bluez-alsa: bump version to 4.3.1
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

Add new optional dependencies on bluez midi support, opus, systemd and
spandsp.
---
 package/bluez-alsa/bluez-alsa.hash |  2 +-
 package/bluez-alsa/bluez-alsa.mk   | 30 +++++++++++++++++++++++++++++-
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/package/bluez-alsa/bluez-alsa.hash b/package/bluez-alsa/bluez-alsa.hash
index 5513865603..fbcbabea28 100644
--- a/package/bluez-alsa/bluez-alsa.hash
+++ b/package/bluez-alsa/bluez-alsa.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256  b69a3e6dd69315194403ee930ac1553aed3fb9a3988e502ae5c24a8bfef70f9f  bluez-alsa-4.1.1.tar.gz
+sha256  933fe898dfac21fdfeb5f4ffa685c2aa2db9c064d639170ac2652f156e956a2a  bluez-alsa-4.3.1.tar.gz
 sha256  956564dcf06ba65cd7a5eb6cdfd695e2ab0f09ea9684e4eaf079f5d533bd206d  LICENSE
diff --git a/package/bluez-alsa/bluez-alsa.mk b/package/bluez-alsa/bluez-alsa.mk
index 38682c2755..8a5abe3f7f 100644
--- a/package/bluez-alsa/bluez-alsa.mk
+++ b/package/bluez-alsa/bluez-alsa.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BLUEZ_ALSA_VERSION = 4.1.1
+BLUEZ_ALSA_VERSION = 4.3.1
 BLUEZ_ALSA_SITE = $(call github,Arkq,bluez-alsa,v$(BLUEZ_ALSA_VERSION))
 BLUEZ_ALSA_LICENSE = MIT
 BLUEZ_ALSA_LICENSE_FILES = LICENSE
@@ -16,6 +16,7 @@ BLUEZ_ALSA_AUTORECONF = YES
 BLUEZ_ALSA_CONF_OPTS = \
 	--enable-a2dpconf \
 	--enable-aplay \
+	--enable-cli \
 	--disable-debug-time \
 	--with-alsaplugindir=/usr/lib/alsa-lib \
 	--with-alsaconfdir=/etc/alsa/conf.d
@@ -73,6 +74,12 @@ else
 BLUEZ_ALSA_CONF_OPTS += --disable-rfcomm
 endif
 
+ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_MIDI),y)
+BLUEZ_ALSA_CONF_OPTS += --enable-midi
+else
+BLUEZ_ALSA_CONF_OPTS += --disable-midi
+endif
+
 ifeq ($(BR2_PACKAGE_LIBOPENAPTX),y)
 BLUEZ_ALSA_DEPENDENCIES += libopenaptx
 BLUEZ_ALSA_CONF_OPTS += --with-libopenaptx --enable-aptx --enable-aptx-hd
@@ -80,4 +87,25 @@ else
 BLUEZ_ALSA_CONF_OPTS += --without-libopenaptx --disable-aptx --disable-aptx-hd
 endif
 
+ifeq ($(BR2_PACKAGE_OPUS),y)
+BLUEZ_ALSA_DEPENDENCIES += opus
+BLUEZ_ALSA_CONF_OPTS += --enable-opus
+else
+BLUEZ_ALSA_CONF_OPTS += --disable-opus
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+BLUEZ_ALSA_DEPENDENCIES += systemd
+BLUEZ_ALSA_CONF_OPTS += --enable-systemd
+else
+BLUEZ_ALSA_CONF_OPTS += --disable-systemd
+endif
+
+ifeq ($(BR2_PACKAGE_SPANDSP),y)
+BLUEZ_ALSA_DEPENDENCIES += spandsp
+BLUEZ_ALSA_CONF_OPTS += --enable-msbc
+else
+BLUEZ_ALSA_CONF_OPTS += --disable-msbc
+endif
+
 $(eval $(autotools-package))
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
