Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1440A60703BA
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 16:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=R1Lcqfpq;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dJVkTQyK
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCF51810A8;
	Mon,  2 Nov 2026 16:05:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tPVkxBhEP7Gb; Mon,  2 Nov 2026 16:05:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C58338108D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793635514;
	b=WcEPT/Crwz79MA/XcuAO7DllX/aZ6vI9aCQBdgBR6Q4LREAfo2kkmgz9GPRZTliQuyN5
	 dyZ1PMY+BSRTuv7f1QFRyghSGeXgW6TGGcqXr/rOY+bBsOZAN+AraH9Q+q4igQfiGEYtO
	 Vbq47RiXDPXJ76hzYNjq1rSaLOdbYFfD+sJZ1Pi0gCJoj+O6q36mYt5EqYnDpGXovBw93
	 xaDnW8wKmEUnIWVFeTZtx+QK/cEMTpr/V13vPLpXnVPyyELlyhhQtnWM6zhaem6E6QDAi
	 dTdV0KQpacj6wHuxVnaYp7NQlkztMdOd0dWrnJQdlJxvtsELFCGOEUnZzcBo7OrDCAw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793635514;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:X-Google-Original-From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=XgrBFdHgwR/finhZGDyC0tALncEQBjjCpslg4zdd7OM=;
	b=qj2VOphh3oe/wsbZQaHTwsCgxjLhzLxl9hL1QmVrkHOfKvEBbHw/4CiyAlCMxAgc1VgA
	 2Ql5QeRQdUN8sg2akFLr6r7cLH++i/OGBKJMMk/mRtCTtc0JWnk4cNixOsGHPR/gHk4tu
	 rJ/W1+Sxh9X3IqG9/MzWHnA6O+VPgvq09ZQBY+i1yOQpJDQfeE8+IIsE1hq2MVDobKL+K
	 TdQQGLwqKTES/uWMDUT3UfbW7nYtxSLKrO2cjEO5nr1/bsgf42AjmyKmKLd5pZs26f1dg
	 L2oxEtRmOTF1ZI32eIJ9WORk+sBSMB2OTTC/ayCRCjHrnWlYAZa/DTF4r9qbK03EAMA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793635514;
	bh=XgrBFdHgwR/finhZGDyC0tALncEQBjjCpslg4zdd7OM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R1Lcqfpq2QRZAiw7gjoqJ6P+C+3dxcCF2T5NF9XNPlRh3d4P4jAwGAQjNFCCyUIWu
	 8alWs2hVhctuyJkFjov0wr/KN/cpjN8m+IJe9WsfQ85KZaMU1U6tQmeMmVex30Lguw
	 uyIpiaHdP2GF1jmIxd3gxrMZ9sr00ow69t/8jOnBm0Rce5XxNmDvNj8YS89KzReTK3
	 8jzu+/5k5r+naSzCCMaYaAzJRC4hywqCKVUH4XZw0VosxS1W6KuD07UKDYOmr8gdks
	 WCaHcbk9vjXUm2REb5QbMgKuIRvz6R3dOdfb1fQCgbDkNlMGRsD211HYi0SsVKH4b+
	 tP5r1pNGqNmcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C58338108D;
	Mon,  2 Nov 2026 16:05:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9873ED3A
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 16:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89FF4400D6
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 16:05:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VZrAEq8_Lu8N for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 16:05:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 545D24007E
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::434"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793635511;
 b=Geny4BadeX3ZulRIh4GZTmzGNvxWmIlb3FvYiGZlhMcHlPiT7hI1oCKBTPaP5R8w4uai
 vPH2LjIDhdt86Bp1feI+osf1xg1OfJ9fXOsH41N/Z+3Ri+VZVqZba77OmA9MWmdLC6gkC
 8T4O/eEOOGTNnYF/iJZr2+IHHzYNtHOVGslZpVt6mgOoAj8V8JhqCIa6hYTzG7ZpJb+JV
 ojeYQkQ35YQgsiNFSfUqgWmiRWiDbUOtUDijETmINZ+R4um3/sG2b0NBfW8NpbLlvpTC5
 9NICAV6wx3hMg4c74flCZo47bjsiXyVP6n3os0xaZgE91HW+//9ECFw0VdvQ1w+zw/Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793635511;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Sender:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
 bh=MgSvARsXhA5dVrRbUM3790+UQt4ZTcyJfJsUpJodBDI=;
 b=P9WPsxIP8ORIYpg9Vl9MNJ95EnaubIp3lYc14275TciesUALKRSVbat4FNtX+CWb1R81
 3Zf5Msz8oLQYioqBNJpMObt11Yda7n4ykUwjLk6TPRmN5du44DjJS7toOStCkyqWKNnRF
 +DUhuX30AQR3U5iN5faxI8fGJ7DmcEmg7faWJIKBExw8o0kQNmDiz3tSvzfnl8K6bfBPv
 I4zj96W8pj5oy7Ek4OBlTZFKvwcXHyXa2ZKlB9QHuUvgr6TtFVdtyGlNs09FblmTIQ90Y
 OWG1TE1Gq3iBzttEZzloSMM3kFBeh/rqrK1zgIQTcr5gBUrACpYATFCN1v2F8OTk+Jg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=none header.from=devoogdt.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=dJVkTQyK; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::434"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.devoogdt@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=dJVkTQyK
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 545D24007E
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 16:05:10 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-48dfdd0678dso2241526f8f.0
 for <buildroot@buildroot.org>; Mon, 02 Nov 2026 08:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793635509; x=1794240309; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=MgSvARsXhA5dVrRbUM3790+UQt4ZTcyJfJsUpJodBDI=;
 b=dJVkTQyKKfQeo0+K3Ed0GrgfRhk29/C5ruKJx8akGHGBWnGlMYGs5mkZ+Nxi4DG2P7
 7LK9bldX4njjStIB408ylzW82gdsBxnXr1s9+UoMRGK8kByYLx7Vv6O73dJwnx7NQmCD
 pbuSZB6fC81jHNDNAUOgHtHOlo2HvQ6ZeM86auAWwT8cPsEGpZilNmYEGWojBuvkX7T3
 CFmz3UeQj1j4U4Abp0psHaN9rMb3rH1Of+mNX2i8HfDe7tuO6K3ISt0NoURH9VQrFyQw
 XGCSDqWFGHRZqaA7TsIwbfoWL27CrGw/QwRx79UZsbCAzdszr1aWdcj6KXOjcUzKpBlX
 mwtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793635509; x=1794240309;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=MgSvARsXhA5dVrRbUM3790+UQt4ZTcyJfJsUpJodBDI=;
 b=UeEWUkNtE45osz5oXAfSF7Ahl43Jgs8KOefdgVQ8ZqcEaq3KEXf3gqUkaSOmfvOu9X
 r3VAJnOY61dJtavY1Xeg2e5nn9aFMSfgW8MLcbzmAboPk7Hlp1qmUJBLpDE7sxJrzSa6
 LyrXwXtWkDLgyAxEH8/1siRsf3PDhqw2hpVKsa90zJECysS8x8bYZcB2eLZmM5i9qIm9
 nhZ48NZ/qOp/2hzH8xECo1SgdTMgX8ymqADUHnOKfvVuwkAyUfPNEd1Uk6DMgVIGW/hL
 2XJ3DHBtCHS7P6XnWWoeRT+Xu9S4/+ar1p7uoCGMsiAtVJDv2l+2X8D3QUA5D0E1F1pB
 lCWg==
X-Gm-Message-State: APuU4Z+oX0GsghQspFILaM5P0ByiDRv2qO7Q0LuGQVOYHZ0Abv9ohFr5
 oT3CZhDcF3ffpk/gdxXiNxKdaZZU2OzuIJK6RNoINmkl0qMEIWdY/lpnxBaZOw==
X-Gm-Gg: AYBFou3TzHvPg1sS5oOzKW+YE2F98x+LMzb64urjfK2Qe1by0Q/ujvakfGtS1m9iPFv
 ZfxZ/PW63YRO5qYu0bm3OqPHRszsSeVCDX5Bavu1UZk8aRMWpAp1c12oIm/DafrWxDeED0sfi1p
 xXzQ8wWnO0kkQqNR7Ogenj0pWYq3p5eYGs3CBZkUsE+bn0I0fnHDgQvLUzLd7ZHk0ULNbF04gZM
 j2buoU6jGJLT2VtUKYiasgQI+L3KmNEhPTtEQ9Wk7y3yNiMaED7/+8vw8AwDBBmS1ZYqmDHvNf7
 U/G0Bw++Ga/HkzMKuGnSSHPF+BpTsUsgs4NqLw9IEsrriFbwXmttmBiNI5DS5UF66hx3n2BjSaG
 fFHysIwZ4s1yVIJHHLY5spnM8AYP+ySV+/tZ0MD1mnICGgpZ0SQteB/fFH2tb+hL+Wwnz1uhLSR
 7+bwa7jGnczQ06BboKie+M5m3llCUckzeS/hjekRgRH7ceRmAthsLzQZfVqtZc4Poe+zbJHC0Hx
 h5XouPCYMyrrFzS4dRktOBWMs/Zx25oIUeZmysesKPpB5ap9uSUC8EeGJsQcmj0t0YdCbR8jnAx
 8MzLPHyvpD+cGVNUxNjstv85e5I2qOuOXDLfsysIEHufNQT85pfmzh3gJH0Q5DZBk+1BGcTtg6Q
 T2lRK+RoiTf1T8/ilf1NPbdvdf7nCfxTHHnw1vo/CI9YIB/7DIdX+JBqVdXAHmZfiI+vpCSa28S
 AIm2CTithzhLi7dtLsDLFOueo=
X-Received: by 2002:a05:6000:454b:b0:48c:49bd:62df with SMTP id
 ffacd0b85a97d-48e6e2bc9c2mr15137862f8f.1.1793635508616; 
 Mon, 02 Nov 2026 08:05:08 -0800 (PST)
Received: from KORLIN40066.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-48e71b9eaeesm20789169f8f.49.2026.11.02.08.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 08:05:07 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Cc: fontaine.fabrice@gmail.com, thomas.petazzoni@bootlin.com,
 thomas@devoogdt.com
Date: Mon,  2 Nov 2026 17:05:03 +0100
Message-ID: <20261102160505.1754919-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <audrTUDPjZfZpyNG@windsurf>
References: <audrTUDPjZfZpyNG@windsurf>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/libgtk4: add missing direct
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Thomas Devoogdt <thomas@devoogdt.com>

GTK links directly against libdrm (mandatory on Linux), cairo,
harfbuzz, libfribidi, libpng, jpeg and tiff, and the X11 backend
additionally against fontconfig, x11, xext, xrender, xi, xcursor,
xdamage, xfixes, xrandr and xinerama.

Add them to LIBGTK4_DEPENDENCIES so that they are always built before
libgtk4, and select the corresponding Config.in symbols instead of
relying on them being selected by other packages (pango, cairo, ...).

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v2: split in two commits, see https://lore.kernel.org/buildroot/audrTUDPjZfZpyNG@windsurf/
---
 package/libgtk4/Config.in  | 12 ++++++++++++
 package/libgtk4/libgtk4.mk | 19 ++++++++++++++++++-
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/package/libgtk4/Config.in b/package/libgtk4/Config.in
index c1f3928b8a..13494fb692 100644
--- a/package/libgtk4/Config.in
+++ b/package/libgtk4/Config.in
@@ -29,8 +29,13 @@ config BR2_PACKAGE_LIBGTK4
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_GDK_PIXBUF
 	select BR2_PACKAGE_GRAPHENE
+	select BR2_PACKAGE_HARFBUZZ
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBEPOXY
+	select BR2_PACKAGE_LIBFRIBIDI
 	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_LIBRSVG
 	select BR2_PACKAGE_PANGO
 	select BR2_PACKAGE_TIFF
@@ -81,9 +86,16 @@ config BR2_PACKAGE_LIBGTK4_X11
 	default y
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_FONTCONFIG
+	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXCURSOR
+	select BR2_PACKAGE_XLIB_LIBXDAMAGE
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXFIXES
 	select BR2_PACKAGE_XLIB_LIBXI
 	select BR2_PACKAGE_XLIB_LIBXINERAMA
+	select BR2_PACKAGE_XLIB_LIBXRANDR
+	select BR2_PACKAGE_XLIB_LIBXRENDER
 	help
 	  This enables the X11 backend for GDK.
 
diff --git a/package/libgtk4/libgtk4.mk b/package/libgtk4/libgtk4.mk
index 9a5ed651a8..395e850de0 100644
--- a/package/libgtk4/libgtk4.mk
+++ b/package/libgtk4/libgtk4.mk
@@ -17,12 +17,19 @@ LIBGTK4_INSTALL_STAGING = YES
 LIBGTK4_DEPENDENCIES = \
 	host-pkgconf \
 	host-libgtk4 \
+	cairo \
 	gdk-pixbuf \
 	graphene \
+	harfbuzz \
+	jpeg \
+	libdrm \
 	libepoxy \
+	libfribidi \
 	libglib2 \
+	libpng \
 	librsvg \
 	pango \
+	tiff \
 	$(TARGET_NLS_DEPENDENCIES)
 
 LIBGTK4_CONF_OPTS = \
@@ -46,7 +53,17 @@ LIBGTK4_CONF_OPTS += -Dintrospection=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGTK4_X11),y)
-LIBGTK4_DEPENDENCIES += xlib_libXcursor xlib_libXi xlib_libXinerama
+LIBGTK4_DEPENDENCIES += \
+	fontconfig \
+	xlib_libX11 \
+	xlib_libXcursor \
+	xlib_libXdamage \
+	xlib_libXext \
+	xlib_libXfixes \
+	xlib_libXi \
+	xlib_libXinerama \
+	xlib_libXrandr \
+	xlib_libXrender
 LIBGTK4_CONF_OPTS += -Dx11-backend=true
 else
 LIBGTK4_CONF_OPTS += -Dx11-backend=false
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
