Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD96ECD3431
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 09:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99F63402E8;
	Wed,  4 Sep 2024 09:54:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NdjvrSKWRrkB; Wed,  4 Sep 2024 09:54:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EF9E402AA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EF9E402AA;
	Wed,  4 Sep 2024 09:54:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6D7E81BF577
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 09:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BA5E607FC
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 09:54:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nvBqWYxFtvgk for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 09:54:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.72.192.75;
 helo=mout.kundenserver.de;
 envelope-from=nicolas.cavallari@green-communications.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0D5ED606C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D5ED606C0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D5ED606C0
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 09:54:39 +0000 (UTC)
Received: from evilbit.green-communications.fr ([88.171.60.104]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis)
 id 1Mi2Fj-1s8c5a0NPd-00e1VN; Wed, 04 Sep 2024 11:41:55 +0200
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
To: buildroot@buildroot.org
Date: Wed,  4 Sep 2024 11:38:12 +0200
Message-ID: <20240904094121.23486-2-nicolas.cavallari@green-communications.fr>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240904094121.23486-1-nicolas.cavallari@green-communications.fr>
References: <20240904094121.23486-1-nicolas.cavallari@green-communications.fr>
MIME-Version: 1.0
X-Provags-ID: V03:K1:sdxvfCRMCizlkfzkBaZCe5wdtIkRGxqkE8vNX9K9TTy+NCFYQQk
 mxLlS4Sg0lnjdqxaHahGhc2SMZLuJ9vzZ3D8d3dGuBxpSoyLSZbl99BjtjBdwFxi4qhAsiR
 i2nnS5CSrWpTwEFfO4yH6ewiDtAdJlVxI5JLkHirjhorRTn2qnucztnrGjFFi05x9zeh1xG
 2KcU5Hz6y+sDdB2e+Myxw==
UI-OutboundReport: notjunk:1;M01:P0:Gwu9Q4LtJAY=;Ab4nIFRIg+gK67ytg19yrY96xKX
 RiEOLDoVhWiIDVcm023iRLHbSNegVjmK6Gdel0CuE7UVZyt5EwRsmc9YmcCwd2wzo+Anszl/J
 JKR51xrJmIpr+cerFVjcJr/5FiCzPGclhePC3tqunvZBOEROYn27eraRKUA21t6HoNGDVa+cV
 xModRyQ6QB0379WlU3cFO1mzl6QzJGfDSoGIMi731nzNFCbsPAK4VTiJ7zZ2dwD7gC09SNlpH
 u7W5zP9CSdh32Pprx8beKgjgXt66fdUNurh+h6Bu38AM8F7pYEUIyTORi4VUaRy869DVgAMiX
 bj9lmXMGbyrvuYWi2rUx8jaa05ph5hONX/SbhyXWUDdMdzeDm+xgTozqUJGGZwKhyvaYvQlEG
 X0pDM57aHguEwmL6133waETpezC5AjQu3ePxX1ttNlNToIoiUWdRkJ7UYFDo7AjrGP2nO7qNe
 S1vqxrSwZzLU1mdyHGsgN/EPVxxLiUPNnUOM+BZU2M8qVlMwHr+1QVqxksTlydjdojH1yKyA5
 lnkIusKEY/iaLnG9EUNLsAFHE4HU0ypZDz7wi4GS+E0QYaGttFqI49drepJYhQYry1DY5JSw9
 efy1DOA7VQLps6bOZNy6tJ3zfSDmKswwUllsScbj8gJHG0HhCNK5R3CERP2iVTkAKofkqoKP1
 EFjAdugT9FhcFmyGmxgPD85ZJyDJ+KqDIu93llKIw6Mp3ybCgFsrLGk76nPoWu2OUpW6D+K8c
 hMlemqUhs2jr1hjkqMnImJL8miNhM22IQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Subject: [Buildroot] [PATCH v2 2/2] package/bluez-alsa: bump version to 4.3.1
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

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
v2: add sob
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
