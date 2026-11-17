Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88D7606A31C
	for <buildroot@archiver.kernel.org>; Tue, 17 Nov 2026 22:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=me0LtF4Z
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F20260829;
	Tue, 17 Nov 2026 22:45:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V9CJ98sT6aKf; Tue, 17 Nov 2026 22:45:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 147C460735
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794955517;
	b=o6kp3PwCwjIPj1tz8IVQ9ZvS+HlEiARSMCQYsRS5hRT3e+iOSnGBIahXwECMoih1kki3
	 SIjJE7a7y9BA5txgo9FPM6NGwRtdvA6kXAI5+XvkCXMgFdObR1MvqD0pORw/+Hq4d03CS
	 V2IHPnAZcr7bJg0pwsifFNPXEyKumz3x7A4XjbxKQfjl8q39lZ6qJcv8BlxgoJWwebsNq
	 z47NsdlcXAEkLUCtjBY6/1cin2lWOJkuILns9iRZmWVfX4glhF+3AEqhyUqKP8iheAmiX
	 7J+E6nJ3TnPuC8l8Z6k2Y3C4gyf4i2+DgCkAhd6Kohq4yOSBhPMGTEEBGocEO2iNjhg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794955517;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM2-Signature:Message-Instance:X-UI-Sender-Class:Received:To:Cc:
	 Date:Message-ID:X-Mailer:MIME-Version:X-Provags-ID:UI-OutboundReport:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=nas7/Dn42tmzf+9RPUfRTy5dn4FiiCfUIybj5jL5osI=;
	b=gpq+XBC7AC7MS/ae5KBr6v/HdGaCYUMRfbX0W8n9gM8bgOH8qGFogD0TGHap3IVU0ZVq
	 4/GaZpsf6NW7ZnpCew1xvTvMuMfAu5zw+knNaDV24vu3E2qNkUI19Eb9O3F7650svzxGN
	 h0scY0jwUbX8qvkvQAyB0f4YuP6JzaZbgkrkCsmC7X/Uv3TOX3X8+4QHBB05ydwAimeqV
	 5jc8+zsXITEnfgL+e7HypUN/gSUr7Sr+5bKGd1I8JEiyvg3SDtvjQNx3ve47Ck3x72X2x
	 vMQn76qCXeoMG4JCXS5GNzSNLS6Sh52KBq2/5N8OU8Hsdq8OjfuV/wWPOmNoZVoQmKg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794955517;
	bh=nas7/Dn42tmzf+9RPUfRTy5dn4FiiCfUIybj5jL5osI=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=me0LtF4ZOO9KNEtKDbMlK/E3Cyg35Vn2OjF4y/t+bZ1V3aN9Bon/AiGfMTBzUBu1P
	 0NFIF3l9WA4g13uaLWbIR4bSUUG6Fj7zULtBfjjyzNEL3XEQGoLMG8dEjuZPFJOiui
	 5t728p4BtihT8E+yfctioEQyFhvrLjGpbw1+lj7l6pLjV5ew/PT5omY07EAbZiCZIX
	 C5Bh+ngM2uuxb/8UgdKjM6PYNvg0cW86RAqMnEzhqODhIOWgsa4Ufz/hnHR8gJLYD0
	 v4PGvA1E4w8hxumgbhkNktRcSQHdsOweWhpTqGjdh6BvlEacNsfOYND+1T3LfnYr9R
	 KKcD5laoMmE7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 147C460735;
	Tue, 17 Nov 2026 22:45:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A6E5A0E
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 22:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87C8E4035D
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 22:45:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0YuV2fGyJH-m for <buildroot@buildroot.org>;
 Tue, 17 Nov 2026 22:45:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 12AF44005D
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 12AF44005D
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 22:45:12 +0000 (UTC)
DKIM2-Signature: i=1; m=1; t=1794955509; mf=PGZpb25hLmtsdXRlQGdteC5kZT4=;
 rt=PGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPg==; d=gmx.de;
 s=s31663417:rsa-sha256:j+SP9t7JLJFHCR0cbq6lXKA3wsPz
 o6qyG/xpXKN3RxqXmypmpBttzmzQS3TyDCuTXqcOKXumWfaVkRSoG/1EbYO213aDf57mXWeNZ0R
 dUvkuNtUIObqrxgGN06Dop4DwWXXzsqWvW80pM9D04wNHil4sWH65+w0pcGtU0YVa9VvkOpUhG2
 2ARf2je0EqMxKpSr90l4Yu8zTJuhizE3vrQdpgst8bD3HfFxxQuAITFaet8GtLcInLZdJePhx24
 niwaN3J5rlzptB3f9OiLCc3ZllSC6s+syMfqNzTbev5xJbJcrmHaSjLGqkMFZSjJrIDMtZnPUu2
 cF97fKaxGUmz+g==;
Message-Instance: m=1; h=sha256: zLAC8i+G1AlpfWjRhn9IJBOj/Pr1eKZoXgxxlJ1VvoE=:
 Ot+FWV4raNhhaeiGTOIkYXUW3MetaA8Dhc/KdiglPBg=, sha512:
 m3cVFINzj5zI5Aw/MppKjFjH/u+QOtaSXoQmPTBYLhqqKsTcz0y0F2wPIZ3lM/8+d/cgZbiTm+CY0enDN//7kA==:
 adbckCwjO3THD74l8tROiOe/6TZsDz5ux7rFi93wyOL/OfhF19H9VzDKXBhVTXOAoofK1Q/Mjcg4+p0qctu+RA==;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MGhyS-1xGorP2Dnm-00CeL5; Tue, 17
 Nov 2026 23:45:09 +0100
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>
Date: Tue, 17 Nov 2026 23:44:58 +0100
Message-ID: <20261117224459.3995109-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:4bh1lVnYxD79Qx8x/Og4UZbzi4UpxHT8ET5aAUPinqya2mdbxen
 m43VMquerx8Z7V+6rYDhpvbJwml7Ug70Z5hjES/SwWGYKeio16tuHeVPZdBajzWKuu0ng+y
 xB8Y7W8DpZI/IBE73k8R0+f0bWDOxH4YfEMTglWbyn0IXpI3eKxYBVudygyPb4MdirIojlY
 bXykWE1dSV2OD1n8lqEJw==
UI-OutboundReport: notjunk:1;M01:P0:Tlf+d8PafHo=;NKHwQArcKbvX4b1Pb+yotMt8mGX
 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
 jprRusNF9AC91Q73UfxdObzhaw0I9H5Cyg6nqc0=
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 7.3.x, 6.18.x,
 6.12.x series
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Update the latest kernel releases to:
 - 7.3.4 -> 7.3.5
 - 6.18.63 -> 6.18.64
 - 6.12.117 -> 6.12.118

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 linux/{6.12.117 => 6.12.118}                 | 0
 linux/{6.18.63 => 6.18.64}                   | 0
 linux/{7.3.4 => 7.3.5}                       | 0
 linux/Config.in                              | 6 +++---
 linux/before-6.17/linux.hash                 | 2 +-
 linux/from-6.17/linux.hash                   | 4 ++--
 package/linux-headers/{6.12.117 => 6.12.118} | 0
 package/linux-headers/{6.18.63 => 6.18.64}   | 0
 package/linux-headers/{7.3.4 => 7.3.5}       | 0
 package/linux-headers/Config.in.host         | 6 +++---
 10 files changed, 9 insertions(+), 9 deletions(-)
 rename linux/{6.12.117 => 6.12.118} (100%)
 rename linux/{6.18.63 => 6.18.64} (100%)
 rename linux/{7.3.4 => 7.3.5} (100%)
 rename package/linux-headers/{6.12.117 => 6.12.118} (100%)
 rename package/linux-headers/{6.18.63 => 6.18.64} (100%)
 rename package/linux-headers/{7.3.4 => 7.3.5} (100%)

diff --git a/linux/6.12.117 b/linux/6.12.118
similarity index 100%
rename from linux/6.12.117
rename to linux/6.12.118
diff --git a/linux/6.18.63 b/linux/6.18.64
similarity index 100%
rename from linux/6.18.63
rename to linux/6.18.64
diff --git a/linux/7.3.4 b/linux/7.3.5
similarity index 100%
rename from linux/7.3.4
rename to linux/7.3.5
diff --git a/linux/Config.in b/linux/Config.in
index 0c8c7cb113..629352435d 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -169,9 +169,9 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.3.4" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "6.18.63" if BR2_LINUX_KERNEL_LATEST_6_18
-	default "6.12.117" if BR2_LINUX_KERNEL_LATEST_6_12
+	default "7.3.5" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.18.64" if BR2_LINUX_KERNEL_LATEST_6_18
+	default "6.12.118" if BR2_LINUX_KERNEL_LATEST_6_12
 	default "6.6.162" if BR2_LINUX_KERNEL_LATEST_6_6
 	default "6.1.192" if BR2_LINUX_KERNEL_LATEST_6_1
 	default "5.15.225" if BR2_LINUX_KERNEL_LATEST_5_15
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index bae4ce7c9c..8327c5dffc 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  74e99aa5e60e242e0a165fed8cb2ea0d054bf7a401f01861d403d75733456613  linux-6.12.117.tar.xz
+sha256  08308460320e852ac0745b2be3c7ae1cd81bdad713506ed7d817ba1ec9e1a5a5  linux-6.12.118.tar.xz
 sha256  4aa89f3652fc131e5d39990f3bcd4b9e131028af3f315dbe83f3a8557dc06f06  linux-6.6.162.tar.xz
 sha256  1e88e317e20dbc79a2cb9e3d9667e908b262d12e76eb66eed894c5460eb87fca  linux-6.1.192.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 9af313603c..1d1150821b 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  b11b6df8295e8e991ff040b71aaa4994a8b55caa23b6b092907f195b5840fd1f  linux-7.3.4.tar.xz
+sha256  8f293f83d54f0b7b9be56863ebc5e4ea79d73e530b4ae55c572be97ef39f0990  linux-7.3.5.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  81764a545072d160748beff4d9de2e7d95aa9f16e8261110288f067a2cc61d71  linux-6.18.63.tar.xz
+sha256  020d45510c539972e6f14c5c71566878d3b7ef56fb082b3e09134f2ebaade562  linux-6.18.64.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/6.12.117 b/package/linux-headers/6.12.118
similarity index 100%
rename from package/linux-headers/6.12.117
rename to package/linux-headers/6.12.118
diff --git a/package/linux-headers/6.18.63 b/package/linux-headers/6.18.64
similarity index 100%
rename from package/linux-headers/6.18.63
rename to package/linux-headers/6.18.64
diff --git a/package/linux-headers/7.3.4 b/package/linux-headers/7.3.5
similarity index 100%
rename from package/linux-headers/7.3.4
rename to package/linux-headers/7.3.5
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 091dc29656..b3eb9289d2 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -482,9 +482,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.15.225"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.192"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.162"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.117"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.63"	if BR2_KERNEL_HEADERS_6_18
-	default "7.3.4"		if BR2_KERNEL_HEADERS_7_3
+	default "6.12.118"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.64"	if BR2_KERNEL_HEADERS_6_18
+	default "7.3.5"		if BR2_KERNEL_HEADERS_7_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
