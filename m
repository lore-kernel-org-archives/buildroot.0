Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082B7606A321
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 12:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=oo0V4H5X;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d6yOFi8G
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4CD681113;
	Fri, 30 Oct 2026 12:03:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZP1Rgaz6mCcE; Fri, 30 Oct 2026 12:03:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 17587810F5
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793361807;
	b=oBaq3QDaakl5Ic6R29/ennjSIqgMGHD7u71t6YX36f+oxJCQH23ad5h1cJhT0CQq1z+3
	 wMgnlhIQbC8iOJmSMok42xOEgNGfibjZpfVpybtuoETBctHNybPbymgnl3NdgpQk2qCrf
	 M3al4MXgaCH+c5kXHtb5O8zAg7HfZJnKaZCRQYDDiz8bcu+3B6Hr3JcFIdwMZz5h8qlpH
	 rJt9jFAoG8UiSaBs9PR0lJKhf+N8g1gXKeXEIf1C580tZ2CkU7siKy6yIIuGha3vkbVX+
	 a1tDxSb2LAzVIYyEhQZvaVQ6cWRwKXaJ67UL2qR2SLTUQOKiTx35AF9xdzRnvaV+fkQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793361807;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ag77Up/R4hQ6zaiYHORugmSg2UwxeiQMNHoxYpE7Y1g=;
	b=eTFOErqMMkm+CuuJZxCD3uhM08lYbhHwLmdWjAMX8xct01/GPWWf6I9zc0LOJ/KCG0TQ
	 lw3aboG060s7GTtmVaj734Zj7KhvC5veoOtYKL/0coXAUDu0Fyuv4OApw0NWpl160w7ip
	 StssUdMSsV9a8xJ7NDIWrKa9C2kkpYL0oO35nA+3Q1O1goUiHXQNJt67MbwJPqIzZrbsV
	 Qv+XxBV/VHzMtDV2tRXcO/qG9HI7gLQMiY53S2dQWepbpKYoWNjYs+R773hAD9P3GmLeo
	 /XUVjQhbVIEh5jGU1yA5JezkDGhmVqw/DnjJPhYuXuxUdeC8zESkVvhPuq59VAR8rpw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d6yOFi8G;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793361807;
	bh=ag77Up/R4hQ6zaiYHORugmSg2UwxeiQMNHoxYpE7Y1g=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oo0V4H5XFyWTzaF2mfmOj4Cj33yz/efY80GCjMvYDH575GzBR3JtR8R3Brl314k8N
	 WpVUz9RqopCn1ha56O0HoNY/jr7VXe8/MwIxx6Qa+/A9TpvcNzbeoqJXAimQ1KddRI
	 dtW7udVHgSsOK6jwsX1Do0Rw7tO9IXdiis2htGoLk4GSF3hMtfYwA5Ek8u2TnkbBqY
	 UYanMzsTcvgs7E3/GQZcdMR64nmkEyZuTjuOnI1RuYV9GxTHYjFtc90uZL6vVzn46z
	 TuKl/0nqH8pkCRk/w3wHPDaTIjmcDKf6tVaTuR36AkZUw/55+tJHwBJ9vk0MSvfSD9
	 nHfuoIuv6Gqhw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17587810F5;
	Fri, 30 Oct 2026 12:03:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 86E57362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 12:03:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68AEA810F5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 12:03:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id guZkwlAMkbhw for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 12:03:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3755180F55
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::332"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793361804;
 b=iDWNY26nwvB0i8ySaD7o7uBRnprh9Df0r8EbzQq24LgxnKpGlGv9tbcCbQzfPMwxsllK
 VEFBpEqm0NXyABGZQwKYL3nwb/tpIB/MQCaG9YNEdJBPSZuh3giULqn8qRJg0XCf8vtCH
 MWbVfBGyY8mG3tkOZekQ07J07HUuSpSrmv+hqnE0peeQHRi9p+Fn3MVnaiBTkMFcC3meO
 tQ/Y1gf9VKtgav8/eMwwh4P1KRIhB0TuqmSJb6rRhmEZR/tm5SCUlxHjTUeHTg+bj76pN
 dMUAnId5s5W2zXi45YYgEy3BS7H6JKPCDr5PGv7dVycChqWk16+jPsXA1wOtR26dTdA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793361804;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=O41H6+/16ThM3aNPBFVLIR+QOvCMYulFxnJlCHM8jW0=;
 b=OfeRpWXAKcjO8eDL+VSDUsIsJOCdlK0mOV0OICMmn7hSGZgsqAUC8PL4H8rjIOPU4kYt
 f2Pw0Gn/dLGnq1Rbr5z2bukyULH0BhiPeH3bj6P62Vvc6qHl/HH0LKPv7KA28cqmRttqy
 lWjzOzYeeI3h3xeN9qga79q9V8arhFCSKMHnmG4NB7A0i45zfyI10xTbR5QVud9I92fYV
 0az+4X5B5cWZdGnZW0fveWLAk+F4s4YjIZwS9SBWL/dx2qfViwv40Gy1CsZmVQvejGxay
 +Pry7w9xbJ90YSzjCgt2TFovMUGqywAaV/oEmzQzyWFLh1i3dEmZWKs00Gg6GEnf6rw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=d6yOFi8G; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::332"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=d6yOFi8G
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3755180F55
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 12:03:22 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4a20bde60a0so4685495e9.3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 05:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793361801; x=1793966601; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=O41H6+/16ThM3aNPBFVLIR+QOvCMYulFxnJlCHM8jW0=;
 b=d6yOFi8GnnrPUTlRhm92SHlJ6G3KF8pThOHqcCGg1U81PW/l2m91jFkPVJL4PdobfT
 lYSDCk8+fJdLyFxHOg0HmUV/5fEq2ul2LejQdEBXnl16BH44ivKZZDn6bwBS9hIXJeNw
 NnMh6bhMGndPaX78u3raMcJCWB4E1bbjt3YGW1ufHUirdnV4MRcV8/N6xWa1z6ar1Ekn
 vY1pyAO0V+D+3lCChkkQqWtjWVkWqg3jrFrrJr0N9xUjgbRyeSDf+NmYK2loqVKYCxIh
 lxdsdggJEFd0BNQiC6iQJdDDeo6g0eHKd+Q8+X2Fyy4eTi5tK6dAKLnHUR72A60JctAi
 0rhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793361801; x=1793966601;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=O41H6+/16ThM3aNPBFVLIR+QOvCMYulFxnJlCHM8jW0=;
 b=pudlcuhtpa6oVbFVAHd0N8oo3fcfG7rfI+L+v7uy+X8knfzCzdSXf8yv0NwHsqD4zz
 tqws0aR37248U4OudOyXiG0KcRc6iK7i7NZVTP8gRfQWpW0/Q79ACKolCXQNpvZQ+Y9Q
 hhyGQHBl0csAZzTnyb67UDemeOBwtkeTZbZW+jgYpWUC5wXXzL0B76ANMSAgf4zqpaw6
 VqolrlbfK1P4agilTjZoKHbcGqD2Z/sNU8KwZQc1uu2OXabpoOriH/2RoRRjzEKlbsoF
 +U6OM9sXcEPdy+4iPicvHP2LSzr6Ztf8tDvBOTQWY/X2pSUqDlHTxnwgf7+Xp3vWX3/h
 BGkg==
X-Gm-Message-State: AFq9FYJ7dJfuIyrdNd9n3J061kP4UvzfY8Kx8vKBp6XAv1/t9vaB168R
 dZBPETPr2I3VxZzCuRWUB0y1aY8g5pscP5r/GYK6OPLga3lmS94cQ5GND2hZ8g==
X-Gm-Gg: AYBFou3o4ONNViKr57BcV6iZAPRm/LeTtS3oCwbpAOzywA/90e8pb45XJFbrt2wKCb0
 pOMBYz7KWLz1nn1Ok2OQ0+ckD2IwBMfstGWe83HEta+LRXMT4qUfEJeGieZbNXBPzY+2U3fodkp
 H/iwFZh7zD1DMYmqWi9a8CmobB0N8JEScFPS1Z36QgHSDbhUTbguKulMZ/6EW5VReSRp3M48jiT
 l4a26C0flgMRv4UWT2wPSx30bQJXjGWaDwScpeCPx5YLrZSWXbXb231sz0KrGDTcaPotKTmW4R0
 IWW8Z1ULXDa4esZUdHwSy5om+s/uGchna3mBoo+8AyBBxVzWiGFkNQ4/d7XEVd6+WUM8jx/4E9G
 2r5eIWEClOkYh+31Ihh7hZJVkK1MouDoNajdB8LXJCp/jaMm9FWsRrg+Cyv7djUa1bvaie9mzvA
 MJQXItikWTPXZSIOylzac5lpGbwKZl3GSRvQt+pWkK+AqsQ9wtD7WI8SM/Ick0zZTxKWVLb2rGi
 YuNw2dscuH9Xp38SbZ8wyZUpPqYBQXGZyxivUweb/aFzWSQlO6cdOdH0GmbU4Gy5FfJ1C+KaG9S
 8sbHIg/dSM6TjUYp+OsUf19iposPDAXNuxcnAwQPyUVXsXAKw1lt//4=
X-Received: by 2002:a05:600c:a4e:b0:4a1:e57b:667c with SMTP id
 5b1f17b1804b1-4ac183d1edamr43906805e9.26.1793361800640; 
 Fri, 30 Oct 2026 05:03:20 -0700 (PDT)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4aa820492cesm143738465e9.13.2026.10.30.05.03.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 05:03:19 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 30 Oct 2026 13:03:06 +0100
Message-Id: <20261030120306.3167071-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/sunwait: bump to latest git version
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Upstream switched from C++ to C, so drop the C++ toolchain dependency
and use the C compiler.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/sunwait/Config.in    | 4 ----
 package/sunwait/sunwait.hash | 2 +-
 package/sunwait/sunwait.mk   | 3 +--
 3 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/sunwait/Config.in b/package/sunwait/Config.in
index e141c778a3..ea0ec171cb 100644
--- a/package/sunwait/Config.in
+++ b/package/sunwait/Config.in
@@ -1,11 +1,7 @@
 config BR2_PACKAGE_SUNWAIT
 	bool "sunwait"
-	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  Sunwait calculates sunrise or sunset times with civil,
 	  nautical, astronomical and custom twilights.
 
 	  https://github.com/risacher/sunwait
-
-comment "sunwait needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/sunwait/sunwait.hash b/package/sunwait/sunwait.hash
index 8396fa27dd..6f9286373a 100644
--- a/package/sunwait/sunwait.hash
+++ b/package/sunwait/sunwait.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  ef26ed05882d5286a64a37c4044f99b877cc54f58a46f0e37ca60c93398df910  sunwait-7326b53e5406c7ebd552ae6dc0fc659252a18e7f.tar.gz
+sha256  ac69169fa8b1ce332682f1af540c648bdec849c255df46aebc145d0ec46fc80d  sunwait-151d8340a748a4dac7752ebcd38983b2887f5f0c.tar.gz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSE
diff --git a/package/sunwait/sunwait.mk b/package/sunwait/sunwait.mk
index 4b27e8267a..1dc4d82b8a 100644
--- a/package/sunwait/sunwait.mk
+++ b/package/sunwait/sunwait.mk
@@ -4,14 +4,13 @@
 #
 ################################################################################
 
-SUNWAIT_VERSION = 7326b53e5406c7ebd552ae6dc0fc659252a18e7f
+SUNWAIT_VERSION = 151d8340a748a4dac7752ebcd38983b2887f5f0c
 SUNWAIT_SITE = $(call github,risacher,sunwait,$(SUNWAIT_VERSION))
 SUNWAIT_LICENSE = GPL-3.0
 SUNWAIT_LICENSE_FILES = LICENSE
 
 SUNWAIT_MAKE_OPTS = \
 	$(TARGET_CONFIGURE_OPTS) \
-	C=$(TARGET_CXX) \
 	CFLAGS="$(TARGET_CFLAGS) -c" \
 	LDFLAGS="$(TARGET_LDFLAGS) -lm"
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
