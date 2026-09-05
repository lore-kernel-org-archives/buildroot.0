Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA70C624DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 16:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41F86605FA;
	Sat,  5 Sep 2026 16:19:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IZksGYW4rN_a; Sat,  5 Sep 2026 16:19:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 53ABC60604
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788625194;
	b=qB3+sdk4mwiOnLXZN7dufHXvUy5jlSPEKkNmATd3+HS+qXJM3kxx07USruqKD7OfEraf
	 0MAsWWEA01b0b72zHLvv04ZVxad0HcoK2+AiEdQwd1PUrUmnMWxP6QYD8zV2vdAM9YuCW
	 PsUbt66BUublmnLracdm+Pd4ffOAiUs/oY3MTKdxp1AcutpGpKQx8QEfJU+tjVfzJ9+Vk
	 u161jiWATaIHB9ymZjJgUPRL3VxxJSkyWH6Gr+qM7mJHeJw5ma8xA3oYXGdWLytnAzJeq
	 fiQmVb2LckfMfGODC1pQG0upodOUr1IGrrtHuvrrSU2YxKwHgMLfo3E2Gr8vECGLqAA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788625194;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+vtQVptxeAixfLFE0xX/+XOO/jbiO0ez22tHrIXhmsI=;
	b=jI3N2mroqNh90pDZA7a5EKafIL1l7zUAnNA47EhOVN27vMCHRk0NYl1A2ZXPblI9Dg5z
	 KIAm93YIERL+FD0AxYSKnGeooahnb0BZxToxeFwpHsGG10g0fNZYW2kB3IU3edpCZEUT1
	 kVkEZJrXtlznkRZzs1lu1/ZeUI+4yZkpp5am/d4+64DHDcwxpF2vgtiSsGVdJ0RLjPKqC
	 OPEJEuCpdLeP1hEslctWuevzTVYOh6pokTsXlY0Qg/GNpF9hR2+A+A1/+Srn1QAT5vvQ8
	 XJ5T0sO6dwLSfP6PjSsdjMMOEa9YRx+Me4YoIywqeaZdqarf3Po0j+swF/3yFHbrPNQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788625194;
	bh=+vtQVptxeAixfLFE0xX/+XOO/jbiO0ez22tHrIXhmsI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=SVvYo23bQ3+NDVSInNsCVlGCx/0lGAiOp74gFUS0EWPaSvTeIqQsCIahVRt2F3F8g
	 hFFCJvIYSJxi7HHWd9fPCHbG/n5TVpOf7L39Sb3AwPId4NeXVrUc6YDsp+QTdlzrbJ
	 Z1AGJ/9uHow2FsRagLUKfD2dXs7fbU5imt3I4H1bl2Ilixjfm9iwrLBFBRRZEvTh+I
	 R82PWIEvDzKpC5WLN1ARHJ1ccBTGw9N+Jhy9IJh+OLZR9xyZTyThqq8GGriNGO/Nd/
	 cJwcVfUtgvsbFlpl4VDMbv07dE3ppWn8NsOB60PyA4R3s0+r8UYLpzmEVejUNFAEDZ
	 XCcz2Rb9GOOgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53ABC60604;
	Sat,  5 Sep 2026 16:19:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D607A279
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 16:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC3F980F7E
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 16:19:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8MGLshDiFrtZ for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 16:19:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8C70780F79
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788625191;
 b=e+0bDRks7An2YgvPCt7R1Zs6ZkBWMnZGs3fHIHbS95EPc1qVuWmkUZv6freb8QVW0Ia5
 qOG8n8p7NWpH27bvjeB6TOctOjMpkFw0IQQIcUwEe1zo6yOJoSORYkjqT11bToIgKunwj
 LUBI1Kj9oQ2n1ikfN1oGzuF1PqzFHDj0nLbin9hEr6j2+OdfFH3sx9KLOp5Hqo4P3Ck+m
 UFrUVjMewtHxedGh8FqTTTBkWzVKOYTOSQ7uQCJVEXpydXGxINpFtOXWINl2B2A+pSzhw
 tHR8HcV/UhXd/53QmE5Q2eUG/wHUpwm7bq3AnSm/RlNTBV0fVQzXPUHZ/dTfqGYTEXg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788625191;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=JXPYFc3rREwcjIcA0uqJffxrwSg5gfHvnptN8Oqesh8=;
 b=SG3syLhZ3u+xdeXFE1O4P6DQLhfCcrUtHH5ROC1FOfuJrVzpTvtZtIuq5z+rYwu2a7Jk
 UIWWOqjjwE6gj4oy9j9hEFqaPD8KCgAwFyy5/DkkBgycFmxAq0/3T+24Y+0XoDEqs06g3
 U1OVAJQmlmyfjmmV9K93TOlbzz8BfwZvOlF8AumNlktj+TzJU3o59wrDR8cSYEF+8mItq
 yTUqUsjxJCTf8ghvo+JI8y1qVzSnYx/9LT9HqrxRB+lGzfDqKVojB9zaVERA4O03QKML9
 4y8xXKQDzdnn87Woe7bF+IXPKlp9tNaqDEqPRv17nQZrivgCEs60sUVFzuoh+dHD6gw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=lwPCucVH; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=lwPCucVH
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C70780F79
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 16:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788625177;
 bh=JXPYFc3rREwcjIcA0uqJffxrwSg5gfHvnptN8Oqesh8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=lwPCucVH5zG5xfDCRbnjFbawheD7cAmOVJm9wqDgm5h6NRJ4R0bqmFtYWlCYPAYRg
 zpI+P+qLBzr+Guw9NAVUot/sP4v5sVjjTlalyCoHROIpXaXLgSiW5Nw4lxVvL4shzZ
 UGas4+G4hH3NPe+WjMyOyv8g+vCxDI7Kwgi975xUmF8IlgHngcVC1BTSJFTVRGjIuW
 KIcAYSe0jwUdvnla/tdpkXEzvaIx7AdsXqmP5vtBx1PLEh8xWFel6vR235sALsoxG8
 1IdBi3ayMastca87/gvIzQBe/TlZtZhaGWRF24npThBQLjMfye1XdDdyKc3NP2cA3S
 hKAK+atzPqlSQ==
Received: from fli4l.lan.fli4l (p5b3a03a0.dip0.t-ipconnect.de [91.58.3.160])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0EADDA4C2F64;
 Sat,  5 Sep 2026 18:19:37 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42882)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x2t7A-000000006l8-32RJ;
 Sat, 05 Sep 2026 16:19:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  5 Sep 2026 18:19:34 +0200
Message-ID: <20260905161936.549476-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260905161936.549476-1-bernd@kuhls.net>
References: <20260905161936.549476-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 2/4] {toolchain,
 linux-headers}: add support for 7.2 headers
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/from-6.17/linux.hash                          |  1 +
 package/linux-headers/7.2.3                         |  1 +
 package/linux-headers/Config.in.host                | 13 +++++++++++--
 toolchain/Config.in                                 |  5 +++++
 .../toolchain-external-custom/Config.in.options     |  6 +++++-
 5 files changed, 23 insertions(+), 3 deletions(-)
 create mode 120000 package/linux-headers/7.2.3

diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 3c5e96ef4c..3aecea4fad 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
+sha256  8ba259e8e7b13ec6ef0941c8a39ad90b24bd4a4d6c0010ba6bafb794550ecd03  linux-7.2.3.tar.xz
 sha256  614d95fafdcb5cce2b6620e7edc6afbb606bffd4655405586815d84687841ad7  linux-7.1.13.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
diff --git a/package/linux-headers/7.2.3 b/package/linux-headers/7.2.3
new file mode 120000
index 0000000000..a4e1d3ec9c
--- /dev/null
+++ b/package/linux-headers/7.2.3
@@ -0,0 +1 @@
+../../linux/from-6.17
\ No newline at end of file
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 433fb363ee..365fe11931 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -3,7 +3,7 @@ comment "Kernel Header Options"
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_7_1
+	default BR2_KERNEL_HEADERS_7_2
 	help
 	  Select the kernel version to get headers from.
 
@@ -55,6 +55,10 @@ config BR2_KERNEL_HEADERS_6_18
 config BR2_KERNEL_HEADERS_7_1
 	bool "Linux 7.1.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1
+
+config BR2_KERNEL_HEADERS_7_2
+	bool "Linux 7.2.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_2
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -133,8 +137,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_7_2
+	bool "7.2.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_2
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_7_1
-	bool "7.1.x or later"
+	bool "7.1.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_7_0
@@ -479,6 +487,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.12.108"	if BR2_KERNEL_HEADERS_6_12
 	default "6.18.49"	if BR2_KERNEL_HEADERS_6_18
 	default "7.1.13"	if BR2_KERNEL_HEADERS_7_1
+	default "7.2.3"		if BR2_KERNEL_HEADERS_7_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 128f8faef2..ad73204b14 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -684,6 +684,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_0
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_0
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_2
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -697,6 +701,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "7.2" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_2
 	default "7.1" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1
 	default "7.0" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_0
 	default "6.19" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_19
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 003887f025..721fd272e0 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -178,8 +178,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_7_2
+	bool "7.2.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_2
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_7_1
-	bool "7.1.x or later"
+	bool "7.1.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_7_0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
