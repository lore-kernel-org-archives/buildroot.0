Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4821DC43334
	for <buildroot@archiver.kernel.org>; Mon, 11 Jul 2022 14:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9112415A1;
	Mon, 11 Jul 2022 14:01:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9112415A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CgLTYx4RBzwA; Mon, 11 Jul 2022 14:00:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BA9140996;
	Mon, 11 Jul 2022 14:00:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BA9140996
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F02691BF2B8
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 14:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA3F24014B
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 14:00:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA3F24014B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sZvAu_L97hyx for <buildroot@lists.busybox.net>;
 Mon, 11 Jul 2022 14:00:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB1D9400E5
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB1D9400E5
 for <buildroot@buildroot.org>; Mon, 11 Jul 2022 14:00:54 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1BF5F100013;
 Mon, 11 Jul 2022 14:00:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1oAtxx-001Ock-I9; Mon, 11 Jul 2022 16:00:49 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Jul 2022 16:00:47 +0200
Message-Id: <20220711140048.332934-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] {linux, linux-headers}: bump 4.{9, 14,
 19}.x / 5.{4, 10, 15, 17}.x series
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

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 14 +++++++-------
 package/linux-headers/Config.in.host | 14 +++++++-------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index e4922fd44e..de9bf0ad7a 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.17.13" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.17.15" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.115-cip7" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.109-cip5-rt4" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 9e4c41d94f..c8707ac711 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  ea47fd08a16bd9001aacc8b88abd24af489bd87a364dd0545e0b6823a68bef53  linux-5.17.13.tar.xz
-sha256  b2390d7d977c66036ef0ceb294e408f2bdaab6dfeeb8ff4f4e0a84b71f8d8754  linux-5.15.45.tar.xz
-sha256  5b7a756004158ece2f5e41795ba523ec201743a736e34ce41cbe09177f7d0e8b  linux-5.10.120.tar.xz
-sha256  c2ad17b3fc70cd05d9e0766abe9b5aa9409fc2cc86a200eaa57c8f837afe36a8  linux-5.4.197.tar.xz
+sha256  4a1c922a490eeabf5b44d4fde36de9ba5b71711b7352c6258716da41160db628  linux-5.17.15.tar.xz
+sha256  f3aa717243051f3fcca90ebfe26fe5c3a596c2f6047846e8d1724ea90df77b07  linux-5.15.53.tar.xz
+sha256  aae72f052b80858f77d40009faf9ccf09c38c8b33f56346d16c05f7e6a429cfe  linux-5.10.129.tar.xz
+sha256  fdc1b10a19d85b37eb0957ddd81acec1d5484f36c496493d8cdad75278737a47  linux-5.4.204.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  7ea3369b915c99b38528dbf68c491f3f9324b2f4e56eac980dd7524d2fc30d1b  linux-4.9.317.tar.xz
-sha256  6637c8470c3093a477d2de6fa9e0f63c55810438a411c73bcd723634371657a3  linux-4.14.282.tar.xz
-sha256  00ad2f5a36c91221a2ade0078b93bf84b60d494bd1ef51eaccb5bdb6277dba3a  linux-4.19.246.tar.xz
+sha256  621978d371b8f0a64e28e3b734af74d5a8d99b81298a99f336b17883e3a4e409  linux-4.9.322.tar.xz
+sha256  78b5494c205d9839b1905b2553c22596dee57c87586a8124186415c8b8f8f616  linux-4.14.287.tar.xz
+sha256  3787c8adccea6e35928dea855af0eb2e849966553505448972d6b3cf037acaf4  linux-4.19.251.tar.xz
 # Locally computed
 sha256  f3559be277be9200897022282be18cfc0278d1d8baec8058305b04b9cd72002a  linux-cip-5.10.115-cip7.tar.gz
 sha256  71fba4ed5cb48fa7869e9fe271b68b77fed26775ce5cf2f50891aa8f71c388b3  linux-cip-5.10.109-cip5-rt4.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index d17686be4c..678c3d35f7 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -379,13 +379,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.9.317"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.282"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.246"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.197"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.120"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.45"	if BR2_KERNEL_HEADERS_5_15
-	default "5.17.13"	if BR2_KERNEL_HEADERS_5_17
+	default "4.9.322"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.287"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.251"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.204"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.129"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.53"	if BR2_KERNEL_HEADERS_5_15
+	default "5.17.15"	if BR2_KERNEL_HEADERS_5_17
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
