Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41898C77B7C
	for <buildroot@archiver.kernel.org>; Thu,  4 May 2023 20:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C89104278E;
	Thu,  4 May 2023 20:22:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C89104278E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CkZUWRoeYKA3; Thu,  4 May 2023 20:22:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B9E942783;
	Thu,  4 May 2023 20:21:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B9E942783
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 293DE1BF3B8
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 20:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D3088417A
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 20:21:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D3088417A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YUw-ZLch93_I for <buildroot@lists.busybox.net>;
 Thu,  4 May 2023 20:21:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 783B484179
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 783B484179
 for <buildroot@buildroot.org>; Thu,  4 May 2023 20:21:40 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.209.47]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtfNf-1qEPGf4Aut-00v8FW
 for <buildroot@buildroot.org>; Thu, 04 May 2023 22:21:39 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu,  4 May 2023 22:21:36 +0200
Message-Id: <20230504202137.18145-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:MOFp8lDgzzGT0tim+A9mBms6kw6Nbq+ZMHr3XTz9KDuireicvf2
 neJ9NJudFvjXctEw8xXkcaVTXbMkr98mtC/8h2AsSCFMHe7b3xgWHrCzu9im45GNyvqYd0Z
 BWMb6XJoeMcMpRjQwgvT0NMpUelF0VZQgWMVrAmYYjS1VQh3FpsPV4mbAWgDmVwE/Yjjxv9
 bXl+MOL2vpF8XjMiMvtxQ==
UI-OutboundReport: notjunk:1;M01:P0:K8uBgsIv/t4=;iMue2sdxZmzg+lN2EisUEkF+1Dc
 oljykvmfnleoOvg+PNhMtluY82EWjoxRHlMbwXLAf+BuOW5nRMoGecJ44reo+BJpfKz6I3dmn
 VJWxWKSHthks2Hx6BCNc8TiMhtkIO1l00USgBc0VDi1gQ/veHasbicMzeCmO9jUJHwfdmVBSv
 vFTm81Z6jdoY64d77j5sPv9i+hBFuFBSjA5kRGmcVDsVpxpu1QtyKPhqG5MEbVI6mxO9FtaR7
 ZKe35Amotd2fnQv3B+JpVj8FNx2BY4H7hIQRAUKttl6KbWYa0VomkImUBWhn9l1vXj97eIy2M
 FfP00cA3Y6GAHFG4qHUiJ8i9zsXzzXpLCXZiIp5KgAt4NIhjQn8CHv6uXjQK1t9rJKURXUher
 nfjMqFlSBOdaOR4s67Ipltnmimu+nb06JqZGBZ3JyIxAlmBUTj2cSvecDBUSOQ11SO2rsXyPD
 ygIeazPxmeDM3vbY1XxMmD3sFrIRWckdqPlygFXxAsWXzfVekIVuZHdIFYRSNAN8usH0CHVDy
 67EPMXnDDTxO4HmzXeocy2NuDnz5I7r+YUG6LBEMFB7ZbCTAMylj0PfdqF3+GwG7eNBVpelcv
 dvy5T8K6Gl455QulI0TX8KBJUjMCpg30WhMInv3D49DKc4WNO+54hKwXG6vQpuYUsvClZQZlb
 IMiTqiW+RjNMJwwo2rEBqnf11yEC6+TIqido1GfpdArbRSVnG04rwqbninXU07cWd8xw5XIcL
 rZHGnPauW7kMI60hFLCXV9R73szQRQiyY1mN7P52Xu8Ka/dGj7fdHTfmhLSX3z7/K+Ixca+ko
 TIraHQX6wsClsVnD00b9Wl5M0MymKK42yUjEvJnGKUF7wyFlBuBVPWckumFWk+HYVaFe7tW/h
 3+XyBzF27VtbXtWJdPyp/1EMviFNREXdL1nyhhorCe5odj9g+5mwmTZpppoDaNVk/nhwiETy/
 jRQyTw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1683231699; i=ps.report@gmx.net;
 bh=iGb9KAvJsUU2UjhXzgALMtqMkJFFa5NXgY8n90igTxI=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=uY/AS25DturpJe8tVnduWMN6zN3+Rsex/dOiEXHna7VciauW0d8xoinV+7JIO0LYI
 wlmJDyavY1xTZFNjm1NHK3Mg0EovEUg335I8Iz+wiixSJPZXvkBQNnO+R7fGTEGjjV
 5+Y2pbhBqtBgev+2Kd85JWQ982TGA2LmjkopkBTMWFcI6KrfxOwe8hegRKCEnbIpEF
 /8v/j75V4zxSnbdrXOp1CV6Z+DH3ilrnDzMtnjPmmOfXekhfPkdAx2fnChwbC81gH4
 /Bng9/xPDiRtwX5spVIEDThHU+QdW0mAXsGv8+gX3SahiGMJdQQ/SOMVb4T4ji9OjL
 5QRFB4nAKdL2Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=uY/AS25D
Subject: [Buildroot] [PATCH v1 1/2] package/edid-decode: fix typo in
 Config.in for comment selection
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

Fix typo ('!!' vs. '!') Config.in for dependencies comment selection
(introduced by commit 'package/edid-decode: bump version to 1889504',
see [1]).

[1] https://git.buildroot.net/buildroot/commit/?id=d498088fe7e1e664d4ee8d9bc54262d40227d6e5

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/edid-decode/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/edid-decode/Config.in b/package/edid-decode/Config.in
index ddf1942c68..5ebecd7330 100644
--- a/package/edid-decode/Config.in
+++ b/package/edid-decode/Config.in
@@ -8,5 +8,5 @@ config BR2_PACKAGE_EDID_DECODE
 	  https://git.linuxtv.org/edid-decode.git/
 
 comment "edid-decode needs a toolchain w/ C++, gcc >= 4.7"
-	depends on !!BR2_INSTALL_LIBSTDCPP || \
+	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
