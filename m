Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73AA7C61DD6
	for <buildroot@archiver.kernel.org>; Wed,  2 Sep 2026 20:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24BE040A67;
	Wed,  2 Sep 2026 20:17:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J1rLDiB-iD6Q; Wed,  2 Sep 2026 20:17:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 985A140A74
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788380224;
	b=FuYOoqs5UECxkSkZA6Ng72BT24oKsk/HLJuMg833Vg0sPzbTD/pYA64wNntBrVKFKHBr
	 qyVbtZC8CcFdshceLnYBa/tkHWk9z8JiwjWDdY9O4trBghIS2UnpaFdXviEHVdQXk/z4Q
	 iOjObJewywxr2MQa5NBkBmhAgXEq6yWYI2/DoSzqru85vFRS5nTKsegd/pUex5a402qRo
	 qo2YD9AAybCXyg3LKFT4kx9DfP/fMvMFVCYSAsLIUKqFB/8QGyhE1IS6EOMlE4gmDcsnx
	 G6nibJiK78Hw8hfajOVBbcD2f5BEb1eEgCxauYxvmUZVTVWqBFvxqnVOWovuAMft+zA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788380224;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=t3bhxfSzyCXqQEQbr92yhso3YDUC+Qe7kvpaaWHDpNs=;
	b=R7xU2GA2RW0pUyTfou2tb3DANLlL1zq3brP48zzTG0EY33I26G2lz885g1pTCWMFfTs/
	 TMo2qxVd5nNoKotTuFWlS4CWUyy7OYhcs+MJAiOuyUjUQEcbhB3ZfNZv1iKkrBeiMdO65
	 ac9filIAL+AaQPCEFWqk+HavvM8m4W0ZIvzXq35Hqd3K2sy5raCkShyzGhYSmGYJ+cuOw
	 lrp4TWs1vA2n9KOYkhWMQmkmoAKrS2mqfXcgF5qfRwwcDRPj4+0BbaDXpa8aBbdoFN0HN
	 nB32g9/ILqsUdaomCdcMi/QqsV5SXM8sBV4dqm3BrxRiXMPRGOPl5T1idk+V8ev7pOQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788380224;
	bh=t3bhxfSzyCXqQEQbr92yhso3YDUC+Qe7kvpaaWHDpNs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=l+jZgKa+5ANK6XOg/Qp0vtFj5o55OMc7RIlxNtGMCyXYinWOM+d/95eaIzEz4okPb
	 WYRXBIhBee49a94OJP6MYzBDXDe83mYvdcXEtwFrM50+YuGTxRT76dBLfd6L2VyS0r
	 TvSkcVgJ+VTK1lgvxY0gp+fW5BvuA7/E1nzPGCWv5SNyJ3zCwIhi+qIuZCSRwXGDUE
	 ApKigHIbgk4J765Bdygmckn3dv7TWxJqdLDWPdVKftSy7G/O/GyQunf9meyU2LK6lW
	 cpzTj7ilTl2bRxu4MA8rzDKhs6mpjPuIuwnCyXQd7t02gOFiZ4rtxHPtJNc/UiOM0X
	 CnUuFyZWw4fXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 985A140A74;
	Wed,  2 Sep 2026 20:17:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 19D41363
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 20:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B5CA810F9
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 20:17:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nQjsBZdGbq71 for <buildroot@buildroot.org>;
 Wed,  2 Sep 2026 20:17:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 72319810E2
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788380222;
 b=L06WFPCBW9ahIN0KovePuxBqpkOqsMkAEnK/zVLZlcaxRvfFt1Rfkz3ZyW37KezabBhC
 GgNh5YVNm0Z4v+8bMWlrej+7guvDf3KSJNirsPnfGD3COr4Nv1qlYY9NzltKx9D1dOHhu
 qOWooo8wh5ODc8ISa2G9C5Le7fViGbjegIJdc+tMUL3xZ+QEzNPUwd0gOotQWrL+pjQdw
 2pkDHMguTM51fhvvr0sXLx+ZztZ9ZTYtVTi6pw4rKtesIX4snmaBDFJ/1bvCTRnQqDpoO
 RVtHkEu0CHUEWgKZ7Mn0VHUKEdJ0hz3NL/gYpqgVwBNScj0JWxQl5YIgzrvdkvRbNGA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788380222;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=qVNZDhyeSZlnI6FDbghb3gk5Tb0c6NXnyKPw5veFuAQ=;
 b=kuQa+9Dk0A215RLgnfO5W9vdWBAZLM6igDUZeJLOHI7NOLJFufhj2dlgd6/+j7iYCydP
 XANlK8TW6WRYHo8DaXi2X4QPyLXwhcJAUidSWwrVoA3eZWuGAuAv4k67bMUA7PexogC7U
 x/F2dlZb60z476bZ0HKcE/UTcUN2VQppwyuKNK1BwsABQf3sSMq3JGii9YMGwMwCaF0ax
 q97tBeeZg0UTzY0N+jcUOgqpfg1L+T/uewuilbpoNO+jxiAmo96l0skRpwSiqRkJNSKck
 WAWpkB6zds9v48HY0NRyOcyfeKwoyvG72B0iyRcPFXKdXbiL+k9CVZt5S2hUAFU1m5w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=cPYy3SWu; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=cPYy3SWu
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 72319810E2
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 20:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788380217;
 bh=qVNZDhyeSZlnI6FDbghb3gk5Tb0c6NXnyKPw5veFuAQ=;
 h=From:To:Subject:Date:From;
 b=cPYy3SWu8o0/mT4xvsWyuNrlToyyWdwsP3FLABoOSqoYo5g+tjYKW3lbJpzAO9NCM
 JazHJnLTlPXg//w0PzAcoo7IZTs2rEmm8qPTDHenL141Wi0c26GrdbJVncVqy7F4kU
 ZIXTE5QSMRRXUa+JiY2mlkfEnKik3zkCAvXyX8PlR4EKjdNK4m8Ul145E4/ICA27Zt
 AOHWzW4CEsjywXTUeViUQG9mchkAjE1GKdqad8fVqBjlBfZ2rS8MpJf1vju8cwCWbN
 jNCw15UiHTQtIBc9pveZLPC1OFCowHffHeJXz2H34poBiXjNOSaXd/aUHXEHkQcg9s
 fQtMKJmCxCDqw==
Received: from fli4l.lan.fli4l (p54a1b089.dip0.t-ipconnect.de [84.161.176.137])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 535F7A4C07F2
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 22:16:57 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34312)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x1rOC-000000004LE-3CXq
 for buildroot@buildroot.org; Wed, 02 Sep 2026 20:16:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  2 Sep 2026 22:16:56 +0200
Message-ID: <20260902201656.875051-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.12.x, 6.6.x,
 6.1.x, 5.15.x, 5.10.x, 7.1.x, 6.18.x series
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Update the latest kernel releases to:
 - 6.12.107 -> 6.12.108
 - 6.6.155 -> 6.6.156
 - 6.1.186 -> 6.1.187
 - 5.15.219 -> 5.15.220
 - 5.10.268 -> 5.10.269
 - 7.1.12 -> 7.1.13
 - 6.18.48 -> 6.18.49

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/{7.1.12 => 7.1.13}                     |  0
 linux/Config.in                              |  2 +-
 linux/before-6.17/linux.hash                 | 10 +++++-----
 linux/from-6.17/linux.hash                   |  4 ++--
 package/linux-headers/{5.10.268 => 5.10.269} |  0
 package/linux-headers/{5.15.219 => 5.15.220} |  0
 package/linux-headers/{6.1.186 => 6.1.187}   |  0
 package/linux-headers/{6.12.107 => 6.12.108} |  0
 package/linux-headers/{6.18.48 => 6.18.49}   |  0
 package/linux-headers/{6.6.155 => 6.6.156}   |  0
 package/linux-headers/{7.1.12 => 7.1.13}     |  0
 package/linux-headers/Config.in.host         | 14 +++++++-------
 12 files changed, 15 insertions(+), 15 deletions(-)
 rename linux/{7.1.12 => 7.1.13} (100%)
 rename package/linux-headers/{5.10.268 => 5.10.269} (100%)
 rename package/linux-headers/{5.15.219 => 5.15.220} (100%)
 rename package/linux-headers/{6.1.186 => 6.1.187} (100%)
 rename package/linux-headers/{6.12.107 => 6.12.108} (100%)
 rename package/linux-headers/{6.18.48 => 6.18.49} (100%)
 rename package/linux-headers/{6.6.155 => 6.6.156} (100%)
 rename package/linux-headers/{7.1.12 => 7.1.13} (100%)

diff --git a/linux/7.1.12 b/linux/7.1.13
similarity index 100%
rename from linux/7.1.12
rename to linux/7.1.13
diff --git a/linux/Config.in b/linux/Config.in
index 12b04de477..d511acd26b 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.1.12" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.1.13" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index cba5ae653d..bc2b34b856 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  a5f8c5be3fde2d6d9ca14e9631642cf1f44487143f11059da730dcd5892e307a  linux-6.12.107.tar.xz
-sha256  4e67a9263f2c19b070112109c9a282ee8e8ea49f1641e41faa5cca2c41654982  linux-6.6.155.tar.xz
-sha256  eeedc32bbf2448205aff50ee2760a4d87172cf8f8279c1e5930069ad36f6236e  linux-6.1.186.tar.xz
+sha256  e1d1ea200d22d55c9f5d5fae59e69bb3b494515705fc3390cd54231ee4f4baaf  linux-6.12.108.tar.xz
+sha256  aee2264a4eaf4a14344b47a0469bd42e8b4885b24f110b724262b3da956f411d  linux-6.6.156.tar.xz
+sha256  1b6e798aeaa708ca670a426ad5a6c86dc2237b8e59e8822876976c383873642b  linux-6.1.187.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  d04a4f798cc26f81170b5ecb27a3d8c8b4838f3aaf2a431b577043e2ead05ca4  linux-5.15.219.tar.xz
-sha256  7b164daadbc3743e61946631a924eb234d5136d7923dd4f3b40a18b91e52263a  linux-5.10.268.tar.xz
+sha256  b5b2992505120ac864cd9ccf7cc44541684df46c5a0b09ccdec93fb7f9aa6723  linux-5.15.220.tar.xz
+sha256  9c5a168119406674ff3bcf366a3a235206eecfa7b79f04629b31a7cc678cc6e9  linux-5.10.269.tar.xz
 # Locally computed
 sha256  bd5db7fe3b0475cce4fc72db7a7f7df1c22b970aabe5ebff6ddd48098973bdf2  linux-cip-5.10.254-cip72.tar.gz
 sha256  97d7d5139900c10ff7435779be4857dda531e7cf6abba52c12a5f39aae195411  linux-cip-5.10.254-cip72-rt32.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 0d4b7ba9bb..3c5e96ef4c 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  389716b3ed27e4cd520b903eea04acc33b9804c4282cb7a918f05ff14e9b5ae1  linux-7.1.12.tar.xz
+sha256  614d95fafdcb5cce2b6620e7edc6afbb606bffd4655405586815d84687841ad7  linux-7.1.13.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  5ebdadb10a4b5708fc6b1c457764a110bc49f8150cc3502c59b921ead8c6fc8c  linux-6.18.48.tar.xz
+sha256  ae826f33111fea6f1d279dde7299d7463c8dfd204aeb75a8fb5432bc60a28191  linux-6.18.49.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/5.10.268 b/package/linux-headers/5.10.269
similarity index 100%
rename from package/linux-headers/5.10.268
rename to package/linux-headers/5.10.269
diff --git a/package/linux-headers/5.15.219 b/package/linux-headers/5.15.220
similarity index 100%
rename from package/linux-headers/5.15.219
rename to package/linux-headers/5.15.220
diff --git a/package/linux-headers/6.1.186 b/package/linux-headers/6.1.187
similarity index 100%
rename from package/linux-headers/6.1.186
rename to package/linux-headers/6.1.187
diff --git a/package/linux-headers/6.12.107 b/package/linux-headers/6.12.108
similarity index 100%
rename from package/linux-headers/6.12.107
rename to package/linux-headers/6.12.108
diff --git a/package/linux-headers/6.18.48 b/package/linux-headers/6.18.49
similarity index 100%
rename from package/linux-headers/6.18.48
rename to package/linux-headers/6.18.49
diff --git a/package/linux-headers/6.6.155 b/package/linux-headers/6.6.156
similarity index 100%
rename from package/linux-headers/6.6.155
rename to package/linux-headers/6.6.156
diff --git a/package/linux-headers/7.1.12 b/package/linux-headers/7.1.13
similarity index 100%
rename from package/linux-headers/7.1.12
rename to package/linux-headers/7.1.13
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 14c62a698d..433fb363ee 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -472,13 +472,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.268"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.219"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.186"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.155"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.107"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.48"	if BR2_KERNEL_HEADERS_6_18
-	default "7.1.12"	if BR2_KERNEL_HEADERS_7_1
+	default "5.10.269"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.220"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.187"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.156"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.108"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.49"	if BR2_KERNEL_HEADERS_6_18
+	default "7.1.13"	if BR2_KERNEL_HEADERS_7_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
