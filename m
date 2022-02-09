Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 635EFC433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 19:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D6A2401EC;
	Wed,  9 Feb 2022 19:13:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id niS8SUHH5ggk; Wed,  9 Feb 2022 19:13:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5591D401E5;
	Wed,  9 Feb 2022 19:13:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D8A221BF422
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 19:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BECE5403A7
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 19:13:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SyXcQRzJHf-4 for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 19:13:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4712B403F8
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 19:13:13 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 l123-20020a1c2581000000b0037b9d960079so3857159wml.0
 for <buildroot@buildroot.org>; Wed, 09 Feb 2022 11:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UNYClg2OsYzPrZX0KRsGj0PjMwEYsY4o3y0Z9FFcG54=;
 b=c2ZS8Y8gj+b7s/D5G6x+8ahlXfnNPQJVoDECVKB4X3n9R8Em/G80iGOXVo2JWR22Ci
 wcSWtjfFEu83Ar3LJBbyta+dvhDlfuZfsWio6wrdP6ub5wImSkFm6fZptTVJlEjfAfki
 S+yHvZst1qoefw9AMQPjACznqRJuyvLNTMEHPAFxSqdfxXqBIsGtnLoXy5P3C2SptJ2I
 Tje59Y3jVxQ6RreUIb13/PsWyhck/yO4plE5xm+Hes6neKaT73pOyUuB4NMI3P5KD56N
 N5051CsEE0Bxc1wgeE8HvM8axpLfsuOWa5JJUsCP4It54aA4wVFJ4KMe9dLI5wi5tY8t
 8ZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UNYClg2OsYzPrZX0KRsGj0PjMwEYsY4o3y0Z9FFcG54=;
 b=TM4ucn7bVa1sAq0u48BjM8oNOuQ3XzIMGrPc2vrjZ5GwoLxub0O6g8bIOnmxsphxUQ
 JgdrWS2T6N+OlLmxpR0TR/VlAwqBOu8pTSopV/+rLhASxzbA/gQtIK9tTkrnUobZq9fX
 x7lJTwwxKyGWKFZOhtUdxF7PdcKVKLmP/zrxbDJVYbYczBq4w0DnnnSdjE+s6ZwhL7fM
 O2+GT4xGk4aD/r9CXGJz0Qu+ei0NEV0KpOysexcHRTREaKSDfCkVWXQhKC/HudP1VUaX
 z+a9f5Lrf0BAkyKIojzAYklWkva6wX+zhgtJPRK8p10cFqu+QNSRn5oIUB80Z4JtaUCs
 u+WQ==
X-Gm-Message-State: AOAM531+1S6Tya8ox8nGHqAIr0grqtcGq5BcOunojcbcjxZLOKNwfhb1
 7N65o9iyn4ElnEfN40aRv6UBcPZCdbA=
X-Google-Smtp-Source: ABdhPJx6fPdEGm6VYnlztOZVf+QOehke3NxTIsqUVsJI7CuUCSWgsi9RALsLWktIpLZgRMIgqRBvfg==
X-Received: by 2002:a05:600c:a4c:: with SMTP id
 c12mr3367294wmq.48.1644433991218; 
 Wed, 09 Feb 2022 11:13:11 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id p2sm10629698wrt.101.2022.02.09.11.13.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 11:13:10 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 20:13:29 +0100
Message-Id: <20220209191329.201362-3-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209191329.201362-1-fontaine.fabrice@gmail.com>
References: <20220209191329.201362-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] package/sdl2_ttf: add harfbuzz optional
 dependency
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
Cc: Peter Thompson <peter.macleod.thompson@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

harfbuzz is an optional dependency (which is enabled by default) since
version 2.0.18 and
https://github.com/libsdl-org/SDL_ttf/commit/328bbed78db496ff36720e8a809661ffb236e673

If harfbuzz is not disabled and not found, builtin harfbuzz is enabled
resulting in the following build failure without C++ since commit
f4da031a77f200515bcc5b2e0fe665a7b4f2a780 and
https://github.com/libsdl-org/SDL_ttf/commit/9a7ef3fb640a1f086d9b02954c3b4bbfb3578871:

configure: error: *** A compiler with support for C++11 language features is required.

Fixes:
 - http://autobuild.buildroot.org/results/3fecb96a8063b1a28703682e9373714c1c9cfa24

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sdl2_ttf/sdl2_ttf.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/sdl2_ttf/sdl2_ttf.mk b/package/sdl2_ttf/sdl2_ttf.mk
index e9397d8505..54e76815f1 100644
--- a/package/sdl2_ttf/sdl2_ttf.mk
+++ b/package/sdl2_ttf/sdl2_ttf.mk
@@ -13,6 +13,13 @@ SDL2_TTF_INSTALL_STAGING = YES
 SDL2_TTF_DEPENDENCIES = sdl2 freetype host-pkgconf
 SDL2_TTF_CONF_OPTS = --disable-freetype-builtin
 
+ifeq ($(BR2_PACKAGE_HARFBUZZ),y)
+SDL2_TTF_DEPENDENCIES += harfbuzz
+SDL2_TTF_CONF_OPTS += --enable-harfbuzz
+else
+SDL2_TTF_CONF_OPTS += --disable-harfbuzz
+endif
+
 # x-includes and x-libraries must be set for cross-compiling
 # By default x_includes and x_libraries contains unsafe paths.
 # (/usr/include and /usr/lib)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
