Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF7F606A868
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 22:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kb2jsAfD
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9992960820;
	Wed,  4 Nov 2026 22:15:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CWLl6dE2gZb5; Wed,  4 Nov 2026 22:15:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BA8D4607D5
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793830549;
	b=pgsy9g5P2Zrhg+bNRSZPtG+Xy1xfnDiPc0E2z1BfKrXkcwJ0KDRdKHUw7AoQ2vjFyUAA
	 3SGuoC49rjQ0csBxDn1HacIwNGXjStX7eQE8aJi2SyfGSaCXQnh1/MQv7Dns2Ptvbx9Eh
	 mxEAZP/HfvCFSTtx/OMobFi0PLrzY78JDJRIbKavmBBbhl0rh4s3ik5el/MklMqQEsm2Z
	 Crr+CpK8BxMRoauF6w5aYsfrZQEEqcDP+OxzQp/G1Ht+qhJdu7+5pZZsp2/1NC1IStdCX
	 sOxH9P+J0pCertWFf3w/lPB48rXcnSE9B5rxUbCpzbIbf0TwWSEIGIs4ULM5C8ju8qw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793830549;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=yC5uvn2VhDh9pz4rTyTzaX2WHs0aKYBEnngT/eeZ/F4=;
	b=HBomLrHUvBgo6sKmTgi4ccYOoSHI8WSsxsns5TmEQ2e+whcWuKd0wZspsZ0iJXFUD7Zr
	 Hi8DlGK4uswCRpGYCRxqvWF6JSzwbrF3SZZbNg4vvYgQeRPnPmvRUtz3atHmgXo7FqtBv
	 DOXAAgoVfI//jThyWXpGfBuxCAb/lMOrFQh6uj6cA7sfJphfKhaaDVWvMIq9HjI1xA4WS
	 4pZk+Yiq5u0hgNX+iaDrxyZGG76G2FZAGJp1sYI1C/Xis1MoUo8s+L+IQCN/hns2WumBB
	 ja8JEGgpAQMJerwI/7Mlz65bi9/KAqmtWRYzxCSBwSw9omQN79CnwApt8YRnVGuSVEw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793830549;
	bh=yC5uvn2VhDh9pz4rTyTzaX2WHs0aKYBEnngT/eeZ/F4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kb2jsAfDu7BKBth/xwBO1/Xoj3s67gnIe3BpgUl+WqIy9bFm9w8xIPLPFEzjjU4jg
	 aI3mfqFgH27s7ZrC7XckBzcpIJmUhrPncfPTbQKpSMxA9L5dz39Go0VRtw/t0Hj6iS
	 AGMFnm2OXFxBTlAca+rA6eHhcgfOWS4Uex4En1XIh5xMepTLVcT979FDIOi8Me1fjk
	 if8VBfvxS5H/xzDr/Ktu/2Osd/8K20bIPi3NYw7Vh+G53TGHcypOHn8YxcMnosxvYx
	 4uox8vj8S/h/a7k9CZmeR+wcFclM5q2j08HD5x0fUo4qneuD6IEP5sm3YSeNREMOVE
	 ymXSKHk8ZjrkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA8D4607D5;
	Wed,  4 Nov 2026 22:15:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CEF4AB00
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:15:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4D1581285
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:15:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XJT8x78PQnaG for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 22:15:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B2A8781283
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=209.85.128.43
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.43;
 helo=mail-wm1-f43.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B2A8781283
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:15:46 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4a140e7405dso11109545e9.3
 for <buildroot@buildroot.org>; Wed, 04 Nov 2026 14:15:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793830544; x=1794435344;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=0p7jpdTxaDaPjHHzorzKxLHGiGcNybxbAVDbrAhu6yg=;
 b=ARmK7ouZgW/gHVvQi0vGWC9zgwW29obbrHfsq4aygTFY4Pw8CPmt0WXHEocHIky5xU
 9rhIcWth3PtNAI6rVOSlaHi1k5HnfMTE/h0tATZnieEnRBbquJQv+oBwp11h9e96YagE
 NI8/CkorT7IS0h0VKNvPN45LQgEHJErLB+nyU7ThjVeq9SY31yMJVE4yeBMV6C5UVSCl
 YRfRz/3wzS8AzvOG5CkA/mYjuH4GMu4yp8K9e/VEtoGnBjtB6X/j8qYi/EbOqZ28Wpet
 CTirqXQm7qVh1Pnfx8gIZ3T6HxQk9o2Wo6VK1yjRz2YpoYexq4tEXP1rQI5dbCRY3jBR
 8qrA==
X-Gm-Message-State: APuU4Z/+9yQdVXgIFJNnXG8PojU+nQ3gqSRUj89RYHozUUkkJ8UW5XEa
 Gnr2KXxNoBvOzZI2huZLeu2dpRTS/UjS7Cj9Cwxd2twv295zapYjgAh4
X-Gm-Gg: AYBFou0v3Emlh05ZZT3DHnHAeaARuDqM5zltoFve4Z8uv5KwBfTRCvsN0uFpIIS9KSd
 vonh49x0K/hwFd4ipS2GuVmAqXMi7506QHWM3gXEXJMjnGkkUM85VLt1QHgjTRCt7WMWdbNcd8z
 OMGWSabYCxYp+3JB8u7i2mZxYtBNeXEbYeIRxmv5DTVfBGP5obbUwmzdmpTex2f6OFV3xFMg7gR
 /yM4OoVXcI/vYX7ITGj2aL6znuvrL5UkGLx7mN62+ADyCLy3kVEuNt00M8HjF8SIp1uXH2SxVKF
 EjCgrhDL+9FK02/FHVX+AQHqcuCypOwGR9s1V2965TOirR+YEsRhQrr4/viFmpTdn+wVf3uIDX3
 VPqv+uYOLyPQhQFbquTUltroKs8k/t+psSwIMGoCbJQxZSrXzd735Idn0jLgoVuWfIjn+F1D3c0
 /M4uT3ipJwxfdBmZ1ga7njT4PzLmDT22x28cWisRjILUt+oWHp6we8LHfIZ8rMJbll7vfT6cfcX
 gU1lo0GAqCNhfVFmnH9vf66LfR1wHTGqKZNUiUuhiNLEZ1icMHcPzKmM2C1noJrnbxBVs4mBGKk
 lSB3PZmuBeHGjLos256dhrNvTS7q5g7VCHYxN8/Y/Q5Pa58V8fSOqwdgsbWLM5d6PWoGWd0BXJe
 PeFNu23OHuhXJjACd+TTwOrWfdukz+Qgva7n414IaqkoOx4fClE2JtYsZgsc3zLlokx2c13dC2v
 i94Daok3rUyQ==
X-Received: by 2002:a05:600c:4e48:b0:4a2:150f:1610 with SMTP id
 5b1f17b1804b1-4ac183d16eemr369599685e9.23.1793830543994; 
 Wed, 04 Nov 2026 14:15:43 -0800 (PST)
Received: from KORLIN44614.barco.com
 ([2a02:a03f:eb5f:fa00:eab4:ea85:6b5e:333c])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-48fed552afcsm6086664f8f.41.2026.11.04.14.15.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 14:15:43 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: thomas@devoogdt.com
Cc: buildroot@buildroot.org, fontaine.fabrice@gmail.com,
 thomas.petazzoni@bootlin.com
Date: Wed,  4 Nov 2026 23:15:41 +0100
Message-ID: <20261104221541.391611-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CACXRmJiBtFOHY4_nTtkKXn5CwN0BGJ+vz6b4bCC-bd1XX2s+tw@mail.gmail.com>
References: <CACXRmJiBtFOHY4_nTtkKXn5CwN0BGJ+vz6b4bCC-bd1XX2s+tw@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/libgtk3: add missing direct
 dependencies
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

GTK3 links directly against fribidi (mandatory) and harfbuzz
(required for X11 and Wayland backends, optional otherwise). Add
fribidi to LIBGTK3_DEPENDENCIES and harfbuzz conditionally when
BR2_PACKAGE_HARFBUZZ is enabled, and select the corresponding
Config.in symbols instead of relying on them being selected by pango.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v2: only mark harfbuzz mandatory for X11 and Wayland backends
---
 package/libgtk3/Config.in  | 3 +++
 package/libgtk3/libgtk3.mk | 6 +++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
index dac2d179746..0a45284ff7a 100644
--- a/package/libgtk3/Config.in
+++ b/package/libgtk3/Config.in
@@ -30,6 +30,7 @@ config BR2_PACKAGE_LIBGTK3
 	select BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_CAIRO_ZLIB
 	select BR2_PACKAGE_LIBEPOXY
+	select BR2_PACKAGE_LIBFRIBIDI
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_PANGO
 	select BR2_PACKAGE_GDK_PIXBUF
@@ -72,6 +73,7 @@ config BR2_PACKAGE_LIBGTK3_WAYLAND
 	default y
 	depends on BR2_PACKAGE_HAS_LIBEGL
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
+	select BR2_PACKAGE_HARFBUZZ
 	select BR2_PACKAGE_WAYLAND
 	select BR2_PACKAGE_WAYLAND_PROTOCOLS
 	select BR2_PACKAGE_LIBXKBCOMMON
@@ -87,6 +89,7 @@ config BR2_PACKAGE_LIBGTK3_X11
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_FONTCONFIG
+	select BR2_PACKAGE_HARFBUZZ
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXRANDR
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index cbe49b87161..078d348c1cb 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -15,7 +15,11 @@ LIBGTK3_CPE_ID_PRODUCT = gtk
 LIBGTK3_INSTALL_STAGING = YES
 
 LIBGTK3_DEPENDENCIES = host-pkgconf host-libgtk3 at-spi2-core libglib2 cairo pango \
-	gdk-pixbuf libepoxy $(TARGET_NLS_DEPENDENCIES)
+	gdk-pixbuf libepoxy libfribidi $(TARGET_NLS_DEPENDENCIES)
+
+ifeq ($(BR2_PACKAGE_HARFBUZZ),y)
+LIBGTK3_DEPENDENCIES += harfbuzz
+endif
 
 ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
 LIBGTK3_DEPENDENCIES += fontconfig xlib_libX11 xlib_libXext xlib_libXrandr xlib_libXrender xlib_libXi
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
