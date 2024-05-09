Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F82C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 16:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 982F1405B0;
	Thu,  9 May 2024 16:48:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yCJReYeyD-6b; Thu,  9 May 2024 16:48:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5859B41E87
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5859B41E87;
	Thu,  9 May 2024 16:48:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E94451BF337
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4BD141E87
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:48:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EeC1nao_7BCx for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 16:47:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD438405B0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD438405B0
 for <buildroot@buildroot.org>; Thu,  9 May 2024 16:47:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A77B986CED; Thu,  9 May 2024 16:47:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 18:47:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c89bec21dbebe5fe689aac5c0674b69634b52317
X-Git-Newrev: 92117ac3915ec64f010781d93b05034b43e9e381
X-Patchwork-Hint: ignore
Message-Id: <20240509164759.A77B986CED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/aubio: bump version
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

commit: https://git.buildroot.net/buildroot/commit/?id=92117ac3915ec64f010781d93b05034b43e9e381
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The latest release from aubio dates back to 2019 while upstream is
active: https://github.com/aubio/aubio/issues/381

Current git HEAD includes support for ffmpeg 6.x:
https://github.com/aubio/aubio/commits/master/src/io/source_avcodec.c

and also removed the dependency to libavresample which was dropped in
ffmpeg 6.0:
https://github.com/aubio/aubio/commit/245deeadd81afc4ec5635b65d71646490c5c19fd

so we can just depend on the ffmpeg package without suboptions, quoting
configure log:

Checking for 'libavcodec'                : yes
Checking for 'libavformat'               : yes
Checking for 'libavutil'                 : yes
Checking for 'libswresample'             : yes
Checking for all libav libraries         : yes

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/aubio/aubio.hash | 5 ++---
 package/aubio/aubio.mk   | 7 +++----
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/aubio/aubio.hash b/package/aubio/aubio.hash
index 6195788327..dff02ffa9f 100644
--- a/package/aubio/aubio.hash
+++ b/package/aubio/aubio.hash
@@ -1,5 +1,4 @@
-# From https://aubio.org/pub/aubio-0.4.9.tar.bz2.sha256
-sha256  d48282ae4dab83b3dc94c16cf011bcb63835c1c02b515490e1883049c3d1f3da  aubio-0.4.9.tar.bz2
-
+# Locally computed
+sha256  b0e20427750fbfbf017f2b54e41dc0d61ab61335b705bc056ca92a928b2bdd30  aubio-152d6819b360c2e7b379ee3f373d444ab3df0895.tar.gz
 # Hash for license file:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/aubio/aubio.mk b/package/aubio/aubio.mk
index bfc627fa91..07634e41c6 100644
--- a/package/aubio/aubio.mk
+++ b/package/aubio/aubio.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-AUBIO_VERSION = 0.4.9
-AUBIO_SITE = https://aubio.org/pub
-AUBIO_SOURCE = aubio-$(AUBIO_VERSION).tar.bz2
+AUBIO_VERSION = 152d6819b360c2e7b379ee3f373d444ab3df0895
+AUBIO_SITE = $(call github,aubio,aubio,$(AUBIO_VERSION))
 AUBIO_LICENSE = GPL-3.0+
 AUBIO_LICENSE_FILES = COPYING
 AUBIO_CPE_ID_VENDOR = aubio
@@ -59,7 +58,7 @@ else
 AUBIO_CONF_OPTS += --disable-fftw3
 endif
 
-ifeq ($(BR2_PACKAGE_FFMPEG_AVRESAMPLE),y)
+ifeq ($(BR2_PACKAGE_FFMPEG),y)
 AUBIO_DEPENDENCIES += ffmpeg
 AUBIO_CONF_OPTS += --enable-avcodec
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
