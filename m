Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 202FFC43334
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 21:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9EE541B45;
	Thu,  9 Jun 2022 21:15:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nZu4j3B_EVc5; Thu,  9 Jun 2022 21:15:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84C4041B3B;
	Thu,  9 Jun 2022 21:15:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 22EDA1BF340
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 21:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B69541B3B
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 21:15:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y-23Z0zTmytw for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 21:15:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CCC1F41A5D
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 21:15:49 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id a15so25532629wrh.2
 for <buildroot@buildroot.org>; Thu, 09 Jun 2022 14:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LIZU/n284tR1L5Zp9fCs0OhCcB/zEZiOoFFIKJ2PZgs=;
 b=jsnBWrFYrqkRsE9zQ7SL55WQK/AqiZ2VhnzcofWHqKxauTkKyeoi6soFZBqzHaHlhZ
 GHOIRWAQaNoXbTeAe2T6iQ8kadswaJAYbNTzTVKCtxRObkTswAo8qMm7LMPSRIicEME0
 6MnINfsUXVV/ofKVh73IRTPipif8XdCux9i+byvH8QRs6xL//RSWDsC3e5OjmxD4lfMF
 n+8dK2oo0xEp7JtSXGkLV7TO5wJRW0wAmASFi1KWhQhOrNF8mVTPiKMGcUwoq03E4Kn+
 g3UUCA9U7YUK+MzbsAXhgZdilSOkjaKHMjwPIZGCU9OKsszE5MzOU/hOuKkTjiwskXbi
 yihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LIZU/n284tR1L5Zp9fCs0OhCcB/zEZiOoFFIKJ2PZgs=;
 b=8Ofdx+bT+dyVl0yK+d4IrZncuQla8fUp9ksgvUwbnrcns9JlGdyTb6UzCvNiK2WYZp
 Dd7w3SQhtoUMzFQDWUMo6EbPx5wc6AdM0V3Ph8MviAZ4nxXDfiowVEKJpwE9FOMpPa38
 +mnLVz+fjCsbbK70OwnEwvgXAj+UdP7XCAfOY1jCoc6OUNdHBP+U5195hMEPM+k/qjD2
 tQOeL6QqWhwrPrY2GSPTmJaq8VbpaX8K8bVDnSDry+uCsGXghvTvb7AubWZJHW+9F3hd
 MC8n0Iazgh4eIZAvbzv0c8xENljmhHZg63WcrEJsYYBW9ov1fIVtVDEOri6Urn/23RZd
 y1KQ==
X-Gm-Message-State: AOAM532xU0vnXVLB0CMlZkQFI5Okb30Df2prQfnoRq1Gw6pPUvJALZkP
 qVNyoXnIfbENlZIybvn1g/l60lBQD6Y=
X-Google-Smtp-Source: ABdhPJxHG/Q4MDrgliM3P5km1k1P2ngDb5jP4cpOT+D2LvnA1/1t3dNiAA4LErv83eSLCMZYTsp+vw==
X-Received: by 2002:adf:e488:0:b0:20f:d981:4b42 with SMTP id
 i8-20020adfe488000000b0020fd9814b42mr40778431wrm.455.1654809347747; 
 Thu, 09 Jun 2022 14:15:47 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 s13-20020a5d6a8d000000b0020c5253d8f7sm25654551wru.67.2022.06.09.14.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 14:15:47 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 Jun 2022 23:13:04 +0200
Message-Id: <20220609211304.2939572-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libmediaart: link with -latomic if
 needed
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with BR2_PACKAGE_LIBMEDIAART_BACKEND_QT
raised since bump to version 1.9.5 in commit
3db4d486d689b4a9d59c8f7637211893b0a1cb1b:

/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: libmediaart/libmediaart-2.0.so.0.905.0.p/extractqt.cpp.o: in function `std::__atomic_base<int>::operator--()':
/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/sparc-buildroot-linux-uclibc/include/c++/10.3.0/bits/atomic_base.h:334: undefined reference to `__atomic_fetch_sub_4'

Fixes:
 - http://autobuild.buildroot.org/results/39aa4ecd37de774e06f67a6e1c4495dc1f0917b4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmediaart/libmediaart.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libmediaart/libmediaart.mk b/package/libmediaart/libmediaart.mk
index 77665fd95b..de92cde849 100644
--- a/package/libmediaart/libmediaart.mk
+++ b/package/libmediaart/libmediaart.mk
@@ -24,6 +24,9 @@ else ifeq ($(BR2_PACKAGE_LIBMEDIAART_BACKEND_QT),y)
 LIBMEDIAART_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
 LIBMEDIAART_DEPENDENCIES += qt5base
 LIBMEDIAART_CONF_OPTS += -Dimage_library=qt5
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+LIBMEDIAART_LDFLAGS += -latomic
+endif
 endif
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
