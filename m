Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C22D3B7F3
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 20:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA6F160E5A;
	Tue,  9 Dec 2025 20:48:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A8lR2Ai0mdD1; Tue,  9 Dec 2025 20:48:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C510060C0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765313305;
	bh=pyuei8th125MAWqON84SGmApXOGZ0EjTCPurWaKN8Zg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gh+J8ud2s4qTgHhAkaxXRP/W51fYjwk96cahDJvPwbEUtM+VRaFB+Xl9SQsQYdWxT
	 B2o6yrt2HTtL8Jsalt0IZwKepXxNIwmbC4gSD/eFxLCb1Kj5GKNd0yjHXGqFQ5NQPt
	 1fzBmK9nBHzDM/VHi5vin8lVrg/vFW/JsJMN7p93gUJO16zRJdDoKI0xJ/KLqYtxNe
	 w/LGX6EI6iYBNnG8ZbNdIiA0Kjd/5c/gOJaq8OmThC9Yv3FUmbDRlRY+iqf9xSiqFi
	 jUpC2cxbrJ+jKXXi4A76dQ0AFy9bgFodtcXEzZp0onatz8VBHvVI15i+YZP5YiHHoK
	 EcQQlAnWxkNSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C510060C0D;
	Tue,  9 Dec 2025 20:48:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A400E237
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 20:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89E6384357
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 20:48:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mGjng-r6AKqY for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 20:48:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACA618434C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACA618434C
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 20:48:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9BC388699A; Tue,  9 Dec 2025 20:48:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Dec 2025 19:25:02 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: d61a96788738274f07b2bccbfdc4aa4b6bfeb743
X-Git-Newrev: 3e19283d9bb285c780d512c08610a1dbdb978a99
X-Patchwork-Hint: ignore
Message-Id: <20251209204823.9BC388699A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] {linux,
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

commit: https://git.buildroot.net/buildroot/commit/?id=3e19283d9bb285c780d512c08610a1dbdb978a99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Update the latest kernel releases to:
 - 6.12.58 -> 6.12.61
 - 6.6.116 -> 6.6.119
 - 6.1.158 -> 6.1.159
 - 5.15.196 -> 5.15.197
 - 5.10.246 -> 5.10.247
 - 5.4.301 -> 5.4.302

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 372f413a8f..f94e3b257d 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  7ca4debc5ca912ebb8a76944a5c118afd5d09e31ef43c494adb14273da29a26e  linux-6.16.12.tar.xz
-sha256  5f1c4c546660a6a81046fdfa6195306bad2c8d17c0d69876dc100a85ad4613ac  linux-6.12.58.tar.xz
-sha256  a9a59742c29be284c205dc87cbe9b065f9688488132c8f5a6057a5539230a51d  linux-6.6.116.tar.xz
-sha256  ad068bfdb604ec0f4f7de385c8e7ab944008aa78a4aeeca94f53206e6726bfda  linux-6.1.158.tar.xz
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
index effbb8f368..d3a1601503 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -454,12 +454,12 @@ endchoice
 
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
 	default "6.16.12"	if BR2_KERNEL_HEADERS_6_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
