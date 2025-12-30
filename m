Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75800EE57C7
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 22:26:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2120660BD5;
	Tue, 30 Dec 2025 22:26:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RLhbTbOIUe57; Tue, 30 Dec 2025 22:26:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4972660A56
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767133596;
	bh=gCR+7z5RbHjomIgDgNq3IORUYG1T4kimhuZni7U6LF4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ze8/3AGPavRJOEI3GaA/N97hZbt7xpotREqv5ikS0RBwlFnbGtcDjEf0ngbepavwX
	 gxN1U6M3x04N2a3u6kud72KAcZnKqQ6Pu1VRZuqnMUX5yy2yhjDpe40jE4+Vv7Ss4j
	 1ePPejM0NVV6Kc6ItPft3RV2VE4/qEXg0sPPcyiovVboh5FnXl4/6pORhPpoKIHSfW
	 EKKbjSzFHX+yQaXOMk8WHWiV7FhYiKG5dW1GUSjZlzQhTb7lg92X63/rsFTnucomYp
	 eK0Ww+oRo87n4loMyadLvrcLzJRfN1NQOoyC7nkCNVg7kzf8KNEH8fgxu6NSxAKObI
	 1q7C3KswocUvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4972660A56;
	Tue, 30 Dec 2025 22:26:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B63E277
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:26:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E098404D9
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:26:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DhF4YINX4q-l for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 22:26:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1E9840099
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1E9840099
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:26:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9F22F80714; Tue, 30 Dec 2025 22:26:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 23:22:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5f2ad897f14c103b208aea6e37f3149dbfa02ef4
X-Git-Newrev: 60ede40f169935df91a39824d6220d0f63261c11
X-Patchwork-Hint: ignore
Message-Id: <20251230222628.9F22F80714@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl2: drop rpi-userland support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=60ede40f169935df91a39824d6220d0f63261c11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As we're about to remove the rpi-userland package, drop support for it
from package/sdl2.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sdl2/sdl2.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index eb6e753869..31f96d8e9b 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -27,6 +27,7 @@ SDL2_CONF_OPTS += \
 	--disable-video-offscreen \
 	--disable-video-vulkan \
 	--disable-video-directfb \
+	--disable-video-rpi \
 	--disable-ime \
 	--disable-ibus \
 	--disable-fcitx \
@@ -77,13 +78,6 @@ else
 SDL2_CONF_OPTS += --disable-3dnow
 endif
 
-ifeq ($(BR2_PACKAGE_SDL2_OPENGLES)$(BR2_PACKAGE_RPI_USERLAND),yy)
-SDL2_DEPENDENCIES += rpi-userland
-SDL2_CONF_OPTS += --enable-video-rpi
-else
-SDL2_CONF_OPTS += --disable-video-rpi
-endif
-
 # x-includes and x-libraries must be set for cross-compiling
 # By default x_includes and x_libraries contains unsafe paths.
 # (/usr/X11R6/include and /usr/X11R6/lib)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
