Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84E3606A31D
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 19:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AARATZuu;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=pZd1jAc9
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9367340C62;
	Wed, 21 Oct 2026 19:59:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id StH17_fXlPB3; Wed, 21 Oct 2026 19:59:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A19B340C56
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792612771;
	b=kViuc68NaTv+rwHIPqHM+a5ByF2kozme3kpM5JaXl574diau9vfTtNMwe0Pd6pVn8hcr
	 rZtnZWVFTr8+keZgmX9zqN8r2FTNrs0z0GmEYNZvbkC3OWMlHVc2xmcqYUiXtdmCfk2Ev
	 35IMTwyvFqrD2rkAuzmThHCtWEk60lQP2injZ9xffAypuhh5JtQL9Qe/TFN7Crgp+uvJS
	 pLMk6caqcyfQnRMvCfTpvWwYfNIQj+viD9reuGH5J8WX5gtGXgoQ+MBdh9bO4tMUw6hzS
	 e8jYrndDzA98r5+g6JKcUxiXVrQLsvqKQBZ7swG5jfRU4h93bthvcAo0WCcf1/808sw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792612771;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0h1nQD9rnhmN8x0H0jGhrTEn9G9OywkzWSxkrZOqW7E=;
	b=QlbfCqruO4AyKXoDbGdZV1sg7+WZlX0S3HP/k+rCpOyRrFoVNXJsXuXunQDfCjvrFm2G
	 DuzlF2+Nuh9DYrElFerrgcrvrXmITviHzpQSesKxZJP8irO0BUlX2pheR65xkzwIJ0Vhq
	 f3XH5Sc+kH/Z/+hi5oFptGHDP9dT9RiPN7d0p1RAoUkvy+X/dtwyZTB/x3k8FIPm1Hafd
	 iaL5owGUQuWW9k3QE1gRaeFOMMrBNjJh7/M4pG8mSr9xNlC5fC0tGzCF0n95w/8PLnjS1
	 4oL/cFsnllWHSk+yW9rNjnlvJEzVnMmgJJT20c+xuzOkDeLDFw3ia4XL/RSQI+q0Igg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792612771;
	bh=0h1nQD9rnhmN8x0H0jGhrTEn9G9OywkzWSxkrZOqW7E=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AARATZuuqz5ypV1U5aHs/ln6BsLcxRDqjrgsT5cjf6Av5ZkWQydpbvpAE0f9sZsbv
	 6kYHMyPAI0GJMhwq9Wo3QYY2oFYp7fHPEdXnPAUI5Gi2m3ZNv0XyncIX7vH2UXPz0r
	 jppHZPgpuj1gEPhT6x+7o5g7MTESF43AOLbP+4V9hDPbVTlaBHvTJ68GpGeDagThDR
	 2DPoUq/BXKZ9KxyVfy3+K9ihGjGfd6IkYyjB++iN/Bz+IvpiV39Og2tQ6ESWEn4YTf
	 t+7ustWFOVFw8VooF/hVSO2Fo1VCcExTdQtmJ2X1FM82J7MVOS2gUHl0rPY5vJXzLV
	 Q2lfnXTYUo+ng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A19B340C56;
	Wed, 21 Oct 2026 19:59:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F2881AB
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E93466115E
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:59:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s_-ykVUK0W7w for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 19:59:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6F1C861011
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792612768;
 b=rXMt8xk728y74RQT4uBPLDOmA7uY/Fmzft+gWCfIuz6vG40/SNTypptzWjOyKHRRD8cu
 MQwqSNyfOjIbPHi/VPmBHY2C9ahqP0TK3gqHbUACy5+lKFKJe1lrbzXHTALQ4lkslT3wV
 38A37u/GVv63dkVtdLJ7807r+M+VJMF2DctOeWZEgK9YF3aRFaz7zBgixt/zCW8lNCeOP
 HmJ3iJaexLVrVteZFRj0keh4VxJjxC8Pg3lfleMa7egNpRZpdSw8VmqLnauFNG31mzR9Z
 Z+PdJ97cZsjxAlWuF4PGangoH68qylfOnjcj1PhI2Qx5xdfztndAX7xBjl2eOlLxt7A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792612768;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=Y0K5+1SHkPHNYE3ROmmPeRKv1Xwh26JhZKPn35pqzN0=;
 b=WB1u7k8b2Cg5K0ZkNBDA9LFurnlUjZLwV7pelShbJOUjjGL3cSTiZEhu3k83YxQfalZh
 l/FX9dPsshtey6n6zcWJ1XQjVzP1jxvdavL85WDVk6HsVClGGcFRAprCPFvECBGmvUIL5
 MchPSq5xP0GwxBHsvijdM65VYRuABwc8sgLdNwFRDeV8ZNlPC6JjwIdlPhH2zxvNZ6ryQ
 h97puY39Wb1JryuUQRK8OubWAlLua/wQptRKKHHuFlmYgztsM9IL59DtCDlkNRngrmzjr
 hazHjxvef90RoRy88rWKm63zCZY3hJxUrmvSJ3fQiI4c6fVPZzhe+qjEulfPRPEC1Ng==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=pZd1jAc9; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=pZd1jAc9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6F1C861011
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792612765;
 bh=Y0K5+1SHkPHNYE3ROmmPeRKv1Xwh26JhZKPn35pqzN0=;
 h=From:To:Cc:Subject:Date:From;
 b=pZd1jAc9DXjjH4LZuIYBf1O651QrkSz+KnRjAYXG4SYOpmpwMrpqusBhrIwE7TCIK
 LYbF1ZANUTa6ILHuHRGm1sYyhIGDGrXuSfQAwwbiL4IEfeMMDK3SQ4f4nZMP+XGuVp
 dRd6tE5M+WEVkG/4yuga2dLvJgYUc9iSZwDxUAQtLsC14MCFqR6ZwsytZz7LoKA3dh
 9B8qbzms3m4+9qojt0GGFsKbEncFmOWk3krgIOdEuveY00oyw7TPXaJge6UogRDAoo
 gwQ3V0ihteYSjzUGGsKbzm1ucmDDnjrcfOqYLKOT/zpC/zK3u310UbCo9ROGEMXjAB
 Sgx5ii7EllDdw==
X-KAS-Sym: v3:f51bdf72230551df:r7CgYwwGehmmnk+LyiytBX51W/KkTICE7RDECH0QTK2mA
 hXLPmsOMCn31LxojeYNH9UEylnpBolTDFrZnWEgcr29zW2Y3EUljh4ymML322CfjK+nSMlmEcTo
 6rfENkeBZhXkW5y5sp4OyXHZt9tPSpr5Ozwr1V4pJm1lOlSqTHSxHz+7KsgyXmsVJGYeto/WzEQ
 jbKbpqhHO36+PTRQq9xOld8DzzNEcAJid7EkOOq3cIG0SDNbPD/YO1DCxU6BhJcyahdIJJ2PZGJ
 utsVpWumXodPuibO5HtKO7fhP4ntHt/MyWuLxn0C5uXATaF5RhvqDWnlZBMorX7oW9BYVnDA==:
 Rh1p7vP/MBsBslhb0hTPev7US49I/PO4gUXWlJIsnoDo3nqtg/1Cyuzfr/n0iSzmxfVoHlkh39I
 Bo+cQ5zQJvxH03+dR4EQEqeEuxicxAlRHtpntQsA2TBNtFm5QKYNBMKAXfZbOJgftv05mGQcXZa
 MZ0bP5kxCrFtInznDxbTLmGVkIKNb/wbYzLc2vI13Rk4ypOnlK7zmgjV+cGbbnXtcTqRtNGK6Zy
 Sqk9VlVim9EkwqCwfapdotM7JLzK2kfSWWZGkvLG3Vb+OoYCOU2EmUrPabFUOgo8DA37ediA89P
 qJlWPHEK9oFBLI65axMP3b2Ln52e/6yh7OzWZJSBrvNU2WHKb94UbD6Eb6pDGpW59kCF7Ahxt66
 kGJ1qwJjnKlfXLZV8CKxNqw2n0GbETV3j/oCLY7BfJf2Hs3vJdBzgWCxVT2+B9KrAHdzrcid9Xm
 lfmPWHC2wnoWz38XEFJpm5fpL5e0zl/hzAmMR71+UJrnrhLSWP+eSkjw49n5gkSNbKepIwljKVK
 OgNw4aC4biEJCMvJY+TyliwBuMidYUouzcp4xjzJlBz0hmwXzYumJX5vXkWlO5Ixox4GKYmYciM
 XWP8
Received: from fli4l.lan.fli4l (p5b3a054b.dip0.t-ipconnect.de [91.58.5.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2A17DA4C461A;
 Wed, 21 Oct 2026 21:59:25 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50930)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xJcT6-000000007lB-1fx5;
 Wed, 21 Oct 2026 19:59:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Michael Fischer <mf@go-sys.de>
Date: Wed, 21 Oct 2026 21:59:24 +0200
Message-ID: <20261021195924.2746366-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v2 1/1] package/sdl3: fix X11 dependencies
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add handling for optional X11 dependencies to fix configure errors.

Please note that SDL3 only checks for these dependencies when X11
support is enabled so we do not need to add =OFF options to the else-
clause -DSDL_X11=OFF:
https://github.com/libsdl-org/SDL/blob/release-3.4.12/cmake/sdlchecks.cmake#L325

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: added handling for xlib_libXfixes (Julien) and xlib_libXrandr

 package/sdl3/sdl3.mk | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/sdl3/sdl3.mk b/package/sdl3/sdl3.mk
index ecbcbf4bc2..ddd2e2d0b9 100644
--- a/package/sdl3/sdl3.mk
+++ b/package/sdl3/sdl3.mk
@@ -59,6 +59,49 @@ endif
 ifeq ($(BR2_PACKAGE_SDL3_X11),y)
 SDL3_DEPENDENCIES += xlib_libX11 xlib_libXext
 SDL3_CONF_OPTS += -DSDL_X11=ON
+
+ifeq ($(BR2_PACKAGE_XAPP_XINPUT),y)
+SDL3_DEPENDENCIES += xapp_xinput
+SDL3_CONF_OPTS += -DSDL_X11_XINPUT=ON
+else
+SDL3_CONF_OPTS += -DSDL_X11_XINPUT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXCURSOR),y)
+SDL3_DEPENDENCIES += xlib_libXcursor
+SDL3_CONF_OPTS += -DSDL_X11_XCURSOR=ON
+else
+SDL3_CONF_OPTS += -DSDL_X11_XCURSOR=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXFIXES),y)
+SDL3_DEPENDENCIES += xlib_libXfixes
+SDL3_CONF_OPTS += -DSDL_X11_XFIXES=ON
+else
+SDL3_CONF_OPTS += -DSDL_X11_XFIXES=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
+SDL3_DEPENDENCIES += xlib_libXrandr
+SDL3_CONF_OPTS += -DSDL_X11_XRANDR=ON
+else
+SDL3_CONF_OPTS += -DSDL_X11_XRANDR=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXSCRNSAVER),y)
+SDL3_DEPENDENCIES += xlib_libXScrnSaver
+SDL3_CONF_OPTS += -DSDL_X11_XSCRNSAVER=ON
+else
+SDL3_CONF_OPTS += -DSDL_X11_XSCRNSAVER=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXTST),y)
+SDL3_DEPENDENCIES += xlib_libXtst
+SDL3_CONF_OPTS += -DSDL_X11_XTEST=ON
+else
+SDL3_CONF_OPTS += -DSDL_X11_XTEST=OFF
+endif
+
 else
 SDL3_CONF_OPTS += -DSDL_X11=OFF
 endif
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
