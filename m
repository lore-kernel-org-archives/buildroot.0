Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 644CAC02194
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 13:01:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A9A040568;
	Sat, 14 Sep 2024 13:01:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WdwUFu3_rrg8; Sat, 14 Sep 2024 13:01:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03F1D40278
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03F1D40278;
	Sat, 14 Sep 2024 13:01:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 760AC1BF232
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 13:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61E8140278
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 13:01:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ly1yUBuVhXJ7 for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 13:01:44 +0000 (UTC)
X-Greylist: delayed 428 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 14 Sep 2024 13:01:43 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7A0684020B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A0684020B
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=35.89.44.39;
 helo=omta40.uswest2.a.cloudfilter.net; envelope-from=parthiban@linumiz.com;
 receiver=<UNKNOWN> 
Received: from omta40.uswest2.a.cloudfilter.net
 (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A0684020B
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 13:01:43 +0000 (UTC)
Received: from eig-obgw-5001a.ext.cloudfilter.net ([10.0.29.139])
 by cmsmtp with ESMTPS
 id pCSasK001vH7lpSIMs32ZF; Sat, 14 Sep 2024 12:54:34 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182]) by cmsmtp with ESMTPS
 id pSIIs34H2mqhipSIKsG3QA; Sat, 14 Sep 2024 12:54:33 +0000
X-Authority-Analysis: v=2.4 cv=NdEt1HD4 c=1 sm=1 tr=0 ts=66e58789
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=EaEq8P2WXUwA:10 a=-pn6D5nKLtMA:10 a=vU9dKmh3AAAA:8 a=ys7s_uIHIrOwV0Zdl-MA:9
 a=rsP06fVo5MYu2ilr0aT5:22 a=ZCPYImcxYIQFgLOT52_G:22
Received: from [122.165.245.213] (port=40424 helo=localhost.localdomain)
 by md-in-79.webhostbox.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <parthiban@linumiz.com>) id 1spSII-001nZs-0V;
 Sat, 14 Sep 2024 18:24:30 +0530
From: Parthiban Nallathambi <parthiban@linumiz.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 18:24:05 +0530
Message-Id: <20240914125406.3026002-1-parthiban@linumiz.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1spSII-001nZs-0V
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (localhost.localdomain) [122.165.245.213]:40424
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 2
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfAUzol+ldibwxeNL9vhIIYqwPtC1OweLOy/gDe64ZpbxyPIw+86TEwBPhGMRrBShLuLW21oE2CO164BgPnysZHN8jk48cwzG1oUWx8gBgA83fs98Ixcb
 m5kXKhq8zLvez03N40Edv/LDdVfALI4R1TDYUAoMPr7yx8r17+RbnGzTRTvXiYKIU1uWlTUCFa6sF84eIbzDfyHOYVk8IVo+oAs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=linumiz.com
 ; s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
 :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3UDqdxU+v7wPA/KYwf0f+IZqfabWQ+fCabFMypCl21c=; b=V2oDyq5IgGui3qdQlPvhk/eh7C
 3t4whiPwsWrobiAGs/M69jROWN9ReWhC9igI+2rzC2DnTorbAlIoK2uUHiv9GoO1xwA4M3D2ysBFD
 eM2siBRlqCjUarT/0x3B59UiTqi6quOwfuijGfy2WneYAo70fNKXZ0c3y6JR0PZz8cnsBlauIVuKk
 3wYO8WP/FBgAs/nMVbWy0/I8ORHLicTzqKRSsz4zK8r7wiaNKhugEvXt1dXqxQL4BScTATMbuchZ1
 bATaAALZ1XEYPx9CjuBZXV4mOTeJeNYk4msG7gz33tBaza9FHjJxNrx9QnN40b5lcJsqRf02kLuLd
 ClPkFoSA==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linumiz.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linumiz.com header.i=@linumiz.com header.a=rsa-sha256
 header.s=default header.b=V2oDyq5I
Subject: [Buildroot] [PATCH] bluez5_utils: disable asha profile
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
Cc: Parthiban Nallathambi <parthiban@linumiz.com>, marcin@bis.org.pl
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

asha profile as it depends on audio profile which isn't selected
by default (BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AUDIO), results in
below linking failure.

ld: profiles/audio/bluetoothd-asha.o: in function `get_transport':
asha.c:(.text.get_transport+0x2c): undefined reference to `media_transport_get_path'

Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
---
 package/bluez5_utils/bluez5_utils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index b1caef5cc5..59eb68de61 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -28,6 +28,7 @@ BLUEZ5_UTILS_CONF_OPTS = \
 	--disable-lsan \
 	--disable-ubsan \
 	--disable-pie \
+	--disable-asha \
 	--with-dbusconfdir=/etc
 
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_OBEX),y)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
