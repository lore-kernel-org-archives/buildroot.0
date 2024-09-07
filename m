Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD15E71080
	for <buildroot@archiver.kernel.org>; Sat,  7 Sep 2024 13:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E81BE81EDB;
	Sat,  7 Sep 2024 13:03:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fLGBrRtDGSID; Sat,  7 Sep 2024 13:03:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C85DF81354
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C85DF81354;
	Sat,  7 Sep 2024 13:03:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7633D1BF57F
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 13:03:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63F018133A
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 13:03:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id snmfNICZ0xBH for <buildroot@lists.busybox.net>;
 Sat,  7 Sep 2024 13:03:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1CEF38130C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CEF38130C
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1CEF38130C
 for <buildroot@busybox.net>; Sat,  7 Sep 2024 13:03:24 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2f029e9c9cfso39671191fa.2
 for <buildroot@busybox.net>; Sat, 07 Sep 2024 06:03:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725714202; x=1726319002;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Boqxe/HVY3qnEkif9dtfaHrpd7UPQXuao3oB3N+HdjY=;
 b=WDY25508Ir2g327ez6xU/ZkB7U6wD0IDMwi4AdDTQwEFn/aCwMwhn1Ci6OZoXZduXB
 +Up6+JA4/6sRoE1cZ2ZqbI5Ri6fjSp4LrbRtNSV9C8wU7YkajWtdBrBtXIDbN35PQRev
 plDqbaf4UV4/ChuOP0ZShRqpoYAr/dbWQGK+GE1FrWLL1m0SA7Wlg97FCJjp8j/2zQOE
 qp2Kwy3/GNETRVwwe0S/hH1Cvsmp9SqMw6iH4j6807eHrKtkcTEnXos2rEtbn8P6/+/O
 uggvKLDej3N0VzFrJDy6Llog2Nk/JL28F9puZABm5RRo6EK0hknlCvZo7I6XxFOzBiAy
 ce2Q==
X-Gm-Message-State: AOJu0Yx7czxQ9uDy/S6dAMiUiYJgAGzMom8rCSGdBzwUWki/3xKKLHZD
 TKcPMo+0DaWBXseLgLbvoxMiHfXAg6vsGBciNHRtNTtAoVlVlSzbN19pnv/x4YpJVQuINPdyxlC
 OMw==
X-Google-Smtp-Source: AGHT+IFtW9M9DTGV+BUUXy6+O1yHKc6XQ9y0DpvAXBn1plWvKFaUoIh7uZJ0lq37zOsuPdz3lFLsSg==
X-Received: by 2002:a05:651c:2112:b0:2ef:226e:e150 with SMTP id
 38308e7fff4ca-2f75aa07a6amr19891061fa.32.1725714201359; 
 Sat, 07 Sep 2024 06:03:21 -0700 (PDT)
Received: from vm-2404.. (255.7.65.37.rev.sfr.net. [37.65.7.255])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d2583558esm69255766b.1.2024.09.07.06.03.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Sep 2024 06:03:20 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat,  7 Sep 2024 15:03:14 +0200
Message-ID: <20240907130315.3284726-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1725714202; x=1726319002; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Boqxe/HVY3qnEkif9dtfaHrpd7UPQXuao3oB3N+HdjY=;
 b=hxIH2e/lH3hV7koHcJ865FNbJkglUKJ8ZH9/qmpHXnqD+uu6H0lKr0HmcizmMSi5KA
 UA4I0VYvcIIdWNWa9mvL3FisMVSSjV2JIILgvn+0jWSUAv9LthiI6ASksnsDRK14HqlL
 g4TnmUm6boKuzSSLU0LKn/e1nmLKT/hYLoiRb3gKa3CKshDDyKevoSZ20ATVn9CRkm1b
 BYzzjMkTGtlPeiI5eqabXOI7MUY6UhUqsgTB5bR8nUgnOqe7cXdhH0jLRWVL3MJAiWsc
 Tgp/bC7JV5+/1gCF0Lhb+lkIn0/4kxrC3icYseXBOMZtfYObn1jYGOHzfYaj3QEnJarx
 GkbQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=hxIH2e/l
Subject: [Buildroot] [PATCH] package/libgtk4: bump to version 4.14.5
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
 package/libgtk4/libgtk4.hash | 4 ++--
 package/libgtk4/libgtk4.mk   | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/libgtk4/libgtk4.hash b/package/libgtk4/libgtk4.hash
index efb944f2a..636b675d1 100644
--- a/package/libgtk4/libgtk4.hash
+++ b/package/libgtk4/libgtk4.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gtk/4.12/gtk-4.12.4.sha256sum
-sha256  ba67c6498e5599f928edafb9e08a320adfaa50ab2f0da6fc6ab2252fc2d57520  gtk-4.12.4.tar.xz
+# From https://download.gnome.org/sources/gtk/4.14/gtk-4.14.5.sha256sum
+sha256  5547f2b9f006b133993e070b87c17804e051efda3913feaca1108fa2be41e24d  gtk-4.14.5.tar.xz
 
 # Hash for license file:
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libgtk4/libgtk4.mk b/package/libgtk4/libgtk4.mk
index 48bfc80c0..b00a2faca 100644
--- a/package/libgtk4/libgtk4.mk
+++ b/package/libgtk4/libgtk4.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGTK4_VERSION_MAJOR = 4.12
-LIBGTK4_VERSION = $(LIBGTK4_VERSION_MAJOR).4
+LIBGTK4_VERSION_MAJOR = 4.14
+LIBGTK4_VERSION = $(LIBGTK4_VERSION_MAJOR).5
 LIBGTK4_SOURCE = gtk-$(LIBGTK4_VERSION).tar.xz
 LIBGTK4_SITE = https://download.gnome.org/sources/gtk/$(LIBGTK4_VERSION_MAJOR)
 LIBGTK4_LICENSE = LGPL-2.0+
@@ -27,7 +27,6 @@ LIBGTK4_DEPENDENCIES = \
 LIBGTK4_CONF_OPTS = \
 	-Dbuild-tests=false \
 	-Dbuild-testsuite=false \
-	-Dmedia-ffmpeg=disabled \
 	-Dprint-cpdb=disabled \
 	-Dvulkan=disabled \
 	-Dcloudproviders=disabled \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
