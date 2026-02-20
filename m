Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F46C53216
	for <buildroot@archiver.kernel.org>; Fri, 20 Feb 2026 06:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8898360FB5;
	Fri, 20 Feb 2026 06:55:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S6PyeOAYa1rh; Fri, 20 Feb 2026 06:55:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B93A260F61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771570528;
	bh=0yJak6nkQKCuzKRvq3rVqKEutwqFzVBdjLWnT2yerEA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JjEWdkx5W8qVTekm0+0wt30jcrXOQw/4yaGyTg6m+6VG4uqIzK+b+8QZOR8wgpZ/h
	 9W2XjHOaZ45U8qCM/Vml6FcDbR8agU+1sx9OmSAHn0svKT3h2D0pFjKeL+ZeddVms0
	 JBjwWMoR7MQRNip+MK+zq1zGteX6Qgt9vDAbEFPBC++NsckFN4++dBLDRLPuL0EDwk
	 n8e+1PxCZjt+6fmmadPfUZPYO6U62bqTw1zv4jwYQnwix1mePxp0RUlrrgDqBp3+cd
	 cFXTgQFhXcjXVeLhBLn1hk/snrRAsJvBB+4YZl+dawZMGe3MKr7/8qBr1ad5S18nU3
	 6ClNNhmQYNEGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B93A260F61;
	Fri, 20 Feb 2026 06:55:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D2A3355
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 06:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F10241788
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 06:55:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VMGIfIapDwlo for <buildroot@buildroot.org>;
 Fri, 20 Feb 2026 06:55:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98E3441786
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98E3441786
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 06:55:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 91E878712A; Fri, 20 Feb 2026 06:55:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 20 Feb 2026 07:50:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 34b9d6381ebfa978b7a377f073a6ff272b171135
X-Git-Newrev: 5a08bca31bbdcc10d2ee55c6573240868d2d6a37
X-Patchwork-Hint: ignore
Message-Id: <20260220065525.91E878712A@busybox.osuosl.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5a08bca31bbdcc10d2ee55c6573240868d2d6a37
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/{6.19.2 => 6.19.3}                     |  0
 linux/Config.in                              |  2 +-
 linux/before-6.17/linux.hash                 | 10 +++++-----
 linux/from-6.17/linux.hash                   |  4 ++--
 package/linux-headers/{5.10.250 => 5.10.251} |  0
 package/linux-headers/{5.15.200 => 5.15.201} |  0
 package/linux-headers/{6.1.163 => 6.1.164}   |  0
 package/linux-headers/{6.12.73 => 6.12.74}   |  0
 package/linux-headers/{6.18.12 => 6.18.13}   |  0
 package/linux-headers/{6.19.2 => 6.19.3}     |  0
 package/linux-headers/Config.in.host         | 14 +++++++-------
 11 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/6.19.2 b/linux/6.19.3
similarity index 100%
rename from linux/6.19.2
rename to linux/6.19.3
diff --git a/linux/Config.in b/linux/Config.in
index 4ed9104695..73a8059523 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.19.2" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.19.3" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index d523173bb0..f2946ac337 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  4059d394cbf8e9548df36d37e0b8a80c4409ac4e14ecc5019a72a770ef7b41ba  linux-6.12.73.tar.xz
-sha256  16742f4e78abfec8cc9205fb3cf79d63c7e819c33bfc691402683402c350ee2f  linux-6.6.126.tar.xz
-sha256  fd2d033321bd15e0ad5669208b6e43f3f93ccecb059a512ca6b913ca940c38ea  linux-6.1.163.tar.xz
+sha256  3b56eeb1dc9a437f189ca56b823be3769994f59a4ea0895b08ec0d20acaca13e  linux-6.12.74.tar.xz
+sha256  a7cd9c97b4f0b31cc030bcdc60abe5434fffb2556e293f7438ce7909dff8c9fe  linux-6.6.127.tar.xz
+sha256  33bf087f7bbf7f626873dd7d955eb44182a93695db41f5f89a6bd3d233a39d1c  linux-6.1.164.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  fce4b1c86688880932ba8f755880cbf390a89453464bfd90b9a1b01a121c2998  linux-5.15.200.tar.xz
-sha256  47754da223a9f264b917be5d575a4dae03fc8777aa9e1b00473e973ee997d529  linux-5.10.250.tar.xz
+sha256  4f2afffbeddaad6b8527d41a3e3a82646d3cf5dfd0acbb6c4e8a99fc70461b96  linux-5.15.201.tar.xz
+sha256  e6857625fee3b587b0279b445adc3940a5c40723385fa1055ac7af16ff4b4c01  linux-5.10.251.tar.xz
 # Locally computed
 sha256  93408e0c5d70ff0ab63dcf9edec6fda2b8524281d611a88e56590436bda43914  linux-cip-5.10.246-cip66.tar.gz
 sha256  b3454708b98016f02604433e41060be2c1feb595c2bddeb25292596f047f0915  linux-cip-5.10.246-cip66-rt29.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 6edbdd7471..8f4d558e8d 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  88611981582cceb7cdd4d688d9d881073cf4977176252193a23ca6d4b982ee5a  linux-6.19.2.tar.xz
-sha256  e003294ad4c2c2ac5bb77fbb8259511134f51d987b3212516832dc4b0c83f1ea  linux-6.18.12.tar.xz
+sha256  0e474968adfcbee32916fd01a89d8ccfd1168d8d32569e76a5c664c793198ebe  linux-6.19.3.tar.xz
+sha256  ed2c3c55fd38e6836c094fce356f2567f9516130b73354a29857960368c5687f  linux-6.18.13.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/5.10.250 b/package/linux-headers/5.10.251
similarity index 100%
rename from package/linux-headers/5.10.250
rename to package/linux-headers/5.10.251
diff --git a/package/linux-headers/5.15.200 b/package/linux-headers/5.15.201
similarity index 100%
rename from package/linux-headers/5.15.200
rename to package/linux-headers/5.15.201
diff --git a/package/linux-headers/6.1.163 b/package/linux-headers/6.1.164
similarity index 100%
rename from package/linux-headers/6.1.163
rename to package/linux-headers/6.1.164
diff --git a/package/linux-headers/6.12.73 b/package/linux-headers/6.12.74
similarity index 100%
rename from package/linux-headers/6.12.73
rename to package/linux-headers/6.12.74
diff --git a/package/linux-headers/6.18.12 b/package/linux-headers/6.18.13
similarity index 100%
rename from package/linux-headers/6.18.12
rename to package/linux-headers/6.18.13
diff --git a/package/linux-headers/6.19.2 b/package/linux-headers/6.19.3
similarity index 100%
rename from package/linux-headers/6.19.2
rename to package/linux-headers/6.19.3
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index d53460d07d..4745ff148e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -464,13 +464,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.250"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.200"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.163"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.126"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.73"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.12"	if BR2_KERNEL_HEADERS_6_18
-	default "6.19.2"	if BR2_KERNEL_HEADERS_6_19
+	default "5.10.251"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.201"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.164"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.127"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.74"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.13"	if BR2_KERNEL_HEADERS_6_18
+	default "6.19.3"	if BR2_KERNEL_HEADERS_6_19
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
