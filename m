Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09541EB64D8
	for <buildroot@archiver.kernel.org>; Thu, 22 Jun 2023 17:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D9F383BDC;
	Thu, 22 Jun 2023 17:24:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D9F383BDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ceA3V9k9A0dm; Thu, 22 Jun 2023 17:24:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA25483880;
	Thu, 22 Jun 2023 17:24:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA25483880
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C6E391BF4DA
 for <buildroot@lists.busybox.net>; Thu, 22 Jun 2023 17:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D57883AAC
 for <buildroot@lists.busybox.net>; Thu, 22 Jun 2023 17:24:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D57883AAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mMj7GjlDDDc2 for <buildroot@lists.busybox.net>;
 Thu, 22 Jun 2023 17:24:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0596A83880
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0596A83880
 for <buildroot@buildroot.org>; Thu, 22 Jun 2023 17:24:50 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0f96.dip0.t-ipconnect.de [91.58.15.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9CFB2A4C0103
 for <buildroot@buildroot.org>; Thu, 22 Jun 2023 19:24:46 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48920)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qCO33-00050I-3D
 for buildroot@buildroot.org; Thu, 22 Jun 2023 19:24:46 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 22 Jun 2023 19:24:45 +0200
Message-Id: <20230622172445.1854863-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1687454686;
 bh=soaZHW21nAhGV+XxfXiCfANX43GGP6aU0R7GbpXDNXo=;
 h=From:To:Subject:Date:From;
 b=qNvmxPpaqKAJ/LwxpRpFnrUWlofNNobZ/IRhaXoawMosZTa1qO9XEjqn3F5ZJCKHH
 WMsChVfcZZMeuZRsKHs6eWZcNKqyOmJ31nZ/YRIgcdeLMHeY6fkYEUKnjhoCezgn4p
 mOXucUuS0GKR6oq7Y+OR8eNUeYud/41mOgDt2k68Uu96JOeG4pO/odSvOJrDgPYtck
 Cjq2WADl/5HbhlZrlK1O5U1xjX12IFO/G34U60hKEt2cZickIIhKwzuQ7VLvK9iMS5
 8P6x0u6MxdcZuFi7qQua1DTuzhVNqi9KH6jykdtzit/V0kkWLe+Lj+3ZS718PLO81d
 V4+Q9vCPQcGTw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=qNvmxPpa
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 4.{14,
 19}.x / 5.{4, 10, 15}.x / 6.{1, 3}.x series
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 14 +++++++-------
 package/linux-headers/Config.in.host | 14 +++++++-------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 70591f4a25..315af971db 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.3.8" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.3.9" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index d90f6cb2a3..f49ab52afb 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  4323d421250e2e444c35d36f4aa8ddb56591dedc25c68d359d19c4ef9dd20955  linux-6.3.8.tar.xz
-sha256  b26f7cbcbf8031efc49f11f236f372fc34a4fd5fc6ad3151b893d1aa038ed603  linux-6.1.34.tar.xz
+sha256  41ecf21399b17ab85163750ba22347d09b54fa099b80b63d0e2ef0066129b13e  linux-6.3.9.tar.xz
+sha256  be368143bc5d0dc73dd3e8c6191630c1620520379baf6f47c16116b2c0bc26ac  linux-6.1.35.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  a9a8331f3c0e004b40a41f30d688b53bf85405597ac41c2c89be7f4fbcf7239f  linux-5.15.117.tar.xz
-sha256  77a9bebc1d1fa057212a3ac62c2a0784aafcdef149032df8898ebc9ed3c62908  linux-5.10.184.tar.xz
-sha256  33010d4f02314dd4eb51ab5d09f49ce970f2cfefe9f2133a2e085cac5dfffed7  linux-5.4.247.tar.xz
+sha256  4e6bf4dadb04d5d11d1d4cc37c0eabcf33bc333b7dd3dc2143c3099a823eb5b3  linux-5.15.118.tar.xz
+sha256  280662ec8dc8738cf947ad66e748141abd58cbe3b5ed66b7f2b153222b7c7090  linux-5.10.185.tar.xz
+sha256  3abed132e76c6575733acba39eaa54f6d8f4b1dc951b0e601a33959743b13e35  linux-5.4.248.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  47841504f334b24fe411270954423202ed84e21251edf5a61d40bde59051089d  linux-4.19.286.tar.xz
-sha256  c63a327e799b8a30ca96167f66100d4d7788338ac0a8cf5fc492c97e303211bc  linux-4.14.318.tar.xz
+sha256  286a9b8c75bff7bdf66985e12a3a650b2bd638a776a5a6e93415930855662a73  linux-4.19.287.tar.xz
+sha256  aca4750f02f4090b753c1445db44dfa90de535eca73a7b0a7aa4453f65ba1ff9  linux-4.14.319.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 5b16e659df..10e33a7306 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -396,13 +396,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.14.318"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.286"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.247"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.184"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.117"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.34"	if BR2_KERNEL_HEADERS_6_1
-	default "6.3.8"		if BR2_KERNEL_HEADERS_6_3
+	default "4.14.319"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.287"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.248"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.185"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.118"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.35"	if BR2_KERNEL_HEADERS_6_1
+	default "6.3.9"		if BR2_KERNEL_HEADERS_6_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
