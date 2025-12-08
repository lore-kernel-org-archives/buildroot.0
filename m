Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C261BD3B994
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 20:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60F0240578;
	Tue,  9 Dec 2025 20:45:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CciS3ke_7yWT; Tue,  9 Dec 2025 20:45:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74A004099D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765313130;
	bh=pUEiGFRgKeDMNTaG8Ae1OQa/kKxNz2atBLT1ZMK83gc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jqp+GyC01pzRGAreYiyH8IrNBDutabwZGBINdQp4De+5Wuy871qOfBhO8XGepxIqy
	 /38oENwbpnj5QP6P6fVhXwln8Enio75K2Mky5gS3IWvw0bqXdUTj/T+rBsa3kLVbK2
	 UpmghEtpEs1hjhM10OccoGWpu1gFTwPklmb1+aO4j1zgun7Zz0nhEczcOreOcFGGjF
	 Sy1JkgsTBe0/d1OL23D6pZwPxantZSEBEHOJz6NRbMO3pwfzQ4NTZIwdOeebZ5dSUB
	 wOBB86DN2nl1Dg6kfZboM8jDjFZEXbYv8cWN3VHBdUYILsTsqNtOzrsvcsb1gcqm3I
	 FmmJxMjZCzq2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74A004099D;
	Tue,  9 Dec 2025 20:45:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 82E6DE7
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 20:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69FEB4009D
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 20:45:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S4USWBHT_sDM for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 20:45:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B3D340028
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B3D340028
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 20:45:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0845E86993; Tue,  9 Dec 2025 20:45:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Dec 2025 19:24:24 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9a5dca399f36664d63da13c5adbdf5ea5bad36b8
X-Git-Newrev: 81fd6056f10f94012e0b234ee04da22b6355b2b5
X-Patchwork-Hint: ignore
Message-Id: <20251209204527.0845E86993@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] {linux,
 linux-headers}: bump 6.12.x, 6.6.x, 6.1.x, 5.15.x, 5.10.x, 5.4.x series
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=81fd6056f10f94012e0b234ee04da22b6355b2b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Update the latest kernel releases to:
 - 6.12.58 -> 6.12.61
 - 6.6.116 -> 6.6.119
 - 6.1.158 -> 6.1.159
 - 5.15.196 -> 5.15.197
 - 5.10.246 -> 5.10.247
 - 5.4.301 -> 5.4.302

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 15 +++++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index c5460c42b3..769bf3391f 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -137,7 +137,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.12.58" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.12.61" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index fb33cd5a0e..b86f257367 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,11 +1,14 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  5f1c4c546660a6a81046fdfa6195306bad2c8d17c0d69876dc100a85ad4613ac  linux-6.12.58.tar.xz
-sha256  a9a59742c29be284c205dc87cbe9b065f9688488132c8f5a6057a5539230a51d  linux-6.6.116.tar.xz
-sha256  ad068bfdb604ec0f4f7de385c8e7ab944008aa78a4aeeca94f53206e6726bfda  linux-6.1.158.tar.xz
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  1a69745105528676f12f29dc2494945d96cb23666dcc5223794abc22415f1735  linux-6.12.61.tar.xz
+sha256  3da09b980bb404cc28793479bb2d6c636522679215ffa65a04c893575253e5e8  linux-6.6.119.tar.xz
+sha256  1f207ebe93980829ecc0a18b694816f22b715e9893767731651969a168342b9e  linux-6.1.159.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  83157953598b026fb721c906c60dfdfd8e986f25ecb9910f3504f690e2770e05  linux-5.15.196.tar.xz
-sha256  eb6b76c269d2dc09791638b10b9dcb9d79fd2abd45113a31fc03f68731caa875  linux-5.10.246.tar.xz
-sha256  b7718766d060e6714bbe47004c71c360e844758f42fbf62cbaa5571119527962  linux-5.4.301.tar.xz
+sha256  fd218df8e2107a4443b6c29fef7f95aad167031e0fbdbc7a858ae8471360668a  linux-5.15.197.tar.xz
+sha256  70c8b87ba1fcd8bfa663661934dc9bda92d0b5f3c0fc3197bb56399f69d9fe0c  linux-5.10.247.tar.xz
+sha256  ae6a3207f12aa4d6cfb0fa793ec9da4a6fcdfdcb57d869d63d6b77e3a8c1423d  linux-5.4.302.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 390f9d4852..1b49a701de 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -428,12 +428,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.4.301"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.246"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.196"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.158"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.116"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.58"	if BR2_KERNEL_HEADERS_6_12
+	default "5.4.302"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.247"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.197"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.159"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.119"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.61"	if BR2_KERNEL_HEADERS_6_12
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
