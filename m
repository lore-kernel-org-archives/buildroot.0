Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB17B606A31A
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 17:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=eaEL8Upy
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8078440660;
	Wed, 21 Oct 2026 17:10:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gJfhJMNZSo8d; Wed, 21 Oct 2026 17:10:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2AC124066F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792602621;
	b=DZcIEtZx2QVfXv3tjnVJ7WARJEWrGG1m+DKJs/Eu0nX9yTTLZKqgnZ2OmSK4uHLpFrBo
	 JQFFjcKN/53jTZ8KQd8zvW0pNypeiPJhsWhi91XB/HitcbHZCkR75M4QDd8b15BhF0Xxx
	 Sr0Sr/wi4kMNwG0XBIA+RQ+X9bi/tDB3IunZQ1XrOpsP/VED2TMdjuld3nR3BB3CFKfHC
	 xVq7ofODyqh9MQor/k7F5k+T25PRUYLnXsdaMpzGVomkeSQ4irRM2+n79tew771pOtxxB
	 DIXsN+71yhDEO6sQsBAMT7As0ijyTxtzg7VyBhvSr1k8KrOdayuy8Iz1ZZRqzZQ5lOg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792602621;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=qLUO/CwhLoZWLIk8WyH3cFzLRYlMHiRF6Dveu5YoaO4=;
	b=VGh/7i58xNvR8IjRdAVpZ4iaVgL8hzeMdhn27gT6vqVxZVSOFitiLPkx1iNcQgClEY1O
	 USKp+T9Ubyh2M8mqkTU5Y0JNq3/A9O2r0JQYGHzbDfvK6i4Rf73siHDrbmPmu4IbDJ/0W
	 CycHqImHpCTlZAAPfapYUW+KNkcKAm1fELAivlR2BDupzPZg/WKgNjKAqfyjg978c+fuN
	 EtoHTB16zGT8/j70NuPzPGSCSgzNbwYxIHLsGeqO1Z3+nacV6Uhap1wmdp5c2XEuckSOR
	 0W8yqfwCyTxVmbBc5/2OPF3RZP/lsgTuYsqIwqlrl63+xVYQSeXNgp0XapG2VHUwxcg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792602621;
	bh=qLUO/CwhLoZWLIk8WyH3cFzLRYlMHiRF6Dveu5YoaO4=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=eaEL8Upy/INOvxzZj49tbvL1rcL/Y13rWLirE4clI/w8kY9xP3wFxqvkQxkJwJRlE
	 wHzioT4X4268wMPtIC+3y2niLMf2oaSkpA1OkHGtnQGXW6x/mvFGjqmfc95Y8f6WFL
	 W8W7td6WYPRJlORKoaQoCJ4gNc9xxu/n9Pd+1wblBXAoBot9bud6O10liFjCgUQcEr
	 JQ1H92qZ5YJ351ybWZVIyL2qmbEcMPPQcYlkMrlUJ4iEZLymzh6Bzj5fIj+ztORv9H
	 EUfP7rZjNUO+NXL0l1BMtysmgaTpwKjhXO/P3yPwOVt/P+Go0dFOrFJspYug3n1Y79
	 jxYF90zRSp0hQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AC124066F;
	Wed, 21 Oct 2026 17:10:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 67AF3769
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 17:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E295403C2
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 17:10:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b9xDKTD41Nrc for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 17:10:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 99EFC4016D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792602619;
 b=U0qGSkgpgKtkjlnMseft94uJNA25qLADufnnZX3VnE2RIpjGeArmkINKwGClaC4nuvhF
 s+GqlFdMpDME7QzY9Un73YmQSigWPzBGqUweTWSsi7AnsQxAKCFBgdDV4hcUu3FZvbmAp
 21peVQeXhpl0833fr2owkAdIl6CRD/pmpz7WnZh0tfly8CxMlnnPY+/Wq4RxtUSJuGXZr
 3IOyds4Nk7HNiEBEbyz+Bo5Nv/6sJR6YuFArwgJPu3otZB0O56JB/WsIxEWgQrElZdj2x
 7huxhr7B48PXnLnpCfKm/baS6ESg+8gWXu3pJFnL2RHwKamRM539MrNzOY7yCVmfDrA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792602619;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=+LqAQtMD1HVr+gc8g56mKicOxcVlfJ2Pzant27f181E=;
 b=GvkAeV4ZNbM1sCYr86EFMnb4URnoAdiF/azPaVGYiTiayilr2tYbqvd7H/5pCae1Guhr
 8JIB/UR4pn0czwAmaGVLjZny9YTtDIxLGhnMKIq0NRaTJFQTOb2vO277c2eF6VQCw36oB
 eGplu3xP/d6NUKWd4tvVINMiy8lGVwHhZMSbuwiYQmn8nKCfHbtp0Ch5YleY4ZPBMtFQr
 4MpXndPbSNU12z7K3FZG7A+ibPUEoAWr99CD4l2wE/XCDE5V4N4FClQJeIFK63kQY+5gB
 WhvN6/9WkRZ/3B4zNuTIDCx4BdbFMqPoRkCO2uhox68S8nRUg01h8vN8ueplvBVoS4g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=MnncqeMR; 
 arc=none smtp.remote-ip=212.227.17.22
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 99EFC4016D
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 17:10:17 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MfYPY-1wddIl372O-00e2ye; Wed, 21
 Oct 2026 19:10:15 +0200
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>
Date: Wed, 21 Oct 2026 19:10:00 +0200
Message-ID: <20261021171000.3332724-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:/LWljhlU242y/l/RiDV9iMcs7+8U1ltXMgWZvKpXlyFpLubfaOU
 dQX2eUlak8WViqqx+eTYfmxX5Qjg7I8rXV5QujnbWY8UVnbnDjpJhlfErse4FP+dUeDSEmF
 D+ID7td05c5WhxSP69fkTBKnh0NyNMgV0h91/JlyEGhbRBBApX0YZJxte2dM/u8rjz4qNgU
 LLCnt+uw/STGUmxRsIMRA==
UI-OutboundReport: notjunk:1;M01:P0:myDxVilnyrA=;sVgpSKKQWTWU1KP/99aXlj1PMt2
 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
 /fHiHWK1uGSuXEdE/0VBwAJ8exLovvzQV+0saU4=
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 7.2.x, 6.18.x,
 6.12.x, 6.6.x series
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
 - 7.2.11 -> 7.2.12
 - 6.18.57 -> 6.18.58
 - 6.12.113 -> 6.12.114
 - 6.6.159 -> 6.6.160

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 linux/{6.12.113 => 6.12.114}                 | 0
 linux/{6.18.57 => 6.18.58}                   | 0
 linux/{6.6.159 => 6.6.160}                   | 0
 linux/{7.2.11 => 7.2.12}                     | 0
 linux/Config.in                              | 8 ++++----
 linux/before-6.17/linux.hash                 | 4 ++--
 linux/from-6.17/linux.hash                   | 4 ++--
 package/linux-headers/{6.12.113 => 6.12.114} | 0
 package/linux-headers/{6.18.57 => 6.18.58}   | 0
 package/linux-headers/{6.6.159 => 6.6.160}   | 0
 package/linux-headers/{7.2.11 => 7.2.12}     | 0
 package/linux-headers/Config.in.host         | 8 ++++----
 12 files changed, 12 insertions(+), 12 deletions(-)
 rename linux/{6.12.113 => 6.12.114} (100%)
 rename linux/{6.18.57 => 6.18.58} (100%)
 rename linux/{6.6.159 => 6.6.160} (100%)
 rename linux/{7.2.11 => 7.2.12} (100%)
 rename package/linux-headers/{6.12.113 => 6.12.114} (100%)
 rename package/linux-headers/{6.18.57 => 6.18.58} (100%)
 rename package/linux-headers/{6.6.159 => 6.6.160} (100%)
 rename package/linux-headers/{7.2.11 => 7.2.12} (100%)

diff --git a/linux/6.12.113 b/linux/6.12.114
similarity index 100%
rename from linux/6.12.113
rename to linux/6.12.114
diff --git a/linux/6.18.57 b/linux/6.18.58
similarity index 100%
rename from linux/6.18.57
rename to linux/6.18.58
diff --git a/linux/6.6.159 b/linux/6.6.160
similarity index 100%
rename from linux/6.6.159
rename to linux/6.6.160
diff --git a/linux/7.2.11 b/linux/7.2.12
similarity index 100%
rename from linux/7.2.11
rename to linux/7.2.12
diff --git a/linux/Config.in b/linux/Config.in
index c84c4d41e6..e0a8bbb457 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -182,10 +182,10 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.2.11" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "6.18.57" if BR2_LINUX_KERNEL_LATEST_6_18
-	default "6.12.113" if BR2_LINUX_KERNEL_LATEST_6_12
-	default "6.6.159" if BR2_LINUX_KERNEL_LATEST_6_6
+	default "7.2.12" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.18.58" if BR2_LINUX_KERNEL_LATEST_6_18
+	default "6.12.114" if BR2_LINUX_KERNEL_LATEST_6_12
+	default "6.6.160" if BR2_LINUX_KERNEL_LATEST_6_6
 	default "6.1.190" if BR2_LINUX_KERNEL_LATEST_6_1
 	default "5.15.223" if BR2_LINUX_KERNEL_LATEST_5_15
 	default "5.10.272" if BR2_LINUX_KERNEL_LATEST_5_10
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index d288e880e7..8be46f25a9 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  e09b6727e5c521253f0d41694900b9c38fb7604db7d35238a8197aa9f7de2428  linux-6.12.113.tar.xz
-sha256  7206727244da5d85f4a03758d29e1c0673f2f01877793f494c0f3638c46b8fa5  linux-6.6.159.tar.xz
+sha256  7a8589912bd7a8adb07fed074283652cf482a35facef8954554654f0154b4af3  linux-6.12.114.tar.xz
+sha256  b24c40a9e2188695803358567edda51c4080176424a57dbefca45e5ac44ec225  linux-6.6.160.tar.xz
 sha256  8aa50daca0412a3d0a61a87af3744f39773d40b3132635fb7bc9be652cdb7b0c  linux-6.1.190.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  c1faba89652ec4af585fb96131fdb70d99e891c2b368cbf6d9c1e5fb7f156c23  linux-5.15.223.tar.xz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 96b0dcce55..83d7d04e16 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  fd0fc479f983a8c05313f13e9c36330fe6651cf725396748c40d5cd93fa1e6a4  linux-7.2.11.tar.xz
+sha256  bb18468a8dc8978aa00caa6446e753f7b6da3fee56b6b7f38b16f9430ba02d4f  linux-7.2.12.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  5bd9acdc82ec5efc3790ae840e5aaa40dfde7efff261cf6dde902dc570acf98c  linux-6.18.57.tar.xz
+sha256  069b19f9032c4dac8149ae4b6520c35debca0f42a9f6d52ee55ba6ca9b818013  linux-6.18.58.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/6.12.113 b/package/linux-headers/6.12.114
similarity index 100%
rename from package/linux-headers/6.12.113
rename to package/linux-headers/6.12.114
diff --git a/package/linux-headers/6.18.57 b/package/linux-headers/6.18.58
similarity index 100%
rename from package/linux-headers/6.18.57
rename to package/linux-headers/6.18.58
diff --git a/package/linux-headers/6.6.159 b/package/linux-headers/6.6.160
similarity index 100%
rename from package/linux-headers/6.6.159
rename to package/linux-headers/6.6.160
diff --git a/package/linux-headers/7.2.11 b/package/linux-headers/7.2.12
similarity index 100%
rename from package/linux-headers/7.2.11
rename to package/linux-headers/7.2.12
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index bdf0bb58b8..405d278e1e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -477,10 +477,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.10.272"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.223"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.190"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.159"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.113"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.57"	if BR2_KERNEL_HEADERS_6_18
-	default "7.2.11"		if BR2_KERNEL_HEADERS_7_2
+	default "6.6.160"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.114"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.58"	if BR2_KERNEL_HEADERS_6_18
+	default "7.2.12"		if BR2_KERNEL_HEADERS_7_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
