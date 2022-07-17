Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C095C43334
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 22:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 942C783ECE;
	Sun, 17 Jul 2022 22:46:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 942C783ECE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jx9SdV2IBpld; Sun, 17 Jul 2022 22:46:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96F1F83ECB;
	Sun, 17 Jul 2022 22:46:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96F1F83ECB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 933B91BF59E
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 22:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D22760F88
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 22:46:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D22760F88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lIEyqQvSisvR for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 22:46:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0DF060F14
Received: from delivery23.mailspamprotection.com
 (delivery23.mailspamprotection.com [185.56.85.146])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A0DF060F14
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 22:46:08 +0000 (UTC)
Received: from 6.247.214.35.bc.googleusercontent.com ([35.214.247.6]
 helo=es87.siteground.eu)
 by se23.mailspamprotection.com with esmtps (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <dimi@tpm.dev>)
 id 1oDD1W-0008n6-Ts; Sun, 17 Jul 2022 17:46:07 -0500
Received: from [95.111.54.43] (port=34674 helo=localhost.localdomain)
 by es87.siteground.eu with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.90-.1)
 (envelope-from <dimi@tpm.dev>)
 id 1oDD1U-0003Oh-UV; Sun, 17 Jul 2022 22:46:01 +0000
From: Dimi Tomov <dimi@tpm.dev>
To: buildroot@buildroot.org
Date: Mon, 18 Jul 2022 01:45:24 +0300
Message-Id: <20220717224524.8771-2-dimi@tpm.dev>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220717224524.8771-1-dimi@tpm.dev>
References: <20220717224524.8771-1-dimi@tpm.dev>
MIME-Version: 1.0
X-Originating-IP: 35.214.247.6
X-SpamExperts-Domain: es87.siteground.eu
X-SpamExperts-Username: 35.214.247.6
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.01)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT9rMlH5wtyTNmZDIMK0sOmjPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5xKipkaFeQDP2JiLCjsOSqCBHoJjdDPbdunZvlh+03gEx+y
 AgUhs4TMs248ll4GqtGr/hqYzjDWzrFya1I3MqUAQaXPwIlI4yu/PH1NWDdGRTs6iCqyc2xZiCQi
 m0aSXTpTtObPqIqeRAv2CqzEPfjvzn3+O390ZiUEIR10am7COXQg45AD+/l6P8h0+TPjaDxMfcvw
 9uVrltEafCGDyHAgHlsrgHdRWEueoBSMqiQzPh1yRvIbtitNGnLjaBpZxUE1lUtc0sYymngJCgc9
 Cmsi3JsXLVveoVoX3FIZv8wq4YPAgTtUp75uqlx0KezvZHV2PGGSsz4vL/EJ/mIfZdAth4qquF0m
 STLvgCmSR4faGwwvmLeDYYVoZCdncqjCVTxqe+hzuzR4e2zKsft/i9azUpyDFBOp1ITdzGU/ruyy
 5nGfZreTrrCodBGR0eudR/Re4NVbVEBU/8Tv9RjL1Pyu39sUHXwyAFnSuVW90ZJgh3r6hAL/pjzQ
 N/GQ45ibIzuzIh1wkn5B+muMTuS2LDwzt8Ds8HhMu8AsuC+XP0IWdUIAUNuMtkDDGcfMcpylyxhs
 01KruaxB6s0aI7mWLxFqewZEt7CZOQ7IU15wrAsvU4/yXIk618YVJp5jM2kZcUgHPUbw7CVpNolc
 zSoTuJsRnENsSECCOsy4kitQ2EVON3ZmAvzhACRw3PmZbvOIthEBCAXfjTx5VY+N0cu8XXuOCDA/
 T7Q4qbMn7aXAp+iWlzYfTH509XQw8Xdr+MnJzzZn/WnTKonJfGSB+FJgE/zw4HUoD+cIWUzsqPTs
 oNyo6vdjzQ6YC7Heg3Xf7O1TOd6RJQvT/U9rVpsp+2+YWHqMJlXoybOvrfLlgErbJFPCX7X6uLCQ
 WGN9pNli3DC1GSEfv4lM87Xwq8Tt2B51wfJcRxTOU98rZk8NSs3bD+yB4iG7X+t1TW39Ja77LGPp
 OwBdIsa6pXKCXxjFsbUwgHS0eo7ybJmmaWykWTbAAZ1XGFTzcEStuOgM8+WgcxlSOIcPxmo87wug
 keVczgPJFLMsHgC00qgRk2z6CMYeLQ7wp2F7GO6T6bnYu21C1+IFqWMHzhJIya1bhC8OG6CHeS+X
 Mj9B6P5z9jr1E+YC0mZnY7DiOrvyPQGBoymZzgLPbwz2OKHH5lr9xXvSM4nM3avg
X-Report-Abuse-To: spam@quarantine1.mailspamprotection.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tpm.dev; 
 s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=euP/hsZZRoexLe2SSQoeRRadJTszmQ7UuSNmyKRkvY8=; b=b+7u8B7P07fBsKXV7LyPNSeweR
 iohKG6nx4n+LxOiaTF0pnAGyf95dg5+DiQxhKpsua5AXej1iG5SaJ3AMRCzYjWDLV4NRa+Plqf+U5
 aG9VuHn18lNSgEecDWNLMT1C+NqK/laEED/4eSS7KmwDaPXZTOMY/63a0Vcd6ENIMf+D4hXPnr9m0
 3FEq8sXfrzv0bofaMkvWFQs0syXrBRmdrU2SiS84TWcbvHJ4cZ9xQSqNa+9ZQmnHTnyW9YSJvIf+C
 LfAWWM4NXJnKYexQ4QOUu7pOLFuMf9WWI47Od6OUPzOFOnhIeNgdeM/l8NIJt1QGU3fKLLikWWO6/
 13rkghpw==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=tpm.dev header.i=@tpm.dev
 header.a=rsa-sha256 header.s=default header.b=b+7u8B7P
X-Mailman-Original-Authentication-Results: mailspamprotection.com; auth=pass
 smtp.auth=35.214.247.6@es87.siteground.eu
Subject: [Buildroot] [PATCH 2/2] package/wolftpm: Add config options for TPM
 2.0 extra capabilities
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

Some TPM 2.0 chips offer extra capabilities. This patch adds additional
configuration options to the wolftpm package, so such capabilities can
be available to the user. For example, the STMicroelectronics ST33 and
Nuvoton NPCT750 both offer secure GPIO. Due to chip differences, wolfTPM
requires explicit configuration options to enable the extra capabilities.

Signed-off-by: Dimitar Tomov <dimi@tpm.dev>
---
 package/wolftpm/Config.in  | 14 ++++++++++++++
 package/wolftpm/wolftpm.mk | 12 ++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/package/wolftpm/Config.in b/package/wolftpm/Config.in
index 0b964c3d7e..52a9005d66 100644
--- a/package/wolftpm/Config.in
+++ b/package/wolftpm/Config.in
@@ -23,6 +23,20 @@ config BR2_PACKAGE_WOLFTPM_WOLFCRYPT
 	  encryption. Disabling this option is not recommended as it
 	  could create a security breach in most environments.
 
+config BR2_PACKAGE_WOLFTPM_ST33
+	bool "st33"
+	default n
+	help
+	  Enable support of TPM 2.0 extra functionality offered by the
+	  STMicroelectronics ST33 chip.
+
+config BR2_PACKAGE_WOLFTPM_NUVOTON
+	bool "npct750"
+	default n
+	help
+	  Enable support of TPM 2.0 extra functionality offered by the
+	  Nuvoton NPCT750 chip.
+
 comment "wolfCrypt hooks need a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
diff --git a/package/wolftpm/wolftpm.mk b/package/wolftpm/wolftpm.mk
index c5ebeca18e..d3f693a62e 100644
--- a/package/wolftpm/wolftpm.mk
+++ b/package/wolftpm/wolftpm.mk
@@ -35,4 +35,16 @@ else
 WOLFTPM_CONF_OPTS += --disable-wolfcrypt
 endif
 
+ifeq ($(BR2_PACKAGE_WOLFTPM_ST33),y)
+WOLFTPM_CONF_OPTS += --enable-st33
+else
+WOLFTPM_CONF_OPTS += --disable-st33
+endif
+
+ifeq ($(BR2_PACKAGE_WOLFTPM_NPCT750),y)
+WOLFTPM_CONF_OPTS += --enable-nuvoton
+else
+WOLFTPM_CONF_OPTS += --disable-nuvoton
+endif
+
 $(eval $(autotools-package))
-- 
2.27.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
