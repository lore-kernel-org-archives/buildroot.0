Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E99AAEB64D9
	for <buildroot@archiver.kernel.org>; Mon, 19 Jun 2023 14:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7238581F34;
	Mon, 19 Jun 2023 14:17:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7238581F34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oENW4eHC7lNG; Mon, 19 Jun 2023 14:17:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADCAE81DEF;
	Mon, 19 Jun 2023 14:17:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADCAE81DEF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8CBAA1BF4D5
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 14:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65C256117B
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 14:17:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65C256117B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LrB10Ib7ywUf for <buildroot@lists.busybox.net>;
 Mon, 19 Jun 2023 14:17:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 257C561174
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 257C561174
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 14:17:15 +0000 (UTC)
Received: by mail-qv1-xf31.google.com with SMTP id
 6a1803df08f44-62fff19e8fdso13326166d6.1
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 07:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687184233; x=1689776233;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YMqAZzYEnLjskxrqjeFkauMYS8H2vMXawND1yOoC9Yg=;
 b=iuOykQzGisOAzf1LL1G1C0lCnQ/KltPkLxc7kYjEd0dxP23jDlTEJZ6LYgM5WP2A5J
 xPwPNimpXlQrcBAEjr9hkOCjLAd0h7dpNRUCqBTFQK7KdyhlEX9Y2XEcItVyXRB5PdHa
 m46bnjirI5mvXlhFnUdT8l0KMI76NuJoGq6rb4SKg8hWgydMB0WB7XCqTzshMBMNbVwq
 vEGm6uvMDrFOt9pcdE/ghNvP74zCr/o2CDoiwmHuMx8nIE6gw20SjziMMbCT9b7ZwQU4
 xGS0iNxVq39AVFfD/Yi5d3noGWbRg2nhlm6/7cmE1dOI1uobvC1lPkwBsAD/JN18jj9S
 PTTw==
X-Gm-Message-State: AC+VfDzFb3yLhhTU+LcLaTtSUuTp9MhIOf08TJEZueFQPgW8mxn1VeCS
 mWff8L2uUUYPvnLOypJpCo+keYBXTMYnXFzYWyU=
X-Google-Smtp-Source: ACHHUZ4bQPnR0x/gQNqAhPMXGuwghj5DjljA6FwMnT3nQGkUFhN6qAXQO8E8cF5zeeiMg1/YK99IIw==
X-Received: by 2002:a05:6214:301c:b0:631:e699:cff5 with SMTP id
 ke28-20020a056214301c00b00631e699cff5mr1136753qvb.18.1687184233507; 
 Mon, 19 Jun 2023 07:17:13 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.pdxnet.pdxeng.ch
 (host-79-25-27-4.retail.telecomitalia.it. [79.25.27.4])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a0cec0d000000b006215d0bdf37sm18653qvo.16.2023.06.19.07.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 07:17:13 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 19 Jun 2023 16:17:07 +0200
Message-Id: <20230619141707.1011210-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1687184233; x=1689776233;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YMqAZzYEnLjskxrqjeFkauMYS8H2vMXawND1yOoC9Yg=;
 b=KO56mm+9jWKmP4tBdHnycJsSYXFTkqm4A+B+5U0adkQmJqJs5Vf0LXjHe1zZFmO/Ud
 YumWGDPWUDoP4lGZj0Q7whTKqKuph9708w0kP1+m+VoXIE4F+cX+id2UeNL3SdjXZMiB
 yP2XPCf07POdCr4J6AavxxqlAwZd85KzIqy/Y=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=KO56mm+9
Subject: [Buildroot] [PATCH 1/1] package/uuu: bump to version 1.5.104
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.104

The changes to README.md are not related to license modifications.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/uuu/uuu.hash | 4 ++--
 package/uuu/uuu.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
index a5b665620c64..a35970c54fda 100644
--- a/package/uuu/uuu.hash
+++ b/package/uuu/uuu.hash
@@ -1,4 +1,4 @@
 # locally computed
-sha256  e89d3665af499ab71360d948176cf64619b082f8272a994d1fbfc000e67c0f14  uuu_source-1.5.21.tar.gz
+sha256  f95ef6e5f4feb8b3e8d2c1163c35415263c82ac4ba3a51bcf4e3d59d3eebd063  uuu_source-uuu_1.5.104.tar.gz
 sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
-sha256  584bfbb18b4c08b872d48b80419dd453307212a144134fb516bd6ddc0700c2e8  README.md
+sha256  f68fb8c8002c797a14e63f91963ac247034fdfd44275e4f4a3226111cd0423db  README.md
diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
index 1a5f84ce4d7d..07dd6ce5b345 100644
--- a/package/uuu/uuu.mk
+++ b/package/uuu/uuu.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-UUU_VERSION = 1.5.21
-UUU_SOURCE = uuu_source-$(UUU_VERSION).tar.gz
+UUU_VERSION = 1.5.104
+UUU_SOURCE = uuu_source-uuu_$(UUU_VERSION).tar.gz
 UUU_SITE = https://github.com/NXPmicro/mfgtools/releases/download/uuu_$(UUU_VERSION)
 UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
 UUU_LICENSE_FILES = LICENSE README.md
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
