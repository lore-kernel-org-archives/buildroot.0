Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A76FCF9C69
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 20:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE0954032E;
	Sun, 22 Sep 2024 20:57:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 34EYWfLOVXCZ; Sun, 22 Sep 2024 20:57:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D1C5402CD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D1C5402CD;
	Sun, 22 Sep 2024 20:57:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8CCBB1BF39D
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 20:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B91F60750
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 20:57:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DCiYjSVJw9fh for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 20:57:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 916B76061D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 916B76061D
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 916B76061D
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 20:57:49 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-7db637d1e4eso2610225a12.2
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 13:57:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727038669; x=1727643469;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W0CEhMaK+fOYNNuEIRTpa7ydDRce1WAKJSVH82MTTWA=;
 b=FplF5dZMngQRxFFTd2cX/CvtGr0o/uaQlzEKO/yH4BLguHt7ebEKKDaaHx5yX+C7cg
 187Oo4MjCFIRJZJ3geizJiOEEaMlo+yBqiF0b3hAEzwVZgP9uSuJklCa/QqGc1JozN6Y
 ygbuq7fnkuJUaA1TkyZog8T+/0M4oEzm84B0zJ1d/UepcrICkgvrVKray7k+8pRhJBql
 MieXZ9VjSLy43TAMI4bqkFHUita/JrMPctIZreWzneOlZR3yss8Y1xfN7eQWY7NrzEdo
 a9/knJrD9p+7wgMqJhNIm81BR2GRTzpraEMOLI9kHQgvCjC1R8S87O++a/Zog+SZ47dG
 EpIg==
X-Gm-Message-State: AOJu0Yw/RhLvrZAxylv2xcRU1Cnk83gMZxWsg1iZYN/d3fBQ+C8af+sQ
 df2ZQjiWrUR8fQu+6dBK+nLWvSGBubvv6/63oPSDkLnpa7UJpJsX3Zk0pKn0P8w=
X-Google-Smtp-Source: AGHT+IGnSF+UqOCaY0rTXCZUFv96R6R3iFUzSniA/y1MlOrZuyocq4TzirEXoDgkb1ZU3eRddCrZCA==
X-Received: by 2002:a17:90a:68c3:b0:2d8:8c82:10a with SMTP id
 98e67ed59e1d1-2dd80c465f4mr12825148a91.5.1727038668469; 
 Sun, 22 Sep 2024 13:57:48 -0700 (PDT)
Received: from localhost.localdomain ([2600:8802:2a05:9000:ad2f:66c:ef69:238f])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2dd50c109desm4563635a91.0.2024.09.22.13.57.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 13:57:47 -0700 (PDT)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 13:57:44 -0700
Message-Id: <20240922205744.3811678-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727038669; x=1727643469; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W0CEhMaK+fOYNNuEIRTpa7ydDRce1WAKJSVH82MTTWA=;
 b=P1uW70hPLmQMNx6DXyiUwczXmlfFmZaTscEk5iLO78UvC1+kGG2JQ5r+3/phZkbMDl
 Jd+fotF+FnvhHn+eXcpXVk/MxFUkRDFj/xACM/XC++KGJNkatVznLU3d/LKZu03WZewM
 7UAWhdfRomSAgZQzMqIDqOPZ1Zbj7GhrVGxo25dJUudlIH27wzIrVKkbeRW29gxJ/QN6
 auZZI45SpFl/9CgrI0HVHQ/U/JEPycWWoPiYAgoQtznMrInK8MiRDeFSFYXdkjpiueiZ
 nKf0AgQE9XC2Sui0Zuoq7LlO9pSbAEhgYEZeQ4urfKpKRt/h1xQ8UQ0PPnibLDs4Ltuc
 v8zw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=P1uW70hP
Subject: [Buildroot] [PATCH 1/1] package/libpcap: bump version to 1.10.5
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
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://github.com/the-tcpdump-group/libpcap/blob/bbcbc9174df3298a854daee2b3e666a4b6e5383a/CHANGES

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/libpcap/libpcap.hash | 4 ++--
 package/libpcap/libpcap.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libpcap/libpcap.hash b/package/libpcap/libpcap.hash
index 34339c1261..7f53b99b8c 100644
--- a/package/libpcap/libpcap.hash
+++ b/package/libpcap/libpcap.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.tcpdump.org/release/libpcap-1.10.4.tar.gz.sig
-sha256  ed19a0383fad72e3ad435fd239d7cd80d64916b87269550159d20e47160ebe5f  libpcap-1.10.4.tar.gz
+# https://www.tcpdump.org/release/libpcap-1.10.5.tar.gz.sig
+sha256  37ced90a19a302a7f32e458224a00c365c117905c2cd35ac544b6880a81488f0  libpcap-1.10.5.tar.gz
 
 # Hash for license file:
 sha256  8a54594d257e14a5260ac770f1633516cb51e3fc28c40136ce2697014eda7afd  LICENSE
diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 3d05590da3..67adb0a978 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPCAP_VERSION = 1.10.4
+LIBPCAP_VERSION = 1.10.5
 LIBPCAP_SITE = https://www.tcpdump.org/release
 LIBPCAP_LICENSE = BSD-3-Clause
 LIBPCAP_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
