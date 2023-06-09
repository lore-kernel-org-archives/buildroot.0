Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96378C7EE29
	for <buildroot@archiver.kernel.org>; Fri,  9 Jun 2023 14:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C04F542512;
	Fri,  9 Jun 2023 14:40:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C04F542512
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H8jqvSNswNY3; Fri,  9 Jun 2023 14:40:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 868AD424FC;
	Fri,  9 Jun 2023 14:40:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 868AD424FC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 502381BF2FC
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 14:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A628408C8
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 14:40:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A628408C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tze0aiJuWcFr for <buildroot@lists.busybox.net>;
 Fri,  9 Jun 2023 14:40:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D066441528
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D066441528
 for <buildroot@buildroot.org>; Fri,  9 Jun 2023 14:40:30 +0000 (UTC)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
 by mailout09.t-online.de (Postfix) with SMTP id 951052866A
 for <buildroot@buildroot.org>; Fri,  9 Jun 2023 16:40:27 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd71.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q7dHv-2oUdA90; Fri, 9 Jun 2023 16:40:27 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:38392)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q7dHv-0003UF-08
 for buildroot@buildroot.org; Fri, 09 Jun 2023 16:40:27 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Fri,  9 Jun 2023 16:40:26 +0200
Message-Id: <20230609144026.56039-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686321627-4D3BE3BC-18E38583/0/0 CLEAN NORMAL
X-TOI-MSGID: f097b6da-1680-40ea-b103-7ff3b0c1c83f
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

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 14 +++++++-------
 package/linux-headers/Config.in.host | 14 +++++++-------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index b4d32f6ea3..69bf91bbf9 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.3.6" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.3.7" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 18ede2d60f..20e67fc4d1 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  7a6a1f0dfa0bf7f45f9d4a7b409315cf32267850adab4db033a17de0320a24ef  linux-6.3.6.tar.xz
-sha256  7c88b7a09ba2b9e47b78eba2b32b1db6a4d89636f7ddd586545f9671a2521a6c  linux-6.1.32.tar.xz
+sha256  fe369743996c522a7b473e99dcf8f88847bd5cc88546fd3b7a41d9fe5a5b97a9  linux-6.3.7.tar.xz
+sha256  b87d6ba8ea7328e8007a7ea9171d1aa0d540d95eacfcab09578e0a3b623dd2cd  linux-6.1.33.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  1b076860779235e90519e867c1ec78c7a34d1125d8fdba787ff495c7c14f1214  linux-5.15.115.tar.xz
-sha256  de8ec58929460e3a14c1b0502f4a449f24c988a7a4a03ff04a82fb2d665fe9f6  linux-5.10.182.tar.xz
-sha256  9607881878fbd21e0dec4e8192b0f6352d17fd74c3ec23ffe6b0a24093efb1a4  linux-5.4.245.tar.xz
+sha256  f617c9d1bb5326cc93495938f43eb8cb9aea9d2f451e5a99bce2893f296e179a  linux-5.15.116.tar.xz
+sha256  409497c635caf49614de21950ec091eb621a5d5fe1f63fc418ef68ac38b56119  linux-5.10.183.tar.xz
+sha256  0938790a858fd0af6aa6b27a3bdf4c5d4a46aba60e6178156980d58bef7ed9ea  linux-5.4.246.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  7fb9ee20c7e52f9be6d9f501e8498a22f4b364abfde136143749a77e597fd03e  linux-4.19.284.tar.xz
-sha256  ac8318f1c1d387e23ccfa760ec042943372df23e3c4e2408177fb5a3f6488f76  linux-4.14.316.tar.xz
+sha256  aaa1775359c7a066ec70852ea2709fe7e7109517b7d895f34e237132db8edc16  linux-4.19.285.tar.xz
+sha256  8cf28f5aae6f77fa718861c415d646a189a7f9493ef0ccb461575a092af03c30  linux-4.14.317.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index f9a164d78d..00ec22d606 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -396,13 +396,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.14.316"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.284"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.245"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.182"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.115"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.32"	if BR2_KERNEL_HEADERS_6_1
-	default "6.3.6"		if BR2_KERNEL_HEADERS_6_3
+	default "4.14.317"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.285"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.246"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.183"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.116"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.33"	if BR2_KERNEL_HEADERS_6_1
+	default "6.3.7"		if BR2_KERNEL_HEADERS_6_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
