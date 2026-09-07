Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0982C79FA0
	for <buildroot@archiver.kernel.org>; Mon,  7 Sep 2026 17:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9407D6066C;
	Mon,  7 Sep 2026 17:39:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cTXgNDVAfkCJ; Mon,  7 Sep 2026 17:39:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D85A1605C7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788802773;
	b=sz+zMOnElBNV+g1yyfVYtu+3fJUKomls8r3qIm0x8E9SlAC/+eRbIhKGV1qogZdDAeRB
	 YSPvwhcXOMo0KL6ZQVG1tW0MZUCumnAMgll99C+OR1H88DQTKFbAxb88P42N+uGZzh8q8
	 +iZg5ZcBed/O0kP3JXol9Lrkrp6zI9nKsZqU0Is5uG3IJ5jXbKeEXgH8qqZ/yYdBM+sGl
	 dWomvP4HMd/9t5F8HUZtjwnGHZY5HSKolK/dMZg7JZEz6tbBmCJ+hy11k4gGnUc+QAaPx
	 crfFSS08FEEUtn+40qspZneYBmK9bXP9Y3ijRl+uJMebD4v2RJ5X3vG6+37hFp17Glw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788802773;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=9G/gFhW58ylHZYkIgRBom7wKp18rWQFDf4tJnRxrv/0=;
	b=Kuo/CK6vp+f5mCJKwC09Z36IUVRlEyIW+1SDxA8WICfIuwur3VFAXmJnCYiDjwG76cMz
	 KcEUm/oUAEucMqlY+GW9DQtTPt+8VYZT2cpBUriFECWA2hgW558uJS1qsA30mxPRnMcV4
	 Me0d28a6GACRTiaI6lde6J8GOobn/DQB20p/gdM4vujDvrGCYp+KrQwwYpBPfNbUOCisc
	 2nuynvVSzPtzWGtXnnajmrxDIc3sIbcvUUPz8pHQ3X3BA07kPjkBwnJ5boT+aNTh4mruW
	 q+zxI/qbu6hSXT+0U7Dqd9TnYPQ7+yDLRloy1D0w6XyXL1D/+iAtrewzYffPeygyEoA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788802772;
	bh=9G/gFhW58ylHZYkIgRBom7wKp18rWQFDf4tJnRxrv/0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=b+yI8ahTzRIT4nc++mgb3/QdIuizfO1VN9xon2Q1M4/bPXJvqtXLUftEMpdz4GR//
	 n7snkpuKVYcrr6AoZ1+UhRL2cIX14/Kq5oUTT+dvOUP+d6rvb5kMzB3uVwD5Mf2EcP
	 L5nawz0Tm6tMWnSameVbbyX78qYW1SndL8uNRWogT0OyHkaB7H3j2IuTU2wO7bDE9D
	 d4MeLrOOWondeZ/4aU29TgsiYEwM+7Kd973OQH0J4cpXjKn88cfDp945YJ/fzE3ypi
	 NWF981VTbfTjj3mxJhVDAha8FWA5NvwlqFTXYVpyZ/gmYsxuGxmwivGdjxy5Fqkd2S
	 Tlm+REFQSe1VQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D85A1605C7;
	Mon,  7 Sep 2026 17:39:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8002CAEB
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 17:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7DBEA40106
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 17:39:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XlncrLnNTeWr for <buildroot@buildroot.org>;
 Mon,  7 Sep 2026 17:39:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 3377E4007E
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788802770;
 b=dx613dSHaOl6Aj64EcJNY5FXQWFhz8SdlED032xORKzow/zlUHLrZqOg+oJBY/m0coXz
 bU6EWFYleAn3WJPysenk4pp3M4sksYcfc2BRWkY3a5eQWo15WGo16YDRvc7VF+F6Z0xHp
 30gT2BL/dpkX5UTgQXMBXd6dnEKvi3k1yI0XGOrTXOzloHSQxyWwMcwC1u/xh5DCdFVW/
 Bi9q/XeE7/QQ3IRDD3P4/9O612M6QYtxyeTu8/cEy4aOu+tQCyZj0OjDa1yyGWbxOdDRN
 0ynOFVA4XvJ4pDgdfEznrWXZMZkrLkN2Yt/OlCz/jSDlZasywq+e1XQbMDWBVADqZrw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788802770;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=evt/Jh+Kv1b2v7rfUWPu84ySYieQ0lKx6k1Y49Ao7Ao=;
 b=Xj/INyUP8f0DWjK9mHXzBTSXWHpY5B4sSlVhXrF6JhI1yl2/GaPHP2tyXRlv0tVynygP
 Y0iTskk49L5fUf/9d68LfM6lCqvHFs3fPrLWPBdhre0tdk2H9cRGYzB3TX12FVoFtBfnG
 b5EWRwS5X3NuC1gKkMB0rC6LCoeP+wxZRaUHQXF4hLCk7ZzegiO41pwNVCTepqX0qnK80
 T4oaK3X3PNbMK73N0K2BLxJVk8fDE/IX+l23mKYgaDGTVyoDMj7XRkf6/xLsmd20A0juO
 7or6Ko9CnG7PRkFirYAVQ+PLHCRcRQQWvm/uCi2NkuPS8G8vHXLvhsvOxTAqn9e4ZXw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=n1ggPdrU; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=n1ggPdrU
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3377E4007E
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 17:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788802766;
 bh=evt/Jh+Kv1b2v7rfUWPu84ySYieQ0lKx6k1Y49Ao7Ao=;
 h=From:To:Subject:Date:From;
 b=n1ggPdrUiXFKLH3k3Rk34/xJsmi8Io5zY7cpRjDYzAORIBwdkgXXHcJauhg5puZAt
 dqqJ7Cs3n+p/P+tuYgDMVLwm8u8OSF9AMDX7ArgTQHxZdHy9N15Idw8WRtYNbtEm8B
 N1pN3nS98Pu/fJQ8SzaV6h+53tBw5Yms6C1nSWfyw50HbzRfuqoRzYmkFRO+Bel4Po
 CZlMPJBOC15FB5gzV9ORRI6svDn03zgCi2RP17g3nHZknN5NIUz/kRpjXiaCqk1XrJ
 K0Xv/XI0W+HuUVuejhweuKFg4iu/kMO04QT5x/WVja2h/240e1xVRcwLMWdUy+00VO
 eEzTzavAIwpgA==
Received: from fli4l.lan.fli4l (p54a1bccf.dip0.t-ipconnect.de [84.161.188.207])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3DFD8A4C303F
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 19:39:26 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42386)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x3dJW-000000003X0-0IAy
 for buildroot@buildroot.org; Mon, 07 Sep 2026 17:39:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  7 Sep 2026 19:39:25 +0200
Message-ID: <20260907173925.3802484-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.12.x, 6.18.x,
 7.2.x series
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
 - 6.12.108 -> 6.12.109
 - 6.18.49 -> 6.18.50
 - 7.2.3 -> 7.2.4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/{7.2.3 => 7.2.4}                       | 0
 linux/Config.in                              | 2 +-
 linux/before-6.17/linux.hash                 | 2 +-
 linux/from-6.17/linux.hash                   | 4 ++--
 package/linux-headers/{6.12.108 => 6.12.109} | 0
 package/linux-headers/{6.18.49 => 6.18.50}   | 0
 package/linux-headers/{7.2.3 => 7.2.4}       | 0
 package/linux-headers/Config.in.host         | 6 +++---
 8 files changed, 7 insertions(+), 7 deletions(-)
 rename linux/{7.2.3 => 7.2.4} (100%)
 rename package/linux-headers/{6.12.108 => 6.12.109} (100%)
 rename package/linux-headers/{6.18.49 => 6.18.50} (100%)
 rename package/linux-headers/{7.2.3 => 7.2.4} (100%)

diff --git a/linux/7.2.3 b/linux/7.2.4
similarity index 100%
rename from linux/7.2.3
rename to linux/7.2.4
diff --git a/linux/Config.in b/linux/Config.in
index 21a8819e5e..e22a6ee9ce 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.2.3" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.2.4" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index bc2b34b856..a2e1a81725 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  e1d1ea200d22d55c9f5d5fae59e69bb3b494515705fc3390cd54231ee4f4baaf  linux-6.12.108.tar.xz
+sha256  5484e552a334e15019f4aeba89e5b58f04651cf2f4e24e04de9f152f1c38e3fa  linux-6.12.109.tar.xz
 sha256  aee2264a4eaf4a14344b47a0469bd42e8b4885b24f110b724262b3da956f411d  linux-6.6.156.tar.xz
 sha256  1b6e798aeaa708ca670a426ad5a6c86dc2237b8e59e8822876976c383873642b  linux-6.1.187.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index f362bced0d..a5559ae547 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  8ba259e8e7b13ec6ef0941c8a39ad90b24bd4a4d6c0010ba6bafb794550ecd03  linux-7.2.3.tar.xz
+sha256  01710ee01737dac492f1bae52becd057e08d20d11589089aa06accff415c28dd  linux-7.2.4.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  ae826f33111fea6f1d279dde7299d7463c8dfd204aeb75a8fb5432bc60a28191  linux-6.18.49.tar.xz
+sha256  d2fc041dab4e11d9645e3ba53be058faa52b8ce28a8a97c889bb2cacee170461  linux-6.18.50.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/6.12.108 b/package/linux-headers/6.12.109
similarity index 100%
rename from package/linux-headers/6.12.108
rename to package/linux-headers/6.12.109
diff --git a/package/linux-headers/6.18.49 b/package/linux-headers/6.18.50
similarity index 100%
rename from package/linux-headers/6.18.49
rename to package/linux-headers/6.18.50
diff --git a/package/linux-headers/7.2.3 b/package/linux-headers/7.2.4
similarity index 100%
rename from package/linux-headers/7.2.3
rename to package/linux-headers/7.2.4
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 2ba298090f..b865602cdd 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -480,9 +480,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.15.220"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.187"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.156"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.108"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.49"	if BR2_KERNEL_HEADERS_6_18
-	default "7.2.3"		if BR2_KERNEL_HEADERS_7_2
+	default "6.12.109"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.50"	if BR2_KERNEL_HEADERS_6_18
+	default "7.2.4"		if BR2_KERNEL_HEADERS_7_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
