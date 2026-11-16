Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1351606A322
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 15:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LvW7g8Gq
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1126407B7;
	Mon, 16 Nov 2026 15:39:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jIFcYCZytfs2; Mon, 16 Nov 2026 15:39:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 12B3440798
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794843578;
	b=ckJ5W/WOQAbQpfTcmY2yzV8MwgmEZNQX0LRo57DqD7QeCwoCEv4q9iOzhoqi+3cJxik0
	 sYEYqqZXsSEhUU380v1ytQM/rUjG3JkHfuaAcmLRM4qs2jIKJQhPYtmFE+lvJGtePmhHS
	 2ZMlqXB7UmCLy8Q4nonRHy17vrXsR0jWTZBaq8YD3OtHV7Ev+XWc3MODDsa+UgJ6vk7fQ
	 YaPEtSEcjYf+jxccOrUzuyZGMnAOuJIH5y2A/WwQr/P1pZISzObOuvYSkexPzVDkA3UbQ
	 uXgz65Q2JgFfuIo+khEPiy1miBAeOQFONDs8cOHtjtqMrKaIwWg9bqyOk8u39B2SC2Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794843578;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=pH0rAoySeBIQf9yIECvlOMMufLxGjZZqga5JHMmtyOg=;
	b=W5XGuJ3HIj91VGG23wnLX6dXYmJxqy+H5nd2YpwVauioSp72KCLugS+Sut88Q1M9qkwM
	 dLDhCtocXNLwAHqcQBDgw6GNYpQYYDP7CDcYMG25NfzkwQIWYK9Wc0cyJaUcNTQhEDsb8
	 cYJMLKmCSid7pHD7g6ows6AJRhRA5OJDS+NJ3Z3/PQ/p+3i5Hh+p2AzIl2iWfOYG6x/1D
	 gl0eluLphFokUYtSC5LO6gTT9CT//4J9EYYi9LAksGChrRyYjvT4xiUUasjjtT5yAtzTR
	 soGTpkYvtjUvfmvjwQ6jo693DTXxAtUWI+CmvOi1P5pCaw7ijiXBZ7iC0SDhdrL6HgQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794843578;
	bh=pH0rAoySeBIQf9yIECvlOMMufLxGjZZqga5JHMmtyOg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LvW7g8GqYfQSmEBpxYyUnJMCuQol3kV30+YBPx0MNdA4uT/O/P0w5sa/J0YDPpUwx
	 pdEvgR+3AyBcoBBqEBPDRXcKLCgWgpLxQu00aFhs1B9P2SzKb/vYjmyKYLOXVFP8rP
	 ZFeO0LbGccp77cqxv+L3z1b4Ovorz3AraGSoB6hwkuNoDA3F2vkVA2I3Z65iz8PSoA
	 zyApIKrGD2WfSPW1XE3SbSxunvZBI+rMpaFXBxr9bXPPKthawdZna+ucxOFzaprT2C
	 STkjqSmgKF+mqvkIyTYQDKSlYUOa1hCJeotkoQki1Rh/xFX4Z7ULstYTlLiQhnPbd3
	 CuLyKUqzmM5XQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12B3440798;
	Mon, 16 Nov 2026 15:39:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F070109
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05A2C60829
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:39:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5BC9KtppqoCD for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 15:39:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E6BF460828
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E6BF460828
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:39:34 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4a1fbd52ab6so28592515e9.0
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 07:39:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794843573; x=1795448373;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=LiKyrsUd2op2AiGXDBdoMwtISmd5VRGbU7grrBHonc4=;
 b=Ep60RFejnk3OEb4vtJiY2qzS/NIAPtLwuuD/O/rf84gRF8/p8RFea7LGv8QNhjmAZc
 pHp6hkqhaLGe66Zbz07dBQIB3gQXSZMgAVnrnglYlltlzwX1gdPO+84vGGtcEp0fyf5D
 N+XVOZZvP/V5FFMLb6B6iCvKD7yct2uAo1UcyYCj8VU0MK/4IIk4VMm4ZD27Fqxk6p0U
 tqx8P5OjRRIOaiINs4nhVcboujC4ox6faC1IjMylIK8U4V3kUtiC69U2BAWxH2QMtzD/
 AAC8XZ3iuAoFnFc7ijto6g0eR3edrkh0pXOOGCFJBAgFnRONT2l7LBO5Hewwo9c6HVIr
 fozA==
X-Gm-Message-State: APuU4Z+GGaz+pL+toES+5xGF6FFBt2w3uMSq6aA062ApzNOmbWUIThxV
 Tr90VOMCYh5FHe6Bzc4GZeyswUKnjUhGWwV0rBSLMYnfX+6D3uRgezz6YOY9CLu1O7PiQRWqyEB
 snEsTqoI=
X-Gm-Gg: AYBFou01vHg+4/t4hKViG1WbJVJNTI46trH7xxECQRl11oaZChtGxRFrHm5EstVEZTs
 eGKJsAjmG9sGKbRwMbtVMZKcyeJWVcbDbIJamu+1WOe2+LApARu/kBtLWLWL2LzGnGqN82TeqBB
 2Qh21B7MvjRBJMzDKNhhyW9IasJE8/Be4/pe5Q0KDVKrhjL9BZiGSAfIBOhLXomBfq1q6jQOMGr
 bcve1bhTsCnwO2ztah5djY+Eck3NjXV3qV/4WzKC9baGYmkyIXFjrsy/6LTNdwIYvBYVnqq/9/R
 C8dW+SmAtKPq3rKDz4UFWkvxHc4byw6Mv88GTGWAEudfE4lqx5ZJr+GE79YjolUvDcyJ2HdCWr9
 H40mEOXlGDBYSkIX0fKlSn0WHJEc2eSgw0Ipgu2VMfcg5X++uAkdvDSvSdiI1clmqV3ugkv6yJd
 eOCMsmM3waO4+aMUlFd9plyue0xGvRAtKI7yiDH1YaguU1PPQE1TN+gn3eNR5c5hGPgZW4GLWdX
 FQAUiTEvRKa/ile2bMLNWPPTXslkB/4G7nYyoRFr9NY8DpMSjH/im7pPgd8eZ/s92lYUuEoPhAU
 p678J4IEdPhvuhUVtTZm3V928RY+DnQ=
X-Received: by 2002:a05:600c:1daa:b0:4a1:9663:7633 with SMTP id
 5b1f17b1804b1-4bb55a47625mr231654885e9.11.1794843572855; 
 Mon, 16 Nov 2026 07:39:32 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb571f976esm157942855e9.3.2026.11.16.07.39.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 07:39:32 -0800 (PST)
To: buildroot@buildroot.org,
	Thomas Devoogdt <thomas@devoogdt.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Mon, 16 Nov 2026 16:39:29 +0100
Message-ID: <20261116153930.725443-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261102160505.1754919-1-thomas.devoogdt@barco.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/libgtk4: add missing direct
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> GTK links directly against libdrm (mandatory on Linux), cairo,
> harfbuzz, libfribidi, libpng, jpeg and tiff, and the X11 backend
> additionally against fontconfig, x11, xext, xrender, xi, xcursor,
> xdamage, xfixes, xrandr and xinerama.
> 
> Add them to LIBGTK4_DEPENDENCIES so that they are always built before
> libgtk4, and select the corresponding Config.in symbols instead of
> relying on them being selected by other packages (pango, cairo, ...).
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> v2: split in two commits, see https://lore.kernel.org/buildroot/audrTUDPjZfZpyNG@windsurf/
> ---
>  package/libgtk4/Config.in  | 12 ++++++++++++
>  package/libgtk4/libgtk4.mk | 19 ++++++++++++++++++-
>  2 files changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libgtk4/Config.in b/package/libgtk4/Config.in
> index c1f3928b8a..13494fb692 100644
> --- a/package/libgtk4/Config.in
> +++ b/package/libgtk4/Config.in
> @@ -29,8 +29,13 @@ config BR2_PACKAGE_LIBGTK4
>  	select BR2_PACKAGE_CAIRO
>  	select BR2_PACKAGE_GDK_PIXBUF
>  	select BR2_PACKAGE_GRAPHENE
> +	select BR2_PACKAGE_HARFBUZZ
> +	select BR2_PACKAGE_JPEG
> +	select BR2_PACKAGE_LIBDRM
>  	select BR2_PACKAGE_LIBEPOXY
> +	select BR2_PACKAGE_LIBFRIBIDI
>  	select BR2_PACKAGE_LIBGLIB2
> +	select BR2_PACKAGE_LIBPNG
>  	select BR2_PACKAGE_LIBRSVG
>  	select BR2_PACKAGE_PANGO
>  	select BR2_PACKAGE_TIFF
> @@ -81,9 +86,16 @@ config BR2_PACKAGE_LIBGTK4_X11
>  	default y
>  	depends on BR2_PACKAGE_XORG7
>  	depends on BR2_PACKAGE_HAS_LIBGL
> +	select BR2_PACKAGE_FONTCONFIG
> +	select BR2_PACKAGE_XLIB_LIBX11
>  	select BR2_PACKAGE_XLIB_LIBXCURSOR
> +	select BR2_PACKAGE_XLIB_LIBXDAMAGE
> +	select BR2_PACKAGE_XLIB_LIBXEXT
> +	select BR2_PACKAGE_XLIB_LIBXFIXES
>  	select BR2_PACKAGE_XLIB_LIBXI
>  	select BR2_PACKAGE_XLIB_LIBXINERAMA
> +	select BR2_PACKAGE_XLIB_LIBXRANDR
> +	select BR2_PACKAGE_XLIB_LIBXRENDER
>  	help
>  	  This enables the X11 backend for GDK.
>  
> diff --git a/package/libgtk4/libgtk4.mk b/package/libgtk4/libgtk4.mk
> index 9a5ed651a8..395e850de0 100644
> --- a/package/libgtk4/libgtk4.mk
> +++ b/package/libgtk4/libgtk4.mk
> @@ -17,12 +17,19 @@ LIBGTK4_INSTALL_STAGING = YES
>  LIBGTK4_DEPENDENCIES = \
>  	host-pkgconf \
>  	host-libgtk4 \
> +	cairo \
>  	gdk-pixbuf \
>  	graphene \
> +	harfbuzz \
> +	jpeg \
> +	libdrm \
>  	libepoxy \
> +	libfribidi \
>  	libglib2 \
> +	libpng \
>  	librsvg \
>  	pango \
> +	tiff \
>  	$(TARGET_NLS_DEPENDENCIES)
>  
>  LIBGTK4_CONF_OPTS = \
> @@ -46,7 +53,17 @@ LIBGTK4_CONF_OPTS += -Dintrospection=disabled
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBGTK4_X11),y)
> -LIBGTK4_DEPENDENCIES += xlib_libXcursor xlib_libXi xlib_libXinerama
> +LIBGTK4_DEPENDENCIES += \
> +	fontconfig \
> +	xlib_libX11 \
> +	xlib_libXcursor \
> +	xlib_libXdamage \
> +	xlib_libXext \
> +	xlib_libXfixes \
> +	xlib_libXi \
> +	xlib_libXinerama \
> +	xlib_libXrandr \
> +	xlib_libXrender
>  LIBGTK4_CONF_OPTS += -Dx11-backend=true
>  else
>  LIBGTK4_CONF_OPTS += -Dx11-backend=false
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
