Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E7BBC4332F
	for <buildroot@archiver.kernel.org>; Wed, 12 Oct 2022 07:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7138C4180D;
	Wed, 12 Oct 2022 07:54:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7138C4180D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LHRJHr_JBOnG; Wed, 12 Oct 2022 07:54:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45736417FC;
	Wed, 12 Oct 2022 07:54:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45736417FC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 170E61BF8C7
 for <buildroot@lists.busybox.net>; Wed, 12 Oct 2022 07:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6C8E4038D
 for <buildroot@lists.busybox.net>; Wed, 12 Oct 2022 07:54:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6C8E4038D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DkR0LM1SD5fc for <buildroot@lists.busybox.net>;
 Wed, 12 Oct 2022 07:54:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD4BF40112
Received: from delivery17.mailspamprotection.com
 (delivery17.mailspamprotection.com [185.56.85.134])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AD4BF40112
 for <buildroot@buildroot.org>; Wed, 12 Oct 2022 07:54:40 +0000 (UTC)
Received: from 6.247.214.35.bc.googleusercontent.com ([35.214.247.6]
 helo=es87.siteground.eu)
 by se17.mailspamprotection.com with esmtps (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <dimi@tpm.dev>)
 id 1oiWZZ-000GAv-4r; Wed, 12 Oct 2022 02:54:39 -0500
Received: from [95.111.54.43] (port=59648 helo=localhost.localdomain)
 by es87.siteground.eu with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <dimi@tpm.dev>) id 1oiWZX-000FTe-14;
 Wed, 12 Oct 2022 07:54:35 +0000
From: Dimi Tomov <dimi@tpm.dev>
To: buildroot@buildroot.org
Date: Wed, 12 Oct 2022 10:54:22 +0300
Message-Id: <20221012075423.14729-1-dimi@tpm.dev>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Originating-IP: 35.214.247.6
X-SpamExperts-Domain: es87.siteground.eu
X-SpamExperts-Username: 35.214.247.6
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.07)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT/DR7HCVeqZ6Jwr84i7E1k2PUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5xKipkaFeQDP2JiLCjsOSqCBHoJjdDPbdunZvlh+03gEx+y
 AgUhs4TMs248ll4GqtGr/hqYzjDWzrFya1I3MqUAQaXPwIlI4yu/PH1NWDdGRXUWryFCeLHSERAu
 GR33hv1TtObPqIqeRAv2CqzEPfjvzn3+O390ZiUEIR10am7COXQg45AD+/l6P8h0+TPjaDxMfcvw
 9uVrltEafCGDyHAgHlsrgHdRWEueoBSMqiQzPh1yRvIbtitNGnLjaBpZxUE1lUtc0sYymngJCgc9
 CmsiXhTG+PaMK5UE3Zu4DMGBKIPAgTtUp75uqlx0KezvZHUu+iTf4jeLzPxiKlO+e+wTh4qquF0m
 STLvgCmSR4faGwwvmLeDYYVoZCdncqjCVTxqe+hzuzR4e2zKsft/i9azUpyDFBOp1ITdzGU/ruyy
 5nGfZreTrrCodBGR0eudR/Re4NVbVEBU/8Tv9RjL1Pyu39sUHXwyAFnSuVW90ZJgh3r6hAL/pjzQ
 N/GQ45ibIzuzIh1wkn5B+muMTuS2LDwzt8Ds8HhMu8AsuC+XP0IWdUIAUNuMtkDDGcfMcpylyxjp
 JJXdFF26mf/HrhmlfaDqewZEt7CZOQ7IU15wrAsvU4/yXIk618YVJp5jM2kZcUgHPUbw7CVpNolc
 zSoTuJsRnENsSECCOsy4kitQ2EVON3ZmAvzhACRw3PmZbvOIthHKOhcThrNj1AqX8Jq1thvEqHfb
 Q8u7jCjeXBf4QJQjVzYfTH509XQw8Xdr+MnJzzZn/WnTKonJfGSB+FJgE/zw4HUoD+cIWUzsqPTs
 oNyo6vdjzQ6YC7Heg3Xf7O1TOd6RJQvT/U9rVpsp+2+YWHqMJlXoybOvrfLlgErbJFPCX7X6uLCQ
 WGN9pNli3DC1GSHKzN1rop6/VUR3WHJzx/Pyq/8B0Wo0iKwieE6KSu83gSG7X+t1TW39Ja77LGPp
 OwBdIsa6pXKCXxjFsbUwgHS0eo7ybJmmaWykWTbAAZ1XGFTzcEStuOgM8+WgcxlSOIcPxmo87wug
 keVczgPJFLMsHgC00qgRk2z6CMYeLQ7wp2F7GO6T6bnYu21C1+IFqWMHzhJIya1bhC8OG6CHeS+X
 Mj9B6P5z9jr1E+YC0mZnY7DiOrvyPQGBoymZzgLPbwz2OKHH5lr9xXvSM4nM3avg
X-Report-Abuse-To: spam@quarantine2.mailspamprotection.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tpm.dev; 
 s=default; h=Date:Subject:Cc:To:From:list-help:list-unsubscribe:
 list-subscribe:list-post:list-owner:list-archive;
 bh=hTxNSsXWHNllwpU/gjOtOFtPi5tHUMouoGoboRY8SP8=; b=u9B/O8AJcxFs2fPaGcAwXQoc6C
 0ZB5vbN00dqxqSprrr4oa2XZhPjVJ7b+Ph6WRUj5RgFtlo+aOEwxVqs2zVmg+4KD3wGuunyqu13lo
 qXEIKYH6ABBktSHZZkryehi9h0Kk60Fq2i8ZfUHBybwSvtNym8lkpNhu+aMmn+iY86nugnL2tY4Ac
 YJAoL1PPdtEekg+MkPVGSAzfqhrxevyd8p7vkM57kj41BzjTsGbhH6vMb58rlRrbcpr0PHEZHjX5m
 5fvYk4JhBXCENwWaEAIeHofZgvgjS4piz8iv83ND966+irusdI5VoaXYFIFXhVrh+H32VwKWJfRKP
 ixwCPFNA==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=tpm.dev header.i=@tpm.dev
 header.a=rsa-sha256 header.s=default header.b=u9B/O8AJ
X-Mailman-Original-Authentication-Results: mailspamprotection.com; auth=pass
 smtp.auth=35.214.247.6@es87.siteground.eu
Subject: [Buildroot] [PATCH 1/2] package/wolftpm: Update version to v2.6.0
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
Cc: Dimitar Tomov <dimi@tpm.dev>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Dimitar Tomov <dimi@tpm.dev>

This patch series bumps the wolftpm version to the latest available and
adds one new config option for controlling debug messages in wolftpm.

Signed-off-by: Dimitar Tomov <dimi@tpm.dev>
---
 package/wolftpm/wolftpm.hash | 2 +-
 package/wolftpm/wolftpm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wolftpm/wolftpm.hash b/package/wolftpm/wolftpm.hash
index d24df58eaa..e256967a01 100644
--- a/package/wolftpm/wolftpm.hash
+++ b/package/wolftpm/wolftpm.hash
@@ -1,4 +1,4 @@
 # Hash from https://github.com/wolfSSL/wolfTPM/archive/refs/tags/v2.4.0.tar.gz
-sha256  31d1a5f5d60af14c4d07e14a9b0667404d4801fed32afd3fc0649749020ad17b  wolftpm-2.4.0.tar.gz
+sha256  78331cc2d98339247857f5ceb3e7cd3c4f5773e3d81bf1d73e8df9446e37472b  wolfTPM-2.6.0.tar.gz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/wolftpm/wolftpm.mk b/package/wolftpm/wolftpm.mk
index 7e8a108585..f217322545 100644
--- a/package/wolftpm/wolftpm.mk
+++ b/package/wolftpm/wolftpm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WOLFTPM_VERSION = 2.4.0
+WOLFTPM_VERSION = 2.6.0
 WOLFTPM_SITE = $(call github,wolfSSL,wolfTPM,v$(WOLFTPM_VERSION))
 WOLFTPM_INSTALL_STAGING = YES
 WOLFTPM_LICENSE = GPL-2.0+
-- 
2.27.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
