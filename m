Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52DF3C433F5
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:57:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE301604D2
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:57:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EE301604D2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B65C760B0A;
	Wed,  3 Nov 2021 21:57:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xfcWcKvy7gtq; Wed,  3 Nov 2021 21:57:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 137CC60B01;
	Wed,  3 Nov 2021 21:57:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 713D41BF38A
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E1BB60B01
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:57:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WMIyJAHiIP7K for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 21:57:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE69A60AED
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 21:57:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0153F8A4F6; Wed,  3 Nov 2021 21:53:19 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 3 Nov 2021 22:56:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e444baf8164094df4cbd0b8becbc2fa597cb950f
X-Git-Newrev: 377aa3b117e5845322e0619ae20f37f1331ec19e
X-Patchwork-Hint: ignore
Message-Id: <20211103215320.0153F8A4F6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 4.{4, 9, 14,
 19}.x / 5.{4, 10, 14}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=377aa3b117e5845322e0619ae20f37f1331ec19e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/linux.hash                     | 14 +++++++-------
 package/linux-headers/Config.in.host | 14 +++++++-------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 32fe47d096..dca42d33aa 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  57b2cf6991910e3b67a1b3490022e8a0674b6965c74c12da1e99d138d1991ee8  linux-5.15.tar.xz
-sha256  4dff4e96d4052195002538027f8a810411ba6116a41bff5575952702d509d06a  linux-5.14.14.tar.xz
-sha256  0a2b2f5fefb90773190aaef4726ac363e03992aedc424b0a57eca092d084304b  linux-5.10.75.tar.xz
-sha256  cc0c0f902748d251cb22d0e69e3b8d260c447eb0072ef853da15da6cce775038  linux-5.4.155.tar.xz
+sha256  c30dcbb1f884b94c80eab001339a6df5de46651f976460cdd213b6e2858ebc00  linux-5.14.16.tar.xz
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
index 3a25667ea0..38cb274066 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -374,13 +374,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.289"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.287"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.252"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.213"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.155"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.75"	if BR2_KERNEL_HEADERS_5_10
-	default "5.14.14"	if BR2_KERNEL_HEADERS_5_14
+	default "4.4.291"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.289"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.254"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.215"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.157"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.77"	if BR2_KERNEL_HEADERS_5_10
+	default "5.14.16"	if BR2_KERNEL_HEADERS_5_14
 	default "5.15"		if BR2_KERNEL_HEADERS_5_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
