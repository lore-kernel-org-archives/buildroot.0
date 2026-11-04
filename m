Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D724606BA26
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 20:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=sFDAj9+9
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FEBC40899;
	Wed,  4 Nov 2026 20:52:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2xi995AiSyKE; Wed,  4 Nov 2026 20:52:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EC13340874
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793825557;
	b=EHcwf1iUXcdGPCEQxZ6YBEUJUUjf8zH4EEQ/GZfVdilwrTA48/FoV4onItva+aKNAkTV
	 kLg4/HD3l66dGPaoYiTN6ZP6ZseY5w8qHWf1/Bo8qc3TAk78RvDuqH5gaKLKZ7NV8nOnR
	 rNy0xvP3baLMWixOyDz8eQHVbo2z5sZcJhpxNZih+hp3UBDhyhB/sWfTPREmZnxr9w2Iv
	 2H0eSLpjn99VreNCqatGYFacvBCYX/AK4nMHHMv31G9Y0uez4hfF71GfwqYF92cZ8Nxez
	 vt+v003E5dLa5Cv9X2oIJmvPxffO2tpboBhtgQ9LA5/XeM6KPNMyFP9b3tM/tSov9OA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793825557;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=gWNGupyBVlRu0rTrQMK7XIyyN6YynraNVi5eT5NuaPI=;
	b=mJX1YHTLuRAOtrF4p7CjqEXBuopwt5Vnm5RSAdU3SWrK/i9fSUdjAyV6QBwJAWdRD5vf
	 ctZWmVdUEny4TBz2N6udzitnklMDMDxWdfk2jKlb+i2UPKKopAVKIkw8TCWGQQeZS6eqC
	 1voq7jYK96jDBN7wGbyxmoMICoXDYBRaoECu1LYF2dYOGgzcqcdMdOviGQRwBxp5mrGLM
	 pYtxk2cEAwjrrBjUxFR+Zq9nKeIKrigeX0SipDsKGMAga/ahHUFOXMhq6994tn9mWEbGp
	 ED8eD0gPp38pVfA42jx24qGoHJ3QeS+/qhcDfDrw50sDNtqfcyc6oCaRyeMzZPRSmQQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793825557;
	bh=gWNGupyBVlRu0rTrQMK7XIyyN6YynraNVi5eT5NuaPI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sFDAj9+940XBRhvFZhCud8m1MioeAPhB87bEIY24yTCUsm+ro2PbCvdN5aEAorwVY
	 mMH5aQSW9ILXe8tvxVfWX4/v4rYiE84KbxN9D95Ozr4hfuQf+tN9fgXwZuwPq44EeY
	 UrcAAMaH3q/FO2gnPIMY/zN1LLZ6EaJVfkmFmRqcXozZzYtCn+C4PnUYJlVLg95GP/
	 mYIvLePVzsjlnI+6LFy4p0QLl8/F6IwkQ2UUFADxFNRl78kkamAAS1lQb7DmrC5sxT
	 54i03qDuXHN6xksnUdgyhjJrulvMfBEpoiyWokvTx/63pWOqoq4K5Z7LlTxkCTR96o
	 t1SgmS7P1Cf9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC13340874;
	Wed,  4 Nov 2026 20:52:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C307AFC
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 20:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CB7A4013C
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 20:52:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mSV34KGq4gyR for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 20:52:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 7706B4008E
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7706B4008E
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 20:52:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D89B9DE08; Wed,  4 Nov 2026 20:51:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 21:52:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c502c8d6103051bb8286b591d7d3ac5945d7bdf7
X-Git-Newrev: bbdf77c6c87d930594f2cb0b5029c671cde2408f
X-Patchwork-Hint: ignore
Message-Id: <20261104205103.8D89B9DE08@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgtk4: add missing direct
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bbdf77c6c87d930594f2cb0b5029c671cde2408f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

GTK links directly against libdrm (mandatory on Linux), cairo,
harfbuzz, libfribidi, libpng, jpeg and tiff, and the X11 backend
additionally against fontconfig, x11, xext, xrender, xi, xcursor,
xdamage, xfixes, xrandr and xinerama.

Add them to LIBGTK4_DEPENDENCIES so that they are always built before
libgtk4, and select the corresponding Config.in symbols instead of
relying on them being selected by other packages (pango, cairo, ...).

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
