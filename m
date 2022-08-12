Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C09C00140
	for <buildroot@archiver.kernel.org>; Fri, 12 Aug 2022 13:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA8B183DEE;
	Fri, 12 Aug 2022 13:21:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA8B183DEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pi8m5kSVOEao; Fri, 12 Aug 2022 13:21:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 064D5837AC;
	Fri, 12 Aug 2022 13:21:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 064D5837AC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 005FC1BF23C
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 13:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCDE983B07
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 13:21:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCDE983B07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rzGrviBTDPY7 for <buildroot@lists.busybox.net>;
 Fri, 12 Aug 2022 13:21:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E34F8834AE
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E34F8834AE
 for <buildroot@buildroot.org>; Fri, 12 Aug 2022 13:21:51 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 az6-20020a05600c600600b003a530cebbe3so554377wmb.0
 for <buildroot@buildroot.org>; Fri, 12 Aug 2022 06:21:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=IcnVsHp9xIFpwSRPHDKbuQG1ENy4b4OJyigBqGhfpEE=;
 b=cQnC3kD3SiYHfoM7TbUxQq4GKJT5VGdN7leexx+zKX6x5nCuxuy/yLaya46xoUsCeK
 HYm/9hx/2FRCNdvMjf0LOtR9mPBXZrjczBaK9jDNLgdZU5O6LdrG5Eo399WMQw13jBAb
 LmsVY76yeUOxBTS6QXznXvxv5273JhO+I7bI5MosHnhlznX9r6quUiJkMOyvf8nDGuOD
 gxjL/Gue3CbNyk4rQ/7NCb4ul6K9F610IEhZ33r2v7YnTSRrDKbE9GZLoZhtm2Y1aeZz
 ev0T0HVUzXK5BGYTZx0E+GZ4+G+QNPK7QwWJgUwMgMKjioLIcVlek1VRmBPHT102IgUT
 ctxg==
X-Gm-Message-State: ACgBeo1jO4dwZXD7juXEvdTfMWPOowPjaT4M2p/4FvfOQHTaPeSmnviM
 M0TdZblG2Hivzb7W+fZYslx+sLBp/Hw=
X-Google-Smtp-Source: AA6agR5bjlFRS4VxeJ0b8tEtrNq2qVWquPcC9aGVJpNqFniWGJzM1lH9tuzRD4dSWxsi3+NonLVNwg==
X-Received: by 2002:a05:600c:3556:b0:3a3:2a9c:f26 with SMTP id
 i22-20020a05600c355600b003a32a9c0f26mr8852680wmq.58.1660310509797; 
 Fri, 12 Aug 2022 06:21:49 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b005f8c665f94b38664.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:5f8c:665f:94b3:8664])
 by smtp.gmail.com with ESMTPSA id
 c12-20020a056000104c00b0021badf3cb26sm2527672wrx.63.2022.08.12.06.21.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 06:21:49 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 12 Aug 2022 15:21:44 +0200
Message-Id: <20220812132144.104301-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=IcnVsHp9xIFpwSRPHDKbuQG1ENy4b4OJyigBqGhfpEE=;
 b=newMCdP90S4QQWjW9RX8aIXuSMPr/FsnpmYUyfO0ftnvMWgpaJ7wwBSMpQOu1t3B5U
 FzW+yuiLyu+Ax7Hj2M4T7F8xmVKdWLWS3t8uUAQFP12BSdq8aeDrblvuQmRyBWipMmqS
 oeNS8xC/ggeyVoJVSTleADWvO5mkmwgiJkrPtFIDGsgsyKOLQz/enKUkq1NYGn4i9gFV
 B0PbKOQqYWxE0mtOZ2blLMigV0W0uHxAXfkNnv105Q3WY65v9SB2vNM7LGbOfPCs2AlO
 K/ljiVJ9iUYWNwKc/ny0KaVo14XliLvZfU+bjdrR7EXnrkb/FmTR4TIZrPH7ALVqzHtc
 JrYw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=newMCdP9
Subject: [Buildroot] [PATCH 1/1] package/alsa-utils: needs dynamic library
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

alsa-utils needs dynamic library since bump to version 1.2.7 in commit
4dc8563363d639255217ffc59482eaccf93a1b51 and
https://github.com/alsa-project/alsa-utils/commit/44d3e8aa44fc12f95bfeef0e3a1051e8f77047b5:

pre-processor.c:28:10: fatal error: dlfcn.h: No such file or directory
   28 | #include <dlfcn.h>
      |          ^~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/1173a1ee28a58ce565a3274f35e868c35bb2e04e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/alsa-utils/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/alsa-utils/Config.in b/package/alsa-utils/Config.in
index 2d7062b0ca..14c78bee9d 100644
--- a/package/alsa-utils/Config.in
+++ b/package/alsa-utils/Config.in
@@ -1,11 +1,12 @@
-comment "alsa-utils needs a toolchain w/ threads"
+comment "alsa-utils needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU # fork
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
 menuconfig BR2_PACKAGE_ALSA_UTILS
 	bool "alsa-utils"
 	depends on BR2_USE_MMU # fork
 	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
+	depends on !BR2_STATIC_LIBS # dlfcn.h
 	select BR2_PACKAGE_ALSA_LIB
 	help
 	  This package contains the command line utilities for the ALSA
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
