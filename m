Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27298C25B75
	for <buildroot@archiver.kernel.org>; Thu, 23 May 2024 17:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D05FA81587;
	Thu, 23 May 2024 17:36:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EQDgjnMXtSwL; Thu, 23 May 2024 17:36:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3ED681DE2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3ED681DE2;
	Thu, 23 May 2024 17:36:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4D46E1CE701
 for <buildroot@lists.busybox.net>; Thu, 23 May 2024 17:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4659340848
 for <buildroot@lists.busybox.net>; Thu, 23 May 2024 17:36:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id teHMXPOMFHyI for <buildroot@lists.busybox.net>;
 Thu, 23 May 2024 17:36:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C1B4140846
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1B4140846
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C1B4140846
 for <buildroot@buildroot.org>; Thu, 23 May 2024 17:36:44 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-42016c8daa7so55655615e9.2
 for <buildroot@buildroot.org>; Thu, 23 May 2024 10:36:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716485802; x=1717090602;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pSSIsQAPMcxeB0pPJTxzZUNxsaeoaO2kGsmruX/BHE0=;
 b=sJJI7xKoaTKoNzxdXkOdeRi57nSwCGCgx1PVoaQbaPB5YtzI17M/txSr08+opctDQK
 y703gJYXtIZgBrxIcVnA6ylf3SpkLDOwfa6h0I/we2EKex59I48Zmo0Zn9QTOYFdIDCT
 Akp8Va9srQPB4dyk/PqT1wTHh0tTC0qd6ItRDiYHRCWe7B17bdfdo886gul3aqcH25YU
 DLnNE5AmotR8BVuE/HStK5XCyCMu8iT6jkB+qZ5kbCbMzzM7ydF9Fo+uXDaPw/7iPzpo
 zFjhXfdiigkAq6kUlLmEewj1jedkfFcs55dz1YQ99hxhdU2EAf2RlfJ8HvFyqDqOMTC+
 X73w==
X-Gm-Message-State: AOJu0YyRxdJv4821v1hlu6GGl4LVKtc8wc/OZjxg/bwsLDpc8XFhzJqK
 IBA5M1G9luxYth1WLTjA9OCk8SfOvja+HXS4RAMVszAuRg4prI3HL0iCCA==
X-Google-Smtp-Source: AGHT+IE0PWpkseRvbqHNDZtOwCPk+AuicmYq92X/NzkDEvYzzOEQkgzq8AOrkihhXkblHSFh++o7Zg==
X-Received: by 2002:a05:600c:1386:b0:41c:73d:62fe with SMTP id
 5b1f17b1804b1-420fd38513dmr37244155e9.41.1716485802302; 
 Thu, 23 May 2024 10:36:42 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42100fbb140sm30995905e9.44.2024.05.23.10.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 10:36:41 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 23 May 2024 19:36:40 +0200
Message-ID: <20240523173640.1510882-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716485802; x=1717090602; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pSSIsQAPMcxeB0pPJTxzZUNxsaeoaO2kGsmruX/BHE0=;
 b=a6p4XI8B0r4OqlShP3uYxfsZkIz0KDb+w8jRG5pb87rPecqGKOkXQ7HDx0lW8qRQnb
 QWZprowkr/JhNS7dXa0otpBxjTo7nJgna7avA+z3i3KbmlvUtyxR9PIDS+qCOkGgT3U9
 RlWzoaaBCC7gEct/VyLutcbCjldQM2v3NLCx9vtvR8JTWBBNrZ7MACCUV95JaZG7Wut/
 RMlgC8MpKb1Y/lKI0ciAfBPejYX21Z8JBnGFAmdd2mJdWebLxsP8KMBWc+qPHDDY9CIV
 e3vEHn5ErHVAd8qB31APASJaE06rDObyrLPgXvx1MPrmdqePhWEeRW7hF5p6fZiQbSb6
 08ow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=a6p4XI8B
Subject: [Buildroot] [PATCH 1/1] package/x11vnc: drop unrecognized options
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
Cc: Martin Kepplinger <martink@posteo.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--without-{jpeg,sdl,zlib} are unrecognized since bump to version
0.9.14 in commit aeea662fb12e69073a233fe1058287212fbbca33 and
https://github.com/LibVNC/x11vnc/commit/d287ed9a77c647f35e85e0b10621a6661e911fad
because those dependencies were linked to libvncserver, not x11vnc

Fixes: aeea662fb12e69073a233fe1058287212fbbca33

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/x11vnc/x11vnc.mk | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/package/x11vnc/x11vnc.mk b/package/x11vnc/x11vnc.mk
index aa0f14c456..645ef40643 100644
--- a/package/x11vnc/x11vnc.mk
+++ b/package/x11vnc/x11vnc.mk
@@ -6,9 +6,6 @@
 
 X11VNC_VERSION = 0.9.16
 X11VNC_SITE = $(call github,LibVNC,x11vnc,$(X11VNC_VERSION))
-# sdl support is not used in x11vnc, but host include / library search paths
-# leak in if host has sdl-config
-X11VNC_CONF_OPTS = --without-sdl
 X11VNC_DEPENDENCIES = xlib_libXt xlib_libXext xlib_libXtst libvncserver
 X11VNC_LICENSE = GPL-2.0+
 X11VNC_LICENSE_FILES = COPYING
@@ -25,12 +22,6 @@ else
 X11VNC_CONF_OPTS += --without-avahi
 endif
 
-ifeq ($(BR2_PACKAGE_JPEG),y)
-X11VNC_DEPENDENCIES += jpeg
-else
-X11VNC_CONF_OPTS += --without-jpeg
-endif
-
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 X11VNC_DEPENDENCIES += openssl
 else
@@ -61,10 +52,4 @@ else
 X11VNC_CONF_OPTS += --without-xdamage
 endif
 
-ifeq ($(BR2_PACKAGE_ZLIB),y)
-X11VNC_DEPENDENCIES += zlib
-else
-X11VNC_CONF_OPTS += --without-zlib
-endif
-
 $(eval $(autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
