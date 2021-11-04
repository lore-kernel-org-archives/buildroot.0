Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3724AC433EF
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 12:24:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5E1C611C3
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 12:24:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A5E1C611C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7056340015;
	Thu,  4 Nov 2021 12:24:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pwCj6pgquPu8; Thu,  4 Nov 2021 12:24:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78CB6403A9;
	Thu,  4 Nov 2021 12:24:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7583F1BF25F
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 12:24:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 654A280EFD
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 12:24:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ktbqKeh9iU4 for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 12:24:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B88580EC5
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 12:24:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8261D8A558; Thu,  4 Nov 2021 12:20:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 4 Nov 2021 13:01:12 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: f7307165906a227d646feec26f5d60008a2eae73
X-Git-Newrev: 76d7b6991c04ec43a127210d32e09608987325d6
X-Patchwork-Hint: ignore
Message-Id: <20211104122039.8261D8A558@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] {linux,
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

commit: https://git.buildroot.net/buildroot/commit/?id=76d7b6991c04ec43a127210d32e09608987325d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 377aa3b117e5845322e0619ae20f37f1331ec19e)
[Peter: drop 5.14.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 0a6f2c3bc7..1e8e3e6aed 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -125,7 +125,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.10.75" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.10.77" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.198-cip54" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.198-cip54-rt21" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index e7321b7eeb..83037f05e0 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,11 +1,11 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  0a2b2f5fefb90773190aaef4726ac363e03992aedc424b0a57eca092d084304b  linux-5.10.75.tar.xz
-sha256  cc0c0f902748d251cb22d0e69e3b8d260c447eb0072ef853da15da6cce775038  linux-5.4.155.tar.xz
+sha256  d3b64edfc1dd7212e62ed733aeeb73d64ffd6d9658d322d44cddf1b41d5b8fc3  linux-5.10.77.tar.xz
+sha256  9f3fbbbcb3c8a53e1cbed9ae6b06991ba618c1deeaef0a125ba9e82d8414864a  linux-5.4.157.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  33196aa3c0487d6d5be14c366fea1fb3d603d66efcf039746f77f3ef819be7bc  linux-4.4.289.tar.xz
-sha256  d44128674702529dd26214d6cd1c19542c37c5cc516f352bebbb78f0a9ed97c2  linux-4.9.287.tar.xz
-sha256  933bb2e9359165da8a7eb8ae8321e88e3e070c34b827d51937ff3ba443e15908  linux-4.14.252.tar.xz
-sha256  38f28c1cd6db0b54ee37a14fd17db651fe68704d08f95e141b14d32b872f4e98  linux-4.19.213.tar.xz
+sha256  70a7f59ab5755d746dd35d5bc09fe122348f15986d21283fb7a81105c7de6b51  linux-4.4.291.tar.xz
+sha256  a5c2d0fdd5b34aca1fb2d7bdce48a6a5a0fa85ad926e6d6d74df17fe30397fa6  linux-4.9.289.tar.xz
+sha256  dfd95c1bc3af5b0e57e53608f8356037510b19cb55cac520e43c3d499ea60d46  linux-4.14.254.tar.xz
+sha256  9e2064f9cb942999a76737d510f08a85bcd8164e9762ce0f7dbfeac58bc2f2b3  linux-4.19.215.tar.xz
 # Locally computed
 sha256  e6fc0a999a180ad272b08ff71cbc67f2d3fdc6773d4a8069aefb8781b8e07821  linux-cip-4.19.198-cip54.tar.gz
 sha256  449668d678e458ddaf30f944b7ca7f5ce6ea6664f57d43ea4eb90b176e03b9cb  linux-cip-4.19.198-cip54-rt21.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 14348f072c..569c3ee261 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -346,12 +346,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.289"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.287"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.252"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.213"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.155"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.75"	if BR2_KERNEL_HEADERS_5_10
+	default "4.4.291"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.289"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.254"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.215"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.157"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.77"	if BR2_KERNEL_HEADERS_5_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
