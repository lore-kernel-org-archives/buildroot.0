Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDE7C2BA4C
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 14:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACDAF60D77;
	Wed, 26 Jan 2022 14:55:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G93ZHjZTR0Sa; Wed, 26 Jan 2022 14:55:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7E6B60F7E;
	Wed, 26 Jan 2022 14:55:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2D68E1BF577
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 14:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C200829F2
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 14:55:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vu7g80LBijk6 for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 14:55:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5360982DDE
 for <buildroot@busybox.net>; Wed, 26 Jan 2022 14:55:21 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 c190-20020a1c9ac7000000b0035081bc722dso4239457wme.5
 for <buildroot@busybox.net>; Wed, 26 Jan 2022 06:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pvoAvcRJDnmwRFF9ITjQLPL/RrW6IplBOjf0gv6aSvg=;
 b=D2/Vvf34WRhSc/kxlHUH0k58LhsnRor8Z+x6LDi0yPmYcgI2ZedjBitfou9pmU8hI8
 FdD2ESJmLgNTjW2tuESrM2LE8MuL6nBZMiOr2pql6v0EtoUoH3JypwUShZxIoLpJC3ew
 hWo7jbiveJarohnJ/7JHDB4hm4aSCQYh+a2kifJBpfbBeH0DD6cln+LnWe4GEjfDXZxr
 /bTB13XAPL92BFpuH+WzL+GjWNsjJKICSfxAUK6ytZvGBAwTJ12RhsyuhVajc1lyOOv6
 BYlvpDAFupqEKe222gqgC4ObN7uuUoeLxZDmbFhVBWZhNsJzXRr8w26fFZoe+KB2Djgi
 qSDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pvoAvcRJDnmwRFF9ITjQLPL/RrW6IplBOjf0gv6aSvg=;
 b=Dl7LAGzFLNqY27bAch8bbhoDnRMqTl0lfk7920nFa2WKJnPS2HIvv/ax4icG4qRmuB
 /+z6d51R3phpsAQ6PNFeNmMUXphDo/SxbX1hYh4W+3Xb05o5wcqRC5y46SCNcJxzZgy1
 VH4jLdqTVARRUAlxctocFvMZGQLkoaK/2xZW+tY7gjM0wOhAgWCFLPcI6WjfvMVWY+ZN
 1eRcYqqDg8b+ITfb/L3Cdm3LJiqt4ingjiTSjqcRTcF+4R8jA2dRTN4L6zj0A28M+Zh2
 GzDsmcMqT3xHwOC7qhHy86m9OxcepUIL21+43xZYSaZXqrJp+n+sDz0A6WvLEL7yDHyb
 Nu2w==
X-Gm-Message-State: AOAM531obgUGyjaWoDSc9lwuKW9iOK3NEsT9sIpo/ELy6tEypkht3T7S
 QSB1Q2s+i4Rc8h6t5+qemwcz97Aw1mg=
X-Google-Smtp-Source: ABdhPJxj0gThVpQ2U0QTdGNNOxsHaVlbDwPnAupPvuCJd38b/HMb9hWLxxRY+HtWOVcxpChxQRRQag==
X-Received: by 2002:a05:600c:4f07:: with SMTP id
 l7mr7853100wmq.129.1643208919492; 
 Wed, 26 Jan 2022 06:55:19 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id g5sm16396591wri.108.2022.01.26.06.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 06:55:19 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 26 Jan 2022 15:55:03 +0100
Message-Id: <20220126145503.1032630-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220126145503.1032630-1-francois.perrad@gadz.org>
References: <20220126145503.1032630-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/lua: use Lua 5.4 as default
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua/Config.in                          | 2 +-
 support/testing/tests/package/test_lua.py      | 4 ++--
 support/testing/tests/package/test_lua_sdl2.py | 1 +
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/lua/Config.in b/package/lua/Config.in
index 5d4cee5d5..309dd6eec 100644
--- a/package/lua/Config.in
+++ b/package/lua/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_PROVIDES_LUAINTERPRETER
 
 choice
 	prompt "Lua Version"
-	default BR2_PACKAGE_LUA_5_3
+	default BR2_PACKAGE_LUA_5_4
 	help
 	  Select the version of Lua API/ABI you wish to use.
 
diff --git a/support/testing/tests/package/test_lua.py b/support/testing/tests/package/test_lua.py
index 573ae0100..9703dffbd 100644
--- a/support/testing/tests/package/test_lua.py
+++ b/support/testing/tests/package/test_lua.py
@@ -42,8 +42,8 @@ class TestLua(TestLuaBase):
 
     def test_run(self):
         self.login()
-        self.version_test('Lua 5.3')
-        self.g_version_test('Lua 5.3')
+        self.version_test('Lua 5.4')
+        self.g_version_test('Lua 5.4')
 
 
 class TestLuajit(TestLuaBase):
diff --git a/support/testing/tests/package/test_lua_sdl2.py b/support/testing/tests/package/test_lua_sdl2.py
index 22c4087f5..b9aad15f4 100644
--- a/support/testing/tests/package/test_lua_sdl2.py
+++ b/support/testing/tests/package/test_lua_sdl2.py
@@ -5,6 +5,7 @@ class TestLuaLuaSDL2(TestLuaBase):
     config = TestLuaBase.config + \
         """
         BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_LUA_5_3=y
         BR2_PACKAGE_LUA_SDL2=y
         BR2_PACKAGE_SDL2_IMAGE=y
         BR2_PACKAGE_SDL2_MIXER=y
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
