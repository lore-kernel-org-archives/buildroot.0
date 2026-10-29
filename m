Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0C5606A31A
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 21:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cmgrtWjf;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=ORL6uhyJ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D205605EC;
	Thu, 29 Oct 2026 21:11:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5nD-O-lqDtxf; Thu, 29 Oct 2026 21:11:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5CBF360A78
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793308267;
	b=qxpC7olDNSMndjVIHZtzsSAASbHAoEzRXtGkVD9DAkRYD7bd8MwJh9+bUl5Dn47D1Fvb
	 2pa8dRqS0VsQyOf02Fd4xfMFnPf5GLTp55nFhcVlB6vF9WaPm8LROztP1PVydh3NMDKTH
	 CBV0a/Cg1oBIvTUfbvrrcFEK3fUNXOlH+yZbT+kFRT7elC9ePZjXW1Ec5xgekuMYxG8O3
	 48ZrOlCgm+3mIw62FsIcsFfpIaZzTP8G4C36s/h05UQukIzY3DgBe9nmS/v6qA0G87GIU
	 /eokZFagb9kzje/sWJe55pjL3gfNBrPMh6ed8X8rO8OoKLrp/fVAcYDQUgCNlvklCDQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793308267;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RNfNSp/9JusnZvDjclIMDvzxIIydIC3gYdRv5fWc9Oc=;
	b=li0VCKX9bXi8Qs7zAR6Nd7EG19gEXYH07ouIjHeZqMNf7lvv4bko/3kM0Kd0q/cCT/j1
	 CcR2X0QY7nPiJlGPtG7+hJESGECB0JGYI7dB2/aW3bJbtHW1G++JJLfLsdeJmIpfNSyoj
	 EG86DvdXiOugNYH4wG8HSoHfadNGyVqFxUQlnBC2VDlZivzRSfWocStRzhB/7T2k6bQ6B
	 YlliJVVLrCATpoB9yr4Jv/qrapQEojFdcMmTApj9NQyaiwNnku2msNJ9layzp+ZYmBqXZ
	 krIVjSqCreTiX/mGhPMtG3XJ2bM5N+h+GgbrsD/mZ50736N1UyVswywQNAyMlwWyNSg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=ORL6uhyJ;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793308267;
	bh=RNfNSp/9JusnZvDjclIMDvzxIIydIC3gYdRv5fWc9Oc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cmgrtWjfwcUR+LpxxyYM1rFh9gJwrWVJZTUS+3Wcx++6KvqnyZz11sY2Un1Pk22th
	 QDcsfMclzrSI4WqIgI5d3bnNwcydkqLaTDqFfRYPESVS3tcFn2ll61dt2SebMYcvQh
	 fYmy6pjV9HaCYHDMHLOzAu/9XDnLTJtY1JTWSlZzvskEQfcDQCTQ+VTnJoydthnLOv
	 kjEtMl7ZECuLCF/hGw0h3Mwl1Pe07JcOf+eg3Zh9fUyVhk/zAcqFPEOv9Khxsu9C83
	 8O4zfWf6rb5jX0Z80NaXfFrRYkeo0g3ickOQoqj2RkYBYvi4ypvXfJgL9n60lEuKUH
	 0g9AG4Ygc3k9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CBF360A78;
	Thu, 29 Oct 2026 21:11:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B2370972
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A430060A78
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:11:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7zBPIR9YxSKG for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 21:11:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 96083605EC
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793308265;
 b=S+XCYft4/N+Skuqvjhtcfp2K2DjJvUJfTgvipIXN4lZLnt5MLJss6cP3Bxk1CzGLnECq
 eVzlLV6GjdupnN3p5F0xsl/bMCmucuRuFfA7vyd+gEkbR/F8VGjN4mZP2vWt7Cy4uJ7c9
 JyUHajBmwdZtSk4QnLAbW3BIlZ/eTO/vijosM7K8vTMMRdABq4rcjK4qu7sw54t5NczHI
 0X6Cs06ArmnIh5ro+fLRoLEnMZxC5EwTkGU1AQEBonnbmRV2ecF1sStn/4iE5NpOvKqss
 KRzU3bzqjBgMU8xSOAVCns+IT6AwdTXm1Krhc+wT5EbQbjWPSKjJKXj2OupRGmXDNEw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793308265;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=TJN7ysSsxNj/LKquWpc0NKKQjFRxQCkXbizv2UnTCjs=;
 b=fvBQYAVisF43OO4A/QTXrNwMlaeOZ5D9kLGo/ATl73ESKZed/FpubJlkDX3rvb/LOgO+
 X6bHKI3ArS3bYnB7mc4CMhbld2OXOhkLouq5o+/hGmu0oV4D6EvFVL+L8CnONQNxFWkeJ
 gIg5WKfhAj0YU1mB7140uB50DVh0EagwrLDiGU/UWoCrPBSWAe1zSmf93ROvV5Gv9S41q
 lizUl8vcR9Nm9G25dmVEGIcee2J3I242mTKi8C3cU5+WdulUBJsdjE/nj7YqKEx2RmUB8
 ppPWA1YdQQBjjlhdtUUmlenk65wqFgH1/OpSRW23DWKnP7R4MTpYHRZGRQ13/7heCxA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ORL6uhyJ; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ORL6uhyJ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 96083605EC
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793308262;
 bh=TJN7ysSsxNj/LKquWpc0NKKQjFRxQCkXbizv2UnTCjs=;
 h=From:To:Subject:Date:From;
 b=ORL6uhyJgDDZ2ht8msSGJKdlauQAqNRZq9iY6ZO39jY75PgE03P5F98N46heUSo2E
 sQienRLVPGvS/TALgO1iFcT8WzNHfe51wbaY4XajT4Wk6i7DafvYo4/Q8nIavdu1IQ
 aUBwSUqVfjAc8136Yr0W1K3kRLN5GTzO7f0ZrKDY2twCO0vnS9YW/MTfks4WDMlmVx
 e9Je1H01xaXFZLnq7kra3gpk87qC0eCg58fyJH2dZq1lC3nIeyy8U0V+/5sf+lWl8Y
 YFNJMJC7QZCigXdqKU8oiNA+4hsSQp8JZVTeIt099T4pQ+4C7xxU/ELwu1vq2bEF7Q
 DsVGp3QeP7TLA==
X-KAS-Sym: v3:f51bdf72230551df:WRQHxWQLr8HR1mmY6XH8DJG3RChrL6LKV0qi9OkJkI0nZ
 UfPAhCd/y2JMfAxmAu5Xx8lSg6bBAsKRwSNIwVwsP7mAxTEgnz3AR72MFQMMh9Ls6Jr1STYUZyA
 Rl2FKn+070X0048mJxiPD6Y8/tb2lI3fZJYWi5FSObMeHo+BKPfgJSd3gzoVM7//Pb3pGqpY+VB
 Yam04R4oF0tCqCfzC8/HBRas5xq2ArhQ5KKpLysXsJNO2Q1TNeBmBfJoowR7U2VN2KVvgvHTnC4
 7tKWPwivWtwhPwJUclh7VMipAvWELAD4u8Ew6Zwq38RouyEm8OSZbk1A60nMAKxENzLOzvQA==:
 gQNlQPvpGi04YdnTRnSj/VKBBEUewPNs1kDnia8TqacD0xupQhILUtbLFJMcIeSdbZ49CKZQkt5
 BFqQYFxeBQIRKHLdsLvs2TL3RN0ezo+BD6sydJjpz9AXapyL7NGK/daKJEum0ZmFhAp+4ACpyHg
 4oL3Gi7jm1axZaRve8vQA7RZISNMcgTGQs4QV6F2ZplOk6UwcVjyiA5RHzpLoZzKC2g7aYXkaKC
 0hqo0JzO7JSmgc7xdzA5a0qjDvyOJqAF/PU89SMddPg2xLeRc4ighbTspDshPJVVGHc6S1JsIC8
 eRQcLSThV1dVFqKO+HyvgdU4KF08KHW9HVYKqPm/z4mzh2bvfqUeVYHDrsynr47S+TLMtiJ4U1R
 9bLbDE5gTsAA8+2RlQlWzci1FLDQeO+3K1lc46xB5+u9UpWtWIcM6yHzYO1kVgjvsg+QY5uVsZu
 WwZyiyaB4/eMp/nPzmvTMj/tPOFJNGoaFfL7xmNJArFev2dW1ntqLShlLaClWRlrfV55ewBTRbM
 oQ176+nHsViprJ+eLOgGhJCzf8ASaIAwpf5/bDlTjARVfZvVjYq7Xlo1+42na5K/klt3pf/IeNa
 w31w3w==
Received: from fli4l.lan.fli4l (p5b3a01b5.dip0.t-ipconnect.de [91.58.1.181])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D3063A4C6CE9
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 22:11:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38766)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xMXOo-0000000027w-1QTW
 for buildroot@buildroot.org; Thu, 29 Oct 2026 21:11:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 22:11:02 +0100
Message-ID: <20261029211102.1455105-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 7.2.x,
 6.18.x series
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/{6.18.58 => 6.18.59}                 | 0
 linux/{7.2.12 => 7.2.13}                   | 0
 linux/Config.in                            | 2 +-
 linux/from-6.17/linux.hash                 | 4 ++--
 package/linux-headers/{6.18.58 => 6.18.59} | 0
 package/linux-headers/{7.2.12 => 7.2.13}   | 0
 package/linux-headers/Config.in.host       | 4 ++--
 7 files changed, 5 insertions(+), 5 deletions(-)
 rename linux/{6.18.58 => 6.18.59} (100%)
 rename linux/{7.2.12 => 7.2.13} (100%)
 rename package/linux-headers/{6.18.58 => 6.18.59} (100%)
 rename package/linux-headers/{7.2.12 => 7.2.13} (100%)

diff --git a/linux/6.18.58 b/linux/6.18.59
similarity index 100%
rename from linux/6.18.58
rename to linux/6.18.59
diff --git a/linux/7.2.12 b/linux/7.2.13
similarity index 100%
rename from linux/7.2.12
rename to linux/7.2.13
diff --git a/linux/Config.in b/linux/Config.in
index 60a37fd0b4..c7f1db7b73 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -183,7 +183,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "7.3" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "6.18.58" if BR2_LINUX_KERNEL_LATEST_6_18
+	default "6.18.59" if BR2_LINUX_KERNEL_LATEST_6_18
 	default "6.12.114" if BR2_LINUX_KERNEL_LATEST_6_12
 	default "6.6.160" if BR2_LINUX_KERNEL_LATEST_6_6
 	default "6.1.190" if BR2_LINUX_KERNEL_LATEST_6_1
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 27bd3da1d9..2f6ad625d7 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,9 +1,9 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
 sha256  87363c24f10e06321eb362765521094e94471f6bff8bce2d6b3e40f39f004953  linux-7.3.tar.xz
-sha256  bb18468a8dc8978aa00caa6446e753f7b6da3fee56b6b7f38b16f9430ba02d4f  linux-7.2.12.tar.xz
+sha256  08e7b0c4f2dd1971f972da274b5e589a98989390ac56acd7a1a5af922363ea6c  linux-7.2.13.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  069b19f9032c4dac8149ae4b6520c35debca0f42a9f6d52ee55ba6ca9b818013  linux-6.18.58.tar.xz
+sha256  53a55ac9863a5547e292b8e381d4e4c2240dd1127d5428a7c44dbc550be23963  linux-6.18.59.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/6.18.58 b/package/linux-headers/6.18.59
similarity index 100%
rename from package/linux-headers/6.18.58
rename to package/linux-headers/6.18.59
diff --git a/package/linux-headers/7.2.12 b/package/linux-headers/7.2.13
similarity index 100%
rename from package/linux-headers/7.2.12
rename to package/linux-headers/7.2.13
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 36d72710a0..100545ba6e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -487,8 +487,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.1.190"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.160"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.114"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.58"	if BR2_KERNEL_HEADERS_6_18
-	default "7.2.12"	if BR2_KERNEL_HEADERS_7_2
+	default "6.18.59"	if BR2_KERNEL_HEADERS_6_18
+	default "7.2.13"	if BR2_KERNEL_HEADERS_7_2
 	default "7.3"		if BR2_KERNEL_HEADERS_7_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
