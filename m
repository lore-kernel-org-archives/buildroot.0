Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 489CBEB64DA
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 11:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBA1E40629;
	Sun, 16 Jul 2023 11:09:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBA1E40629
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Capt1BZ8yLfX; Sun, 16 Jul 2023 11:09:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B83B140919;
	Sun, 16 Jul 2023 11:09:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B83B140919
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 31A721BF3A7
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 11:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0BF8A40189
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 11:09:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BF8A40189
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S_GM_LFuMKdd for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 11:09:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 252AD400FB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 252AD400FB
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 11:09:15 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 164E2A4C029A;
 Sun, 16 Jul 2023 13:09:14 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54746)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qKzcn-0000c7-2j;
 Sun, 16 Jul 2023 13:09:13 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 13:09:13 +0200
Message-Id: <20230716110913.3849024-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689505754;
 bh=WtY8SiMMAkVzXdN9yubt7FQQPKDxktGe8Bwb3h4ik9w=;
 h=From:To:Cc:Subject:Date:From;
 b=dTCuXFsLakKwpLA1UUxTr2MgXjWlHJznE+5vKPoBrYFAotPRlSloA8VVBRqD93oMB
 bNr12Hiq76oW4JsM9AhL+l/+3ZrDUjvl2FgPWGSKysVj4WQR2fMD/5IYfBzUkH3f5N
 hBgvySPBX/fL3dsAqXDgS5YmWc2k3zi1yJPYLEIjllWKv6lm35otUCRVQ0elb+SJMy
 nHJ0EGgFqp4CzgYOBZNQ7fF7y+4dvIPUeUJ8yOHK6tdbQRolqLnPn9agqZkTArZZow
 /01b3OEb9tOl5pqiZ9ykyAX2+/wmUuN+2fljybOXxtS8KW9s4lKFIrICSzCB0bQGpp
 wq/FGADsGWP/g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=dTCuXFsL
Subject: [Buildroot] [PATCH v2 1/1] package/pipewire: bump version to 0.3.74
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://gitlab.freedesktop.org/pipewire/pipewire/-/blob/master/NEWS

Added optional dependency to opus, disabled features with missing
dependencies in buildroot.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: reworked dependencies (James)

 package/pipewire/pipewire.hash |  2 +-
 package/pipewire/pipewire.mk   | 11 ++++++++++-
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
index 0e027aaa55..98de073bdb 100644
--- a/package/pipewire/pipewire.hash
+++ b/package/pipewire/pipewire.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  c78c95cdff2774418f0a9468e94a1b2800761d322f13104df6501e1a0dc92558  pipewire-0.3.65.tar.bz2
+sha256  b30d886b87aa8c055af6d6c7261d1d04336f3a75221c31afe1ea8ba86184bf70  pipewire-0.3.74.tar.bz2
 sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
 sha256  be4be5d77424833edf31f53fc1f1cecb6996b9e2d747d9e6fb8f878362ebc92b  LICENSE
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index d6bd2434bf..9d32da7c72 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIPEWIRE_VERSION = 0.3.65
+PIPEWIRE_VERSION = 0.3.74
 PIPEWIRE_SOURCE = pipewire-$(PIPEWIRE_VERSION).tar.bz2
 PIPEWIRE_SITE = https://gitlab.freedesktop.org/pipewire/pipewire/-/archive/$(PIPEWIRE_VERSION)
 PIPEWIRE_LICENSE = MIT, LGPL-2.1+ (libspa-alsa), GPL-2.0 (libjackserver)
@@ -35,6 +35,8 @@ PIPEWIRE_CONF_OPTS += \
 	-Dlegacy-rtkit=false \
 	-Davb=disabled \
 	-Dlibcanberra=disabled \
+	-Dlibmysofa=disabled \
+	-Dlibffado=disabled \
 	-Dflatpak=disabled
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
@@ -189,6 +191,13 @@ else
 PIPEWIRE_CONF_OPTS += -Dpw-cat=disabled -Dsndfile=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_OPUS),y)
+PIPEWIRE_CONF_OPTS += -Dopus=enabled
+PIPEWIRE_DEPENDENCIES += opus
+else
+PIPEWIRE_CONF_OPTS += -Dopus=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
 PIPEWIRE_CONF_OPTS += -Dlibpulse=enabled
 PIPEWIRE_DEPENDENCIES += pulseaudio
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
