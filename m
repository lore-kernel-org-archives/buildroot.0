Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DDB606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 18:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PbWPqUKT
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4803480E8C;
	Fri, 30 Oct 2026 18:38:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IAQTXyDFjmum; Fri, 30 Oct 2026 18:38:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 254D881189
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793385509;
	b=bOOzjhzWhdqIHhIFBg+IL2e5GVz7U3M5kxONnzHoSQHTlHX5DYLP1tjBwNREPvAYETNa
	 /Oa5uYQEE/Rmlr2DEHb8K9jrCqFnU77qHvUZu343qjljjaVzW04nwmMUrvfCVpyiKFJ9o
	 NmOnV7PP5lS11ylnuNl374a/fNmRCsgtkPtXWIfLboOdb46Equ3A4IwTNBvbzgRjJ3I1P
	 /AptXYHA7hmIKYBmk68KG6Gxmao1s68/7Z2DUYfpOs2KBaUtaUAqCrPVQ2TRZDJyyHuri
	 yVxl5nPQYdBEv1ze8hz+e8CKXTsl/LpCwSBpx77k5+LcH807PVN1p+abjHzV3UT9pqQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793385509;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=jCJzpckapQ1zjqUVFNZ4Z9GsqcrdyaUgvLO4W+HrmdY=;
	b=f5SPY2Ek2QlQcrH8NioUYM7GZfehQGZIc9kysnmX85bMa5QLfwzli2+fjd7RUiMOc2wK
	 NZgXQLRlfCZoNf9dSj1OJgndX99b9lklgl7TGTNX8mZch+Dv6/jFlW7zVJ9baeO9s4aS2
	 D8K5lD3CQdblacFNbUV4FCzg18ke9DwRi5kAsecXS6rM7SaPBO5MAQbR1zVZmEPqyqdXZ
	 lRaVb4DnbL2VxnL51zSDHPRfRTJPFujD32qidHdLZu5z4AMhQxCxmYYCpoMKJnkMAhkX7
	 EUnhB6XfJH5luLRk+oNKMZz2Ai0AHfcWGGoR2IrNKJlvYxTg+v3FjsBs99ps6wdzkBg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793385509;
	bh=jCJzpckapQ1zjqUVFNZ4Z9GsqcrdyaUgvLO4W+HrmdY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PbWPqUKTf5H4Y7HJsOkVoAc2lV1fjcdZI0Jp0rZlEPqWy66RSGMuvkbLWKMC4mAIM
	 CbKYEP2I6QM5Giud4pPNvgIn6ef28szDqW3GubI/2xR/ihIR2GbeBlgli/LCAvbZMp
	 bLrFhICJCrkQLkG4OvfGGwuEn6kZBNhSqEmqD547blhvEhiCjJXZ1eON/Kqlw4h50F
	 5HVTy7dezaskOSLDMeqcYSmnDFcvzPCJpDH1pQFRCR4zXtUdca7+rBQ6PLypvreu1I
	 ecLZJJr5RpISj0gngTVW8Dp1a8C9YxAQLJdfu7g3z014nDJAQcQf8Ys2X9hGmP+tws
	 YimVQb3LWnXVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 254D881189;
	Fri, 30 Oct 2026 18:38:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D0D62AC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 18:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48FDA400B3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 18:38:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HlqGqwc8Ky55 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 18:38:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 42C1440083
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793385507;
 b=dm4WMd7l0yMgtL6ncXrdf4xaPrUe6orec+x5iyChsgSisg+T84mEq3j+8flU/tM9TqV5
 jArFW5LYVVhAnFP9Vor28NvyRC25wFOu362F2bry1JkUd/fMn3w1z0HljOXPTns2+5vpe
 UjLY4y+4dow8U4eM+ciGC1CCvNdS2vLUSE0IqrJU5UXQE7T01nWeDTAUdKJMEnjuC9i2Q
 xQkBXqTQwTOb94Ls3d00LzwgM99hSYVUi8RgEqS7t90aKdoRKPeECsd9yhlYtMyReCUx/
 CNMO5jQrEqLO0N2cma18xgtlsTFIyaarN/y/tnOK7p2/6wbO1zh1NCWROQAi7Q/wJWQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793385507;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=3XErHS5rIndVL50V8DDW9Gh6KXlTGCcKC9ZO8QXmvX4=;
 b=QdGgxYAwkJHCcVvEBx/BDCYa6gtpmXXdqjpU6KRmMALtLufZ/xtRD2hm2lXREBdeY03N
 1a5axLgniwLBhYsNCJvTsBy2h/ZV7nK/nmokMYjIxs8kxK5DMDATe7X1kyKkXego6klZ3
 +OSmD+y5FnRwcpjevSK8tycDS8KzzxLaUbxRORNN794ZiP3LzXw2ZiumhLLulqhExVh73
 vdo/cFtt6qlss5hTldaWm2os609IMArYl9PU2aQf1EJFRn4xseyKftsF2u4xl7HaFkngZ
 hFdvM8d8xcU1WolJAhUUoJ8JUxeDjbNoqjbNATL1mawsKoSVoWfJjrHoUGF7mpyR0bg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42C1440083
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 18:38:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D8D289D3AF; Fri, 30 Oct 2026 18:36:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 30 Oct 2026 19:34:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 93156d584867848edb1ff6d93083517b8cfe6d8b
X-Git-Newrev: 3571ec6fb095c68bdeb867ffeb39bc2cee0a2fec
X-Patchwork-Hint: ignore
Message-Id: <20261030183658.D8D289D3AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 7.3.x, 7.2.x,
 6.18.x, 6.12.x, 6.6.x, 6.1.x, 5.15.x, 5.10.x series
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
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3571ec6fb095c68bdeb867ffeb39bc2cee0a2fec
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update the latest kernel releases to:
 - 7.3 -> 7.3.1
 - 7.2.13 -> 7.2.14
 - 6.18.59 -> 6.18.60
 - 6.12.114 -> 6.12.115
 - 6.6.160 -> 6.6.161
 - 6.1.190 -> 6.1.191
 - 5.15.223 -> 5.15.224
 - 5.10.272 -> 5.10.273

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 linux/{5.10.272 => 5.10.273}                 |  0
 linux/{5.15.223 => 5.15.224}                 |  0
 linux/{6.1.190 => 6.1.191}                   |  0
 linux/{6.12.114 => 6.12.115}                 |  0
 linux/{6.18.59 => 6.18.60}                   |  0
 linux/{6.6.160 => 6.6.161}                   |  0
 linux/{7.2.13 => 7.2.14}                     |  0
 linux/{7.3 => 7.3.1}                         |  0
 linux/Config.in                              | 14 +++++++-------
 linux/before-6.17/linux.hash                 | 10 +++++-----
 linux/from-6.17/linux.hash                   |  6 +++---
 package/linux-headers/{5.10.272 => 5.10.273} |  0
 package/linux-headers/{5.15.223 => 5.15.224} |  0
 package/linux-headers/{6.1.190 => 6.1.191}   |  0
 package/linux-headers/{6.12.114 => 6.12.115} |  0
 package/linux-headers/{6.18.59 => 6.18.60}   |  0
 package/linux-headers/{6.6.160 => 6.6.161}   |  0
 package/linux-headers/{7.2.13 => 7.2.14}     |  0
 package/linux-headers/{7.3 => 7.3.1}         |  0
 package/linux-headers/Config.in.host         | 16 ++++++++--------
 20 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/linux/5.10.272 b/linux/5.10.273
similarity index 100%
rename from linux/5.10.272
rename to linux/5.10.273
diff --git a/linux/5.15.223 b/linux/5.15.224
similarity index 100%
rename from linux/5.15.223
rename to linux/5.15.224
diff --git a/linux/6.1.190 b/linux/6.1.191
similarity index 100%
rename from linux/6.1.190
rename to linux/6.1.191
diff --git a/linux/6.12.114 b/linux/6.12.115
similarity index 100%
rename from linux/6.12.114
rename to linux/6.12.115
diff --git a/linux/6.18.59 b/linux/6.18.60
similarity index 100%
rename from linux/6.18.59
rename to linux/6.18.60
diff --git a/linux/6.6.160 b/linux/6.6.161
similarity index 100%
rename from linux/6.6.160
rename to linux/6.6.161
diff --git a/linux/7.2.13 b/linux/7.2.14
similarity index 100%
rename from linux/7.2.13
rename to linux/7.2.14
diff --git a/linux/7.3 b/linux/7.3.1
similarity index 100%
rename from linux/7.3
rename to linux/7.3.1
diff --git a/linux/Config.in b/linux/Config.in
index 9d17fba318..ebd4287e48 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -182,13 +182,13 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.3" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "6.18.59" if BR2_LINUX_KERNEL_LATEST_6_18
-	default "6.12.114" if BR2_LINUX_KERNEL_LATEST_6_12
-	default "6.6.160" if BR2_LINUX_KERNEL_LATEST_6_6
-	default "6.1.190" if BR2_LINUX_KERNEL_LATEST_6_1
-	default "5.15.223" if BR2_LINUX_KERNEL_LATEST_5_15
-	default "5.10.272" if BR2_LINUX_KERNEL_LATEST_5_10
+	default "7.3.1" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.18.60" if BR2_LINUX_KERNEL_LATEST_6_18
+	default "6.12.115" if BR2_LINUX_KERNEL_LATEST_6_12
+	default "6.6.161" if BR2_LINUX_KERNEL_LATEST_6_6
+	default "6.1.191" if BR2_LINUX_KERNEL_LATEST_6_1
+	default "5.15.224" if BR2_LINUX_KERNEL_LATEST_5_15
+	default "5.10.273" if BR2_LINUX_KERNEL_LATEST_5_10
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index 8be46f25a9..eb8307fe8f 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  7a8589912bd7a8adb07fed074283652cf482a35facef8954554654f0154b4af3  linux-6.12.114.tar.xz
-sha256  b24c40a9e2188695803358567edda51c4080176424a57dbefca45e5ac44ec225  linux-6.6.160.tar.xz
-sha256  8aa50daca0412a3d0a61a87af3744f39773d40b3132635fb7bc9be652cdb7b0c  linux-6.1.190.tar.xz
+sha256  0ec90fe4b20422b1b664b77e6d2dde22b40bd41e7eb2cad8ac8739a4749cb1bb  linux-6.12.115.tar.xz
+sha256  7d34405be5cd4989b2a5e9cbefa798e3a175218901271e034af3fe4e840b71c6  linux-6.6.161.tar.xz
+sha256  02f15b77d213e15607923832ef9382e2414ea90df6c007f15a910e139645c35d  linux-6.1.191.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  c1faba89652ec4af585fb96131fdb70d99e891c2b368cbf6d9c1e5fb7f156c23  linux-5.15.223.tar.xz
-sha256  e7e6e7db0fc009fa223ed10bb37be059042c463593f35f50b5c5cc4a70351614  linux-5.10.272.tar.xz
+sha256  2757f8ad099cf77499ebab0896b5d31a467b74d5bb18c32b62da059d33b30711  linux-5.15.224.tar.xz
+sha256  02ec2bcda2f6227fa69fd7a4e8cc04e6e948c9120932880663c6215b4632979d  linux-5.10.273.tar.xz
 # Locally computed
 sha256  bd5db7fe3b0475cce4fc72db7a7f7df1c22b970aabe5ebff6ddd48098973bdf2  linux-cip-5.10.254-cip72.tar.gz
 sha256  97d7d5139900c10ff7435779be4857dda531e7cf6abba52c12a5f39aae195411  linux-cip-5.10.254-cip72-rt32.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 2f6ad625d7..b39e09f55c 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,9 +1,9 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  87363c24f10e06321eb362765521094e94471f6bff8bce2d6b3e40f39f004953  linux-7.3.tar.xz
-sha256  08e7b0c4f2dd1971f972da274b5e589a98989390ac56acd7a1a5af922363ea6c  linux-7.2.13.tar.xz
+sha256  fa595aad93734f829c963c2a90ef7c3673224fd7fdae7b49406e397cde2de231  linux-7.3.1.tar.xz
+sha256  bb1b871ef95a8de10b3f7b7baf0e0d754abbf620f804b6caf860f226aa97647d  linux-7.2.14.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  53a55ac9863a5547e292b8e381d4e4c2240dd1127d5428a7c44dbc550be23963  linux-6.18.59.tar.xz
+sha256  3c2f44ef6acc021a7ad444d9a2e6ec1ef488ff09368793d0004a6080f69d621e  linux-6.18.60.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/5.10.272 b/package/linux-headers/5.10.273
similarity index 100%
rename from package/linux-headers/5.10.272
rename to package/linux-headers/5.10.273
diff --git a/package/linux-headers/5.15.223 b/package/linux-headers/5.15.224
similarity index 100%
rename from package/linux-headers/5.15.223
rename to package/linux-headers/5.15.224
diff --git a/package/linux-headers/6.1.190 b/package/linux-headers/6.1.191
similarity index 100%
rename from package/linux-headers/6.1.190
rename to package/linux-headers/6.1.191
diff --git a/package/linux-headers/6.12.114 b/package/linux-headers/6.12.115
similarity index 100%
rename from package/linux-headers/6.12.114
rename to package/linux-headers/6.12.115
diff --git a/package/linux-headers/6.18.59 b/package/linux-headers/6.18.60
similarity index 100%
rename from package/linux-headers/6.18.59
rename to package/linux-headers/6.18.60
diff --git a/package/linux-headers/6.6.160 b/package/linux-headers/6.6.161
similarity index 100%
rename from package/linux-headers/6.6.160
rename to package/linux-headers/6.6.161
diff --git a/package/linux-headers/7.2.13 b/package/linux-headers/7.2.14
similarity index 100%
rename from package/linux-headers/7.2.13
rename to package/linux-headers/7.2.14
diff --git a/package/linux-headers/7.3 b/package/linux-headers/7.3.1
similarity index 100%
rename from package/linux-headers/7.3
rename to package/linux-headers/7.3.1
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 100545ba6e..0856a2a211 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -482,14 +482,14 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.272"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.223"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.190"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.160"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.114"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.59"	if BR2_KERNEL_HEADERS_6_18
-	default "7.2.13"	if BR2_KERNEL_HEADERS_7_2
-	default "7.3"		if BR2_KERNEL_HEADERS_7_3
+	default "5.10.273"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.224"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.191"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.161"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.115"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.60"	if BR2_KERNEL_HEADERS_6_18
+	default "7.2.14"	if BR2_KERNEL_HEADERS_7_2
+	default "7.3.1"		if BR2_KERNEL_HEADERS_7_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
