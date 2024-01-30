Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C5EC46CD2
	for <buildroot@archiver.kernel.org>; Tue, 30 Jan 2024 10:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B2B141AEF;
	Tue, 30 Jan 2024 10:00:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B2B141AEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p0iK9EuicrmS; Tue, 30 Jan 2024 10:00:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8644941A60;
	Tue, 30 Jan 2024 10:00:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8644941A60
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3C3931BF395
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 10:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 222818225C
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 10:00:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 222818225C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WlmXU5z5dNtl for <buildroot@lists.busybox.net>;
 Tue, 30 Jan 2024 10:00:46 +0000 (UTC)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B3062837B9
 for <buildroot@buildroot.org>; Tue, 30 Jan 2024 10:00:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3062837B9
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a35385da5bbso442661866b.3
 for <buildroot@buildroot.org>; Tue, 30 Jan 2024 02:00:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706608843; x=1707213643;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7p80binl2aos423W2gkaOzvXwDzlRlO/I/bkPPF8/w0=;
 b=bsKqjWeHyckNqGuXhJSYhJGbixB4FWnp4lXseJ4+8VyK87RuG4L41G7XCsylByTsxF
 LZV7361U4QzlM3qDex1PeThbRqKOSHjQdWi9XyCoTGY4R8sc2FlEpvUfQLrJz/6QEyf4
 7EbtC+I2VRMcm5PYZQ5PUGEMITCjDUy9QcVRvL5Ig70GRFY0Ntk/R3RQAedmjk9eyuYN
 X4PvVg05wU6De0GY1TPk59wmoj+QoQqQvcaP/iQsaIv7F9TwwbUkXM5KTfO59mGt+IBs
 8vQ/Qi9cFQTYiPLCaIqkwJs2lItn30ALwl2qY0WFHULGGKaiK0D/DNZi5/qmEW9fGrDz
 TPnw==
X-Gm-Message-State: AOJu0YxXynjcUh0tzrUd8D6inEWcmh8Z7p6JXwI/XLv1BA1WItAPaB14
 rXQm6NL/U7HIDjn5cn8QYtRrZwmWPcsfc8GQ4FDWrX3ShaHmiEDW/gjMX3CE
X-Google-Smtp-Source: AGHT+IH1yBPnPlX3I0zHLqpPGks+1PXlRUpirr67Oi1V5+6U3kfVx1tmR06w2cDbNY17o6B19rTGhA==
X-Received: by 2002:a17:906:6d44:b0:a35:4664:8830 with SMTP id
 a4-20020a1709066d4400b00a3546648830mr5521899ejt.0.1706608843004; 
 Tue, 30 Jan 2024 02:00:43 -0800 (PST)
Received: from fedora.. (d-zg2-171.globalnet.hr. [213.149.37.171])
 by smtp.googlemail.com with ESMTPSA id
 vw1-20020a170907a70100b00a35bfc2d570sm1961888ejc.6.2024.01.30.02.00.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jan 2024 02:00:42 -0800 (PST)
From: Robert Marko <robimarko@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 30 Jan 2024 11:00:39 +0100
Message-ID: <20240130100039.176171-1-robimarko@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706608843; x=1707213643; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7p80binl2aos423W2gkaOzvXwDzlRlO/I/bkPPF8/w0=;
 b=gKCJiBnYHkNU2MvlCAnfiFIT8edKlYM/S6srqX92bqoRqAX+TAsu36bq0cImSrGYE+
 pvR1N3W5NsOUO01obnYIPhpNS25c9+BiD5CZ7qMeiuWZ45P4rV7T9h7v5Y7p+VfyIkEq
 ZKH2OPSWoqwIq6oGkLr5IHyxGQ4o3CBD1sR63TwS+wp0JbZr4Kj2Z6zYPKRZ7hZb5I+r
 qIjhhu/hpbYnD96gpD6Wy8B0BTnPWukZeXnx2QiWe/709nCKqyswlEa+YzjnsUwNcqjt
 ajY5TLtYuriJWg+Q3oy6C6ojBaAoKxaSL5H+wXJi7cBUvngTkdTuDxZXd7iL80Y7clZD
 TPlQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gKCJiBnY
Subject: [Buildroot] [PATCH] package/mdio-tools: bump version to 1.3.1
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
Cc: Robert Marko <robimarko@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[v1.3.1] - 2023-12-02
---------------------

Fixes mvls to work with kernels 6.2 and onwards.

- mdio: Multiple registers can now be dumped at once, via the generic
  dump operation.

- mvls: Relax the driver matching to accept the strings used in
  kernels 6.2 and newer.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 package/mdio-tools/mdio-tools.hash | 2 +-
 package/mdio-tools/mdio-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mdio-tools/mdio-tools.hash b/package/mdio-tools/mdio-tools.hash
index 1a9d598923..19172e2cd6 100644
--- a/package/mdio-tools/mdio-tools.hash
+++ b/package/mdio-tools/mdio-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d2ab71d92173053af41d754e9c229e1ead768b9f8b7f4947b3b87b84c4c5e360  mdio-tools-1.3.0.tar.gz
+sha256  652353ba153fdd8b1d58ded4b90d0639536d705aa5923018e27ea0b78aa8e4fb  mdio-tools-1.3.1.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/mdio-tools/mdio-tools.mk b/package/mdio-tools/mdio-tools.mk
index fb8ec39f35..16eba74734 100644
--- a/package/mdio-tools/mdio-tools.mk
+++ b/package/mdio-tools/mdio-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MDIO_TOOLS_VERSION = 1.3.0
+MDIO_TOOLS_VERSION = 1.3.1
 MDIO_TOOLS_SITE = https://github.com/wkz/mdio-tools/releases/download/$(MDIO_TOOLS_VERSION)
 MDIO_TOOLS_LICENSE = GPL-2.0
 MDIO_TOOLS_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
