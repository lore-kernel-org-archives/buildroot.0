Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965D7606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XoJVJ4cL
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6845940D14;
	Fri, 30 Oct 2026 15:29:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DeA53S9MYb71; Fri, 30 Oct 2026 15:29:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 483F240D09
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374146;
	b=IhEaRFc9sCFDv/rJSA/wpSU6hA9by7K/kOO+TJaFs5PxyobG4YZ0XhbzPWxMBKyGGEvP
	 J3iJeHQxxOeLe+k+OQs6WpG7c7cPP8lxw9YsxuoCNPdjwYxNmEIe9PG7xcgVpcivs1C6S
	 sjEFgYl3Y4qKCejHzFgTALk5dvAIS0Dl5LWXutt2q+EZWDyA1EycqERFKgSRFdb7YTgDz
	 EHOmT60VYmIptNdi/uQdNRQeCy+E6MEBYhWQLnp4tiQy0b8+i7TMsKrnfF7OVugfU2YK4
	 rMqbri3MBMyZt6MR4Z/1ydZrlL7rHCezEQW3XadtOU3sTSb1nCb5WaRWA1OOgw4jp7w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374146;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=6vp2cKRAvDIexU7zw5L2APijk3gqGntnfdHrJJJqNfc=;
	b=clWMrgljFTcEMuYIWax9MG3op904r28RA5ZTNohCOTdxEFUvL9W5IwvBdzyjKDQE5+Rv
	 BsJo5GkBeu2wbhBgbp2aldX4ua5tgrMr4uF8p8AycvWEjlV3VRMUkLT689W1IhICtH3ZS
	 WeFRpbB264h3SelPEWYmkL9ghlcmaCbmXQaXPfoU6QZMeyj+3ORtV2U93dyPp8GaZ2Ui0
	 yV3cmGGXAObGNL8HyPXfL6C/gwv5XKv/YY/vkRUCtk2UCg11njpEoqIcGjaGZqfH3H1ES
	 P/UHPZrsCQkPkVGqUp78H1r2WGDWpnlcwV+3+g07Otv1iyj9nM7y/Z3cUOUlYYl1EvA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374146;
	bh=6vp2cKRAvDIexU7zw5L2APijk3gqGntnfdHrJJJqNfc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XoJVJ4cLopleAKDTJd3fzBNqLJXnTZtnx0gtwwWG1fsV6f6Tnvwr2sfH2lg0nifcG
	 6vTNpXWI9lOUWCXkzN2lMdia6pP4LjF753zZTdc5oDXcIvORqjZMf5OGGhmEur096l
	 h5+ydsZjbTetxTPz4EMI6KnbAt3s3G8wVw4wZqKs3su9N6DtrFqnCmovBivdxCmRZR
	 hc2m7cN+IUrk8iZRoEazAUAwqHsOj00gxZw2JVbVp0vyJelxldj7Uc6FdO5/Aq4kfp
	 Cw24fphODSno3z1fF9DJk51CrWHntxxanUA7/RJnnI+fOtf+F1a+MO+1Lm9JMfBA3t
	 xwuA+kFzajncA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 483F240D09;
	Fri, 30 Oct 2026 15:29:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 52E4F235
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3879660B48
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lbGhDK6L7glc for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:28:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0008D60B76
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374083;
 b=FEWvvwIWrnr8NyKhlY+POfaZhB9nCVdLjVMejmamipzkalq8AVrexMCsrYV/Ss3jMnnK
 QOsajrvL9Ax+/9UTYmlYViGbfAdBKgPI/Phh5IMV08oZSX0caS+tR2DfM8WrI919zDsmC
 2WUN6b4520q1Yfbh0qVLCR98uynBT6ZvZbcnJsklIpYhxZHW7t3zRZ09Ya+nEnfcAr0o+
 gcw2tQUW/H1gibWj1qQxvW+EmYMHiHbEA9AW/J4QDnOYMqCKgaAg5ZDCv2iO/8KBRRECC
 eSdS6xdNKXmPFIyqjCq7FpIXYTXeQzDE3hYZYtQnE4PeMrZMsSh3V8sLf95W7VjbLlg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374083;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=L0mp1z50tF3NZPyGRZRZIshJ/SBJuTJ0T3fGi29sRyY=;
 b=ehGlfdnSdvOMHYgWZ6uXVJgTEsKRuXmnNOvAoOzyyJNWSqf7Ij4CKbqMSmTlVmGsqK1Y
 HDrs1LkXpP09nqZ7iW+sZoQquRDAwxqQXCqX4sQk+qeVOMJwUqmUAKhIwIRcgJYJ29R0Y
 A+ZlrIYOQI580KlSq2AsOYNYcW2g0uHLEwkQs8BNXJ7w+K1jYyiATdK0V7Sk20sXtBg2O
 QQgmCWmq3aWh4K9P3lv2WAqJqhMplMWWYnmTJ88SzNH+eop02W9QB+/YRm/FovrijHzeg
 b6ftvP0mFSGE2RaP1+dJ/Ksy7qfQp3xb0VUOy1dfVsHoJqHETleUcIIVkFwcFmRHgBw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=KjS1eR0H; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0008D60B76
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:02 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4a2d6d01ecbso5435715e9.0
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:28:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374081; x=1793978881;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=L0mp1z50tF3NZPyGRZRZIshJ/SBJuTJ0T3fGi29sRyY=;
 b=S3Xn6xAdGZoo0qCczorCGo6O6bAvRbUOCNQ09nGLbxFENhccbvwhiuQcpoR/R0qds7
 t32h+rVcLaCNlqTNy6upxSbWzKXi3r6JW6XqaxAIK6+W4uYj3vyjo9b/NFquyCE8ifiS
 97SkHmpHFe74IwBCXpn5hPX28Ad69QPEtQHZp995czGPvYhF3A9AjpWp/tCRPQMml0Ps
 ID2fn7p6TEecSuVXS9/yn6lLCapUAmP4PxkNMg0L7J448SOZkCwgnsP582ZRVLXSm7HG
 7+k2lXI9vIjLtGGSVCpSn2la6aHe+8/9tS0JcIU0ECDubL82umI0MwozbxjaMxd8Fh3W
 zZoA==
X-Gm-Message-State: AFq9FYJY6xiZaDrFSBNJy1GkMUJ/rlTSMt0U5VXQe0kjBQvBCJeFaMDL
 zzXsXfV0D23CJ38mz6wF2aM8dp7QLsZx2xRQXyIIOCy0CuWhQIoJ7aSSVBzySjZP9AmfpQY8e+Q
 4VNCjD0I=
X-Gm-Gg: AYBFou2CLOem37GeZP4PEpjxKZqh/hT6HBHbBTUBYPMiP7oLB0mVp9YbIT3ZQFJ5ER/
 3hWCWbHBfv50V2bkyXhNanz9O9S+8yAA4TNeI5zhxyp83vwO5OY1abOFHH7U2Z5j66uzz04v5a+
 QzJytVV7sUQaJ+bQNcpA+M6++voWVSA63r/eNMBnvhM0sA/io6C4lZ2qiA5sBF9H2j6rSfs330u
 aFHBYwaduuQ+rYfBfZ+OfltVRbvlwAHFhvj76uN/ae8ytBVXPIq1KlHProagdVhrgUAI1zJFS5o
 zr8ELnK7sw6cm86jvYi3iNoV5IkNpJXuBWhtXIc7AbbFaLN5TQWk+VxzW3iYHtEP4QM3ZE1xZ4p
 hXLm1arJxOlvMLhnSJp3zD0JokyKHugpUCsgoGYB2vI86wi2bYGM0fGgrFRr5/umuXEQqLbG4af
 wGgC1lImp1FVSe4sA/awxoTNPvk2GcZfsy5LQIW7bXi3XnO1vf5v3qaxQJFBlDoITq2LYbJ3aNr
 FkHzX2rkNIvLxIEcUTXVGHlEDDkGpoofFhZXzncvLCIysYhkTZz6FkO8SYa/HuKyh/JyelprCRy
 B958rKtp9wywIEJ9n0PRGseBuRH5TH6DsUWzedhBVbwlDg4S/B7xtdODM5WfqRYcP/C/nHAf
X-Received: by 2002:a05:600c:a012:b0:4a3:59c9:a747 with SMTP id
 5b1f17b1804b1-4ac1793fb0fmr56651385e9.17.1793374080868; 
 Fri, 30 Oct 2026 08:28:00 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abf60f1076sm70473455e9.6.2026.10.30.08.28.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:28:00 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:27:58 +0100
Message-ID: <20261030152800.1907077-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261021211141.2759992-1-bernd@kuhls.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 1/1] package/sdl3: fix X11 dependencies
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
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Add handling for optional X11 dependencies to fix configure errors like:
> 
> CMake Error at cmake/macros.cmake:433 (message):
>   Couldn't find dependency package for XCURSOR.  Please install the needed
>   packages or configure with -DSDL_X11_XCURSOR=OFF
> 
> Please note that SDL3 only checks for these dependencies when X11
> support is enabled so we do not need to add =OFF options to the else-
> clause -DSDL_X11=OFF:
> https://github.com/libsdl-org/SDL/blob/release-3.4.12/cmake/sdlchecks.cmake#L325
> 
> The problem exists since the package was added with buildroot commit
> 2dd13e328f118363165b47258429604a5ffd3b41 so a backport to the 2026.08.x
> branch should be considered.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.08.x. Thanks

> ---
> v3: added configure error snippet and backport info (Thomas)
> v2: added handling for xlib_libXfixes (Julien) and xlib_libXrandr
> 
>  package/sdl3/sdl3.mk | 43 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/package/sdl3/sdl3.mk b/package/sdl3/sdl3.mk
> index 8c2cb8f629..861714385f 100644
> --- a/package/sdl3/sdl3.mk
> +++ b/package/sdl3/sdl3.mk
> @@ -59,6 +59,49 @@ endif
>  ifeq ($(BR2_PACKAGE_SDL3_X11),y)
>  SDL3_DEPENDENCIES += xlib_libX11 xlib_libXext
>  SDL3_CONF_OPTS += -DSDL_X11=ON
> +
> +ifeq ($(BR2_PACKAGE_XAPP_XINPUT),y)
> +SDL3_DEPENDENCIES += xapp_xinput
> +SDL3_CONF_OPTS += -DSDL_X11_XINPUT=ON
> +else
> +SDL3_CONF_OPTS += -DSDL_X11_XINPUT=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_XLIB_LIBXCURSOR),y)
> +SDL3_DEPENDENCIES += xlib_libXcursor
> +SDL3_CONF_OPTS += -DSDL_X11_XCURSOR=ON
> +else
> +SDL3_CONF_OPTS += -DSDL_X11_XCURSOR=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_XLIB_LIBXFIXES),y)
> +SDL3_DEPENDENCIES += xlib_libXfixes
> +SDL3_CONF_OPTS += -DSDL_X11_XFIXES=ON
> +else
> +SDL3_CONF_OPTS += -DSDL_X11_XFIXES=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
> +SDL3_DEPENDENCIES += xlib_libXrandr
> +SDL3_CONF_OPTS += -DSDL_X11_XRANDR=ON
> +else
> +SDL3_CONF_OPTS += -DSDL_X11_XRANDR=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_XLIB_LIBXSCRNSAVER),y)
> +SDL3_DEPENDENCIES += xlib_libXScrnSaver
> +SDL3_CONF_OPTS += -DSDL_X11_XSCRNSAVER=ON
> +else
> +SDL3_CONF_OPTS += -DSDL_X11_XSCRNSAVER=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_XLIB_LIBXTST),y)
> +SDL3_DEPENDENCIES += xlib_libXtst
> +SDL3_CONF_OPTS += -DSDL_X11_XTEST=ON
> +else
> +SDL3_CONF_OPTS += -DSDL_X11_XTEST=OFF
> +endif
> +
>  else
>  SDL3_CONF_OPTS += -DSDL_X11=OFF
>  endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
