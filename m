Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69609CE7A9A
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 20:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0E1640E96;
	Thu,  5 Sep 2024 20:34:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0tuYJH6Fndvl; Thu,  5 Sep 2024 20:34:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2683540DE5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2683540DE5;
	Thu,  5 Sep 2024 20:34:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3E1CA1BF41B
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 20:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A1B4406FA
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 20:34:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rGXO2EyZ-S-L for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 20:33:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6967406F2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6967406F2
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 20:33:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D23C580042; Thu,  5 Sep 2024 20:33:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Sep 2024 22:24:22 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 32ceedbedccb6ee7981db65957d698843171cc8b
X-Git-Newrev: 93dd24358e37828237b7d31695ab93412a47d507
X-Patchwork-Hint: ignore
Message-Id: <20240905203358.D23C580042@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/bluez-alsa: bump
 version to 4.3.1
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
