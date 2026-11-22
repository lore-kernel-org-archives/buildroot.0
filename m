Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E8F606A31A
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 20:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Vp8DsMlg;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=skDRAwAz
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6567E40612;
	Sun, 22 Nov 2026 20:22:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7I39WohpOmdh; Sun, 22 Nov 2026 20:22:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 20B0840635
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795378929;
	b=GNOes9kzQLl1oh9Oa40aK7qRufkt0SlEgZo7Otsp9KTHd8yMtkDS78sTuR15s+V60Ozl
	 Wi+xrZvVJFY/80WIcOmzbEwV2W16u+siAzn5ob8XMS6onjSBlrS9lNb9p0A4Ooy2zJxXC
	 YHB68MPjfNnp/etP9IggVrbLZsWgJUZL2xyvOWgMSWQD2eTAMeJ76sBZGNykPPMVOFqvF
	 gtwLzbbPtKSF14iMIQO+TNEGLrYc7bYBGLGqK2yXfSPgbzQXstWncnDMVdG0jueXO9nOX
	 xqOSt27xgT/TtxRKcNFYwbupitzWDWh6febDR4n9TubLSbwfEiKXF83d5diqzMi8aAA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795378929;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=KukHB8Ac3+2pUC/MAiLQ6T1BGGCfoghEWKRPMTdEMNA=;
	b=kIg2rYsSLqRRWdMqsxo+1cEj7zVS08ULwhObwxBPolzvK5gPouuiTqj+43R/Uf1lH1Ow
	 Di713zNp6rigJ4sppUmoW/HEiAQ3t9BmWg3LcYE/in5+fTOK9hJQf6oppyg12DkZDY5lh
	 c82RCWR7Cf2f+JsGPR5sXMtB/oxmOyqXdwB1BFqWnhZ1UFfAH/M09Z1lM3f4FKxFL+xPZ
	 3rSJYH6ChCH77bYR6qe90xeYgcY+O6P/YCmWxYgSPhCfeWgVtcm9DFdEFVrQcbrOvqXf+
	 Jd3GX+jKCd6cAy3GeoD+kZ2OafNtBsdxoaGI+yRXGrYI57hn/xaqJEDHER+T5kVqMKg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=skDRAwAz;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795378929;
	bh=KukHB8Ac3+2pUC/MAiLQ6T1BGGCfoghEWKRPMTdEMNA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Vp8DsMlgllDq0pdx3ONFiYWLiha2eO7+W9mHXPhBpqq7MmvZmTJjR+PXZQaV1X3mo
	 zRYIY63DOTyGg9iaWE+wCebKrfn28BEI8aDe5dW390QjRvXokHQc4tQ1Ib5O0Pef1V
	 Ou+0EVtghwbnJokjXz7Y+Xw4JawCi1js2DTGDQ/Usc3dqOx4h0uAzImU8XPWBzxD4j
	 Kofzy3kiRXW4zQm5stsSvG/1OBV57hHEBm6vhRnw3M3IydQRePvFxqsubrEbevUKly
	 HW/UqUcVejt5gbL+428oEYm/lk6Nr+lE7nDxhep3KurnspPViLFglMWIme7yyU75Sa
	 HYZ0MN5oOM1hw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20B0840635;
	Sun, 22 Nov 2026 20:22:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DF78310
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 20:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6EF554060F
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 20:22:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E3wovO4UJ_G8 for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 20:22:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 036E04060E
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=skDRAwAz
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 036E04060E
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 20:22:03 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4bb69f5b161so16669655e9.0
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 12:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795378922; x=1795983722; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Uw+QeFke2Tdqx2qVRp2NCgyC5agE2mO4aY3X23W/z1Y=;
 b=skDRAwAzJQwYamMDJaBDAd2WYZvOWSsxQxtNdC1N2lgwUDDiaEl1K+kHG+YeSgoVAE
 qQLG4K8eI0oQPCHflr7DdUYxsq03bsjABwM5EN6kGqgiv/32qGu9Pfgn9APweIxBUg9o
 yzrtq6D53FC8J3CitqHgRqHedqCmhtpdNjWiUb1leCas5noLXm60hD+xzEivsbZfkDD9
 DXsQT+3eb0hBsNoSpeFUxOkEJq6LGunLq0XTwxIO8f4/sQzNCx3wF8m7z3nCve+xM+Wf
 SaQQUnD8/mQ2p1DzHbXNXjbYVftQ0fnI+D9voj0Vd+54KmqT3KUVYHuDgIkMAWNWBA0e
 8wpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795378922; x=1795983722;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Uw+QeFke2Tdqx2qVRp2NCgyC5agE2mO4aY3X23W/z1Y=;
 b=iApj3xF8Nj956CohDsZ9ltMOhlGFx/VP3fC6DwmzLBxxBE5WE2xsbm0MypeLrErBwg
 kUAn4kbmihTMbTI1CWGzrmEv+MJCrseUT0WR1Mz/5cehD/1qMZ7h9ubh68scySiTPdfs
 VVWYXWuNvI63uakxhuRPnruPQ16GzAfRD8gbllraq96tscdXl6Xqhs/9ix8BO29chVcP
 Tvl4ZwKd6yNFW5ZElP1yCd+UtKU/1rSwtDdRvQ3fT6BjVCySxfQ8PkAQyNxb8KwWvhXo
 VGlvcU1Q8TfSRbI09Tg7FPQJ/iuqg4j1qNY1mioZ8I7RYVLybd3RW5llJc6kHUI4fg+Y
 hFfA==
X-Gm-Message-State: APuU4Z/lYtlaIsdLPOIS6AW6DqBh/uBA5VSWqgKs1WnxCTCMtPMKowPr
 JFGXDzFHtTp9KiU0ihOWcyMPte6u06qtjLaA+sbKwt4oYg5KHnoq6psAgjlUQJv1
X-Gm-Gg: AZFdTZfBtHK91ZFBc+Y5b/JNiDe9iGXcmhazT/oaiv1Nr9zI+csSmNKaudcbwmQkvJm
 JNS+6vhyc3YpQcXKA9jPPfa8+IuQNpDnI0JN2SnBoDKYRRZUEzXPw2gDjFUkEE61OZ9jVRKNcqx
 IPh0f+tU/HT+mp0j1QnU5z6gFzUS9C4NTtCar+uATg36iRZk8fIzsFav83p7IadVeFqQ/+OUR4y
 k+9qWEQoenH4iB8zvhN9CIVsqsBkhMFsdwnb17fwWEhheatiGFX8d4IpQZBozyjmJbAKYb90ifl
 2GzJ+UQ7rOo6qAn2goGYVw0dGknSroSr3zQMZwgSLKpZDbv0VBLmDSaqYltDhrlao8lPQALhjYN
 XQLZYL0bsMHUc/DlptMl9L7efKIc/9j40lm9BuJqLph1V0MsgEs9tkyozu/yhaKm5GBHnryY0WK
 si5y8az+tcF1z60DJ3U2m6svaYJHYrFMfEUaLhxLUGlQaPL793671ZtiyEf+sFvDNI8ChWbXD8r
 GRaPAhflgjO2GGbpfUJUKw8p60qg9l5Quv+uGyfl6D9rk3XRhe+Xbddc3kRahxxwhdjZOB0j+UU
 7mgZ3fGQlNa40AEmlUSNzbvJVhCPiN3rP+fIvbyxDFdEjUP+s+gU
X-Received: by 2002:a05:600c:1c1f:b0:4bb:6847:7943 with SMTP id
 5b1f17b1804b1-4bb88814510mr243346335e9.26.1795378921578; 
 Sun, 22 Nov 2026 12:22:01 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb853a12acsm319409495e9.8.2026.11.22.12.22.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Nov 2026 12:22:01 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Nov 2026 21:21:54 +0100
Message-ID: <20261122202154.3606582-5-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122202154.3606582-1-angelo.compagnucci@gmail.com>
References: <20261122202154.3606582-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/4] package/qt6: security bump version to 6.12.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Christian Hitz <christian@klarinett.li>, Bernd Kuhls <bernd@kuhls.net>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Baxiche Su <baxiche@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fixes the following security issues:

- CVE-2026-9499: Out-of-bounds read in QTextCodec::codecForName()
  (qt5compat)
- CVE-2026-15037: XML injection in QDom serialization (qtbase)
- CVE-2026-78253: Uncontrolled recursion in
  QXmlStreamReader::readElementText() (qtbase)
- CVE-2026-79616: Out-of-bounds read in Context2D.path and PathSvg.path
  parsing (qtdeclarative)
- CVE-2026-79680: Authentication bypass in the password authentication
  of Qt VNC Server (qtvncserver)

Qt 6.12 needs CMake 3.25 or later: select BR2_HOST_CMAKE_AT_LEAST_3_25.

License changes:

- qt6quick3d: the hash of src/3rdparty/meshoptimizer/LICENSE.md changed,
  for a copyright year update.
- qt6languageserver: LICENSES/MIT.txt is new, for
  src/languageserver/3rdparty/metaModel.ts, which is not built.
- qt6multimedia: LICENSES/Unlicense.txt is new, for the bundled dr_libs.
  dr_libs was already in 6.11.3, under the same license.

Release notes:
https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.12.0/release-note.md

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/qt6/Config.in                                  | 1 +
 package/qt6/qt6.mk                                     | 4 ++--
 package/qt6/qt6base/qt6base.hash                       | 4 ++--
 package/qt6/qt6charts/qt6charts.hash                   | 4 ++--
 package/qt6/qt6coap/qt6coap.hash                       | 2 +-
 package/qt6/qt6core5compat/qt6core5compat.hash         | 4 ++--
 package/qt6/qt6declarative/qt6declarative.hash         | 4 ++--
 package/qt6/qt6graphs/qt6graphs.hash                   | 4 ++--
 package/qt6/qt6grpc/qt6grpc.hash                       | 4 ++--
 package/qt6/qt6languageserver/qt6languageserver.hash   | 4 ++--
 package/qt6/qt6mqtt/qt6mqtt.hash                       | 2 +-
 package/qt6/qt6multimedia/qt6multimedia.hash           | 4 ++--
 package/qt6/qt6opcua/qt6opcua.hash                     | 2 +-
 package/qt6/qt6positioning/qt6positioning.hash         | 4 ++--
 package/qt6/qt6quick3d/qt6quick3d.hash                 | 6 +++---
 package/qt6/qt6quicktimeline/qt6quicktimeline.hash     | 4 ++--
 package/qt6/qt6scxml/qt6scxml.hash                     | 4 ++--
 package/qt6/qt6serialbus/qt6serialbus.hash             | 4 ++--
 package/qt6/qt6serialport/qt6serialport.hash           | 4 ++--
 package/qt6/qt6shadertools/qt6shadertools.hash         | 4 ++--
 package/qt6/qt6svg/qt6svg.hash                         | 4 ++--
 package/qt6/qt6tools/qt6tools.hash                     | 4 ++--
 package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash | 4 ++--
 package/qt6/qt6wayland/qt6wayland.hash                 | 4 ++--
 package/qt6/qt6websockets/qt6websockets.hash           | 4 ++--
 25 files changed, 47 insertions(+), 46 deletions(-)

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index f3a540e9f8..7aea40172e 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -35,6 +35,7 @@ menuconfig BR2_PACKAGE_QT6
 	depends on BR2_USE_WCHAR
 	depends on !BR2_PACKAGE_QT5
 	select BR2_PACKAGE_QT6BASE
+	select BR2_HOST_CMAKE_AT_LEAST_3_25 # Qt 6.12 needs CMake >= 3.25
 	help
 	  This option enables the Qt6 framework. Sub-options allow to
 	  select which modules should be built.
diff --git a/package/qt6/qt6.mk b/package/qt6/qt6.mk
index 94ef6df360..b6b634132b 100644
--- a/package/qt6/qt6.mk
+++ b/package/qt6/qt6.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-QT6_VERSION_MAJOR = 6.11
-QT6_VERSION = $(QT6_VERSION_MAJOR).3
+QT6_VERSION_MAJOR = 6.12
+QT6_VERSION = $(QT6_VERSION_MAJOR).0
 QT6_SOURCE_TARBALL_PREFIX = everywhere-src
 QT6_SITE = https://download.qt.io/archive/qt/$(QT6_VERSION_MAJOR)/$(QT6_VERSION)/submodules
 
diff --git a/package/qt6/qt6base/qt6base.hash b/package/qt6/qt6base/qt6base.hash
index 5600cb9937..fb10ee95ea 100644
--- a/package/qt6/qt6base/qt6base.hash
+++ b/package/qt6/qt6base/qt6base.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.3/submodules/qtbase-everywhere-src-6.11.3.tar.xz.sha256
-sha256  46de0710b594945a5d446ae44354daa386141c6903c53781b2ca547bc62f8f8f  qtbase-everywhere-src-6.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.12/6.12.0/submodules/qtbase-everywhere-src-6.12.0.tar.xz.sha256
+sha256  a951bd163c7b80fc6b8c88d7668fb56abf91c152373e13c10666763238131307  qtbase-everywhere-src-6.12.0.tar.xz
 
 # Hashes for license files
 sha256  e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c89cb  LICENSES/Apache-2.0.txt
diff --git a/package/qt6/qt6charts/qt6charts.hash b/package/qt6/qt6charts/qt6charts.hash
index 016e6d297a..002bf5898f 100644
--- a/package/qt6/qt6charts/qt6charts.hash
+++ b/package/qt6/qt6charts/qt6charts.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.3/submodules/qtcharts-everywhere-src-6.11.3.tar.xz.sha256
-sha256  1d51d18e6f36e8b0dbbcd1a59f3ce9452ca5bf9b2d2fc8465be18cd0d06d6700  qtcharts-everywhere-src-6.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.12/6.12.0/submodules/qtcharts-everywhere-src-6.12.0.tar.xz.sha256
+sha256  dc5e0599455c78729248a1bb95824fe6a3420e860b8cabc5ac0c7a93c2062bfb  qtcharts-everywhere-src-6.12.0.tar.xz
 
 # Hashes for license files
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
diff --git a/package/qt6/qt6coap/qt6coap.hash b/package/qt6/qt6coap/qt6coap.hash
index edbd2bc7b7..7c471b0c9b 100644
--- a/package/qt6/qt6coap/qt6coap.hash
+++ b/package/qt6/qt6coap/qt6coap.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  909e9820b08c77ae5a1d68f1325914f931ea3e25e9c6855493925b1ecd8d4fd5  qt6coap-6.11.3-git4.tar.gz
+sha256  b7edfe0429d6aff6f3d76a19fad286c4c1cad8f115bcdad4682adeea22fb0e70  qt6coap-6.12.0-git4.tar.gz
 
 # Hashes for license files
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6core5compat/qt6core5compat.hash b/package/qt6/qt6core5compat/qt6core5compat.hash
index db6adc896c..1ebfffa733 100644
--- a/package/qt6/qt6core5compat/qt6core5compat.hash
+++ b/package/qt6/qt6core5compat/qt6core5compat.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.3/submodules/qt5compat-everywhere-src-6.11.3.tar.xz.sha256
-sha256  2e998067417de46355b6750c3709aaa6032fb27e4b16edb5f73fba79fe436516  qt5compat-everywhere-src-6.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.12/6.12.0/submodules/qt5compat-everywhere-src-6.12.0.tar.xz.sha256
+sha256  78cf1c283795312a7fa31c73eb7f7f556b48374adc484f10ad5a3c0bcb59264e  qt5compat-everywhere-src-6.12.0.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6declarative/qt6declarative.hash b/package/qt6/qt6declarative/qt6declarative.hash
index 32aa367fa1..1a2ab77655 100644
--- a/package/qt6/qt6declarative/qt6declarative.hash
+++ b/package/qt6/qt6declarative/qt6declarative.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.3/submodules/qtdeclarative-everywhere-src-6.11.3.tar.xz.sha256
-sha256  6d6db328a02ae3bb0b1e6944aeef8dfe44cd6b55ab59b1708bbf0400f5759cb5  qtdeclarative-everywhere-src-6.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.12/6.12.0/submodules/qtdeclarative-everywhere-src-6.12.0.tar.xz.sha256
+sha256  311f3a2603e1973bb59baef9dfa740a376de713157d4782ee043681e889c9260  qtdeclarative-everywhere-src-6.12.0.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6graphs/qt6graphs.hash b/package/qt6/qt6graphs/qt6graphs.hash
index 3a18a1e7a3..f6dd7fa915 100644
--- a/package/qt6/qt6graphs/qt6graphs.hash
+++ b/package/qt6/qt6graphs/qt6graphs.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.3/submodules/qtgraphs-everywhere-src-6.11.3.tar.xz.sha256
-sha256  4e74b45c64930022a3c0127a6ea5d406ae973e1af130a9fe22158ab1d784bb6a  qtgraphs-everywhere-src-6.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.12/6.12.0/submodules/qtgraphs-everywhere-src-6.12.0.tar.xz.sha256
+sha256  18c4e968785447051d94b01f8e3c975e31ddc46065c0777443cecc50753a4d8c  qtgraphs-everywhere-src-6.12.0.tar.xz
 
 # Hashes for license files
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
diff --git a/package/qt6/qt6grpc/qt6grpc.hash b/package/qt6/qt6grpc/qt6grpc.hash
index 2ecda8548f..5232ef8cc5 100644
--- a/package/qt6/qt6grpc/qt6grpc.hash
+++ b/package/qt6/qt6grpc/qt6grpc.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.3/submodules/qtgrpc-everywhere-src-6.11.3.tar.xz.sha256
-sha256  17984706311571d329cead7aff9cc9d744c10fb3004af24a82591baf758485f6  qtgrpc-everywhere-src-6.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.12/6.12.0/submodules/qtgrpc-everywhere-src-6.12.0.tar.xz.sha256
+sha256  771852c4e5fbeb3d7c3b2a9aacc13db9efe942a46e7d1454ec1f16092ec3ef9c  qtgrpc-everywhere-src-6.12.0.tar.xz
 
 # Hashes for license files:
 sha256  e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c89cb  LICENSE.Apache-2.0.txt
diff --git a/package/qt6/qt6languageserver/qt6languageserver.hash b/package/qt6/qt6languageserver/qt6languageserver.hash
index cb91c6fea5..e48ec194a9 100644
--- a/package/qt6/qt6languageserver/qt6languageserver.hash
+++ b/package/qt6/qt6languageserver/qt6languageserver.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.3/submodules/qtlanguageserver-everywhere-src-6.11.3.tar.xz.sha256
-sha256  64f4310b5403157eb7652bbd57bdd09b0ed080c9cd9e98b5bf84883ecaa8d60f  qtlanguageserver-everywhere-src-6.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.12/6.12.0/submodules/qtlanguageserver-everywhere-src-6.12.0.tar.xz.sha256
+sha256  552119e37360c06c5fb0b54e91bbfdf8da5a80d2cb1441ef93e966eb3b7a426d  qtlanguageserver-everywhere-src-6.12.0.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6mqtt/qt6mqtt.hash b/package/qt6/qt6mqtt/qt6mqtt.hash
index 50e63c7d51..4580089c9e 100644
--- a/package/qt6/qt6mqtt/qt6mqtt.hash
+++ b/package/qt6/qt6mqtt/qt6mqtt.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  f4b9f412c6e85363fc0009c8a9333b35390bb47f1c4da44e6914fd7143bd7cc5  qt6mqtt-6.11.3-git4.tar.gz
+sha256  f34a28ab1342e973792c189301dd0150b59f13c6501dfd38a8e720fee60e5fab  qt6mqtt-6.12.0-git4.tar.gz
 
 # Hashes for license files
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6multimedia/qt6multimedia.hash b/package/qt6/qt6multimedia/qt6multimedia.hash
index 557530a4ef..e548b667b0 100644
--- a/package/qt6/qt6multimedia/qt6multimedia.hash
+++ b/package/qt6/qt6multimedia/qt6multimedia.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.3/submodules/qtmultimedia-everywhere-src-6.11.3.tar.xz.sha256
-sha256  3d172de9bdd137686c3871762a4adff988a1ec0faec15df0c4560cfc417288e6  qtmultimedia-everywhere-src-6.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.12/6.12.0/submodules/qtmultimedia-everywhere-src-6.12.0.tar.xz.sha256
+sha256  3143f53b64257ba2a0685c940f5dce476c75871ff86b516de45cfd54ea93a62d  qtmultimedia-everywhere-src-6.12.0.tar.xz
 
 # Hashes for license files
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6opcua/qt6opcua.hash b/package/qt6/qt6opcua/qt6opcua.hash
index 1c141c162f..a2ee83c726 100644
--- a/package/qt6/qt6opcua/qt6opcua.hash
+++ b/package/qt6/qt6opcua/qt6opcua.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  4d6dd7d8352597143e69bd7ec9e0cf092508a652fe3421357c0d890f1289d924  qt6opcua-6.11.3-git4.tar.gz
+sha256  6f51d0c69477dedf1c9bd994c1109254ad6d3b82b9c650d31d7a06549c38f850  qt6opcua-6.12.0-git4.tar.gz
 
 # Hashes for license files
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6positioning/qt6positioning.hash b/package/qt6/qt6positioning/qt6positioning.hash
index 7d9352b998..fa4b766096 100644
--- a/package/qt6/qt6positioning/qt6positioning.hash
+++ b/package/qt6/qt6positioning/qt6positioning.hash
@@ -1,5 +1,5 @@
-# From https://download.qt.io/official_releases/qt/6.11/6.11.3/submodules/qtpositioning-everywhere-src-6.11.3.tar.xz.sha256
-sha256  a38695bc412b7261476e8e96178460ec9319e61c34ecc6a14eb2e76e5c73eca1  qtpositioning-everywhere-src-6.11.3.tar.xz
+# From https://download.qt.io/official_releases/qt/6.12/6.12.0/submodules/qtpositioning-everywhere-src-6.12.0.tar.xz.sha256
+sha256  b060d410fac7413b05a0e7938bbf3325f7ad08d7df14af3956270f0696e76763  qtpositioning-everywhere-src-6.12.0.tar.xz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
diff --git a/package/qt6/qt6quick3d/qt6quick3d.hash b/package/qt6/qt6quick3d/qt6quick3d.hash
index beb7b11345..44eed7918d 100644
--- a/package/qt6/qt6quick3d/qt6quick3d.hash
+++ b/package/qt6/qt6quick3d/qt6quick3d.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.3/submodules/qtquick3d-everywhere-src-6.11.3.tar.xz.sha256
-sha256  c05d2491ead3ee22d2c8e9b7c9cc8e5874e7c05c1fc3329bc6a0ece70eaccc96  qtquick3d-everywhere-src-6.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.12/6.12.0/submodules/qtquick3d-everywhere-src-6.12.0.tar.xz.sha256
+sha256  6ced6edbd25fb5a632fe770ae820b376bf50233e8d62002c79a69a505a2e429e  qtquick3d-everywhere-src-6.12.0.tar.xz
 
 # Hashes for license files
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
@@ -7,6 +7,6 @@ sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENS
 sha256  d040359701c01996a017d5c515678929cd1b0625e64cb86db44025fbb6cdf1fc  LICENSES/MIT.txt
 sha256  c3ed04bcbea49f521e4ab32c638fa86b13ebc7b8e1a8972807265079fcd1e6b9  src/3rdparty/assimp/LICENSE
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/embree/LICENSE.txt
-sha256  e4a26033e3551fb2722888949fbb41e77aee628e8e8f04dcffeee301aa7e5634  src/3rdparty/meshoptimizer/LICENSE.md
+sha256  f03037ca7bad1e3eb7f4a63fa6084a8baabd5ba30d3c239a9a7f35705d873e26  src/3rdparty/meshoptimizer/LICENSE.md
 sha256  b90388aaadc2b6f77a5c01278697a2a0539eab471a3befc6a081728becdc3390  src/3rdparty/tinyexr/LICENSE
 sha256  2c16d5b1c2808277fe975b4f70f0fd9afc9b3bcf04e6c676665a82cb2d5579e3  src/3rdparty/xatlas/LICENSE
diff --git a/package/qt6/qt6quicktimeline/qt6quicktimeline.hash b/package/qt6/qt6quicktimeline/qt6quicktimeline.hash
index 60717a3e52..f201fa2aec 100644
--- a/package/qt6/qt6quicktimeline/qt6quicktimeline.hash
+++ b/package/qt6/qt6quicktimeline/qt6quicktimeline.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.3/submodules/qtquicktimeline-everywhere-src-6.11.3.tar.xz.sha256
-sha256  e0e52453a4d13f6378fc4dff4cac8ef874fea35ddb9a72c1604e124ee941c692  qtquicktimeline-everywhere-src-6.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.12/6.12.0/submodules/qtquicktimeline-everywhere-src-6.12.0.tar.xz.sha256
+sha256  6919153c841478c113f0ad20526f40e606590968334762ec6ccbc96002f8da19  qtquicktimeline-everywhere-src-6.12.0.tar.xz
 
 # Hashes for license files
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
diff --git a/package/qt6/qt6scxml/qt6scxml.hash b/package/qt6/qt6scxml/qt6scxml.hash
index 62b1da2cbc..f59dac2c43 100644
--- a/package/qt6/qt6scxml/qt6scxml.hash
+++ b/package/qt6/qt6scxml/qt6scxml.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.3/submodules/qtscxml-everywhere-src-6.11.3.tar.xz.sha256
-sha256  d89d7782d24d9609695c99ffbe8775c74348dc7e742af2b153e357d0ded2081f  qtscxml-everywhere-src-6.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.12/6.12.0/submodules/qtscxml-everywhere-src-6.12.0.tar.xz.sha256
+sha256  adc04875b383256bcd5a412f6f249d363495ea037913ca8c96d723442be38383  qtscxml-everywhere-src-6.12.0.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6serialbus/qt6serialbus.hash b/package/qt6/qt6serialbus/qt6serialbus.hash
index 843ba8b548..e3f4f4fd80 100644
--- a/package/qt6/qt6serialbus/qt6serialbus.hash
+++ b/package/qt6/qt6serialbus/qt6serialbus.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.3/submodules/qtserialbus-everywhere-src-6.11.3.tar.xz.sha256
-sha256  934aa90721b17a7f2d7c59a9afcee2526030bfcf3a8caf95278d2690b284569e  qtserialbus-everywhere-src-6.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.12/6.12.0/submodules/qtserialbus-everywhere-src-6.12.0.tar.xz.sha256
+sha256  1099cc24aff9d20c5ba7897c0b617c318098f009edf92f4e6ca97c815f5bdf38  qtserialbus-everywhere-src-6.12.0.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6serialport/qt6serialport.hash b/package/qt6/qt6serialport/qt6serialport.hash
index 4f573a924a..e8f7a31be4 100644
--- a/package/qt6/qt6serialport/qt6serialport.hash
+++ b/package/qt6/qt6serialport/qt6serialport.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.3/submodules/qtserialport-everywhere-src-6.11.3.tar.xz.sha256
-sha256  b09bfb0eace070ce1b980f7f2c9ba9fb885c2cc29a4cd0416061496426601722  qtserialport-everywhere-src-6.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.12/6.12.0/submodules/qtserialport-everywhere-src-6.12.0.tar.xz.sha256
+sha256  ba8886a54eee466e57c9fa1341255cc09c462c84baab3ee7b19d67cdbcbd71c3  qtserialport-everywhere-src-6.12.0.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6shadertools/qt6shadertools.hash b/package/qt6/qt6shadertools/qt6shadertools.hash
index c88f40bbdb..2b86485786 100644
--- a/package/qt6/qt6shadertools/qt6shadertools.hash
+++ b/package/qt6/qt6shadertools/qt6shadertools.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.3/submodules/qtshadertools-everywhere-src-6.11.3.tar.xz.sha256
-sha256  d86079425ec71eecbb05f4d20623b0a403a7d21a5cfa7efb9734ea3d538d801b  qtshadertools-everywhere-src-6.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.12/6.12.0/submodules/qtshadertools-everywhere-src-6.12.0.tar.xz.sha256
+sha256  c7d84f436e1aaef39fdcadebf2bd71bdf24dc69497e13f2e0198873cbbfea2ab  qtshadertools-everywhere-src-6.12.0.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6svg/qt6svg.hash b/package/qt6/qt6svg/qt6svg.hash
index a520d8d79f..45934c805e 100644
--- a/package/qt6/qt6svg/qt6svg.hash
+++ b/package/qt6/qt6svg/qt6svg.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.3/submodules/qtsvg-everywhere-src-6.11.3.tar.xz.sha256
-sha256  9bdf6fa4b5a2d91c3eaa2edd12263fdff0ae19d0ac25d3c99946cd4189a07123  qtsvg-everywhere-src-6.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.12/6.12.0/submodules/qtsvg-everywhere-src-6.12.0.tar.xz.sha256
+sha256  e4ab39534ec97987b1b9b60ef7f4d3253d5912a69f8c713a01753174a4029331  qtsvg-everywhere-src-6.12.0.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6tools/qt6tools.hash b/package/qt6/qt6tools/qt6tools.hash
index 3a9a1e4fbe..660b873f72 100644
--- a/package/qt6/qt6tools/qt6tools.hash
+++ b/package/qt6/qt6tools/qt6tools.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.3/submodules/qttools-everywhere-src-6.11.3.tar.xz.sha256
-sha256  524ca79ee653fa36d4644ce66a5c0825930ee2550ff1d0987e703a66fd6c61ec  qttools-everywhere-src-6.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.12/6.12.0/submodules/qttools-everywhere-src-6.12.0.tar.xz.sha256
+sha256  8dab8f3611496486a470ad5f115ceea584f36bc22a2b8b6f6ebdbafbb8160693  qttools-everywhere-src-6.12.0.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash b/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
index def4ff4b76..00465b319a 100644
--- a/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
+++ b/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.3/submodules/qtvirtualkeyboard-everywhere-src-6.11.3.tar.xz.sha256
-sha256  7c0ea4c6e05cc4d8225c862781efc78284d5f61809eedc405f37ea31acbb7478  qtvirtualkeyboard-everywhere-src-6.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.12/6.12.0/submodules/qtvirtualkeyboard-everywhere-src-6.12.0.tar.xz.sha256
+sha256  2aae3628f4648f86959d7853e7e1f50ee96a7f1bb5497afb62b7deff6c350170  qtvirtualkeyboard-everywhere-src-6.12.0.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6wayland/qt6wayland.hash b/package/qt6/qt6wayland/qt6wayland.hash
index 37ee1b7375..6a1cde19e3 100644
--- a/package/qt6/qt6wayland/qt6wayland.hash
+++ b/package/qt6/qt6wayland/qt6wayland.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.3/submodules/qtwayland-everywhere-src-6.11.3.tar.xz.sha256
-sha256  7f6185eb6e7d75202c42dfaf18dc54ae96f2d9a7a265358d061a6f85366f6c97  qtwayland-everywhere-src-6.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.12/6.12.0/submodules/qtwayland-everywhere-src-6.12.0.tar.xz.sha256
+sha256  ae14d9bcf1bb3c300a3ab2e6a53f50284e5c6c966a4ac4cc5aedcb1bc74e4d02  qtwayland-everywhere-src-6.12.0.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6websockets/qt6websockets.hash b/package/qt6/qt6websockets/qt6websockets.hash
index 57c0301c7f..1f39a6eb5d 100644
--- a/package/qt6/qt6websockets/qt6websockets.hash
+++ b/package/qt6/qt6websockets/qt6websockets.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.11/6.11.3/submodules/qtwebsockets-everywhere-src-6.11.3.tar.xz.sha256
-sha256  19b39acc37ec67a344fe0f080201c2c64d04d2a3d0c7dfa84955033f1016983b  qtwebsockets-everywhere-src-6.11.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.12/6.12.0/submodules/qtwebsockets-everywhere-src-6.12.0.tar.xz.sha256
+sha256  21690a365cd5fbfa8dea051473e98968df9f4eca0121fed7481d1215b7455a31  qtwebsockets-everywhere-src-6.12.0.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
