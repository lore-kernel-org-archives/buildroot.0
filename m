Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540BFE6FE48
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2884B84D14;
	Fri,  6 Sep 2024 20:08:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gj8Pg8zQ2zvO; Fri,  6 Sep 2024 20:08:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F67484D06
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F67484D06;
	Fri,  6 Sep 2024 20:08:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 10C5D1BF37F
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 20:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8DEE6409F2
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id di7uiLDEgfdV for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:59:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93A7840C63
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93A7840C63
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:59:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8B6EE85FEB; Fri,  6 Sep 2024 19:59:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Sep 2024 22:24:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 32ceedbedccb6ee7981db65957d698843171cc8b
X-Git-Newrev: 93dd24358e37828237b7d31695ab93412a47d507
X-Patchwork-Hint: ignore
Message-Id: <20240906195901.8B6EE85FEB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bluez-alsa: bump version to 4.3.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=93dd24358e37828237b7d31695ab93412a47d507
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new optional dependencies on bluez midi support, opus, systemd and
spandsp.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
