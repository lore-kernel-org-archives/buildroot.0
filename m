Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C51606A31A
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 14:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TWlVX7cd
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 092A4406F6;
	Mon, 23 Nov 2026 14:41:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id loxIH1ttoblS; Mon, 23 Nov 2026 14:41:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F37FA406ED
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795444892;
	b=VE9qh9iAC1vAN3LbVWMnDupNllPQmezthzFtWc+2AlXW++pWpQBCKc2RYXkZYPDLPhlq
	 q911eQUVbCsxu4SG6QenGd/Zu6gkgKG6CmnIYdQNuEf2FqdaOQ/4RHes9sxWNbHc4utpl
	 QXz/CL73mv2/gZxM94qEpoKEd0RyeOOX+Lvw/Z+bTTzsNUcMDbf8rENC2yj8DpK8gwNQV
	 NQwcdsfdsHAyQO6Bxm96B/qiPeZ8/L5I8+wg8JIebixL4kImDuQdBqJ42cQPpgz6VNhBy
	 H5auukj+4Z1jeei+CvdKNjmRYo3tkmvKDO7gkT3V0kgxm+wA3F6RtJCA5YT5NG4jzbQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795444892;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=96+6W6ton1EqVoqi687mFO82uO3vFLeAYNQooeIGwCg=;
	b=nh7YkgGoIgVGSX39Wwz05nk4cCx+YSn01s4GW5TY3/RzLCVjZWQdNNaEon1gfM2ny0Dh
	 MZt9h+19JiT1I4nLH7/lTFE6k4pbAUcHJE3Xjgtj5JtSPlEPmWUvMwo4LTkUR2HUCMg0v
	 p50oTplCu7pWZvB/lbR2rNbSsABy1lA2r9KTpVtZa9vqo77kTuBoDenuAfVS3M5BYMJLl
	 kOtqNQVJ8km1/tfQCr4TJy7EZY8HNpauZz8lLS+/YKxdFUAQT311ccPfOqUwlxcWVRa87
	 43BMHEmfMbCK6y7F94aZUDcppS2CN981u9e6gEWwdL+xeIPht34vvHjIYpplGaiJwug==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795444892;
	bh=96+6W6ton1EqVoqi687mFO82uO3vFLeAYNQooeIGwCg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=TWlVX7cdnsKwm9iDtQ3qAGqIhJkZIw9CI6bJDv9itSnylSoFZghguGFaDDBer9b62
	 77O3lDdD7Ic+O22JTR2MZFC53NLGih6QZNOAt5ud1DnS9V6owdv3mBYJUOaOv31cJp
	 3H8Z54Yax6DrPIG3vqTyMaYht7LuXdUyHX2z4IpU0tZGor+N+5NyhUvk2BCDyQdy7r
	 XOR8sKUKUshlEqFzmlAIDc5j0mnWVLd4+n6yC00c0WXRTrbONO7j4f9g2++FTouyNM
	 J6DTjBhb6dtE2HLNWnWmXlHoNsLK3id8MsS9/m3IlXLDakEE0x7MZvYq276P8DGnrn
	 12yctvaRwKUjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F37FA406ED;
	Mon, 23 Nov 2026 14:41:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 075BC499
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 14:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E117A406ED
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 14:41:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vYCG76zobyv2 for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 14:41:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6A1A3406E8
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A1A3406E8
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 14:41:27 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-c4cb6834eaaso568608866b.2
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 06:41:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795444886; x=1796049686;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=kIMOLb0avizqWrOYGcerdzx4Ct2huORNkYofdI1ZCzk=;
 b=b/tfBW2D5fgBGB/AjRoSbUi37HQHjvPDW2z9OZY+4y+LJ1ZdB0dy6nb7xnUdaaYpqo
 rI0gezP7453+cPf2XQBovYM7VVW2HwHSMmWE9V5fxcF5Y4NWnS4XGbW9kZzC1sRHudeW
 yPm5inpd12pC/TV7W4RvhBRs2/U78jHXaftgQo4WAbGbkwyc04kcykAoo14HosTw8RnG
 h/nsHoapFrHc7obIrOIBHjXNYBG8pnU8ApzJ+6LmANfAva99MoLa/htJo43pxG8MfFM6
 MCslLENB/GJ/8wHknMIj+LMec6FZiJf/GCE1GN7wte+yPES8ELlrFKi5GuoClomlTukc
 7qWw==
X-Gm-Message-State: APuU4Z8h6rZv8sZN974XZ7JQn01Hyom9dA2jM3rVSMmXD5s4PoR7Aw8y
 LrMl9OmPQ6w0D6Go9Iw9gis5UpXdNJqNhKlGtNolzZgWKw8SdtRC7Y+CgWBTIgWu
X-Gm-Gg: AZFdTZdLEZ6EwmxZVF50Lif3OUvDuSaNvryNcVoUsqeaL6lNobgpJbuAs3TMjkI9P/h
 Z1/nq+BXYO65zqTWX+tgY6OwY1oa6z5q79k/F+F6UjN5QcTLUdgJgk9Ip2QK3aVslVe6vl83F9Y
 YaqQsbfOtLJfgB7hqxJ4Tsj9BEZvBm7anFvf28wwAMqqDi4Rkxiqy22oLqh8QNJRGQJyN6y9WC6
 xDSJeAM93WlI0DXZc6ZKN/opl15cFQiJejwdh5eBcHEw2m9lCaofK+VsmmW//5YvSuEn/faQHXr
 z1C6IgKiCsIfYPd/GwiFtbCw2/89lU+1+NPnCPZnQr19P5wvFS5ip8aveZY50EP9ntn3XEMxou/
 LY4SyJRuLt6N003MHe+pRCVoP96EvnPtoegn5+B7vCyorSbC7EiCwYu2WsEJK8Z8dS5mZS5bfLq
 WtS6ny935q6bpgxXGjrWqnQROPLiEQ72YSgp5yXjNcBFtX9SlU3HwVbijVQq45uqtu3XErXpamz
 2mrjG2B8kZQgaZ/kPbBHei0QjwrMFNlOP/JMLWHtBxaUosUabRLA5eh2yMuN3X5ttFpuor5ODls
 K7fV7IABZPoIui5y0gLaVTfuBOjuXRfutY7etkTq+1hMpQZGcMexj8LroARbKSdParTRC9+aj86
 832k46LtOHEPFhNh6Fu1tOVzS9hXzhw==
X-Received: by 2002:a17:907:f488:b0:c4d:28c7:eb21 with SMTP id
 a640c23a62f3a-c513a8845b9mr901668966b.29.1795444885861; 
 Mon, 23 Nov 2026 06:41:25 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c513aea3537sm408673166b.36.2026.11.23.06.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2026 06:41:24 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 23 Nov 2026 15:41:24 +0100
Message-Id: <20261123144124.3278014-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/lbreakout2: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Julien Boibessot <julien.boibessot@armadeus.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

lbreakout2 is dead upstream: its last release, 2.6.5, dates from
October 2015, and the project page says "This game is no longer
maintained. Please try LBreakoutHD instead."

With GCC >= 15, which defaults to C23, the bundled copy of an old
gettext fails to build when NLS is enabled, as its K&R-style
declaration of getcwd() now means getcwd(void):

dcigettext.c:141:7: error: conflicting types for 'getcwd'; have 'char *(void)'
dcigettext.c:531:17: error: too many arguments to function 'getcwd'; expected 0, have 2

Rather than carrying local fixes for an unmaintained game, remove the
package and add a legacy option for it.

https://lgames.sourceforge.io/LBreakout2/

Fixes:
https://autobuild.buildroot.org/results/f9f2b60d894c99715f376f6b3a3d64fa19d46a97

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 Config.in.legacy                   |  7 +++++++
 DEVELOPERS                         |  1 -
 package/Config.in                  |  1 -
 package/lbreakout2/Config.in       | 30 ---------------------------
 package/lbreakout2/lbreakout2.hash |  6 ------
 package/lbreakout2/lbreakout2.mk   | 33 ------------------------------
 6 files changed, 7 insertions(+), 71 deletions(-)
 delete mode 100644 package/lbreakout2/Config.in
 delete mode 100644 package/lbreakout2/lbreakout2.hash
 delete mode 100644 package/lbreakout2/lbreakout2.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 8efc476888..a28b4d3764 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_PACKAGE_LBREAKOUT2
+	bool "lbreakout2 has been removed"
+	select BR2_LEGACY
+	help
+	  lbreakout2 is no longer maintained upstream (last release in
+	  2015) and has been removed. Its successor is LBreakoutHD.
+
 config BR2_PACKAGE_PRBOOM
 	bool "prboom has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 1d2960f9b3..c32aad4721 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1829,7 +1829,6 @@ F:	board/armadeus/
 F:	configs/armadeus*
 F:	package/abootimg/
 F:	package/gpm/
-F:	package/lbreakout2/
 F:	package/libcddb/
 F:	package/libmodbus/
 F:	package/ltris/
diff --git a/package/Config.in b/package/Config.in
index 49659b007e..cef01ec29e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -287,7 +287,6 @@ menu "Games"
 	source "package/flare-engine/Config.in"
 	source "package/flare-game/Config.in"
 	source "package/gnuchess/Config.in"
-	source "package/lbreakout2/Config.in"
 	source "package/ltris/Config.in"
 	source "package/lugaru/Config.in"
 	source "package/minetest/Config.in"
diff --git a/package/lbreakout2/Config.in b/package/lbreakout2/Config.in
deleted file mode 100644
index 3397df97b9..0000000000
--- a/package/lbreakout2/Config.in
+++ /dev/null
@@ -1,30 +0,0 @@
-config BR2_PACKAGE_LBREAKOUT2
-	bool "LBreakout2"
-	select BR2_PACKAGE_SDL
-	select BR2_PACKAGE_LIBPNG
-	help
-	  LBreakout2 is the successor to LBreakout, a breakout-style
-	  arcade game in the manner of Arkanoid. Requires SDL, libpng,
-	  and optionally SDL_mixer/SDL_net.
-	  A display with minimum 640x480 resolution, a keyboard and a
-	  mouse are recommended.
-
-	  http://lgames.sourceforge.net/index.php?project=LBreakout2
-
-if BR2_PACKAGE_LBREAKOUT2
-
-config BR2_PACKAGE_LBREAKOUT2_AUDIO
-	bool "audio support"
-	default y
-	select BR2_PACKAGE_SDL_MIXER
-	help
-	  Activates audio support in LBreakout2. Will add SDL_mixer.
-
-config BR2_PACKAGE_LBREAKOUT2_NET
-	bool "network support"
-	default y
-	select BR2_PACKAGE_SDL_NET
-	help
-	  Activates network support LBreakout2. Will add SDL_net.
-
-endif
diff --git a/package/lbreakout2/lbreakout2.hash b/package/lbreakout2/lbreakout2.hash
deleted file mode 100644
index 440ffed3d3..0000000000
--- a/package/lbreakout2/lbreakout2.hash
+++ /dev/null
@@ -1,6 +0,0 @@
-# From https://sourceforge.net/projects/lgames/files/lbreakout2/2.6/
-md5  1a9238b83f9f13f09b7a4d53e00b4e84  lbreakout2-2.6.5.tar.gz
-sha1  d92326499165fd368be04378d633e13d42b4d2d7  lbreakout2-2.6.5.tar.gz
-# Locally computed:
-sha256  9104d6175553da3442dc6a5fc407a669e2f5aff3eedc5d30409eb003b7a78d6f  lbreakout2-2.6.5.tar.gz
-sha256  67f82e045cf7acfef853ea0f426575a8359161a0a325e19f02b529a87c4b6c34  COPYING
diff --git a/package/lbreakout2/lbreakout2.mk b/package/lbreakout2/lbreakout2.mk
deleted file mode 100644
index 49db8d5466..0000000000
--- a/package/lbreakout2/lbreakout2.mk
+++ /dev/null
@@ -1,33 +0,0 @@
-################################################################################
-#
-# lbreakout2
-#
-################################################################################
-
-LBREAKOUT2_VERSION_MAJOR = 2.6
-LBREAKOUT2_VERSION = $(LBREAKOUT2_VERSION_MAJOR).5
-LBREAKOUT2_SITE = https://downloads.sourceforge.net/lgames/lbreakout2/$(LBREAKOUT2_VERSION_MAJOR)
-LBREAKOUT2_LICENSE = GPL-2.0+
-LBREAKOUT2_LICENSE_FILES = COPYING
-
-LBREAKOUT2_DEPENDENCIES = sdl libpng $(TARGET_NLS_DEPENDENCIES)
-
-LBREAKOUT2_CONF_ENV = \
-	SDL_CONFIG="$(STAGING_DIR)/usr/bin/sdl-config" \
-	LIBS=$(TARGET_NLS_LIBS)
-
-ifeq ($(BR2_PACKAGE_LBREAKOUT2_AUDIO),y)
-LBREAKOUT2_DEPENDENCIES += sdl_mixer
-LBREAKOUT2_CONF_OPTS += --enable-audio=yes
-else
-LBREAKOUT2_CONF_OPTS += --disable-audio
-endif
-
-ifeq ($(BR2_PACKAGE_LBREAKOUT2_NET),y)
-LBREAKOUT2_DEPENDENCIES += sdl_net
-LBREAKOUT2_CONF_OPTS += --enable-network=yes
-else
-LBREAKOUT2_CONF_OPTS += --disable-network
-endif
-
-$(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
