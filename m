Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F140C606A32D
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 11:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=p711aVeg
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C750380E37;
	Sat,  7 Nov 2026 11:03:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XzHjTROL4bsP; Sat,  7 Nov 2026 11:03:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9CA7E80F5E
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794049391;
	b=EeHedlNEegTU6JQA9LeiYQWZtGvv/I+yrEFQkbeRJZazGqGZ1i1GGZim7+rpFPXkl8YF
	 6stKRmBG5kqh4JkDzYmcusdtP144Jdimf5lhm3kH/t/HRhg5C49DT4T9j0WjGO+zfLISx
	 3i/wzUhI9DDIoLyfINfNXLhOj9okBl1w7MWrf738quH0/oWuGhOKR+KITima84YcuqtgO
	 QjRHoEyuDX0fn2M6juRNNpPAb+x/Nhr7uxEniPIQOcosGl/tBLz6S3WRFs7UuvQWW0g7V
	 2h9vwH0rD1I97UM2VWhqwmQUxuK4XM0kA3sU0/FkvmJfb8cVRXpWvu1vu+mxw2qanmQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794049391;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=LpZvn8zHXD4PFXZIy6lyGSFEnPpfn3CWOxhSlxoU/pI=;
	b=EYXGyST5crx8EWRIi4e0eVWYpK9ZmReFgHE1STsPN12IU3fsWVOh+Tfw1qGqYQsPUwlr
	 Goy2iwlQaoe8h+FV3BiwPUcCFaD6NR9R4VS/3iZzWq0/bKZR6DCSqb0giXidL0zIHrHCP
	 SEUP/gMEUprLLOrQGDp5Y605frHeNd2x/Mnq5pOz/vOEo975PQY1b15rwGXmVEjxVRNTS
	 JDkeHcQHUhadHhtq/3l39O1ZAYaVs5clGSBZa2Htvep5OCCxXTN77V+SjKvLbZS+tBAFV
	 Pd7YJ4J5B/FIwXNxAqJBfzNWchFTZBrSm96adoTk2IuahGprrysGcpLJmcL8Df9iv7g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794049391;
	bh=LpZvn8zHXD4PFXZIy6lyGSFEnPpfn3CWOxhSlxoU/pI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=p711aVegzQcvb/S8Kw38CTTG57WIWI+AGKDC9mUHXtdRaoqXHUnOfQncwC/SxZIbu
	 6e0dX3Gxsw6kHISPhbCRJm00+EpL3imQOfIIyRnIu+Dt0bseNFbS+O7OIIVrWDEvZQ
	 Js9vAuV8ecDYCVAKujCdsLd94X6/Q4Ip0ty6fC4BARj3mzMByFzRKDTidzFGGz/T74
	 TRdflDuWmZ1e5vxI6aD/GvBZwccQc9L/bpnF9mLqQkQfTgpej4sCOI3bPwrOW+k1/3
	 FGtWn2J9eTFEZxfeN4TentV8FwQVpeG0YtVqJ3Cvh8SIpBEyUsFmhYM+bZi8PBhSqq
	 ST9hDQKTD6sag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CA7E80F5E;
	Sat,  7 Nov 2026 11:03:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E2DC2FE
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 11:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53EA64009B
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 11:03:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zAkNEzUvjrzF for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 11:03:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 783FD4008C
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 783FD4008C
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 11:03:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3FBE08B6AF; Sat,  7 Nov 2026 11:01:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Nov 2026 11:53:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d87bb13720370ec06b9686d48f07218b6dd6ca5f
X-Git-Newrev: 7f67f27cce2c1fca2fa61669d2502e72dcb51156
X-Patchwork-Hint: ignore
Message-Id: <20261107110136.3FBE08B6AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 7.3.x,
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7f67f27cce2c1fca2fa61669d2502e72dcb51156
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update the latest kernel releases to:
 - 7.3.1 -> 7.3.3
 - 6.18.60 -> 6.18.62
 - 6.12.115 -> 6.12.116
 - 6.6.161 -> 6.6.162
 - 6.1.191 -> 6.1.192
 - 5.15.224 -> 5.15.225
 - 5.10.273 -> 5.10.274

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
