Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ECC6C4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 12:00:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF6B34056A;
	Mon,  5 Dec 2022 11:59:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF6B34056A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yr1nT7YZXU6F; Mon,  5 Dec 2022 11:59:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB52B401DC;
	Mon,  5 Dec 2022 11:59:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB52B401DC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 161961BF955
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B2BC4168D
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B2BC4168D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jSMv9yr2gA2H for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACB844167A
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACB844167A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A502B85BBE; Mon,  5 Dec 2022 11:26:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 14 Nov 2022 23:14:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b2bf6853c11fffb5621632d60f1d3d5ee71e8c0d
X-Git-Newrev: 58d1032f96a565320dc043254cf2ade1950ec0aa
X-Patchwork-Hint: ignore
Message-Id: <20221205112609.A502B85BBE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pipewire: bump to version 0.3.60
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

commit: https://git.buildroot.net/buildroot/commit/?id=58d1032f96a565320dc043254cf2ade1950ec0aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for new optional bluez5-backend-native-mm and readline
config options.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pipewire/pipewire.hash |  2 +-
 package/pipewire/pipewire.mk   | 11 ++++++++++-
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
index 9bead47bd9..4585534569 100644
--- a/package/pipewire/pipewire.hash
+++ b/package/pipewire/pipewire.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  32a6db3f42f00eb95a07369160a614420443ca4f4e90ac628db8ca508e08538e  pipewire-0.3.59.tar.bz2
+sha256  8164eb53c9eafedfa22fe1adc4b8e38f3173c6f33695c735a17ed1a3d43c664e  pipewire-0.3.60.tar.bz2
 sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
 sha256  be4be5d77424833edf31f53fc1f1cecb6996b9e2d747d9e6fb8f878362ebc92b  LICENSE
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index d7ae07170d..9fef605878 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIPEWIRE_VERSION = 0.3.59
+PIPEWIRE_VERSION = 0.3.60
 PIPEWIRE_SOURCE = pipewire-$(PIPEWIRE_VERSION).tar.bz2
 PIPEWIRE_SITE = https://gitlab.freedesktop.org/pipewire/pipewire/-/archive/$(PIPEWIRE_VERSION)
 PIPEWIRE_LICENSE = MIT, LGPL-2.1+ (libspa-alsa), GPL-2.0 (libjackserver)
@@ -105,6 +105,12 @@ endif
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS)$(BR2_PACKAGE_SBC),yy)
 PIPEWIRE_CONF_OPTS += -Dbluez5=enabled
 PIPEWIRE_DEPENDENCIES += bluez5_utils sbc
+ifeq ($(BR2_PACKAGE_MODEM_MANAGER),y)
+PIPEWIRE_CONF_OPTS += -Dbluez5-backend-native-mm=enabled
+PIPEWIRE_DEPENDENCIES += modem-manager
+else
+PIPEWIRE_CONF_OPTS += -Dbluez5-backend-native-mm=disabled
+endif
 ifeq ($(BR2_PACKAGE_OPUS),y)
 PIPEWIRE_CONF_OPTS += -Dbluez5-codec-opus=enabled
 PIPEWIRE_DEPENDENCIES += opus
@@ -189,7 +195,10 @@ PIPEWIRE_CONF_OPTS += -Dlibpulse=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
+PIPEWIRE_CONF_OPTS += -Dreadline=enabled
 PIPEWIRE_DEPENDENCIES += readline
+else
+PIPEWIRE_CONF_OPTS += -Dreadline=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_SDL2),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
