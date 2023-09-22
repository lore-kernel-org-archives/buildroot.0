Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A2EE81A60
	for <buildroot@archiver.kernel.org>; Fri, 22 Sep 2023 19:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7EEC61468;
	Fri, 22 Sep 2023 19:33:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7EEC61468
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fq53Gtv0FsEO; Fri, 22 Sep 2023 19:33:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F62D61687;
	Fri, 22 Sep 2023 19:33:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F62D61687
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AED381BF21A
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 19:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87D7B40535
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 19:33:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87D7B40535
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fuSCP9WT09Zs for <buildroot@lists.busybox.net>;
 Fri, 22 Sep 2023 19:33:34 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9052B40146
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 19:33:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9052B40146
Received: from fli4l.lan.fli4l (p5b3a0af9.dip0.t-ipconnect.de [91.58.10.249])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B6633A4C00E5;
 Fri, 22 Sep 2023 21:33:32 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44318)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qjlu8-0003tt-1b;
 Fri, 22 Sep 2023 21:33:32 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 22 Sep 2023 21:33:30 +0200
Message-Id: <20230922193332.2345183-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1695411212;
 bh=1ftWLEYIl/5nA+I1G7nNV/CLfrPN3ALrbbWX1O5kdW8=;
 h=From:To:Cc:Subject:Date:From;
 b=nzdVJ9ieYAyBOS2D+D6xY9vN89okQTOCGKUVU2r1dQ4eE3a1GE2Veo2vb7AWB1MEZ
 7BoEubMiO4ZIHFFQugO2RFrGu4lOwK45MCCQw02pRYimK/HY3Ben8ZDHoCq67DLW6S
 rWhx7UE9q+hLQfy2tqEPaW92XTFfio3fl2e3JC6gM0j1ZlyOA/twBXWTpurtwHstc/
 znBbmtNYknh/WiSO5qw8fHeYFDOtR7F0kAFXIlKznVGaVaPgkUwmmkDnhUQEtqrK3z
 7+3LEeeycmnaolWJWAYTcYth4UAvuXRCOvG3gfPQpPEAjcxH2Fpid5tZk46Y86zVGi
 vB3/Yy93wHHdA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=nzdVJ9ie
Subject: [Buildroot] [PATCH 1/3] {linux, linux-headers}: bump 5.{10,
 15}.x / 6.{1, 4}.x series
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 90ab048055..7ddcf013f8 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.4.14" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.4.16" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index d62fc7de09..ecd3492c43 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,9 +1,9 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  75eae323747ae37b05086c5a51326a744eb611b0e890e7ebe77de362b30450e6  linux-6.4.14.tar.xz
-sha256  58b0446d8ea4bc0b26a35e2e3509bd53efcdeb295c9e4f48d33a23b1cdaa103b  linux-6.1.51.tar.xz
+sha256  9626ec84a39ecb009bf11a271dd520941159c165d4e62f82e3a77b79d20ff27d  linux-6.4.16.tar.xz
+sha256  a3181e46d407cd6ab15f412402e8220684ff9659b0262b7a3de7384405ce4e27  linux-6.1.54.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  ab464e4107329ff5262f1c585c40fc29dc68f17687a9a918f3e90faba5303d62  linux-5.15.130.tar.xz
-sha256  240d5e47bb378c6813ecd07704fb887651ea7617159d2771071fd70bf33cd995  linux-5.10.194.tar.xz
+sha256  4177b5c4d6e749bb8339ac4aa68eb0932ead9490b956a80d9a597089959618ac  linux-5.15.132.tar.xz
+sha256  71ec2e3af082bcd7c4aac4b8ecdbc2e47695befe4984e3e5567791a605a96fc0  linux-5.10.196.tar.xz
 sha256  c7a4086ba23507b8539d18534565de0d6591138bfa2e449e93964fd5132e353a  linux-5.4.256.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256  ccadbde939a788934436125a1ecd4464175b68ebe6c18072fbc90c8596eea00f  linux-4.19.294.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 7e67dfad5c..3eb47e315b 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -403,10 +403,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.14.325"	if BR2_KERNEL_HEADERS_4_14
 	default "4.19.294"	if BR2_KERNEL_HEADERS_4_19
 	default "5.4.256"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.194"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.130"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.51"	if BR2_KERNEL_HEADERS_6_1
-	default "6.4.14"	if BR2_KERNEL_HEADERS_6_4
+	default "5.10.196"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.132"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.54"	if BR2_KERNEL_HEADERS_6_1
+	default "6.4.16"	if BR2_KERNEL_HEADERS_6_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
