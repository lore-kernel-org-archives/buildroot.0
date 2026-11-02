Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424FB606A32C
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 22:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=oYMcLc6s
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C7576060A;
	Mon,  2 Nov 2026 22:49:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M_dVcwlBdGUd; Mon,  2 Nov 2026 22:49:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 037DF605FF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793659777;
	b=KsTdl1asgVxdIh0GqAbudJDKt+RxwgESJUXhlvQxPC2Cxb0fpWpj6LSD7nvHYeTaHmgw
	 1TNlWV3f5tyX7uHPcfU51L4J4CPfVPCmpDzzPeH0o+uF/NE9Sw13aSwO5WrYTMpOPjMK7
	 LuNDlAFNXAFT8Q0bNzSpuK2oG3LLwtUOP09Dl28epfqTq1iqHFZg8X3iWyal13hlbzcNq
	 Rk/TdrIB4g3luA70wPEbESuWK6CzCXeX5gxLlsklgt6AYaWRfVBd40vCGN31LMOnShAkh
	 wGcvcZSG7TDWg8O5BIWMYVhO/9dg9k2FCB4itl+aO1itDIWs5Q8t1SWgCdgJeUnrRJQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793659777;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=//teD7mg3ye3ET6crOEcdSP2biAgzUFaBQK1YefwBXs=;
	b=DjUyU5F3ywC7Fh6KEr1SLfR+3LnBvD/Y3S3kR+mRRM5o5NKDS/f8pA6iDTvQ3VHlXPqH
	 IfQ8rqFZfaUmLErrkU0E3jl6QIcjDWwhtIHOPqCqVEP7svM2iX4uyKlvhMJ2Tgad5JC8N
	 Ot9GfCHvm3YuYepKYN4TgbGRh4bEepKGLo8VsIIfP+E5vzB4s3Vk5CV3t/cL5pTf8vpj9
	 hJrHpEk5Tq9pXpEfasZqkdf33QUQ66y6z1+IPMRqki5erjGFqmxihTg63AMTPuAcSiS2F
	 /DsxUrl+JmbdnO64lFY/67plgvSiTdCf0Y1THoOL+O08xX1Nk9iDOpCVCex/OZVt7Tg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793659777;
	bh=//teD7mg3ye3ET6crOEcdSP2biAgzUFaBQK1YefwBXs=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oYMcLc6s5gZH6uar6QK3/iI4jC3X0ANXGpWJ821xExrfHLtRXHVdrgzYHSTG5huD3
	 F5NLiEuHOY4BZbxy/LaO70Iji7S2EC+BhW0fbFcQFFGz06tGNhc2htkhKNchgd+El3
	 OiC1VFDeYVDASDfaNlkdkyqzsU7IV/MrElog3xN+HbeGeVlgF7xlkS2IYjwP9+bvO2
	 tJ0qfTJHk8tYSR5hOYOQgdm6EzpJYrgz1iHvus4VjmJT+/9rQTyxd0pdlDhw9yphD9
	 Nm0qKPMN/mumfXHamCIbZpRoP5q+P8HPvxxZ0AWUASs5WdFX8jTfCFZTVZI6fpI7go
	 ntkATZ3L/tegA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 037DF605FF;
	Mon,  2 Nov 2026 22:49:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1544C2A8
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 22:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0698D40519
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 22:49:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RYP6BvN2qfiZ for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 22:49:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2DF6E40512
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793659773;
 b=cMiu5qQaXri8AXo32TQszseYW12dnzsGE5nKlPdvFQN4t/51tri0lQjk0rgM321ynlsA
 Ph2Te/kzewCn6SjSgG3204y5qdvgtbv7nlVrA4/EA40y3VeBw1tflAxv0a7/pJ5EZMv9O
 Ic28z6QixNoWF25mIRm9HkJREihyE9LhDQUr+nd4mY8hqYqnnyhGzkEzWtdvOAHS5bxk/
 NsM99pCarz81ajxU7JgazwCPQ7vagx0APPYJJrmCneWDXQq2i5IWABPP4LK/sUVbo3x0r
 m7UtmQUI8r7ERxv1gWCCHR3Q7T+reyJbPs4eTq7aMeHNLmafpCxtc6GF2R07RQjyi1w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793659773;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
 X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=+r3KXl8EvubFIpHGMUnPYvvvb5PsAsK2TP+pmwav5Y8=;
 b=O2ViY98YHdtyYPjcgTO+rLv/sVZ+n2Ox76LNotOTSfbpND788hY+s68hI84A4R6tdu68
 36KHRN/oMHCgnX4Dd5X3OF9GJivqPlCE3cCxjJiFeBb2jWLlmLC4D83JHEx+XB0cOVpvb
 NCPtij0GFqhoC4yxtWhjeYUr6CdZ/a903jPMTdCHQNG/hZOFox3zn2T/FKc2KpuL0SiJt
 R5ztnsjbD5lvSSojR4oRJLm01CKsZ1G/K0YinjT9qm9vMbW/qBI2jlrw6gfri171bbPQX
 AUlKt23RnA1fCr1bBpTLCCdQlcKA14mu4USxBGlcpKov9ixKun9HkxrPwm4ef8SPW1Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=none header.from=telaak.dev;
 arc=none smtp.remote-ip=209.85.128.176
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.176;
 helo=mail-yw1-f176.google.com; envelope-from=jttelaak04@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=telaak.dev
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2DF6E40512
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 22:49:32 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-8ab43af5e97so1682547b3.1
 for <buildroot@buildroot.org>; Mon, 02 Nov 2026 14:49:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793659772; x=1794264572;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=+r3KXl8EvubFIpHGMUnPYvvvb5PsAsK2TP+pmwav5Y8=;
 b=iU1npaJAW0NvB9mxLauQOufmAU9tRTxwC6y0p+FwReFEWjXI09VQ8f89c0nl8BH09K
 HOWi7Q+12VbggRuEoXP9t1fVeVrgWizQGbo6fJo/EOjmxp6vjLfS39gEKUmMNZZy1Vky
 ByQyNHRBtAk45tyMQpQpy/ihS6agTVSXDd1KYNBF9LaAdEziX4VDVBvAQX9rJyjTtrgN
 /LWJ3KbvpaBZyMpRUUIiMa/9mRTnjY0Upr4eYPhXKRdlzHs3F9hF7EQj7RGaeian5kCn
 R+eG0l0dzBO7jZXJCL64dC+RZPcD55CtUtevkSW6m34shY63QbEP5jICcXuuC0zJgXRi
 NgoA==
X-Gm-Message-State: APuU4Z+i86TyZJkXA5cJ8mhdsbNte9BcU2MQ23/8Wvqwn32KV/s3erHi
 gh/HA+pLmn3KOB66gbhGOApmWaT1I4l6VJbkhPKWYt/h1VytbxG5UQBpw7iozxJdgzo=
X-Gm-Gg: AYBFou1fJhDFc03YCd6/dUjwwkdbsBMVmrdLOsBMRR652LTDHyRTfcTTdCKpV3cTa1N
 /zVJOMZp2R7oIWe8lvSg63t+FZogjKfYxb5xrusA75TbgOIYE00q9x9re62p91X/Ba+ZGQZu2pl
 Mu4KY2LC4tmgWG6utiF8/huKITkAY09puHi48dpNJ9t4qggLbKicvfuVE9a2giffmwsZebYpbFw
 +TqCNMMl1Nfxw821krXEhJ/2u11zGekcwIUI4mUb1StB43ypvegmuaMgyHnKAQ+O9D2P9mMS9ht
 erOCvXuu/yrmysPpFhrPjUOUT7sGu2W7zLI7W7wwZ/NmtcVilGcg70F8lp4vu9rH5LqU/kAcWJ/
 cwWHGzP00HfcS6DXFOu2AyeIESQMwcFlblNYf0Wd5+5rxKCSGrhlRcZsFl3nZIweIF8kP0XXCTS
 mFdXgeNA2H39cNcdUiczcrP002olgfxWzRcdPZl4I5DYI0kUeW9mNdWnGLc2/Zrsc/jlrH5pBhJ
 YOS50ribN1ZF3ZoyCJj5efZJ63R+RJUiv8+xzhLQ0wGOge6wm4w1NXhK1A8eub6LFO7zc47Oxvu
 oqSNw7wytsFJ8ffHqOQnvlVAtwe4bUGHBp6qvu/QZZmYEbgvFvcBEn9H3cHLQ8JkGDbwzDK9NlS
 3aRvATx34MTA0PJX0pZKeWH5AMVilh9TxUWX6jS4ei14jhPQtNsnh
X-Received: by 2002:a05:690c:4192:b0:8b0:a01e:2ce2 with SMTP id
 00721157ae682-8b1c66e9e30mr80629697b3.15.1793659771755; 
 Mon, 02 Nov 2026 14:49:31 -0800 (PST)
Received: from localhost.localdomain ([71.68.170.161])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-8b2b71641aasm61638357b3.25.2026.11.02.14.49.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 02 Nov 2026 14:49:31 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Mon,  2 Nov 2026 17:49:15 -0500
Message-ID: <20261102224915.69302-3-joseph@telaak.dev>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261102224915.69302-1-joseph@telaak.dev>
References: <20261102224915.69302-1-joseph@telaak.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/wpewebkit: add WPE Platform options
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

WPE Platform is the newer embedding API of WPE WebKit: the application
creates a WPEDisplay and WebKit renders through it, without libwpe or
a WPE backend. In 2.50 it is only enabled by default in developer
mode, so add an option for it, with sub-options for the DRM and
Wayland platforms. The headless platform has no dependencies and is
always built.

WPE Platform uses libmanette for gamepads when it finds it, so build
libmanette first when it is enabled.

The DRM platform needs libinput and libudev. It also needs GBM and
libdrm, which the existing USE_GBM and USE_LIBDRM blocks handle. It
imports buffers for scanout with GBM format modifiers, which not every
GBM provider supports, so, like cog, it depends on
BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT, the
closest feature symbol. It does not use gbm_bo_get_fd, so unlike cog
it does not need the DMA_BUF feature.

The Wayland platform selects wayland and wayland-protocols even though
wpewebkit itself selects them today: that is only for wpebackend-fdo,
and the Wayland platform needs them on its own.

Every WPE Platform display compiles an XKB keymap with libxkbcommon.
Without the xkeyboard-config data this fails and the application
crashes, so select xkeyboard-config.

Pass ENABLE_WPE_PLATFORM explicitly in both cases, as upstream
enables it by default starting with 2.54.

Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 package/wpewebkit/Config.in    | 38 ++++++++++++++++++++++++++++++++++
 package/wpewebkit/wpewebkit.mk | 24 +++++++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index c624c697..3b7ea4fc 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -86,6 +86,44 @@ comment "sandboxing supports needs a toolchain w/ headers >= 3.17"
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
 
+config BR2_PACKAGE_WPEWEBKIT_WPE_PLATFORM
+	bool "WPE Platform API"
+	select BR2_PACKAGE_XKEYBOARD_CONFIG # runtime
+	help
+	  Build the WPE Platform API, an alternative to libwpe and WPE
+	  backends: the application creates a WPEDisplay (DRM, headless
+	  or Wayland) and WebKit renders through it. The headless
+	  platform is always included.
+
+	  The libwpe API remains available.
+
+if BR2_PACKAGE_WPEWEBKIT_WPE_PLATFORM
+
+config BR2_PACKAGE_WPEWEBKIT_WPE_PLATFORM_DRM
+	bool "DRM platform"
+	depends on BR2_PACKAGE_HAS_LIBGBM
+	depends on BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT
+	depends on BR2_PACKAGE_HAS_LIBUDEV # libinput
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_LIBINPUT
+	help
+	  Display directly through kernel mode-setting (KMS), without
+	  a compositor, with input from libinput.
+
+comment "DRM platform needs GBM w/ format modifiers and libudev"
+	depends on !BR2_PACKAGE_HAS_LIBGBM || \
+		!BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT || \
+		!BR2_PACKAGE_HAS_LIBUDEV
+
+config BR2_PACKAGE_WPEWEBKIT_WPE_PLATFORM_WAYLAND
+	bool "Wayland platform"
+	select BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS
+	help
+	  Display as a client of a Wayland compositor.
+
+endif
+
 config BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA
 	bool "multimedia support"
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS # gst1-libav
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index ce4d1ad9..f9266d1a 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -94,6 +94,30 @@ else
 WPEWEBKIT_CONF_OPTS += -DENABLE_WEBDRIVER=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_WPEWEBKIT_WPE_PLATFORM),y)
+WPEWEBKIT_CONF_OPTS += \
+	-DENABLE_WPE_PLATFORM=ON \
+	-DENABLE_WPE_PLATFORM_HEADLESS=ON
+# Gamepad support uses libmanette when it is found
+ifeq ($(BR2_PACKAGE_LIBMANETTE),y)
+WPEWEBKIT_DEPENDENCIES += libmanette
+endif
+ifeq ($(BR2_PACKAGE_WPEWEBKIT_WPE_PLATFORM_DRM),y)
+WPEWEBKIT_CONF_OPTS += -DENABLE_WPE_PLATFORM_DRM=ON
+WPEWEBKIT_DEPENDENCIES += libinput libudev
+else
+WPEWEBKIT_CONF_OPTS += -DENABLE_WPE_PLATFORM_DRM=OFF
+endif
+ifeq ($(BR2_PACKAGE_WPEWEBKIT_WPE_PLATFORM_WAYLAND),y)
+WPEWEBKIT_CONF_OPTS += -DENABLE_WPE_PLATFORM_WAYLAND=ON
+WPEWEBKIT_DEPENDENCIES += wayland wayland-protocols
+else
+WPEWEBKIT_CONF_OPTS += -DENABLE_WPE_PLATFORM_WAYLAND=OFF
+endif
+else
+WPEWEBKIT_CONF_OPTS += -DENABLE_WPE_PLATFORM=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_FLITE),y)
 WPEWEBKIT_CONF_OPTS += -DENABLE_SPEECH_SYNTHESIS=ON
 WPEWEBKIT_DEPENDENCIES += flite
-- 
2.50.1 (Apple Git-155)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
