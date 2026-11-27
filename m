Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27526606A31C
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 11:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VEX+Gh3O;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=POE/42px
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07B1E60ACD;
	Fri, 27 Nov 2026 11:25:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jlXsWsGr_TT4; Fri, 27 Nov 2026 11:25:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3B55D60B04
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795778721;
	b=YBcJQdLa++kv2flwFJi8g2b0F6Pz+o4WbSH2OevN+Mp4sbG8+NWtGeJScglYx0Q2Ondm
	 jiXFBrDExZQO6xoyYj/zaSSgL5X6hYSm/lEh4vdYLmz5xXmEzRd/SUR+4R7g0227IiLMb
	 KgUCZV3WvUDUc6baaDbkpJFfynLyS65WXcZOlV5cZyWPvs8K59p6lkB1hvMohGphBjw9S
	 QhMMekBnpfpKshr1+/r9jOzUnR5JyyyqlReMTTKTW7h3vr3mUBywge/7NQPsQWTbgs0nO
	 nxFr5RnsGXMKqP2rDpLiCCIVsKAIC+6zMDs3kXQUlgBLneGXFlN+lsd3Z9SO3PPwfog==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795778721;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=IBQtFcmGdviUX9U4EbOL6LG9vuvKGqeo8jd379c1ATk=;
	b=M2pNZ4y6WO8hpB4E69FKUmRxlt23GzEm+IujvFcGmkI2vc7iDzOCL4s+lFwj+yDz9xhI
	 t21g09FoZxJC+YsZsxInn/uuza17xx5Zc88qgr5ZG9YMPT/DIPJZUzKonmCf2u08AYOvi
	 Fjx4Z8kA+AxJtadAJ03uu9mtYJMfBPL/w5knYYgl/jayw0OLTy1j2TpgSYkPemHpEiggT
	 g8rgZg/nFzmFYJPKTKTnMh4YdtwgK8EeGxROlikzDdyhhj46h1nI1VmGmSl+F6/WG3Tu8
	 TukRrlfU5coSF42NJYj3OnNn3Ra7bfVOTmgvMmAid3ryjycXwvmoPzSegaJshX0oUEw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795778721;
	bh=IBQtFcmGdviUX9U4EbOL6LG9vuvKGqeo8jd379c1ATk=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VEX+Gh3O3z2D2So6Z+g8Ij2zFvuWovM8TBa24LoQYamkTQqXqDx/FUEF73uEly2ED
	 sR41MuWYO6b1MZxma0eUvM2Zd412s7DXhynscRvWzxSwfXFfwJhGUdxHHuZTJkT+Uj
	 MRw8nRwlJeX/SYvuTqLcJWEr8IiSoCrukVYm1+L/iWMXx51shodfv0+zM43UxCXW83
	 9kIapOG/fIJ2DkgajAMGBodBCaEKGUBoTu02S5+pwvBB7PfBCVrsgg+gEGoyo4VUeK
	 CQisDJNdkDKChdfFfLQEL0mHE1Yw/MJXkgoDW4ywNfB1QwYrv+GpwXGSxfXP7sULZB
	 mys12TbZc4Exg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B55D60B04;
	Fri, 27 Nov 2026 11:25:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B325ABEC
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 11:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 997BB40571
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 11:25:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aN8xdi5RcSsV for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 11:25:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 850B340249
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::62d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=POE/42px
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 850B340249
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 11:25:12 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-c407213696aso103992566b.0
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 03:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1795778710; x=1796383510;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=AD69C5nexzZh1vUF7KA08D8lPr29+rNxIEeD94k6aOo=;
 b=POE/42pxMD9y9tg0kZWMglhrcKHRkiovlxbEJHtnyW9ByCxzonOBxMkd/h9evgaIuI
 F1J7I6NklWH5YiNL6EvNQkENS8yD7QyBwZRMcEPm6WrDsTrkpdCmKfl041IjqNEWjK0k
 TYyXSH2fN709KwBK6zJxZ+00tHTk8SofovHWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795778710; x=1796383510;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=AD69C5nexzZh1vUF7KA08D8lPr29+rNxIEeD94k6aOo=;
 b=x82cVALo9sCyBLOe+ZxPKLO67UhyM/nGB5vAb3b91MN3kQLS7eGmHOYXoOMm5mw5ip
 z/KPxhc7BQOafGfouvAN0UFT3n3lsY+UwiIEYgCToW6gYC2G+qe45fB1K8b4/k91/nEN
 REAN2XVMJFRr77NhWzQ0xmn3Jk//8PiTskQg8Kk9zWwUxIiAWpYlFp6hMXMGhk+LU1zA
 z6HKlIH98NzAxMdQwcgCWRtUFcSoybMHcJoGQ9sfF/rUHwpG67wL3GMc1H0CuDv3ta+Q
 wJgVNTfF1lwVc0mSF99vDJXvmIZVydgm0BI0LGAbYW4IzoeZbmmaWtUkGcxMUNScQmva
 U6OQ==
X-Gm-Message-State: APuU4Z+2abY2gRn7w87YvTCxKaNkt00q8ydGkQiXr4s/TjHIOAmSoklx
 lUSPQyvVHh27sbjdiDAGbEQTvlm441oZvGdZvNeuFD+HBbNcevHR6V1iL0UIN5tPpwnUNZv3hiy
 yt3lXQ7w=
X-Gm-Gg: AZFdTZc1sDWJlq3hwgr9V4tq84Rwa3Pzu9t3g/Kd+EjhlrYuQCwYbiKG/g53zTI1po9
 DzRUsHgnnJMxES5Yxooe8nWkjpvJqsSuFhkGct3xi2imsCpiX6u/SwDwIMgWkqUd8oVpvRfaY/c
 1g3Uw06ky+3f/vel7o4f8EBHgs0NcFRxK/bK7jcAMKyTsb1mNtbyu4E+xXJOS7oQS0H8FWVizLa
 56EPHl7V5p4WIzYxi3B0L81WUeAGRtjLnbguAKjC3L1SCDP1Ui6LkDnDPgjeLcwRma5LwfTSpnj
 MqnaQrh712dLoSbOstQq8//2HqnH8lS8xS0dD0x+OxIlFS6/5ZMaAXhzJiYxmk7oFJG+npv1ee4
 mVha0/Ib9ZI1a9LnDTHnYAyLMlf/ZX4lYlU4yT3/G6s+UGaF8m/OvFi9fxoMGezwo47oxHGE8WQ
 LWSaQbNX5Erut8vD5+K+kbDixcAAit1YJi9YRXZqjwM4Ex870jwKpMuC120BJjBsUR3SUVzYpFs
 KoAdxyq+xurvXc3Ii6+KimP11LeWKd5Ys+N8X1O8MFcBznFkZ2yLpivPqykxqt3sq8RutKzIeze
 F+ZckUIHDiTp/R+PN1ctAnoDrLq0Tdrw94mW5WLK6tbVYDl9Mq90woi6AAzvvyO5+op9amczcNl
 PVomUAoSeYJuRdn/5uCf3Lt0A2I6Z93m1yOtZKiTWMGDBKxizPhOQ3GBivBhU3Fuqa69S5szdoZ
 iJV/B7vhEQlg1EM1byHHWuYgx59hgyrIotwSAz8jAz21zcYBPrghQhX0poYxv1qj8E4XmQcLr4C
 RopPHS42BujVuELIoBVl+e9sB9P55TUeuLzTzL+LqpuyP9XD3jx
X-Received: by 2002:a17:906:811:b0:c51:356c:2657 with SMTP id
 a640c23a62f3a-c513a567c14mr1938167966b.3.1795778710445; 
 Fri, 27 Nov 2026 03:25:10 -0800 (PST)
Received: from adam-linux.arnhem.chello.nl
 (2001-1c00-8181-e800-dc0e-c162-ac5f-4bbe.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8181:e800:dc0e:c162:ac5f:4bbe])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c513aea3701sm885808166b.48.2026.11.27.03.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2026 03:25:09 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Nov 2026 12:25:04 +0100
Message-ID: <20261127112507.2594905-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127112507.2594905-1-adam.duskett@amarulasolutions.com>
References: <20261127112507.2594905-1-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 3/6] package/flutter-packages: bump to
 version f455dfa6
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
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Upstream removed the following on commit 4e4cddd1:
 - flutter_adaptive_scaffold,
 - flutter_image
 - flutter_markdown

Update LICENSE hash due to "All rights reserved." being dropped from the
copyright line.

As the flutter-markdown-example package is removed, switch the runtime
test to flutter-animations-example.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2: fix new license hash [thomas]

 Config.in.legacy                              | 24 +++++++++
 DEVELOPERS                                    |  3 --
 package/flutter-packages/Config.in            |  3 --
 .../Config.in                                 |  8 ---
 .../flutter-adaptive-scaffold-example.hash    |  1 -
 .../flutter-adaptive-scaffold-example.mk      | 54 -------------------
 .../flutter-image-example/Config.in           |  8 ---
 .../flutter-image-example.hash                |  1 -
 .../flutter-image-example.mk                  | 54 -------------------
 .../flutter-markdown-example/Config.in        |  7 ---
 .../flutter-markdown-example.hash             |  1 -
 .../flutter-markdown-example.mk               | 54 -------------------
 .../flutter-packages/flutter-packages.hash    |  4 +-
 package/flutter-packages/flutter-packages.mk  |  2 +-
 support/testing/tests/package/test_flutter.py | 10 ++--
 .../system/flutter-animations-example.service |  9 ++++
 .../system/flutter-markdown-example.service   |  9 ----
 17 files changed, 41 insertions(+), 211 deletions(-)
 delete mode 100644 package/flutter-packages/flutter-adaptive-scaffold-example/Config.in
 delete mode 120000 package/flutter-packages/flutter-adaptive-scaffold-example/flutter-adaptive-scaffold-example.hash
 delete mode 100644 package/flutter-packages/flutter-adaptive-scaffold-example/flutter-adaptive-scaffold-example.mk
 delete mode 100644 package/flutter-packages/flutter-image-example/Config.in
 delete mode 120000 package/flutter-packages/flutter-image-example/flutter-image-example.hash
 delete mode 100644 package/flutter-packages/flutter-image-example/flutter-image-example.mk
 delete mode 100644 package/flutter-packages/flutter-markdown-example/Config.in
 delete mode 120000 package/flutter-packages/flutter-markdown-example/flutter-markdown-example.hash
 delete mode 100644 package/flutter-packages/flutter-markdown-example/flutter-markdown-example.mk
 create mode 100644 support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-animations-example.service
 delete mode 100644 support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-markdown-example.service

diff --git a/Config.in.legacy b/Config.in.legacy
index bfd03f92b6..9f15bbd4ce 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,30 @@ endif
 
 comment "Legacy options removed in 2027.02"
 
+config BR2_PACKAGE_FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE
+	bool "flutter adaptive scaffold example has been removed"
+	select BR2_LEGACY
+	help
+	  The flutter adaptive scaffold package was discontinued and
+	  removed from flutter-packages as of commit
+	  4e4cddd1dcc06f03aaf9af23e7d46816ca8800c8.
+
+config BR2_PACKAGE_FLUTTER_IMAGE_EXAMPLE
+	bool "flutter image example has been removed"
+	select BR2_LEGACY
+	help
+	  The flutter image package was discontinued and
+	  removed from flutter-packages as of commit
+	  4e4cddd1dcc06f03aaf9af23e7d46816ca8800c8.
+
+config BR2_PACKAGE_FLUTTER_MARKDOWN_EXAMPLE
+	bool "flutter markdown example has been removed"
+	select BR2_LEGACY
+	help
+	  The flutter markdown package was discontinued and
+	  removed from flutter-packages as of commit
+	  4e4cddd1dcc06f03aaf9af23e7d46816ca8800c8.
+
 config BR2_PACKAGE_RTL8812AU_AIRCRACK_NG
 	bool "rtl8812au-aircrack-ng has been renamed to rtl8812au"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index e0d43b4519..cc28f6f67a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -30,11 +30,8 @@ N:	Adam Duskett <adam.duskett@amarulasolutions.com>
 F:	package/depot-tools/
 F:	package/flutter-engine/
 F:	package/flutter-packages/
-F:	package/flutter-packages/flutter-adaptive-scaffold-example/
 F:	package/flutter-packages/flutter-animations-example/
 F:	package/flutter-packages/flutter-go-router-example/
-F:	package/flutter-packages/flutter-image-example/
-F:	package/flutter-packages/flutter-markdown-example/
 F:	package/flutter-packages/flutter-rfw-local-example/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
diff --git a/package/flutter-packages/Config.in b/package/flutter-packages/Config.in
index 88d9193608..93eaf69697 100644
--- a/package/flutter-packages/Config.in
+++ b/package/flutter-packages/Config.in
@@ -7,11 +7,8 @@ menuconfig BR2_PACKAGE_FLUTTER_PACKAGES
 	  First-party Flutter package examples.
 
 if BR2_PACKAGE_FLUTTER_PACKAGES
-source "package/flutter-packages/flutter-adaptive-scaffold-example/Config.in"
 source "package/flutter-packages/flutter-animations-example/Config.in"
 source "package/flutter-packages/flutter-go-router-example/Config.in"
-source "package/flutter-packages/flutter-image-example/Config.in"
-source "package/flutter-packages/flutter-markdown-example/Config.in"
 source "package/flutter-packages/flutter-rfw-local-example/Config.in"
 endif
 
diff --git a/package/flutter-packages/flutter-adaptive-scaffold-example/Config.in b/package/flutter-packages/flutter-adaptive-scaffold-example/Config.in
deleted file mode 100644
index f7c448e06c..0000000000
--- a/package/flutter-packages/flutter-adaptive-scaffold-example/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE
-	bool "flutter adaptive scaffold example"
-	help
-	  Adaptive Scaffold reacts to input from users, devices and
-	  screen elements and renders your Flutter application
-	  according to the Material 3 guidelines.
-
-	  https://github.com/flutter/packages/tree/main/packages/flutter_adaptive_scaffold/example
diff --git a/package/flutter-packages/flutter-adaptive-scaffold-example/flutter-adaptive-scaffold-example.hash b/package/flutter-packages/flutter-adaptive-scaffold-example/flutter-adaptive-scaffold-example.hash
deleted file mode 120000
index 879f2adb39..0000000000
--- a/package/flutter-packages/flutter-adaptive-scaffold-example/flutter-adaptive-scaffold-example.hash
+++ /dev/null
@@ -1 +0,0 @@
-../flutter-packages.hash
\ No newline at end of file
diff --git a/package/flutter-packages/flutter-adaptive-scaffold-example/flutter-adaptive-scaffold-example.mk b/package/flutter-packages/flutter-adaptive-scaffold-example/flutter-adaptive-scaffold-example.mk
deleted file mode 100644
index e8e27d4383..0000000000
--- a/package/flutter-packages/flutter-adaptive-scaffold-example/flutter-adaptive-scaffold-example.mk
+++ /dev/null
@@ -1,54 +0,0 @@
-################################################################################
-#
-# flutter-adaptive-scaffold-example
-#
-################################################################################
-
-FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_VERSION = $(FLUTTER_PACKAGES_VERSION)
-FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_SITE = $(FLUTTER_PACKAGES_SITE)
-FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_SITE_METHOD = $(FLUTTER_PACKAGES_SITE_METHOD)
-FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_SOURCE = $(FLUTTER_PACKAGES_SOURCE)
-FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_LICENSE = $(FLUTTER_PACKAGES_LICENSE)
-FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_LICENSE_FILES = $(FLUTTER_PACKAGES_LICENSE_FILES)
-FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_DL_SUBDIR = $(FLUTTER_PACKAGES_DL_SUBDIR)
-FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_DEPENDENCIES = $(FLUTTER_PACKAGES_DEPENDENCIES)
-FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_PKG_NAME = flutter_adaptive_scaffold_example
-FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_INSTALL_DIR = $(TARGET_DIR)/usr/share/flutter/$(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_PKG_NAME)/$(FLUTTER_ENGINE_RUNTIME_MODE)
-FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_SUBDIR = packages/flutter_adaptive_scaffold/example
-
-define FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_CONFIGURE_CMDS
-	cd $(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_BUILDDIR) && \
-		$(HOST_FLUTTER_SDK_BIN_FLUTTER) clean && \
-		$(HOST_FLUTTER_SDK_BIN_FLUTTER) pub get && \
-		$(HOST_FLUTTER_SDK_BIN_FLUTTER) build bundle
-endef
-
-define FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_BUILD_CMDS
-	cd $(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_BUILDDIR) && \
-		$(HOST_FLUTTER_SDK_BIN_DART_BIN) \
-			--native-assets $(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/*/native_assets.json \
-			package:$(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_PKG_NAME)/main.dart && \
-		$(HOST_FLUTTER_SDK_BIN_ENV) $(FLUTTER_ENGINE_GEN_SNAPSHOT) \
-			--deterministic \
-			--obfuscate \
-			--snapshot_kind=app-aot-elf \
-			--elf=libapp.so \
-			.dart_tool/flutter_build/*/app.dill
-endef
-
-define FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_INSTALL_TARGET_CMDS
-	mkdir -p $(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_INSTALL_DIR)/{data,lib}
-	cp -dprf $(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_BUILDDIR)/build/flutter_assets $(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_INSTALL_DIR)/data/
-
-	$(INSTALL) -D -m 0755 $(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_BUILDDIR)/libapp.so \
-		$(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_INSTALL_DIR)/lib/libapp.so
-
-	ln -sf /usr/share/flutter/$(FLUTTER_ENGINE_RUNTIME_MODE)/data/icudtl.dat \
-	$(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_INSTALL_DIR)/data/
-
-	ln -sf /usr/lib/libflutter_engine.so $(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_INSTALL_DIR)/lib/
-	$(RM) $(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_INSTALL_DIR)/data/flutter_assets/kernel_blob.bin
-	touch $(FLUTTER_ADAPTIVE_SCAFFOLD_EXAMPLE_INSTALL_DIR)/data/flutter_assets/kernel_blob.bin
-endef
-
-$(eval $(generic-package))
diff --git a/package/flutter-packages/flutter-image-example/Config.in b/package/flutter-packages/flutter-image-example/Config.in
deleted file mode 100644
index 15ae20872a..0000000000
--- a/package/flutter-packages/flutter-image-example/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_FLUTTER_IMAGE_EXAMPLE
-	bool "flutter image example"
-	select BR2_PACKAGE_CA_CERTIFICATES # runtime
-	help
-	  Use NetworkImageWithRetry instead of Image.network to
-	  load images from the network with a retry mechanism.
-
-	  https://github.com/flutter/packages/tree/main/packages/flutter_image/example
diff --git a/package/flutter-packages/flutter-image-example/flutter-image-example.hash b/package/flutter-packages/flutter-image-example/flutter-image-example.hash
deleted file mode 120000
index 879f2adb39..0000000000
--- a/package/flutter-packages/flutter-image-example/flutter-image-example.hash
+++ /dev/null
@@ -1 +0,0 @@
-../flutter-packages.hash
\ No newline at end of file
diff --git a/package/flutter-packages/flutter-image-example/flutter-image-example.mk b/package/flutter-packages/flutter-image-example/flutter-image-example.mk
deleted file mode 100644
index 5d754c0ff6..0000000000
--- a/package/flutter-packages/flutter-image-example/flutter-image-example.mk
+++ /dev/null
@@ -1,54 +0,0 @@
-################################################################################
-#
-# flutter-image-example
-#
-################################################################################
-
-FLUTTER_IMAGE_EXAMPLE_VERSION = $(FLUTTER_PACKAGES_VERSION)
-FLUTTER_IMAGE_EXAMPLE_SITE = $(FLUTTER_PACKAGES_SITE)
-FLUTTER_IMAGE_EXAMPLE_SITE_METHOD = $(FLUTTER_PACKAGES_SITE_METHOD)
-FLUTTER_IMAGE_EXAMPLE_SOURCE = $(FLUTTER_PACKAGES_SOURCE)
-FLUTTER_IMAGE_EXAMPLE_LICENSE = $(FLUTTER_PACKAGES_LICENSE)
-FLUTTER_IMAGE_EXAMPLE_LICENSE_FILES = $(FLUTTER_PACKAGES_LICENSE_FILES)
-FLUTTER_IMAGE_EXAMPLE_DL_SUBDIR = $(FLUTTER_PACKAGES_DL_SUBDIR)
-FLUTTER_IMAGE_EXAMPLE_DEPENDENCIES = $(FLUTTER_PACKAGES_DEPENDENCIES)
-FLUTTER_IMAGE_EXAMPLE_PKG_NAME = flutter_image_example
-FLUTTER_IMAGE_EXAMPLE_INSTALL_DIR = $(TARGET_DIR)/usr/share/flutter/$(FLUTTER_IMAGE_EXAMPLE_PKG_NAME)/$(FLUTTER_ENGINE_RUNTIME_MODE)
-FLUTTER_IMAGE_EXAMPLE_SUBDIR = packages/flutter_image/example
-
-define FLUTTER_IMAGE_EXAMPLE_CONFIGURE_CMDS
-	cd $(FLUTTER_IMAGE_EXAMPLE_BUILDDIR) && \
-		$(HOST_FLUTTER_SDK_BIN_FLUTTER) clean && \
-		$(HOST_FLUTTER_SDK_BIN_FLUTTER) pub get && \
-		$(HOST_FLUTTER_SDK_BIN_FLUTTER) build bundle
-endef
-
-define FLUTTER_IMAGE_EXAMPLE_BUILD_CMDS
-	cd $(FLUTTER_IMAGE_EXAMPLE_BUILDDIR) && \
-		$(HOST_FLUTTER_SDK_BIN_DART_BIN) \
-			--native-assets $(FLUTTER_IMAGE_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/*/native_assets.json \
-			package:$(FLUTTER_IMAGE_EXAMPLE_PKG_NAME)/main.dart && \
-		$(HOST_FLUTTER_SDK_BIN_ENV) $(FLUTTER_ENGINE_GEN_SNAPSHOT) \
-			--deterministic \
-			--obfuscate \
-			--snapshot_kind=app-aot-elf \
-			--elf=libapp.so \
-			.dart_tool/flutter_build/*/app.dill
-endef
-
-define FLUTTER_IMAGE_EXAMPLE_INSTALL_TARGET_CMDS
-	mkdir -p $(FLUTTER_IMAGE_EXAMPLE_INSTALL_DIR)/{data,lib}
-	cp -dprf $(FLUTTER_IMAGE_EXAMPLE_BUILDDIR)/build/flutter_assets $(FLUTTER_IMAGE_EXAMPLE_INSTALL_DIR)/data/
-
-	$(INSTALL) -D -m 0755 $(FLUTTER_IMAGE_EXAMPLE_BUILDDIR)/libapp.so \
-		$(FLUTTER_IMAGE_EXAMPLE_INSTALL_DIR)/lib/libapp.so
-
-	ln -sf /usr/share/flutter/$(FLUTTER_ENGINE_RUNTIME_MODE)/data/icudtl.dat \
-	$(FLUTTER_IMAGE_EXAMPLE_INSTALL_DIR)/data/
-
-	ln -sf /usr/lib/libflutter_engine.so $(FLUTTER_IMAGE_EXAMPLE_INSTALL_DIR)/lib/
-	$(RM) $(FLUTTER_IMAGE_EXAMPLE_INSTALL_DIR)/data/flutter_assets/kernel_blob.bin
-	touch $(FLUTTER_IMAGE_EXAMPLE_INSTALL_DIR)/data/flutter_assets/kernel_blob.bin
-endef
-
-$(eval $(generic-package))
diff --git a/package/flutter-packages/flutter-markdown-example/Config.in b/package/flutter-packages/flutter-markdown-example/Config.in
deleted file mode 100644
index 939b21053c..0000000000
--- a/package/flutter-packages/flutter-markdown-example/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_FLUTTER_MARKDOWN_EXAMPLE
-	bool "flutter markdown example"
-	help
-	  A markdown renderer for Flutter. It supports the original
-	  format, but no inline HTML.
-
-	  https://github.com/flutter/packages/tree/main/packages/flutter_markdown
diff --git a/package/flutter-packages/flutter-markdown-example/flutter-markdown-example.hash b/package/flutter-packages/flutter-markdown-example/flutter-markdown-example.hash
deleted file mode 120000
index 879f2adb39..0000000000
--- a/package/flutter-packages/flutter-markdown-example/flutter-markdown-example.hash
+++ /dev/null
@@ -1 +0,0 @@
-../flutter-packages.hash
\ No newline at end of file
diff --git a/package/flutter-packages/flutter-markdown-example/flutter-markdown-example.mk b/package/flutter-packages/flutter-markdown-example/flutter-markdown-example.mk
deleted file mode 100644
index 0859b947eb..0000000000
--- a/package/flutter-packages/flutter-markdown-example/flutter-markdown-example.mk
+++ /dev/null
@@ -1,54 +0,0 @@
-################################################################################
-#
-# flutter-markdown-example
-#
-################################################################################
-
-FLUTTER_MARKDOWN_EXAMPLE_VERSION = $(FLUTTER_PACKAGES_VERSION)
-FLUTTER_MARKDOWN_EXAMPLE_SITE = $(FLUTTER_PACKAGES_SITE)
-FLUTTER_MARKDOWN_EXAMPLE_SITE_METHOD = $(FLUTTER_PACKAGES_SITE_METHOD)
-FLUTTER_MARKDOWN_EXAMPLE_SOURCE = $(FLUTTER_PACKAGES_SOURCE)
-FLUTTER_MARKDOWN_EXAMPLE_LICENSE = $(FLUTTER_PACKAGES_LICENSE)
-FLUTTER_MARKDOWN_EXAMPLE_LICENSE_FILES = $(FLUTTER_PACKAGES_LICENSE_FILES)
-FLUTTER_MARKDOWN_EXAMPLE_DL_SUBDIR = $(FLUTTER_PACKAGES_DL_SUBDIR)
-FLUTTER_MARKDOWN_EXAMPLE_DEPENDENCIES = $(FLUTTER_PACKAGES_DEPENDENCIES)
-FLUTTER_MARKDOWN_EXAMPLE_PKG_NAME = flutter_markdown_example
-FLUTTER_MARKDOWN_EXAMPLE_INSTALL_DIR = $(TARGET_DIR)/usr/share/flutter/$(FLUTTER_MARKDOWN_EXAMPLE_PKG_NAME)/$(FLUTTER_ENGINE_RUNTIME_MODE)
-FLUTTER_MARKDOWN_EXAMPLE_SUBDIR = packages/flutter_markdown/example
-
-define FLUTTER_MARKDOWN_EXAMPLE_CONFIGURE_CMDS
-	cd $(FLUTTER_MARKDOWN_EXAMPLE_BUILDDIR) && \
-		$(HOST_FLUTTER_SDK_BIN_FLUTTER) clean && \
-		$(HOST_FLUTTER_SDK_BIN_FLUTTER) pub get && \
-		$(HOST_FLUTTER_SDK_BIN_FLUTTER) build bundle
-endef
-
-define FLUTTER_MARKDOWN_EXAMPLE_BUILD_CMDS
-	cd $(FLUTTER_MARKDOWN_EXAMPLE_BUILDDIR) && \
-		$(HOST_FLUTTER_SDK_BIN_DART_BIN) \
-			--native-assets $(FLUTTER_MARKDOWN_EXAMPLE_BUILDDIR)/.dart_tool/flutter_build/*/native_assets.json \
-			package:$(FLUTTER_MARKDOWN_EXAMPLE_PKG_NAME)/main.dart && \
-		$(HOST_FLUTTER_SDK_BIN_ENV) $(FLUTTER_ENGINE_GEN_SNAPSHOT) \
-			--deterministic \
-			--obfuscate \
-			--snapshot_kind=app-aot-elf \
-			--elf=libapp.so \
-			.dart_tool/flutter_build/*/app.dill
-endef
-
-define FLUTTER_MARKDOWN_EXAMPLE_INSTALL_TARGET_CMDS
-	mkdir -p $(FLUTTER_MARKDOWN_EXAMPLE_INSTALL_DIR)/{data,lib}
-	cp -dprf $(FLUTTER_MARKDOWN_EXAMPLE_BUILDDIR)/build/flutter_assets $(FLUTTER_MARKDOWN_EXAMPLE_INSTALL_DIR)/data/
-
-	$(INSTALL) -D -m 0755 $(FLUTTER_MARKDOWN_EXAMPLE_BUILDDIR)/libapp.so \
-		$(FLUTTER_MARKDOWN_EXAMPLE_INSTALL_DIR)/lib/libapp.so
-
-	ln -sf /usr/share/flutter/$(FLUTTER_ENGINE_RUNTIME_MODE)/data/icudtl.dat \
-	$(FLUTTER_MARKDOWN_EXAMPLE_INSTALL_DIR)/data/
-
-	ln -sf /usr/lib/libflutter_engine.so $(FLUTTER_MARKDOWN_EXAMPLE_INSTALL_DIR)/lib/
-	$(RM) $(FLUTTER_MARKDOWN_EXAMPLE_INSTALL_DIR)/data/flutter_assets/kernel_blob.bin
-	touch $(FLUTTER_MARKDOWN_EXAMPLE_INSTALL_DIR)/data/flutter_assets/kernel_blob.bin
-endef
-
-$(eval $(generic-package))
diff --git a/package/flutter-packages/flutter-packages.hash b/package/flutter-packages/flutter-packages.hash
index 00346a8a6a..5e3057e269 100644
--- a/package/flutter-packages/flutter-packages.hash
+++ b/package/flutter-packages/flutter-packages.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9b6fdc8660ac3c601887c3c7e8859662e7fca19584af56dfac9c8acb86298a01  flutter-packages-2df1c3a524131e35d6e385eb9465c47d530e341b.tar.gz
-sha256  89519eca6f7b9529b35bdddd623a58c3af06a88c458dbd6531ddb4675acf75a9  LICENSE
+sha256  457cc5e8e9ce259c0335d3405107bf5633150c0570411ddb2f864ebb9f30bb37  flutter-packages-f455dfa67f5effa368b00050a7fe5abddcb0204c.tar.gz
+sha256  420f7739f169097f0aad1242045169cd643c8f1d94e62866fad265ae4c369b7d  LICENSE
diff --git a/package/flutter-packages/flutter-packages.mk b/package/flutter-packages/flutter-packages.mk
index 40a586f7e0..d769585090 100644
--- a/package/flutter-packages/flutter-packages.mk
+++ b/package/flutter-packages/flutter-packages.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_PACKAGES_VERSION = 2df1c3a524131e35d6e385eb9465c47d530e341b
+FLUTTER_PACKAGES_VERSION = f455dfa67f5effa368b00050a7fe5abddcb0204c
 FLUTTER_PACKAGES_SITE = $(call github,flutter,packages,$(FLUTTER_PACKAGES_VERSION))
 FLUTTER_PACKAGES_LICENSE = BSD-3-Clause
 FLUTTER_PACKAGES_LICENSE_FILES = LICENSE
diff --git a/support/testing/tests/package/test_flutter.py b/support/testing/tests/package/test_flutter.py
index ed8837c7c5..9789a82c33 100644
--- a/support/testing/tests/package/test_flutter.py
+++ b/support/testing/tests/package/test_flutter.py
@@ -30,7 +30,7 @@ class TestFlutter(infra.basetest.BRTest, GraphicsBase):
         BR2_PACKAGE_FLUTTER_PI_RAW_KEYBOARD_PLUGIN=y
         BR2_PACKAGE_FLUTTER_PI_TEXT_INPUT_PLUGIN=y
         BR2_PACKAGE_FLUTTER_PACKAGES=y
-        BR2_PACKAGE_FLUTTER_MARKDOWN_EXAMPLE=y
+        BR2_PACKAGE_FLUTTER_ANIMATIONS_EXAMPLE=y
         BR2_PACKAGE_FLUTTER_ENGINE=y
         BR2_TARGET_ROOTFS_EXT2=y
         BR2_TARGET_ROOTFS_EXT2_4=y
@@ -59,19 +59,19 @@ class TestFlutter(infra.basetest.BRTest, GraphicsBase):
         # so lets try a few times. 600 samples should cover about 10s
         # @60Hz (although, the rendering could be much slower on slow
         # machines)
-        self.assertRunOk("systemctl start flutter-markdown-example", timeout=10)
+        self.assertRunOk("systemctl start flutter-animations-example", timeout=10)
         for i in range(600):
             gallery_crc = self.get_n_fb_crc(count=1)[0]
             if gallery_crc != empty_crc:
                 break
             time.sleep(1)
-        self.assertNotEqual(gallery_crc, empty_crc, "gallery app did not render anything on screen")
+        self.assertNotEqual(gallery_crc, empty_crc, "Animation app did not render anything on screen")
 
         # Stop the application, and check it restored the framebuffer content
-        self.assertRunOk("systemctl stop flutter-markdown-example", timeout=10)
+        self.assertRunOk("systemctl stop flutter-animations-example", timeout=10)
         for i in range(600):
             gallery_crc = self.get_n_fb_crc(count=1)[0]
             if gallery_crc == empty_crc:
                 break
             time.sleep(1)
-        self.assertEqual(gallery_crc, empty_crc, "gallery app did not stop rendering")
+        self.assertEqual(gallery_crc, empty_crc, "Animation app did not stop rendering")
diff --git a/support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-animations-example.service b/support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-animations-example.service
new file mode 100644
index 0000000000..373d6aa50e
--- /dev/null
+++ b/support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-animations-example.service
@@ -0,0 +1,9 @@
+[Unit]
+Description=flutter-animations-example daemon
+After=dbus.service systemd-udevd.service
+
+[Service]
+ExecStart=/usr/bin/flutter-pi --release /usr/share/flutter/animations_example/release/
+Restart=always
+KillMode=process
+
diff --git a/support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-markdown-example.service b/support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-markdown-example.service
deleted file mode 100644
index bbea02ab0d..0000000000
--- a/support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-markdown-example.service
+++ /dev/null
@@ -1,9 +0,0 @@
-[Unit]
-Description=flutter-markdown-example daemon
-After=dbus.service systemd-udevd.service
-
-[Service]
-ExecStart=/usr/bin/flutter-pi --release /usr/share/flutter/flutter_markdown_example/release/
-Restart=always
-KillMode=process
-
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
