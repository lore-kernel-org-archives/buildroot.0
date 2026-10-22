Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C36606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 06:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rxf2N68e
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22F30607E4;
	Thu, 22 Oct 2026 06:23:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EJHR2DDZ-gTl; Thu, 22 Oct 2026 06:23:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E24066081D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792650227;
	b=Qolq+wWvaJec4Lnx2ZkbntuKIQdsqo/RAdgPqLJaPdYz6p2Mb2isYmNITAsZzcAvdpkR
	 eztCxcq7g1UuEFZllnfsJ5oXwGg7JkmqRdy6F64YjqQdDQiy4XtHMg8c1wvsgm0oqt0nA
	 aEzhSDVlhPpXcdj/pm1WEH8lXsL73VrJAUeaGehQ6/BHP21GZ2PRU91/qEzLgpXkpRWtQ
	 ovzS4hnVPtMfJ9Umj2Act65ZcBHD/xBPrjTbBVKe7NHzc650ihzfAWGmxNDQ4R/zhvCBN
	 pTyUGDSkCElvy/KCm8a+QqFHCs+Boyk55XVGW3OPGvm/WpOhKUHw/h6gWdHpUQ1zl4A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792650227;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=uhjU9e5GD8/JA0gf8eBAKEmhl9VIDvU1kehs9oKC54M=;
	b=YJYGYitlU2VzNmvgO2iDqRhcmjYOEcmhkRr0YDjijOZ2C3KbfeK4MzPjPiWO7V+58XZZ
	 fplTIBMUwD/Emes+pcvkqQY/j1AMe7MxxypEuHN8B+Q9JaTQrJ65hRDDgwRHysZQaelBV
	 VEAHqscu+p+SnEx/gbMAeFr0Ud/wQUbte+AEtemc8ZidE2O1J9+IagzSKaupTtpFe1Wv+
	 8UhW2+nvmINiQqfyFti12EXj4HdeqgbcJM6Qk58E+qZSSJQdHU0unBD+9cbnwlsXwYlOS
	 VnIPWEpno9GuAl4ivoVUrH7CC+YvFLMQUpIHGSwlTL3OqqZGiA2nP587fdHiGVl3yzw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792650227;
	bh=uhjU9e5GD8/JA0gf8eBAKEmhl9VIDvU1kehs9oKC54M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rxf2N68eMiMv9m4C+sqBtJrc5xVknO4VHlFxk6BXScTS4OytTSMSQbxBNKeKstJ8Q
	 fJtguYC8dzYUa8fl2YTK4JZZtnucrIRKtZIidUzgkmIf/+hOka5T1opcq8JN/GOmBQ
	 GJ+tw7vSuiSyLZ4vGmx0G9DzJc1fHVz7uerz20famjZMh8XwhwKcRWYghfQfH0j7GA
	 yadfoEwNY0xC9BSur7BwURpquNjIkUboIEceJhrNu6wpKOGpchDGdBr6KF9A4oXt7X
	 sNqdZsHVa13szDYxfmpkcknhYNATpJmPmk4aATzVKVs26MPbUDqx8JKkxymPIFp8x1
	 CeheJTBlysa8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E24066081D;
	Thu, 22 Oct 2026 06:23:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 24FA91184
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 06:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0ACAD8085F
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 06:23:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZnBWmaARMNf9 for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 06:23:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E8DB180969
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792650220;
 b=no3H+R2gmmiINSCKlFTv+PGp5d3A7GrLy7rUqIC7NiirwdbCBgDCDzWysfc6Uza8mmXL
 TtWth7WjNUSqd8hbjlqnWlti34GoDMwEG1GFtgPlUtg7diidhzfNXVMqOIOwRfUbeDuER
 OcZ26v7PADREuCerhcPGC3XF8607DJ4D7WmF8tFIL2YO5S3kmmijf+75+bA9Ip2FtZ8bE
 SOv/aje7sWSvqalRZtMq45sVf5hBgXwbYWVMFIkBrDKXzGCevww5CTLaApPOVO3D5sCGm
 a++Wm64fv2zaja/xZ68yil4WpxGNGBYKJ41acuAWu7P1OU8JJ8EdH45nb9eq9gVXUBA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792650220;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=v+ZQjD1yy64oQRZuR2y3O8tRC4CKpLZ3kM92mAcz0ws=;
 b=f+Z8bvwH7GWtl7M48cMeL6KjGYmzCaPH2AmviNoNFzkqz/qOjP+5ATjzxpk5OocbOYlo
 P1eix2pylqp4FaTs1sdSjeHvPBEVgTJdIhzuVs5ekYY/VUcdfVUHAWcP1fWWp/3ovLxMy
 WHLxVZzDn1A11tn4pkF+k31gJTu32mtN1k/8u9ZkyZK2pJpQI97Qdeo/ZlaQKh2hTNvht
 k+8sJzuKCaD3QiDz1PZN5nAmPV8Adl4mN7fAL+vDIueFktoLtBpE6xdvDKn7VVoLTCMQ2
 0FYqChppiljxTVpWYt4RZMTa+76pfj5ACpoRU4uvjZyapYVWTzRVdD6ldNLotSeFYyQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8DB180969
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 06:23:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 162489B489; Thu, 22 Oct 2026 06:22:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 08:12:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 59f5e16ffebacd111d5fb84f110e15554b9a209d
X-Git-Newrev: b216661a73f7b8e21290a1bc9033e7f9b5fb230e
X-Patchwork-Hint: ignore
Message-Id: <20261022062217.162489B489@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {toolchain,
 linux-headers}: add support for 7.3 headers
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b216661a73f7b8e21290a1bc9033e7f9b5fb230e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/7.3                                                 |  1 +
 linux/from-6.17/linux.hash                                |  1 +
 package/linux-headers/7.3                                 |  1 +
 package/linux-headers/Config.in.host                      | 15 ++++++++++++---
 toolchain/Config.in                                       |  5 +++++
 .../toolchain-external-custom/Config.in.options           |  6 +++++-
 6 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/linux/7.3 b/linux/7.3
new file mode 120000
index 0000000000..74e2b2d5b6
--- /dev/null
+++ b/linux/7.3
@@ -0,0 +1 @@
+from-6.17
\ No newline at end of file
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 83d7d04e16..27bd3da1d9 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
+sha256  87363c24f10e06321eb362765521094e94471f6bff8bce2d6b3e40f39f004953  linux-7.3.tar.xz
 sha256  bb18468a8dc8978aa00caa6446e753f7b6da3fee56b6b7f38b16f9430ba02d4f  linux-7.2.12.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
diff --git a/package/linux-headers/7.3 b/package/linux-headers/7.3
new file mode 120000
index 0000000000..a4e1d3ec9c
--- /dev/null
+++ b/package/linux-headers/7.3
@@ -0,0 +1 @@
+../../linux/from-6.17
\ No newline at end of file
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 405d278e1e..36d72710a0 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -3,7 +3,7 @@ comment "Kernel Header Options"
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_7_2
+	default BR2_KERNEL_HEADERS_7_3
 	help
 	  Select the kernel version to get headers from.
 
@@ -55,6 +55,10 @@ config BR2_KERNEL_HEADERS_6_18
 config BR2_KERNEL_HEADERS_7_2
 	bool "Linux 7.2.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_2
+
+config BR2_KERNEL_HEADERS_7_3
+	bool "Linux 7.3.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_3
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -131,8 +135,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_7_3
+	bool "7.3.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_3
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_7_2
-	bool "7.2.x or later"
+	bool "7.2.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_2
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_7_1
@@ -480,7 +488,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.6.160"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.114"	if BR2_KERNEL_HEADERS_6_12
 	default "6.18.58"	if BR2_KERNEL_HEADERS_6_18
-	default "7.2.12"		if BR2_KERNEL_HEADERS_7_2
+	default "7.2.12"	if BR2_KERNEL_HEADERS_7_2
+	default "7.3"		if BR2_KERNEL_HEADERS_7_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 7452d96122..4e6a8d7927 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -681,6 +681,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_2
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_3
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_2
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -694,6 +698,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "7.3" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_3
 	default "7.2" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_2
 	default "7.1" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1
 	default "7.0" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_0
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 721fd272e0..33171214ff 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -178,8 +178,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_7_3
+	bool "7.3.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_3
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_7_2
-	bool "7.2.x or later"
+	bool "7.2.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_2
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_7_1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
