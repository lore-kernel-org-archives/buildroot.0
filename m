Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53DE8C433EF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 20:59:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21D5861166
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 20:59:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 21D5861166
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1A67400E4;
	Wed,  3 Nov 2021 20:59:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JgZXGJaeD2PL; Wed,  3 Nov 2021 20:59:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E775F40389;
	Wed,  3 Nov 2021 20:59:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F35671BF3D6
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 20:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17913404F9
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 20:56:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X_BdHiGos_yC for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 20:56:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFC27404F4
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 20:56:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4ADD48A3E5; Wed,  3 Nov 2021 20:52:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 3 Nov 2021 21:03:08 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: c3fa0f5e37b51c00484e2b6fceb0406c8ec96bf1
X-Git-Newrev: 4a846c39b65ae299f9592d5eac2003ab2f582655
X-Patchwork-Hint: ignore
Message-Id: <20211103205257.4ADD48A3E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.{4, 10, 14}.x series
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4a846c39b65ae299f9592d5eac2003ab2f582655
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit cc26ee8e1b84faa9feaba7fc6fe911ad74ccf7e0)
[Peter: drop 5.14.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index a5aba2e71c..ee673f4b78 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -2,13 +2,13 @@
 sha256  e877ec724e917c967603225c7e5dc21b6e0f34998c7d086cab8c50324363ab7b  linux-5.13.19.tar.xz
 sha256  e9381cd3525a02f5b895f74147e2440be443ecd45484c6c64075046bc6f94c73  linux-5.12.19.tar.xz
 sha256  11027c6114eb916edbcc37897226fb6263b2931911d2d5093550473ce1a57600  linux-5.11.22.tar.xz
-sha256  b4d635afe7646ac6a6617c738e747ba0a6006675cd9735d18f672f8b1fba4c7c  linux-5.10.72.tar.xz
-sha256  8044c7134c5eed21af9662f1c5399a5d8781b5bc2d8979e9ad06b4435a0a5ed5  linux-5.4.152.tar.xz
+sha256  0a2b2f5fefb90773190aaef4726ac363e03992aedc424b0a57eca092d084304b  linux-5.10.75.tar.xz
+sha256  cc0c0f902748d251cb22d0e69e3b8d260c447eb0072ef853da15da6cce775038  linux-5.4.155.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  870952aad348bed600a07ec24b23890e96f496bbc10e67033dbefa5fbf1f1c09  linux-4.4.288.tar.xz
-sha256  e2a2fdfca4eadf10716260779a510bf5e0f19c6ee0a223724c74d636c815a645  linux-4.9.286.tar.xz
-sha256  a4b43db9fd94a7c50d4f7e42d5264b1449ff41730f84a1323b8e4754fb336e7d  linux-4.14.250.tar.xz
-sha256  9ba722594a5a5444df19510925df7b6b76cbf20ab4dc54e57f1c3e4da4116133  linux-4.19.210.tar.xz
+sha256  33196aa3c0487d6d5be14c366fea1fb3d603d66efcf039746f77f3ef819be7bc  linux-4.4.289.tar.xz
+sha256  d44128674702529dd26214d6cd1c19542c37c5cc516f352bebbb78f0a9ed97c2  linux-4.9.287.tar.xz
+sha256  933bb2e9359165da8a7eb8ae8321e88e3e070c34b827d51937ff3ba443e15908  linux-4.14.252.tar.xz
+sha256  38f28c1cd6db0b54ee37a14fd17db651fe68704d08f95e141b14d32b872f4e98  linux-4.19.213.tar.xz
 # Locally computed
 sha256  e6fc0a999a180ad272b08ff71cbc67f2d3fdc6773d4a8069aefb8781b8e07821  linux-cip-4.19.198-cip54.tar.gz
 sha256  449668d678e458ddaf30f944b7ca7f5ce6ea6664f57d43ea4eb90b176e03b9cb  linux-cip-4.19.198-cip54-rt21.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 2b20a48176..240868d75b 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -370,12 +370,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.288"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.286"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.250"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.210"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.152"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.72"	if BR2_KERNEL_HEADERS_5_10
+	default "4.4.289"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.287"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.252"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.213"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.155"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.75"	if BR2_KERNEL_HEADERS_5_10
 	default "5.11.22"	if BR2_KERNEL_HEADERS_5_11
 	default "5.12.19"	if BR2_KERNEL_HEADERS_5_12
 	default "5.13.19"	if BR2_KERNEL_HEADERS_5_13
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
