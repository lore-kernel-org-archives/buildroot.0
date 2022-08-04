Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A40C25B06
	for <buildroot@archiver.kernel.org>; Thu,  4 Aug 2022 22:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DD518329A;
	Thu,  4 Aug 2022 22:16:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DD518329A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s7tVEgf8QS0u; Thu,  4 Aug 2022 22:16:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97F5A83294;
	Thu,  4 Aug 2022 22:16:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97F5A83294
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F13C91BF302
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 22:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BCED28328E
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 22:16:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCED28328E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cwYUum72IzEh for <buildroot@lists.busybox.net>;
 Thu,  4 Aug 2022 22:16:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FE4983294
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3FE4983294
 for <buildroot@buildroot.org>; Thu,  4 Aug 2022 22:16:12 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 2E781240005;
 Thu,  4 Aug 2022 22:16:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri,  5 Aug 2022 00:15:58 +0200
Message-Id: <20220804221559.46394-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220804221559.46394-1-thomas.petazzoni@bootlin.com>
References: <20220804221559.46394-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659651370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K2bCzPLD0Iiu3miZgc2UBNfSbO1uwPwF9BKPjNbF/40=;
 b=RtRw6+LPgu3za/lHN0Q+yuBsKbvlNBUN1FYyg0MSUVMgXUiYTmJ3ipdhdEuRRswErwQeWY
 7TRNMhqTsHsjIXNL6qLlgqs+lgu8HPr0ugvX/YYTBDSHgN1ppPODLVogfR8kB5By2C+5qK
 YQPTBUnBeeHQjeRQjTKpeOZ7O0HyfEQtV+6Ib/B+iu0iVql3PJxEQWO2VlKpZMcLqcc7Ea
 hMvbWPapyaalQVAMGvJXEWHgGzdpE1qcltPOyy8cV6KMMTV4It80zzrA4L08sefNbv6w+J
 +6LEA4AAf0sfpKG9TRTnKM5haGd1N0sK4C+miTVBzqKCOvSqME9DRZQflZquqw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RtRw6+LP
Subject: [Buildroot] [PATCH 2/3] package/sdl2: be explicit about OpenGL ES
 options
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
Cc: Michael Fischer <mf@go-sys.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In addition to --enable-video-opengles, SDL2 configure script also
looks at --enable-video-opengles1 and --enable-video-opengles2. Since
all OpenGL ES providers in Buildroot provide at least up to OpenGL ES
2, enable both options when BR2_PACKAGE_SDL2_OPENGLES=y.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sdl2/sdl2.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index d255112ce9..c5e7968cec 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -155,10 +155,10 @@ SDL2_CONF_OPTS += --disable-video-opengl
 endif
 
 ifeq ($(BR2_PACKAGE_SDL2_OPENGLES),y)
-SDL2_CONF_OPTS += --enable-video-opengles
+SDL2_CONF_OPTS += --enable-video-opengles --enable-video-opengles1 --enable-video-opengles2
 SDL2_DEPENDENCIES += libgles
 else
-SDL2_CONF_OPTS += --disable-video-opengles
+SDL2_CONF_OPTS += --disable-video-opengles --disable-video-opengles1 --disable-video-opengles2
 endif
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
