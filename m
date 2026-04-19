Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE71EA7190
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 13:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA3664094A;
	Sun, 19 Apr 2026 13:55:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vDNh1MFFbX9f; Sun, 19 Apr 2026 13:55:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C01964094C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776606938;
	bh=rDxbPWrve1WURFd3YhiNzG/JGmhfEa1qfHLxmHWeKgs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cQ0naCQrY2qPriyT1S5+HiSuk19H1nsofBL+7kZLDVG35CqrR+c+pR1/PdSHqClVx
	 lMg8LHf3yBtXwICCDBRT421bBp5MX09+1P113yJqxgi6zdi+gdoG9DVG28Dv2eHKk4
	 nqvEm6OBB1g6LdujH43JGpXrQC743+DLCcOCMwe/ZjFDOSLCvjgYE1wgxUFIZAR9lI
	 Fp6m3ZNrKoY0qmFtSwUSxPBPNvRtPRBEU0taLHucRzpPJZvwyTJy9JR92O9zqheKR/
	 MsnTlKAaA+nFpgS5q2aSYjiu4x66wkI7ZnDCVlPKc44EMJnq2e6uiPeCusw//wTZJi
	 FWxL128E5c5sg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C01964094C;
	Sun, 19 Apr 2026 13:55:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EC6E624D
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 13:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE21882254
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 13:55:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5kXFS6xVMcOX for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 13:55:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF59E82251
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF59E82251
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 13:55:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 62AF081841; Sun, 19 Apr 2026 13:55:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Apr 2026 14:11:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ccf69ab8c4cedfe5a1fdb7e5d90b962045064444
X-Git-Newrev: a7bb4571f4562b6bf35354d2b33ad4f9450bb2e6
X-Patchwork-Hint: ignore
Message-Id: <20260419135536.62AF081841@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 5.{10,
 15}.x / 6.{1, 6, 12, 18, 19}.x series
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a7bb4571f4562b6bf35354d2b33ad4f9450bb2e6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/before-6.17/linux.hash                 | 10 +++++-----
 linux/from-6.17/linux.hash                   |  4 ++--
 package/linux-headers/{5.10.252 => 5.10.253} |  0
 package/linux-headers/{5.15.202 => 5.15.203} |  0
 package/linux-headers/{6.1.168 => 6.1.169}   |  0
 package/linux-headers/{6.12.81 => 6.12.82}   |  0
 package/linux-headers/{6.18.22 => 6.18.23}   |  0
 package/linux-headers/{6.19.12 => 6.19.13}   |  0
 package/linux-headers/{6.6.134 => 6.6.135}   |  0
 package/linux-headers/Config.in.host         | 14 +++++++-------
 10 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index f6a6e0dfa7..cd69a9dd05 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  c2b09c3643946a7097c5371e1dcb123c66505ea30fafd0b0a22dc1d5f0228847  linux-6.12.81.tar.xz
-sha256  6378697b36376bf4e727a47402fee340ca4e3b146d5b407d3753cbff300f37bf  linux-6.6.134.tar.xz
-sha256  e0856fe51e444986425886533ebb91d8540189e80c3f0365c76e4beb7439776e  linux-6.1.168.tar.xz
+sha256  0e570b05cd73981bb4a5bcf0e03751d4f0e2ac776c6d4fdcc2366bed3e0f19a9  linux-6.12.82.tar.xz
+sha256  d3d238ede7169dedb642898af0cb1777e9913171eb1c750eb4d9f82350a7132a  linux-6.6.135.tar.xz
+sha256  e0cbe674801749075b93008d8854dbf1c8d300805ada0b60f6f907bbb83aef2c  linux-6.1.169.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  0bc1bdf74957e276793691865ffb71505809706d9243a42e9704aad0f128cdd4  linux-5.15.202.tar.xz
-sha256  34b3fbe2c9eeb767fc7eea4b9516e0dd44b79401ceb13e41713096b8eb270afb  linux-5.10.252.tar.xz
+sha256  0bebe7d82a57e98792a407109566f1813fde97aaf7f735c1c7e6feebe833dc64  linux-5.15.203.tar.xz
+sha256  ec0724928050e8e2f6226fe8bbb206f42a951c0ed2dbb533c5462789f6d75ac8  linux-5.10.253.tar.xz
 # Locally computed
 sha256  93408e0c5d70ff0ab63dcf9edec6fda2b8524281d611a88e56590436bda43914  linux-cip-5.10.246-cip66.tar.gz
 sha256  b3454708b98016f02604433e41060be2c1feb595c2bddeb25292596f047f0915  linux-cip-5.10.246-cip66-rt29.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 75994f545c..66c28f474e 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -2,8 +2,8 @@
 sha256  bb7f6d80b387c757b7d14bb93028fcb90f793c5c0d367736ee815a100b3891f0  linux-7.0.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  ce5c4f1205f9729286b569b037649591555f31ca1e03cc504bd3b70b8e58a8d5  linux-6.19.12.tar.xz
-sha256  a23c92faf3657385c2c6b5f4edd8f81b808907ebe603fa30699eae224da55f59  linux-6.18.22.tar.xz
+sha256  0559b1fea740e71714b4368023902b7d098c45ac1faa3176eab392c867645648  linux-6.19.13.tar.xz
+sha256  2a2d8e76bfcd135ab861bb9795211574eeff6d4ede9cc920f7c137587e835134  linux-6.18.23.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/5.10.252 b/package/linux-headers/5.10.253
similarity index 100%
rename from package/linux-headers/5.10.252
rename to package/linux-headers/5.10.253
diff --git a/package/linux-headers/5.15.202 b/package/linux-headers/5.15.203
similarity index 100%
rename from package/linux-headers/5.15.202
rename to package/linux-headers/5.15.203
diff --git a/package/linux-headers/6.1.168 b/package/linux-headers/6.1.169
similarity index 100%
rename from package/linux-headers/6.1.168
rename to package/linux-headers/6.1.169
diff --git a/package/linux-headers/6.12.81 b/package/linux-headers/6.12.82
similarity index 100%
rename from package/linux-headers/6.12.81
rename to package/linux-headers/6.12.82
diff --git a/package/linux-headers/6.18.22 b/package/linux-headers/6.18.23
similarity index 100%
rename from package/linux-headers/6.18.22
rename to package/linux-headers/6.18.23
diff --git a/package/linux-headers/6.19.12 b/package/linux-headers/6.19.13
similarity index 100%
rename from package/linux-headers/6.19.12
rename to package/linux-headers/6.19.13
diff --git a/package/linux-headers/6.6.134 b/package/linux-headers/6.6.135
similarity index 100%
rename from package/linux-headers/6.6.134
rename to package/linux-headers/6.6.135
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 366d17ad09..c774796377 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -472,13 +472,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.252"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.202"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.168"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.134"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.81"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.22"	if BR2_KERNEL_HEADERS_6_18
-	default "6.19.12"	if BR2_KERNEL_HEADERS_6_19
+	default "5.10.253"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.203"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.169"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.135"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.82"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.23"	if BR2_KERNEL_HEADERS_6_18
+	default "6.19.13"	if BR2_KERNEL_HEADERS_6_19
 	default "7.0"		if BR2_KERNEL_HEADERS_7_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
