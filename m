Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0275CA5FDD
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 19:20:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9215040DEF;
	Fri,  2 Oct 2026 19:20:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6tIuG4VwM-FN; Fri,  2 Oct 2026 19:20:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4E60140DC6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790968803;
	b=qQWuX2pXFTyzD+7xN2phg4vMU7TRCznuthDMsZrv8qWzgwBs64/sDi88jCidVQQJxtwD
	 wfC4ptc06KJJnDaHfJZxuxxtQAzkprA62Vkb1AGZZpnSCiLLV6aPvEFdv6s57E5man78o
	 YwpCpn86aiyUpIi2m/JfYvFZVCq+chSAwJwx5GCBNXyuN1MlBhnSjcSNuwRdLDBK3Xfwb
	 TcLiyYhjWtEXi9tQCvAlJ2lMblnxgFW6ncPlhUT4N4VWFyxvUeO8jghEFSx4IJ74jy4yW
	 0BUtGlKtOnyJ71vpRGAjFDT/aoqKZNIU/V35kfe97u+vmZaVRRPfJ7BPNtLxWYyYUfA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790968803;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=AuZlinJwFTBx9F1D8h0CCnAr0caqcOkdbI9aKMOz/Bs=;
	b=KtU7lr7zhFHJbEfwi001FWWTlOQikY6k1WXWXRF8YvpHrZCSept5Gtk/qTvHO4PQe+hz
	 dboDN/DIYjt0qq2oKVQNrAUpdsdRc+alBbREqBLxnO1xvsTGQcJwMQwqcamQ6rdJ1nuso
	 h/pvukY6/JdrHpaCu7N0kPdYkrB51sRPqjWfPiBLSvAftC/j9Y4nXpcxeoo8XvZVeBdjL
	 L9ebE5Z8+mluK1PjaUazF0t7KLUPnoLPyIIYFgUG50HunbnAcdjfExuH5vHf5qyRdskpD
	 +b6yaIB74bkopM2SLj0J1/nPx01hIplPMlX4eEFXg0bvdWJOU/0rsyfeJltxvC87i9g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790968803;
	bh=AuZlinJwFTBx9F1D8h0CCnAr0caqcOkdbI9aKMOz/Bs=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WDYpdSMUldWbYdwJXz4mUSOLID75DG8lafmA9jT64dbrHe9KRVNkLBzpqOulBtYap
	 +5c7SZmR8fJuCKRltJdA3vfdEnGBm3JG2ji2ydUivrzNfiua3sxhxNpElhd43fZTGw
	 SyhNjxtLdaOdBdGvLjOBudn81fxUm82/mrrNe9AFVDUl+cWUkHhYXQo6jFlamw7dq5
	 o3TvPhTdFyZ2YaSn0nqAAYodWOgd+6BvPcfgjG9NgPTbtkAVq/eCe1b2qZWWYsNcm5
	 LhW8UkT/jU6xUS7BBUw3gKc3ItLUi81eThTqlJJxZXa8QrYqY3OG4RCS+v+pFzjj8f
	 trISOzGPBfixg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E60140DC6;
	Fri,  2 Oct 2026 19:20:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A0BFD1D2
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92B2781231
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:20:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 62YYC40UNLQf for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 19:19:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 732AC81335
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:30::e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790968799;
 b=G6WCjEwrJZoNj2zMu8fgevIOT/D53R2p/oOQJEfLoYRXxgJqSf/kxnNNnxZ9rhIgMvGY
 3WtLIU8hdkLmiOdq+l+qBvFd3/GD1fxLjzh8duSKrPM1K4ssiejnoOD34M5N5anXDKFLY
 kUtP8IkC50+JAN7gFU7GFNUV3wLz9rLg9VxNd1n4MZ7HYBT/HA0FgUPljA1Lw2Z8sjUrk
 hcus+Qa7ZT8KCvfpTfVhT7rtepnwo3AmtW3xLBt7fkj2uGRpDhguK+ATx87yUEqr6X9lh
 o13lqpyp2FG1705EBz9GP1lsTj4J2cA/vd5D9wcVTXgv/pHGRQ9J/iFhovMFqDxdmCw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790968799;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=9LE+e56zWhXaLcF7Cf81D1pe6cQozWVueRdwI38Xh5Y=;
 b=N86fRj7pahxUMJ3ziihhSyqlTMAsXYpNx7luLXP53OB5SJDsVj4wnczWCzBHjZ/gmmso
 HRzecSuB5BCePPn1jBZ+imMfsQqANFpghFvmnQvwRdpSv1E+jkBgbwxxUo0u++M0MxKbz
 b4qeHUQPtGFoOQ9m9bVHjU0rnPNvC33O66/GU4dbz6FsTZRgeMkzhSwvx7WvPZsBaHpZn
 14cSa25EgDDJQfUt62T8KwQl4NUCr58ZXg9/drZ4awn2rYKT8qgw0jXcwAAkMqewx5b2W
 uH85AkvTc189xoqFvoN4VbLQTV5paK0GCclQWMcI14hWLmqrwHieohsHHipjtvxgueA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=DXkTElyx; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::e"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:30::e;
 helo=mail-wr2-x0e.google.com; envelope-from=francois.perrad.86@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=DXkTElyx
Received: from mail-wr2-x0e.google.com (mail-wr2-x0e.google.com
 [IPv6:2a00:1450:4864:30::e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 732AC81335
 for <buildroot@busybox.net>; Fri,  2 Oct 2026 19:19:58 +0000 (UTC)
Received: by mail-wr2-x0e.google.com with SMTP id
 ffacd0b85a97d-48af9f88c95so77487f8f.0
 for <buildroot@busybox.net>; Fri, 02 Oct 2026 12:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790968796; x=1791573596; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=9LE+e56zWhXaLcF7Cf81D1pe6cQozWVueRdwI38Xh5Y=;
 b=DXkTElyxl/pXc4MAY6+8OXNX08Xl1T02djKF2uePPiEMUD0uDb1awqTbY5/PxPB/1u
 sZIMRdySNgSoBzSin6t42ElenaPNLW4hDQ7l9Ent7CsjZPE5FdCbr1FuyL3U+dIRRuwp
 aWJNvrpYW3EwxN0AWaTtR1yttW+v/1OHKjuk6Ye9KAwPvxusY9j9cg5rBbAU0XxuSUvR
 qBAL8HkwP9+Ac5AKLS9/x9LfqZS+E3SSvSiaTTg5Z0gpnXZ+pmUx7H2XmGOA9xXkRABY
 xG3G3nmqVIWJUcQsdYutGK1O4TvV7ddDspBuoBkval3sWBRZpCgfv1w59hFRCH0t6hqf
 iuNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790968796; x=1791573596;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9LE+e56zWhXaLcF7Cf81D1pe6cQozWVueRdwI38Xh5Y=;
 b=2jlnsQZ8j7yHAyqFvAmq4L4ssYer8T72FglytIynct5NX8YnxAjhpZMpJ3U1Hl/2JZ
 eJqc9vSzNp8l6rBRx6JyJWUN/7Lcv1dS8LJ+z8TaoGfIYNjau8W0En8RS5L9AUeX1pTb
 9mSwErlLW1EINveYDyJrnIPJPQQJQK+SZJLdZ36CDMuJNUSebHw0di29JBxi3wAQnuvG
 cGNEvmJj2fveLEX25JaIIfCuVlY/iJcZcSDkcJ52jcToCxy3ch4Akcc/6vqs7flsz7Bv
 FnVtnDQx+g3C3AqQqJNeQmZxT1BgDwM9/ISLGldlDUgzkGg/AU9tMGeoEo7WjRIKez7V
 vl8w==
X-Gm-Message-State: AFuF++nYYOZ9/cRNg7+TkyuY6RrXIwDNmmZlDZf6mcEIfWpXoTIQfDYa
 grjVbFtKxEsEnHHeCyaYdCQx233EsWQdmTM0Fjzi2xlkc2HnAXEg11eITfy8dw==
X-Gm-Gg: AYBFou3T7GwewKIX6to2CG3A/YPZlDmjkWaDOj/6C4sU1ecXNrkOsAQ9niRR5oj0C9L
 kb/D3lvSYQeH0UiP3iz162wkFTCdVpywxlYnyasuH4LQr0VbHxAC63ndm1Po5K0NBVvwPGMmzUL
 Um8BMs9u5X6Ev88M54bqCpDKGPrA3aB4s2M6i+HKlLbN8x2af7OWillO9hwQe3mVWyjjNjMxjcY
 OLf6Ohh0owNUJsGRVP0F/qtOYDzboPeI5gwZ7p0mmbKC3hRRgQADSU6fdsH6nEjE1n1dTo2/dMC
 Z3idrPIGAUYYKjjW0btXQKw0LInUBO+r3LOwZAZrT+uJnjTCAWNdwPmQ1IbCRybSuQBa9rlSN+A
 TL//AGAoBb3055Q5IEeZ4Qspo3SdUrNSkoabNoFclW6x08139aAf5BxrRQRNOw/FOi+kt2OeQ9i
 /Q0TEJNt3l3NO99r40INWwDcxFmEu4GIGbLP0XgLDrCJ9MZn+t166MzkbVL1dlLpiyw1a1SORsR
 DGjDbWO2Wx7VnV0D+xuJG2Ri8VYtoc++MzLruqN
X-Received: by 2002:a05:600c:19cd:b0:4a0:22d5:21af with SMTP id
 5b1f17b1804b1-4a027564f48mr69118845e9.15.1790968796408; 
 Fri, 02 Oct 2026 12:19:56 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a03ff3cab2sm37144635e9.2.2026.10.02.12.19.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 12:19:56 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Fri,  2 Oct 2026 21:19:40 +0200
Message-ID: <20261002191941.95919-1-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/kbd: bump to version 2.10.0
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

remove upstream patch

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 ...e-dlopen-and-memfd_create-for-libra.patch} |  0
 .../kbd/0001-libkbdfile-fix-zlib-build.patch  | 35 -------------------
 package/kbd/kbd.hash                          |  2 +-
 package/kbd/kbd.mk                            |  2 +-
 4 files changed, 2 insertions(+), 37 deletions(-)
 rename package/kbd/{0002-libkbdfile-Require-dlopen-and-memfd_create-for-libra.patch => 0001-libkbdfile-Require-dlopen-and-memfd_create-for-libra.patch} (100%)
 delete mode 100644 package/kbd/0001-libkbdfile-fix-zlib-build.patch

diff --git a/package/kbd/0002-libkbdfile-Require-dlopen-and-memfd_create-for-libra.patch b/package/kbd/0001-libkbdfile-Require-dlopen-and-memfd_create-for-libra.patch
similarity index 100%
rename from package/kbd/0002-libkbdfile-Require-dlopen-and-memfd_create-for-libra.patch
rename to package/kbd/0001-libkbdfile-Require-dlopen-and-memfd_create-for-libra.patch
diff --git a/package/kbd/0001-libkbdfile-fix-zlib-build.patch b/package/kbd/0001-libkbdfile-fix-zlib-build.patch
deleted file mode 100644
index 1324d0b53..000000000
--- a/package/kbd/0001-libkbdfile-fix-zlib-build.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 488872421ef38215d2797f78497eb559d8eec32a Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@users.noreply.github.com>
-Date: Fri, 5 Dec 2025 16:45:36 +0100
-Subject: [PATCH] libkbdfile: fix zlib build
-
-Upstream: https://github.com/legionus/kbd/commit/2f9a4e56c2ef245fbe840677aad9d5932e17f50d
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/libkbdfile/elf-note.h | 5 +----
- 1 file changed, 1 insertion(+), 4 deletions(-)
-
-diff --git a/src/libkbdfile/elf-note.h b/src/libkbdfile/elf-note.h
-index a0fd9e2..d3b8d5c 100644
---- a/src/libkbdfile/elf-note.h
-+++ b/src/libkbdfile/elf-note.h
-@@ -26,14 +26,11 @@ int dlsym_many(void **dlp, const char *filename, ...);
-  */
- #define DLSYM_ARG(symbol__) &sym_##symbol__, STRINGIFY(symbol__),
- 
--/* For symbols being dynamically loaded */
--#define DECLARE_DLSYM(symbol) static typeof(symbol) *sym_##symbol
--
- /*
-  * Helper defines, to be done locally before including this header to switch between
-  * implementations
-  */
--#define DECLARE_SYM(sym__) DECLARE_DLSYM(sym__);
-+#define DECLARE_SYM(sym__) static typeof(sym__) *sym_##sym__;
- 
- /*
-  * Originally from systemd codebase.
--- 
-2.47.3
-
diff --git a/package/kbd/kbd.hash b/package/kbd/kbd.hash
index d46a60a80..83b45b0e8 100644
--- a/package/kbd/kbd.hash
+++ b/package/kbd/kbd.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/utils/kbd/sha256sums.asc
-sha256  fb3197f17a99eb44d22a3a1a71f755f9622dd963e66acfdea1a45120951b02ed  kbd-2.9.0.tar.xz
+sha256  6e5ca4f8d76ee9e3a8db700b667f13e12aac9933828a64e1aaad93d26be9b479  kbd-2.10.0.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  5a16340fe773f422144b436df90319114a2884933c56e9be6fad642e59be5e1f  CREDITS
diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
index 6e34a45ba..deb76163a 100644
--- a/package/kbd/kbd.mk
+++ b/package/kbd/kbd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KBD_VERSION = 2.9.0
+KBD_VERSION = 2.10.0
 KBD_SOURCE = kbd-$(KBD_VERSION).tar.xz
 KBD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kbd
 KBD_CONF_OPTS = \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
