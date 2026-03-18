Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85EF61077612
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 20:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5942140AA0;
	Wed, 18 Mar 2026 20:38:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QDopfqYg4kjM; Wed, 18 Mar 2026 20:38:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 851E940B4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773866309;
	bh=AZsP+wQXMHMiMYs2IqiSy/rFR29Ha2+tiJq3dH2hLbU=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lq7Bih/JRKXFiKxK4NleFD9AqW6ikJf/+9cX5LWbVazDQSgsNvgY6xGnXiQTE1v11
	 Mlq/NfCdN3/EtZE2MMM6stbO9dCNVs/SE1aSnvum3I2jRMZwh78FJ8e1FKj/86LdNr
	 X/iD5w1hW0sGhbrFxw57KJ3P/Bk5mhdgEMrP8vcgR7BKVvKT/a9qLV1VmcTUJsnNz/
	 hx0LjsnvD70DRvqvdOSdNX0qm1BAK6YHq+F+SSV74LYGXS/7svqlD3Owjr59zKREpB
	 2ydPRsyYbZPWYKnv+u2rHS7cxx+PCL2qxdt8DgCUp5x9rUsf+LlTftbIDVTnWcjRTz
	 8wdtXWWMIaAJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 851E940B4D;
	Wed, 18 Mar 2026 20:38:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E88C41BD
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 20:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E575A60DBF
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 20:38:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IwJ4w-IdEJ0W for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 20:38:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 047C860DA9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 047C860DA9
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 047C860DA9
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 20:38:26 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-c742723c863so3653a12.0
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 13:38:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773866306; x=1774471106;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=dPsBYJd8pJXy8fSFql9oMKOExdMjvhAmNMy1JQyxVkk=;
 b=OPW1Fg9AAEUazbQEVbRaj2bydVywXSnakZ1ZyO6tkNoj36koxU5pv0Wct828Gnrg9y
 rusiKxgghxmEzVihzvPiqEehVv8ob8TyVUUcgQvUFyyowKkA1aK0X6gCaEyfc8yTp9pq
 2uUy8PL27Ug2IEqNsvdBW78aC2UnUe/494CBABQ3HQ9EGWXYelCx9H4wy7r6mApNxpfT
 ioQVdf1ikR+X5vwihLKDeOjBAd4bBfoN4qZhJ8KHvY5Rp+7+2IIc7SpOYyox1NLYCLfD
 QTfOW71DouRyhAMeOv6WeUUnhfkHlfvF+yZ8trA9Au//Xkp4K8I0xNJkYRAHKHD80tr/
 hkvA==
X-Gm-Message-State: AOJu0YyLvMxZLhOTYdjPaIjEwBaiLemw6nE7dAeA5krZOy+wzaQW+lJG
 dIo487C0yXPAqlJF6lIYDN2oh6i7hG2wod1ih2uz/JR5rBUO/1EGnOTP
X-Gm-Gg: ATEYQzzZR831+wcrhP7BQvQyccGEaipLG+VaO7gb353vIxdL1uYbOZLj0pgyhjqdCJG
 x+jA5RzXT7tX8nNE3TCptnmZuBiTNMAR8NgM5R5etaiPwWp82nggP+++drKVMgR2S2pLh5wTSxH
 nI9OPz4D2j3nvmXreuvAHC1OWtZFpNdH6lUYyf1RL23HCf3gInfH5uj93d7QmNMCy6eVI6t397q
 3U2LOFG6ESuRVv/regnSa2ocVrqGOR9Z1ZvginxNBtTNE5OAXMuboUooIUjjeqgfudG1FsUPJHW
 0qIM2d5yvIwXG68kGJKxo+LS5UUInmeu6qAwqh2HqvQ0oWJtCt10lTT19mCQrthF5APCHTRTUGO
 FWR7NhqhZshP7KhuPocuxRWvSaaab+MsdFM6hLvFoFNWT8nxvYeFMrO+guhcIydJpLx83o58hXW
 AzOAFf9WtLxtOrMkpPoJ+G6p6f+Uo=
X-Received: by 2002:a05:6a21:a0c9:b0:39b:ad63:4792 with SMTP id
 adf61e73a8af0-39bad634c75mr1504562637.63.1773866306224; 
 Wed, 18 Mar 2026 13:38:26 -0700 (PDT)
Received: from wash-13.local ([50.120.91.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82a6b56ac50sm4636143b3a.16.2026.03.18.13.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2026 13:38:25 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed, 18 Mar 2026 13:37:57 -0700
MIME-Version: 1.0
Message-Id: <20260318-virglrenderer-v5-1-09a3274852d6@gmail.com>
References: <20260318-virglrenderer-v5-0-09a3274852d6@gmail.com>
In-Reply-To: <20260318-virglrenderer-v5-0-09a3274852d6@gmail.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Romain Naour <romain.naour@gmail.com>, 
 Joseph Kogut <joseph.kogut@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773866304; l=1974;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=psXy7hFr7xzliScleQYAy119z8YH3IvBIyt4tuxRW48=;
 b=W1xBoOWrpaDuudrb09A0kKGbRGDn4rICRZC3FXo+O9gXcdZff2WuyIy8h1qAVVXeIsSJp1E7p
 wMa3L95Me/DAx4vFEXWgkwNuCcEFaTuKVpb4RZ5C+xmYZ2fMARR2Wh2
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773866306; x=1774471106; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dPsBYJd8pJXy8fSFql9oMKOExdMjvhAmNMy1JQyxVkk=;
 b=dJxfj6TpWK88awbuNJrh5X0hEbxaaKINqBVTHhF1O3ek+MEQdhOkhqKLfhUIdtQX/T
 7OGuLWtUecHevjkLlrVMNk74VHx20vMeQ+ybkG6t/d/hORzepSpG+3+qwqBKVZXWrMPn
 +LbJFXhflWFYuMaSoiYUS2EH5PwrVXfAMb7MlLq3qnuSoN2sNjJwrM1wd2SthZce3Ffn
 qM7U+d2RYc2vDrAddXst7jubSqmGPrlpuoQL7x3k5JNcphqq41XUGccwjO2hVZ6WCS98
 M4pWgbZg1Qg5K3wIWSVOwlqR3Kv7KFbhWzw/PpZMagBv9BRGq+Ke1R6joztfPhUTDBDT
 zNUw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dJxfj6Tp
Subject: [Buildroot] [PATCH v5 1/5] package/libepoxy: remove gl/egl
 dependency
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Libepoxy is a library for handling OpenGL function pointer management.

It has backends for egl/glx, which may at one point have been mandatory
to enable, but the library now builds with none of the above enabled
features, as seen below.

  libepoxy 1.5.10

    User defined options
      Cross files            : /home/joseph/br-test-pkg/arm-aarch64/build/libepoxy-1.5.10//buildroot-build/cross-compilation.conf
      b_pie                  : false
      b_staticpic            : true
      buildtype              : release
      build.cmake_prefix_path: /home/joseph/br-test-pkg/arm-aarch64/host/lib/cmake
      default_library        : shared
      docs                   : false
      egl                    : no
      glx                    : no
      libdir                 : lib
      build.pkg_config_path  : /home/joseph/br-test-pkg/arm-aarch64/host/lib/pkgconfig
      prefix                 : /usr
      strip                  : false
      tests                  : false
      x11                    : false

Removing these dependencies allows for some applications that require it
as a build dependency, but otherwise can run headless or without GL, to
build and function.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/libepoxy/Config.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/libepoxy/Config.in b/package/libepoxy/Config.in
index 9da190b895..27d2b968d2 100644
--- a/package/libepoxy/Config.in
+++ b/package/libepoxy/Config.in
@@ -1,12 +1,8 @@
 config BR2_PACKAGE_LIBEPOXY
 	bool "libepoxy"
-	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_XUTIL_UTIL_MACROS
 	help
 	  Epoxy is a library for handling OpenGL function pointer
 	  management for you.
 
 	  https://github.com/anholt/libepoxy
-
-comment "libepoxy needs an OpenGL and/or OpenGL EGL backend"
-	depends on !BR2_PACKAGE_HAS_LIBEGL && !BR2_PACKAGE_HAS_LIBGL

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
