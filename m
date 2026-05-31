Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC8A8CD6E5D
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 14:30:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F2B160F31;
	Sun, 31 May 2026 14:30:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ras8WOephGMB; Sun, 31 May 2026 14:30:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94B2860F2E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780237827;
	bh=ldH7QZ2nQ+LkYi7EPOs4jNlCD8PvE7MA7Apx9IQWF0A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=E0zZQ1gDQsidJCz4DIs1Zv+ezkte7MSiEql9trhKQpzn/UvOu5Pk0aXJAad6v7cXf
	 0ECI1XzzSLaelj/BE76IGSlOjyu3/J4rc9HYSL5iK1W29l+VsWqG11p26ulrPuKrZT
	 BAhkoN7KoDq1jPslKcu3MpZMg2IU1t2WGkt/HDaLMfp1L4vcfUFAQPrB0N4toOaHHE
	 ThE1Mwb+NROhzgziKCSpIetwbxdeqjMjTGBzP5pjwvcbYh8vglpGCJ7sxnDq3dubW+
	 sjywOEiWjTlac+HlV9ofdBfwlAibuFOIoFvl0L2vQIUtHE3LK2XLFEVPYbbYVO611y
	 SkBFGtpQh25mA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94B2860F2E;
	Sun, 31 May 2026 14:30:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 311FE257
 for <buildroot@buildroot.org>; Sun, 31 May 2026 14:30:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16D7942939
 for <buildroot@buildroot.org>; Sun, 31 May 2026 14:30:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id matwc15hMVWC for <buildroot@buildroot.org>;
 Sun, 31 May 2026 14:30:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EBE64293E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3EBE64293E
 for <buildroot@buildroot.org>; Sun, 31 May 2026 14:30:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9CB98876CB; Sun, 31 May 2026 14:30:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 31 May 2026 16:19:09 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e16546abbc2b17abe3cd5b0fd68235b3247d01db
X-Git-Newrev: f0c3c8ea77915342f1424f70adcfb481c3640e56
X-Patchwork-Hint: ignore
Message-Id: <20260531143009.9CB98876CB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pipewire: bump version
 to 1.6.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0548093862567298489=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0548093862567298489==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f0c3c8ea77915342f1424f70adcfb481c3640e56
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Release notes:
https://gitlab.freedesktop.org/pipewire/pipewire/-/blob/1.6.6/NEWS

ffmpeg support needs swscale support:
https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/2cbcdbc579bbffa682088fbedbca10e278e061dd

Renamed configure option 'systemd' to 'libsystemd' due to commit
https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/f2c878a2c175d0bece4571df691a8af02e7a3ab7

Disabled jack2 support for uClibc to fix a build error:

../pipewire-jack/src/pipewire-jack.c:13:10: fatal error: threads.h: No such file or directory
   13 | #include <threads.h>

Removing this include will not fix the problem:

../pipewire-jack/src/pipewire-jack.c:127:20: error: expected ‘;’ before ‘float’
  127 | static thread_local float midi_scratch[MIDI_SCRATCH_FRAMES];

Fixes:
https://autobuild.buildroot.net/results/217/217f4500a7dadf089b90438e1eb06aaa9c50f4c5/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/pipewire/Config.in     | 1 +
 package/pipewire/pipewire.hash | 2 +-
 package/pipewire/pipewire.mk   | 9 +++++----
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/pipewire/Config.in b/package/pipewire/Config.in
index 9d2de6c866..38a321d500 100644
--- a/package/pipewire/Config.in
+++ b/package/pipewire/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_PIPEWIRE
 	select BR2_PACKAGE_ALSA_LIB_UCM if BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_ALSA_LIB_SEQ if BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AUDIO if BR2_PACKAGE_BLUEZ5_UTILS # runtime
+	select BR2_PACKAGE_FFMPEG_SWSCALE if BR2_PACKAGE_FFMPEG
 	help
 	  PipeWire is a server and user space API to deal with
 	  multimedia pipelines.
diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
index 2e6a9ae3aa..8e701bfd4b 100644
--- a/package/pipewire/pipewire.hash
+++ b/package/pipewire/pipewire.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  7670f617220cc053948fc8f2c1ff788192479ef5d4f373d878ac8a7cab76a71c  pipewire-1.2.8.tar.bz2
+sha256  2fdf073869bd171d29a92dc6857979864b53e3dc1a79ac76c15db78e5b12d9f8  pipewire-1.6.6.tar.bz2
 sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
 sha256  be4be5d77424833edf31f53fc1f1cecb6996b9e2d747d9e6fb8f878362ebc92b  LICENSE
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index c1dc2aa0cc..c5127b9a9d 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIPEWIRE_VERSION = 1.2.8
+PIPEWIRE_VERSION = 1.6.6
 PIPEWIRE_SOURCE = pipewire-$(PIPEWIRE_VERSION).tar.bz2
 PIPEWIRE_SITE = https://gitlab.freedesktop.org/pipewire/pipewire/-/archive/$(PIPEWIRE_VERSION)
 PIPEWIRE_LICENSE = MIT, LGPL-2.1+ (libspa-alsa), GPL-2.0 (libjackserver)
@@ -70,13 +70,13 @@ endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 PIPEWIRE_CONF_OPTS += \
-	-Dsystemd=enabled \
+	-Dlibsystemd=enabled \
 	-Dsystemd-system-service=enabled \
 	-Dsystemd-user-service=enabled
 PIPEWIRE_DEPENDENCIES += systemd
 else
 PIPEWIRE_CONF_OPTS += \
-	-Dsystemd=disabled \
+	-Dlibsystemd=disabled \
 	-Dsystemd-system-service=disabled \
 	-Dsystemd-user-service=disabled
 endif
@@ -100,7 +100,8 @@ else
 PIPEWIRE_CONF_OPTS += -Davahi=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_JACK2),y)
+# uClibc does not implement thread_local
+ifeq ($(BR2_PACKAGE_JACK2):$(BR2_TOOLCHAIN_USES_UCLIBC),y:)
 PIPEWIRE_CONF_OPTS += -Dpipewire-jack=enabled -Djack=enabled
 PIPEWIRE_DEPENDENCIES += jack2
 else

--===============0548093862567298489==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0548093862567298489==--
