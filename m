Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653FB606A326
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 01:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=sUx/ODH4
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BBB7608BB;
	Sat,  7 Nov 2026 01:12:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X5QFEngCVr5L; Sat,  7 Nov 2026 01:12:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0972860890
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794013968;
	b=Q8dU+HldLogkPPfjLnoLvGKHmCGbHhMK6yv1DnYxBSpYja3x/NaDpD0Y6eXVDR9UMgtZ
	 QLnPryEFrEo85+d4hiZaaQlL3ktg1hf7ssyudf9iRcXcvdq97ishwAuODI0L9zEAkiiK+
	 o6f7ZUEMo/lh6L4kx8Q7WEdUTnkOVpF3l8eJV7d4G5eyOPQumXnA4+z226vqtzlQSzdTV
	 xtGXxZJVySbNAL66BMTcANHifiDC/a6xUk250mX+3hpa1Zxk5N5DYkOpwwREsILL7tAw9
	 IE6opDhWCj4lGcc+6UF1pYlJHrY+R8KQduyV3mDUlpgQFu97r89MDRHdbnZ8KCR0p3Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794013968;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=KRVsapow4UMv1496ieH60tbhdGjj20lbc8emDwMTdoA=;
	b=Kpr7t4k5QhdX2eHQWcJzWN94vpdT8VPmxR5vV9nI7ktMLE1qnARaZPkSOoB/wZVqAsBE
	 XV9I8wocMfImN7Zsetq/iHB66+DsBd1ydMwG3cNQ4x1278jfRnyVl9kDkL/vj1HuMXDD3
	 L8ANQsscpWpH9LPXtOpC0esEfa263Jnm9D6ENEucAOo1pT2sldZH0VWqQ+TAOs5+i8JeW
	 zMtVa4QeuD8v7UUvTbnTeKrjTHvX5ZyYknXOGuI919/g53flV2WxxQEfmr3LutGqfNliR
	 FoeZ6b3YGr8ElHMrvVmDYcQlDAWmHMwDskkzvNnxtwbM1yEMnjIJr7qmOLlcS8JpADw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794013968;
	bh=KRVsapow4UMv1496ieH60tbhdGjj20lbc8emDwMTdoA=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=sUx/ODH4GScC44Sg7CCaW/oitig6JStbo36qJlAWk7g+rUVPu7HwSiQm+mfx4mEOY
	 P+u6sKTFXd8dpUK2P9LEVoDecuy2NYpGSD3cEhFnE5XfjHCVl30E6AoKeRb0LWdK5i
	 U6O0pZO1ITwhxLQd8le4vtm2Tm/IQgpu7O1YtdXNXWD6M2qkyg8xMIYM/BZr3lMuWI
	 sTvVRCjUys9AoWgHEuz9ZjLSW4/Eoh7AVur65lyH1aYNUn3wV4mYbR539lTHJv/YFn
	 ewcZKJqGrSHg3OXNCugWvcSyTAHFzf04b/UyHMVCicnzG239xNyNu8MTwj4Y7bBsWO
	 IKPW8vZBASF8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0972860890;
	Sat,  7 Nov 2026 01:12:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B580534D
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 01:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9AA1481238
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 01:12:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id golwlMw86jYC for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 01:12:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F3BAF8116C
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F3BAF8116C
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 01:12:42 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Ml6m4-1weIjy2ItY-00nSTv; Sat, 07
 Nov 2026 02:12:38 +0100
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>
Date: Sat,  7 Nov 2026 02:12:21 +0100
Message-ID: <20261107011221.2064497-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:YtbNNnsQKukuBbAVzwJNEAVe1FAmq2lxlklVg65mGemtRvW1LcF
 Y6lYIp2HwXKyPi4xqih2V7USj2vNqDz17dnjHKbwuMG58jhsB4BJHC0gfcbQWbL5Sqp45Ev
 c4dbc3PNYmora2hIR+ke15bxp9hvKuoqy7zBimIjd3zOckqDIYYgJ8ky71HhhY4aQ+gqDvz
 niz1sf0S4mkzs75H9TrOA==
UI-OutboundReport: notjunk:1;M01:P0:LmYmOna+BPU=;l4WkwRZk8U9A0osZeTurOSTvL7F
 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
 nBYh17rTSo/iuGlo3InK2W4Pg/UPPc+cV
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 7.3.x,
 6.18.x 6.12.x, 6.6.x, 6.1.x, 5.15.x, 5.10.x, series
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Update the latest kernel releases to:
 - 7.3.1 -> 7.3.3
 - 6.18.60 -> 6.18.62
 - 6.12.115 -> 6.12.116
 - 6.6.161 -> 6.6.162
 - 6.1.191 -> 6.1.192
 - 5.15.224 -> 5.15.225
 - 5.10.273 -> 5.10.274

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 linux/{5.10.273 => 5.10.274}                 |  0
 linux/{5.15.224 => 5.15.225}                 |  0
 linux/{6.1.191 => 6.1.192}                   |  0
 linux/{6.12.115 => 6.12.116}                 |  0
 linux/{6.18.60 => 6.18.62}                   |  0
 linux/{6.6.161 => 6.6.162}                   |  0
 linux/{7.3.1 => 7.3.3}                       |  0
 linux/Config.in                              | 14 +++++++-------
 linux/before-6.17/linux.hash                 | 10 +++++-----
 linux/from-6.17/linux.hash                   |  4 ++--
 package/linux-headers/{5.10.273 => 5.10.274} |  0
 package/linux-headers/{5.15.224 => 5.15.225} |  0
 package/linux-headers/{6.1.191 => 6.1.192}   |  0
 package/linux-headers/{6.12.115 => 6.12.116} |  0
 package/linux-headers/{6.18.60 => 6.18.62}   |  0
 package/linux-headers/{6.6.161 => 6.6.162}   |  0
 package/linux-headers/{7.3.1 => 7.3.3}       |  0
 package/linux-headers/Config.in.host         | 14 +++++++-------
 18 files changed, 21 insertions(+), 21 deletions(-)
 rename linux/{5.10.273 => 5.10.274} (100%)
 rename linux/{5.15.224 => 5.15.225} (100%)
 rename linux/{6.1.191 => 6.1.192} (100%)
 rename linux/{6.12.115 => 6.12.116} (100%)
 rename linux/{6.18.60 => 6.18.62} (100%)
 rename linux/{6.6.161 => 6.6.162} (100%)
 rename linux/{7.3.1 => 7.3.3} (100%)
 rename package/linux-headers/{5.10.273 => 5.10.274} (100%)
 rename package/linux-headers/{5.15.224 => 5.15.225} (100%)
 rename package/linux-headers/{6.1.191 => 6.1.192} (100%)
 rename package/linux-headers/{6.12.115 => 6.12.116} (100%)
 rename package/linux-headers/{6.18.60 => 6.18.62} (100%)
 rename package/linux-headers/{6.6.161 => 6.6.162} (100%)
 rename package/linux-headers/{7.3.1 => 7.3.3} (100%)

diff --git a/linux/5.10.273 b/linux/5.10.274
similarity index 100%
rename from linux/5.10.273
rename to linux/5.10.274
diff --git a/linux/5.15.224 b/linux/5.15.225
similarity index 100%
rename from linux/5.15.224
rename to linux/5.15.225
diff --git a/linux/6.1.191 b/linux/6.1.192
similarity index 100%
rename from linux/6.1.191
rename to linux/6.1.192
diff --git a/linux/6.12.115 b/linux/6.12.116
similarity index 100%
rename from linux/6.12.115
rename to linux/6.12.116
diff --git a/linux/6.18.60 b/linux/6.18.62
similarity index 100%
rename from linux/6.18.60
rename to linux/6.18.62
diff --git a/linux/6.6.161 b/linux/6.6.162
similarity index 100%
rename from linux/6.6.161
rename to linux/6.6.162
diff --git a/linux/7.3.1 b/linux/7.3.3
similarity index 100%
rename from linux/7.3.1
rename to linux/7.3.3
diff --git a/linux/Config.in b/linux/Config.in
index 4991eb7cba..fd4482293a 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -169,13 +169,13 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.3.1" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "6.18.60" if BR2_LINUX_KERNEL_LATEST_6_18
-	default "6.12.115" if BR2_LINUX_KERNEL_LATEST_6_12
-	default "6.6.161" if BR2_LINUX_KERNEL_LATEST_6_6
-	default "6.1.191" if BR2_LINUX_KERNEL_LATEST_6_1
-	default "5.15.224" if BR2_LINUX_KERNEL_LATEST_5_15
-	default "5.10.273" if BR2_LINUX_KERNEL_LATEST_5_10
+	default "7.3.3" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.18.62" if BR2_LINUX_KERNEL_LATEST_6_18
+	default "6.12.116" if BR2_LINUX_KERNEL_LATEST_6_12
+	default "6.6.162" if BR2_LINUX_KERNEL_LATEST_6_6
+	default "6.1.192" if BR2_LINUX_KERNEL_LATEST_6_1
+	default "5.15.225" if BR2_LINUX_KERNEL_LATEST_5_15
+	default "5.10.274" if BR2_LINUX_KERNEL_LATEST_5_10
 	default "6.12.114-cip34" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index 1dfc00d6df..5aa95c539f 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  0ec90fe4b20422b1b664b77e6d2dde22b40bd41e7eb2cad8ac8739a4749cb1bb  linux-6.12.115.tar.xz
-sha256  7d34405be5cd4989b2a5e9cbefa798e3a175218901271e034af3fe4e840b71c6  linux-6.6.161.tar.xz
-sha256  02f15b77d213e15607923832ef9382e2414ea90df6c007f15a910e139645c35d  linux-6.1.191.tar.xz
+sha256  cb3ed3dfdd47e6ade49dc933db334fd86e24cadee920da612c262b0e9b6a511b  linux-6.12.116.tar.xz
+sha256  4aa89f3652fc131e5d39990f3bcd4b9e131028af3f315dbe83f3a8557dc06f06  linux-6.6.162.tar.xz
+sha256  1e88e317e20dbc79a2cb9e3d9667e908b262d12e76eb66eed894c5460eb87fca  linux-6.1.192.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  2757f8ad099cf77499ebab0896b5d31a467b74d5bb18c32b62da059d33b30711  linux-5.15.224.tar.xz
-sha256  02ec2bcda2f6227fa69fd7a4e8cc04e6e948c9120932880663c6215b4632979d  linux-5.10.273.tar.xz
+sha256  b36b9fd6fa854787687c4c980aee4747577f563a8d4f45b7da2fdbd914c8224f  linux-5.15.225.tar.xz
+sha256  9f87a8b523560ca7740ea4a149c6dc0dab7814c2a41bccdb739b291a7e120b8c  linux-5.10.274.tar.xz
 # Locally computed
 sha256  c4c21ee6722dd5d6a199099e5e68e2f0ef002c34e6e23ac0aa7ce92ba7710a8d  linux-cip-6.12.114-cip34.tar.gz
 
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 4350130ceb..f262a4dfe5 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  fa595aad93734f829c963c2a90ef7c3673224fd7fdae7b49406e397cde2de231  linux-7.3.1.tar.xz
+sha256  79c66dde66cd96877fcde8f7d36aec946b1f423d2b97b5a7b1751b75c764f3d1  linux-7.3.3.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  3c2f44ef6acc021a7ad444d9a2e6ec1ef488ff09368793d0004a6080f69d621e  linux-6.18.60.tar.xz
+sha256  490a7aedf1b355c565d3a6c05333ccccb5da82064eca46b590448a7099d7d651  linux-6.18.62.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/5.10.273 b/package/linux-headers/5.10.274
similarity index 100%
rename from package/linux-headers/5.10.273
rename to package/linux-headers/5.10.274
diff --git a/package/linux-headers/5.15.224 b/package/linux-headers/5.15.225
similarity index 100%
rename from package/linux-headers/5.15.224
rename to package/linux-headers/5.15.225
diff --git a/package/linux-headers/6.1.191 b/package/linux-headers/6.1.192
similarity index 100%
rename from package/linux-headers/6.1.191
rename to package/linux-headers/6.1.192
diff --git a/package/linux-headers/6.12.115 b/package/linux-headers/6.12.116
similarity index 100%
rename from package/linux-headers/6.12.115
rename to package/linux-headers/6.12.116
diff --git a/package/linux-headers/6.18.60 b/package/linux-headers/6.18.62
similarity index 100%
rename from package/linux-headers/6.18.60
rename to package/linux-headers/6.18.62
diff --git a/package/linux-headers/6.6.161 b/package/linux-headers/6.6.162
similarity index 100%
rename from package/linux-headers/6.6.161
rename to package/linux-headers/6.6.162
diff --git a/package/linux-headers/7.3.1 b/package/linux-headers/7.3.3
similarity index 100%
rename from package/linux-headers/7.3.1
rename to package/linux-headers/7.3.3
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 71e2265f4e..202561c85d 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -478,13 +478,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.273"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.224"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.191"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.161"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.115"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.60"	if BR2_KERNEL_HEADERS_6_18
-	default "7.3.1"		if BR2_KERNEL_HEADERS_7_3
+	default "5.10.274"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.225"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.192"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.162"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.116"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.62"	if BR2_KERNEL_HEADERS_6_18
+	default "7.3.3"		if BR2_KERNEL_HEADERS_7_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
