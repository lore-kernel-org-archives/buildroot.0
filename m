Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA29CD37B4
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 12:44:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 515F160881;
	Wed,  4 Sep 2024 12:44:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DEck3dZiBeF8; Wed,  4 Sep 2024 12:44:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D111960885
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D111960885;
	Wed,  4 Sep 2024 12:44:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5053A1BF373
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 12:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49E48404EB
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 12:44:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GBruedY5HJql for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 12:44:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.126.135;
 helo=mout.kundenserver.de;
 envelope-from=nicolas.cavallari@green-communications.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D2F51404D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2F51404D1
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D2F51404D1
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 12:44:27 +0000 (UTC)
Received: from evilbit.green-communications.fr ([88.171.60.104]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis)
 id 1M8yU2-1sj3QF2pp0-0084xu; Wed, 04 Sep 2024 14:44:25 +0200
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
To: buildroot@buildroot.org
Date: Wed,  4 Sep 2024 14:42:46 +0200
Message-ID: <20240904124343.25805-2-nicolas.cavallari@green-communications.fr>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240904124343.25805-1-nicolas.cavallari@green-communications.fr>
References: <20240904124343.25805-1-nicolas.cavallari@green-communications.fr>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Xwm8AEFehZ3fDGBrMbufVEMYgcz4XRKE+vT+OntEw/9jx72Ji0k
 Ysw43ZZdkrjq2T+djBwvDarliiplHTvH954B91arnAEP+aemomHmPGU84NunXR0R5v5L7wx
 o4NjZIKvxsWGZ90KL3xNyiQlBn1oy7IZcuY6UHVUzKW2SyLOCnSFS9VjnDMf4orD32Xpkky
 Z7uSW+l+XSdo5mj41vE/g==
UI-OutboundReport: notjunk:1;M01:P0:cO4GDTsmykw=;ao+ZrDsLU1/LF9gFOyW18GzTTkG
 q4ZCkY2GnqVCccHgmSHFKMQLFwNo5isSc4QJie6sBzHs2GhN3DaezhyAdfJpaXnLGHh2BtbaM
 m7pS/cHDoDf1sJIGm1zcgyYmjgZ4J2wUJ+pu2ms53pdzM/A/ET5+4tVF4rwPBCyLt8vAgZZd9
 f12qyRQhBMmxTcBZKXpPRTj/ZOWvz7fDLiPbLC7qvyg/7xhfvzYC8rR3SZW5WDZ254riJFdD6
 CSU4jUbAnOeJnlabT/5u4s2oKVldB6YLSt598SiOqwJ1fnFt/EkJOliMg+vLZklN6ZQRcf6d/
 /GOM8XtvTSLJSjmmv15KrMyckwK4+IZv90n61fWehoUKuyOQVT+WVC5Dt3ZycFRaiHRPdzn6L
 ewEopvhxYDzKQ4lGFGp0L0/S5oqFru99tw5phZ5ptjTG/AWKbxgSoitDjQ3Lphi1RSm0RdYkr
 cJ5rA+BUML/0WNvh4fSwoCVe+JLXJ+16ZDtjAinb1H9v3T2XrqhDfQb8KOYxhihyLJPXkw3EW
 5OtHK9pvP1wsYs7RoI5pi+J43tkoTNW4YsXN8j3QIfhsWwTwD2fCHHysndGytN5hei+cFkmaR
 4FrUIjIBwrvvWPPvupFuCswUqxsKDHLjROWtvWHI4VmGxg1xiSq/FFHByl5n9l5XrEbXa9gzv
 5mZ92I4YPxvNhnmDUhu8xaDKVYecYic89W9hwizEcC/57LvSmwtuE0sU1kjcgZ+MMygNNgPjr
 4z/Lp7AfHCjroiibAO0lSACiZw//5KWUA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Subject: [Buildroot] [PATCH v3 2/2] package/bluez-alsa: bump version to 4.3.1
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
v3: no changes
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
