Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2575C77B7C
	for <buildroot@archiver.kernel.org>; Sat, 27 May 2023 08:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08F3F60FC7;
	Sat, 27 May 2023 08:12:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08F3F60FC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t1u3xYER3FM2; Sat, 27 May 2023 08:12:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02BD960F07;
	Sat, 27 May 2023 08:12:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02BD960F07
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4F2481BF2BB
 for <buildroot@lists.busybox.net>; Sat, 27 May 2023 08:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21D6540134
 for <buildroot@lists.busybox.net>; Sat, 27 May 2023 08:12:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21D6540134
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oiMpWkgNMHfv for <buildroot@lists.busybox.net>;
 Sat, 27 May 2023 08:12:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1122940105
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1122940105
 for <buildroot@buildroot.org>; Sat, 27 May 2023 08:12:43 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-510b6a249a8so2747140a12.0
 for <buildroot@buildroot.org>; Sat, 27 May 2023 01:12:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685175162; x=1687767162;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8fHvp4mPtTr2FSb1iim/hwWzMkYNHSjs89E8WKxM5VQ=;
 b=eDaXUfJzxHfD35SkNyMMyAztT8Sq9jBsfkCFiaDNPi+8BGjkkWADvRppGh4ga9YVg2
 OkR1cxsr6BYR3ufTqeNfyZ4tdqwlcsyKcgY0BaxgSryLa8hwPoMV4RrCWoNJ/csw+vFc
 rR6OR1Cv31WikL4sblabM9IAWk7NmC9UojuFNCxWUGg80d9RUj+BMtJ4vpw9hPC6ncZH
 kV8tF+W/dlQI0YFNsZ5TwcqoDecGwu7dXxZbg8oqiElEfFHj9eVOkBaD6/nL/owW8IVl
 89XbTulwOQk9Q+D1hOp/hXGHz6Zk/Z11G5X8ogyEys3bTT0xzaCYxw6uBkLwZEAnMbhs
 4duw==
X-Gm-Message-State: AC+VfDwR7F5mUAuw41I/XpLcl3fOJrVwVTc9TAa8N9FMh7kXa9nf2E1S
 imCqljGgHUIcRR+iEMtcbadivFEfTbq6FA==
X-Google-Smtp-Source: ACHHUZ5K4RDTEJ3PXbhlhmiyu8I2PbTxLSJf/H9f7B1ePTEbAQRYL/5eK1ckhCcpBF4o3RvMRRn+ow==
X-Received: by 2002:a17:907:940f:b0:96a:63d4:24c5 with SMTP id
 dk15-20020a170907940f00b0096a63d424c5mr4604737ejc.77.1685175161744; 
 Sat, 27 May 2023 01:12:41 -0700 (PDT)
Received: from LinkTed.fritz.box ([2a02:8070:4182:37a0:64cb:8203:42ee:ef04])
 by smtp.gmail.com with ESMTPSA id
 j4-20020a170906410400b00965a4350411sm3116464ejk.9.2023.05.27.01.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 May 2023 01:12:41 -0700 (PDT)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 27 May 2023 10:11:51 +0200
Message-Id: <20230527081151.59902-1-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685175162; x=1687767162;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8fHvp4mPtTr2FSb1iim/hwWzMkYNHSjs89E8WKxM5VQ=;
 b=GQ/CSSWQddfs5OeNaEn7L2DKIcahPdDEZLLUY0ClZU8CBgV4Uy2jmS5NHrInQOdufg
 oBEIGaBmUqBCdB4dFTLgBz/hjUeDvZa26WkbwDlaoz5Q9Ob1EvV0SHmqUyD8gXAIyoiN
 vVwRrYrLhW6BbjYVHpVJsGQzjFzrqxP6lHIwJ1apxlEiRgGOlNmt7qmJ59nq4fuo/tiY
 sn23XzmmpQcY3WRt7PJDKtM9cPk8EhcRhwBAvjY/E5bsoSI28IE1jI3uGaBZtNmapoqD
 dR9re5f56PExu/VgWVydh18DEUAugB1DBEqiSde4/io38HAxXPd5s7LtTQXYd/aEP+NZ
 cISg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=GQ/CSSWQ
Subject: [Buildroot] [PATCH v1 1/1] package/x11r7/xwayland: bump version to
 23.1.1
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 package/x11r7/xwayland/xwayland.hash | 6 +++---
 package/x11r7/xwayland/xwayland.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xwayland/xwayland.hash b/package/x11r7/xwayland/xwayland.hash
index 0c476f3183..b62f404d40 100644
--- a/package/x11r7/xwayland/xwayland.hash
+++ b/package/x11r7/xwayland/xwayland.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2023-February/003322.html
-sha256  d11eeee73290b88ea8da42a7d9350dedfaba856ce4ae44e58c045ad9ecaa2f73  xwayland-22.1.8.tar.xz
-sha512  f52c6f99d8ef7605bc1c651d5ee5e306c12af30649a2d712b1c4c3cf4c7c80246ae24bd9ac39461d47aafc78f5d659446a459cd6259e05ef3128b204981d114a  xwayland-22.1.8.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-March/003376.html
+sha256  fb9461f5cb9fea5e07e91882311b0c88b43e8843b017ebac05eb5af69aa34c15  xwayland-23.1.1.tar.xz
+sha512  21c386847135c5cb4ac884926b0fbeb6ad21c9ee54752e0cdc8418e31a72872d81032159c1d91b8afb915aaaf65e80454342461d676996b2f3c535a37b0147f0  xwayland-23.1.1.tar.xz
 
 # Locally calculated
 sha256  4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
diff --git a/package/x11r7/xwayland/xwayland.mk b/package/x11r7/xwayland/xwayland.mk
index 7aef1156d3..1b626327ad 100644
--- a/package/x11r7/xwayland/xwayland.mk
+++ b/package/x11r7/xwayland/xwayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XWAYLAND_VERSION = 22.1.8
+XWAYLAND_VERSION = 23.1.1
 XWAYLAND_SOURCE = xwayland-$(XWAYLAND_VERSION).tar.xz
 XWAYLAND_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XWAYLAND_LICENSE = MIT
-- 
2.39.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
