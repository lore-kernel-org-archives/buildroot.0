Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3751606A319
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 18:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cafGJcXc
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CCED405B3;
	Wed, 21 Oct 2026 18:56:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sjsOo_g02z-Q; Wed, 21 Oct 2026 18:56:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4638140EC6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792608963;
	b=hMWRGG7wFjsCugz0q9o+QAnUjPoBOB9VgbegKsnFJZ4sBrmNJshufx7sU4YjThA4Ul0V
	 x0LTv7BW3QDaU+jh5ovo7y6m/XFYHcB0o3qFWOAc98BYbH4rsofQoRQmncZUqyptt3TUO
	 O+dl6+FSDli2qnwfoDTimaP5S86QP2n2+QA+yFl0Xra2IrCnC9Z6YSTBreQyqOIAsh36L
	 mvJlzKw0/4fQpcXr3BnHAXzArn3PYAGjYnkYTaiN3sn3Bw9Ax3O5iyPs+E6tGYpDcJM8P
	 lQFdi99gbkfVHLs9wJvyAtpK4BI0Q9n+2UjlbJWyggefmupBak2KTAcxwSqspAmo+nQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792608963;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=HLp68L1xeMAbtHBH2erDklb1wzd2gsfD+v7pzL2CYTM=;
	b=arK9zzIsPJx671H3jcVjpjqaFA5SeuBGe7CxTgOTPRwzpSOtM3ivXLgLwsKxNcc50emO
	 m6gO1ktpUIL4Z7sMOeiR4JIQFQUhDCQmdTsJ11telQitPyGlrpDfzWW2XGZ2lOZy4ImHf
	 Riv9Vrl8/FqwMhCrwhkVkQPPSLut/su8IONxFUauMbFjAL9g/fR5jRHOGKeANRTi1pTA7
	 CKH811rMdDpFHdeL9KuLdNLQpeFtM0NYV5tcLbKuMB/+w/JdVRtlJpytgVdbH4Nv8tT3C
	 Xhcdo1ay39flCRbRh7xmgyAmq9gFrMVfdPsulpzjAuel7/PHX/K0J0MnfGO+eDCS08w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792608963;
	bh=HLp68L1xeMAbtHBH2erDklb1wzd2gsfD+v7pzL2CYTM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cafGJcXc5YbxYgAJsc5xMgB6yk79BpxhqLzvujccvRTuidAzXSJ5QXj6VyOUUqzxp
	 FjesUFuGgLSX/1QOt9TKZlQ8zBlytBTpSArAANbmN0Sh1gBuLBiywwUt3kIywTJBIF
	 pO3tKnW9T8U4dF3BKUwGi3XxrsyGHEgRkP3jldKnfa+P88Imp++9Mjm6Jm5LsEO1+i
	 hTVSKijK0WsJ1nY+zatpq9Xw0oX156l+y4mr7sGVJjNUWFsnlbRwE1ah8MxEMhb/YN
	 JiDcL6T+BX5/GXl9ox17dtj16qxxizmYZRaGcnn/FKwEqs9AkxDeQMMOYLzOqGuQlN
	 xh6+4zrUJNMYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4638140EC6;
	Wed, 21 Oct 2026 18:56:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E1F013A4
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 18:56:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C817240FCA
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 18:56:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MHBKyPCGshMQ for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 18:56:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D3010405B3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792608960;
 b=nfWnj9076ZXAdCbOy1VYiCc91lQYhbhOfKqBpLKmszWw3jcGKTJ10wmsKuhv0LIrAQo/
 /Vy+5KkGdYv3Yf1mQZ+SraNXXqa6FfX2gmP01pfjh8Ii46kk+PmiHVoNrlfWSXHeDG3H5
 Eqc8grIVRT/FzsejGtLgfGclMsoucC5SDO/kfZhsmWvHBhewBpm1VQio2URyTppLtLH+R
 i4hXtriRzVXGk8xAd/2uJObHiJb3ygK9yMwD3aEejM/AFeD4OBPLEKOifPAhbf2Z6hu+Y
 QorXDhJWx1o+7PKqO6awKHrDHcehDUpeO/WAUcUhTTQ4iGhFttNeutNXI3+OA9FDGIQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792608960;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=XpYqQm28jZa2QCUQ8QI98WglpSJULtbDXRb9zYA9A+U=;
 b=jFO4j5M+fiNq/L+Lp9scMQDbo3KTUTeaUhWIjqN7jxXtz65YAZbPOlfXCzQfloR+ZgyH
 HsjTbxMAfiEzv7HiC27rsr0rFcucIyN9q31BjSH+9IUvOjVFJaPldE0xM8gaqmYKF8gKv
 5DL/KQxj67hPo3ZZVSdZ/mLcBY49wBPglThG04y9S75vcCRWrZIEEOk8+8EnBQgZdfL9E
 6SdZopkX+Pgiupy3dknrZ+Tz0e8DkQwftcHJrjl9uMhGdaXPmWdSFHaD8u5MqCXYwdwkv
 AHnJqq9f++rrddqKj+4uZzd8g6emC+Ri9c6eYF1/lRz1Szv16W+GxiwcKr51XP2tXZw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3010405B3
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 18:56:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3206F99A56; Wed, 21 Oct 2026 18:54:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 20:55:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 77473256bd9a49f2120d1efedbc412aaf4501ecd
X-Git-Newrev: 1b2f53da31daf77dcf6e1606f5ca780813cf57fd
X-Patchwork-Hint: ignore
Message-Id: <20261021185437.3206F99A56@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 7.2.x, 6.18.x,
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1b2f53da31daf77dcf6e1606f5ca780813cf57fd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update the latest kernel releases to:
 - 7.2.11 -> 7.2.12
 - 6.18.57 -> 6.18.58
 - 6.12.113 -> 6.12.114
 - 6.6.159 -> 6.6.160

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
