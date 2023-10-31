Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51999C00142
	for <buildroot@archiver.kernel.org>; Tue, 31 Oct 2023 17:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D44FA83E22;
	Tue, 31 Oct 2023 17:24:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D44FA83E22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UCAO0h4Beip5; Tue, 31 Oct 2023 17:24:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FC9E83E1E;
	Tue, 31 Oct 2023 17:24:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FC9E83E1E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4A3C51BF28C
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 17:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2074C41887
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 17:24:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2074C41887
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FyFpbT3wxGGB for <buildroot@lists.busybox.net>;
 Tue, 31 Oct 2023 17:24:27 +0000 (UTC)
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F0B36408B1
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 17:24:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0B36408B1
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
 by mx1.sberdevices.ru (Postfix) with ESMTP id 16332120020
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 20:24:24 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 16332120020
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru
 [172.16.192.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.sberdevices.ru (Postfix) with ESMTPS
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 20:24:23 +0300 (MSK)
Received: from sberdevices (100.64.160.123) by p-i-exch-sc-m01.sberdevices.ru
 (172.16.192.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Tue, 31 Oct
 2023 20:24:23 +0300
To: <buildroot@buildroot.org>
Date: Tue, 31 Oct 2023 20:24:15 +0300
Message-ID: <20231031172415.18496-1-aolvolk@salutedevices.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 181028 [Oct 31 2023]
X-KSMG-AntiSpam-Version: 6.0.0.2
X-KSMG-AntiSpam-Envelope-From: aolvolk@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 543 543
 1e3516af5cdd92079dfeb0e292c8747a62cb1ee4,
 {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;
 p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; 127.0.0.199:7.1.2;
 100.64.160.123:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2023/10/31 16:01:00 #22371904
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=salutedevices.com; s=mail; t=1698773064;
 bh=yk0otyrLqGpSPnemKFfhkOTmfGFTLFCL+BYDf4eYbhw=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=MsLTRb3uTN529yk+aRpdhHLTS/P1/igEdS5063441tNNdP3l9Ry7j8NvJfs2U2Fq/
 x/wJ7LidX07pTYx1f+MukU1IIAHe79qT9Rr+bPQ7xz1KYNPmgyY6L93s8ewF2PIdJY
 0xoW4sNv4TxKrpTmb0Z86aaO43BhqSDTf1FyhJvLYnU/azo5ZC0LxPcl7ut7UtNSih
 9g0U4+iy1t5QxlcvHiI3YYVmweCscnhGMx276LP5flKFp8HmahULY+6y2UrMpuXcPk
 5YRK5uqt9hB9ohHzv4GvFU0huKr7S44lgVtYj312ayfHupOjS4wIfLzVog85WFJx1e
 rGn5VCGkWLRLg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=salutedevices.com
 header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail
 header.b=MsLTRb3u
Subject: [Buildroot] [PATCH] package/libcurl: introduce option to enable
 WebSockets support
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
From: Alisa Volk via buildroot <buildroot@buildroot.org>
Reply-To: Alisa Volk <aolvolk@salutedevices.com>
Cc: Alisa Volk <aolvolk@salutedevices.com>, ovlevin@salutedevices.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Alisa Volk <aolvolk@salutedevices.com>
---
 package/libcurl/Config.in  | 6 ++++++
 package/libcurl/libcurl.mk | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
index 218309ed56..154215e17e 100644
--- a/package/libcurl/Config.in
+++ b/package/libcurl/Config.in
@@ -31,6 +31,12 @@ config BR2_PACKAGE_LIBCURL_COOKIES_SUPPORT
 	help
 	  Enable support for cookies.
 
+config BR2_PACKAGE_LIBCURL_WEBSOCKETS_SUPPORT
+	bool "websockets support"
+	default n
+	help
+	  Enable support for websockets.
+
 config BR2_PACKAGE_LIBCURL_EXTRA_PROTOCOLS_FEATURES
 	bool "enable extra protocols and features"
 	default y
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index f2c679f162..be85ffa35a 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -152,6 +152,12 @@ else
 LIBCURL_CONF_OPTS += --disable-proxy
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCURL_WEBSOCKETS_SUPPORT),y)
+LIBCURL_CONF_OPTS += --enable-websockets
+else
+LIBCURL_CONF_OPTS += --disable-websockets
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCURL_EXTRA_PROTOCOLS_FEATURES),y)
 LIBCURL_CONF_OPTS += \
 	--enable-dict \
-- 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
