Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F975CD8CA8
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C9AB85F7C;
	Tue,  9 Jun 2026 13:06:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rh4nqevPxpvz; Tue,  9 Jun 2026 13:06:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C27B185EE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010369;
	bh=FyqdgTMAvtCAMPUNdrE4PzeQ+xp+c1Sggcv2fv2kDAE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=m2G1dWFDpMGmEnY7QYR3WryoInkNdU2nmeip/DbmodK0Skt9tyBlBaXLy25RD56aH
	 lizcqJ9O4Ejrc//c5YLilemlrozUC5/k9doGxd9eIaVIJ9UNCkvbQumFQil2mL/qia
	 CHRMiZ+pXavzcLmVrk+KisUJwu2NhIAqMPneh24p+/Svu503PvwP7Ijv2SDm4UxNF4
	 hU3EYJszdEzyptPGRR/TXDZ+dZUxem045pmE0+Cdb6ylZL0yIVaVjnRFbzz79i2rLM
	 CsrAtcGnmh6yDTeu4SSWuJbGbVQYx35jde8IZFyfwMmfwyM4maBlKUMhuWctJxwAR6
	 wmpZ+INKrSEWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C27B185EE9;
	Tue,  9 Jun 2026 13:06:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E494F190
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0675426FC
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YtNIIYA8-7Xg for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45F8A42714
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45F8A42714
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8298987E87; Tue,  9 Jun 2026 13:01:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 31 May 2026 16:19:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e16546abbc2b17abe3cd5b0fd68235b3247d01db
X-Git-Newrev: f0c3c8ea77915342f1424f70adcfb481c3640e56
X-Patchwork-Hint: ignore
Message-Id: <20260609130125.8298987E87@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pipewire: bump version to 1.6.6
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
Content-Type: multipart/mixed; boundary="===============1151900111681924660=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1151900111681924660==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f0c3c8ea77915342f1424f70adcfb481c3640e56
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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

--===============1151900111681924660==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1151900111681924660==--
