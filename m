Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE895C61D9D
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 09:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33957400C5;
	Sat, 25 Nov 2023 09:06:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33957400C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GY3vl7DSj2hC; Sat, 25 Nov 2023 09:06:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F1C54016B;
	Sat, 25 Nov 2023 09:06:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F1C54016B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8095D1BF2CE
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 09:06:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58EBA82164
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 09:06:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58EBA82164
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KAmAB9VDXrXu for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 09:06:32 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F031F8215E
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 09:06:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F031F8215E
Received: from fli4l.lan.fli4l (p4fd6c4a5.dip0.t-ipconnect.de [79.214.196.165])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C28CFA4C0921
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 10:06:27 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52490)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1r6ocM-0001pw-2e
 for buildroot@buildroot.org; Sat, 25 Nov 2023 10:06:26 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 25 Nov 2023 10:06:26 +0100
Message-Id: <20231125090626.20610-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1700903187;
 bh=PY7KTnG4GW6nsvFjoMnw0ViemuJPT5d4QAZX4gFBP6Y=;
 h=From:To:Subject:Date:From;
 b=T2TvoG+r5wNLCyxyN8ZvkHJhT6ua75NwpTuRhrj05PbtSq1dwg7ujGjIR/gHqq/Qp
 Mb8TXFgRXhrfeoijLAxQLB140hHoei2Qhx00vHPlfXxBiZHxoWNp4OePb4m82Y5YAE
 sivbDTjlK95e8MkD8gv1EnQi+EkggsOClAQ8RDzl+SidfMKYhL1YXo4NPLq+51Xv09
 kUK5nLp7VCVTa7i97TGnarKRBANISQAFzs7xS9Zg+1hc6irhrPF/J7xX5HhJWxE091
 Z0dKSaGtBqXgJFQabuIvWo7vljVb/J1gptZWrX6UVNwxf5yZQ6Ogo5gAShasAWr4ig
 esIiyJ1ZArg9Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=T2TvoG+r
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 4.{14,
 19}.x / 5.{4, 10, 15}.x / 6.{1, 5, 6}.x series
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 16 ++++++++--------
 package/linux-headers/Config.in.host | 16 ++++++++--------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index d6e563212b..a2628b95c2 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.6.1" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.6.2" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index aa94a4ca91..c221b25b34 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,14 +1,14 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  da1ed7d47c97ed72c9354091628740aa3c40a3c9cd7382871f3cedbd60588234  linux-6.6.1.tar.xz
-sha256  2ee24af9282b80923b2da56b70aad7df2e8ee4e3f076452e05ba66be2059b519  linux-6.5.11.tar.xz
-sha256  b9fd616facd6becfceef88b9be718d0f16625cab3fe81d11384802a7091e85ec  linux-6.1.62.tar.xz
+sha256  73d4f6ad8dd6ac2a41ed52c2928898b7c3f2519ed5dbdb11920209a36999b77e  linux-6.6.2.tar.xz
+sha256  4a69c1d32c974e125ad723145d31683a3b078667ad56d17f7852dcaffb9f359f  linux-6.5.12.tar.xz
+sha256  c29d043b01dd4fcc61a24fd027c5c7912b15b1f10d8e3c83a0cb935885f0758d  linux-6.1.63.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  af84e54164e1c01f59764ba528448ed36b377d22aafbd81b4b0cf47792ef4aaa  linux-5.15.138.tar.xz
-sha256  9d2d961fbf87486e48b0087326ee35cb0af4dec03c770737b098652457205104  linux-5.10.200.tar.xz
-sha256  9830820714c8f5985c50071cc9e1b40533ee81a4f6c704916c7148d16e54ebfe  linux-5.4.260.tar.xz
+sha256  9c68c10dfe18e59b892e940436dea6a18d167160d55e62563cf7282244d8044e  linux-5.15.139.tar.xz
+sha256  6afc06598fa8e3bc907cff75f995f372df51d40a284e260de78a3421b1f18218  linux-5.10.201.tar.xz
+sha256  31bac78086f0aa0b3b30d521a21a6ecb2374bdf036f69c3fa42e7eb6c5b64fc3  linux-5.4.261.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  9da816bce896024c96b6c846be8f3e6315dd6ae82925698f534153d6a0c10f56  linux-4.19.298.tar.xz
-sha256  de36689d713ed17f8bc1286fe4b9afcdb9a3de3b6f1d6aff52569f055c276bb7  linux-4.14.329.tar.xz
+sha256  c6fb7521e1b4124d5c7637768f1b13d9a57f887d6e50aa80d34e62296e18e48a  linux-4.19.299.tar.xz
+sha256  670ecc452c4a55d52b0dc1f3e11460e88f0ac5e7b3df0672fc46db5c9dff8f67  linux-4.14.330.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 81bd9f9380..057a829140 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -412,14 +412,14 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.14.329"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.298"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.260"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.200"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.138"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.62"	if BR2_KERNEL_HEADERS_6_1
-	default "6.5.11"	if BR2_KERNEL_HEADERS_6_5
-	default "6.6.1"		if BR2_KERNEL_HEADERS_6_6
+	default "4.14.330"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.299"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.261"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.201"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.139"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.63"	if BR2_KERNEL_HEADERS_6_1
+	default "6.5.12"	if BR2_KERNEL_HEADERS_6_5
+	default "6.6.2"		if BR2_KERNEL_HEADERS_6_6
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
