Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59ECAC433FE
	for <buildroot@archiver.kernel.org>; Fri, 14 Oct 2022 15:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2DC5414EB;
	Fri, 14 Oct 2022 15:19:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2DC5414EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4udB_lbbk0RP; Fri, 14 Oct 2022 15:19:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3BE9411A1;
	Fri, 14 Oct 2022 15:19:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3BE9411A1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9D3C91BF2EA
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 15:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7805E411A1
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 15:19:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7805E411A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mCk1vW4yEYSx for <buildroot@lists.busybox.net>;
 Fri, 14 Oct 2022 15:19:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E985340C57
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E985340C57
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 15:19:27 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (unknown [217.70.183.196])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id BBB03D15E1
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 15:10:37 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B6540E0005;
 Fri, 14 Oct 2022 15:10:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1ojMKT-00G7zs-Iz; Fri, 14 Oct 2022 17:10:29 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 14 Oct 2022 17:10:27 +0200
Message-Id: <20221014151028.3843939-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] {linux, linux-headers}: bump 4.{9, 14,
 19}.x / 5.{4, 10, 15}.x / 6.0.x series
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
 linux/linux.hash                     | 15 +++++++--------
 package/linux-headers/Config.in.host | 16 ++++++++--------
 3 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index f9caa3c652..ee59761f33 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.0" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.0.1" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.145-cip17" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.145-cip17-rt7" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 07963f185e..e1fd0feb44 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,15 +1,14 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  5c2443a5538de52688efb55c27ab0539c1f5eb58c0cfd16a2b9fbb08fd81788e  linux-6.0.tar.xz
+sha256  8ede745a69351ea0f27fe0c48780d4efa37ff086135e129358ce09694957e8f9  linux-6.0.1.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  4ecdb8b59c6f6f258d89cbf22eede210e0a55c09db884988fe706efe2fe8f148  linux-5.19.13.tar.xz
-sha256  4a1c922a490eeabf5b44d4fde36de9ba5b71711b7352c6258716da41160db628  linux-5.17.15.tar.xz
+sha256  4686e33847db3ec58e1043bc0c806472aae694b2c413bb7d8da91a5c9a55eb1b  linux-5.19.15.tar.xz
 sha256  da47d9a80b694548835ccb553b6eb1a1f3f5d5cddd9e2bd6f4886b99ca14f940  linux-5.15.67.tar.xz
-sha256  3f47ebdb9afe152a0c32c1157336ef13fa5cc08ac6d884dfc1f6ddc2b7dba268  linux-5.10.142.tar.xz
-sha256  09c72e3dd85df773eb52e53e25c556d132958bd775b0ed6985a6b1ac21c9cfc2  linux-5.4.212.tar.xz
+sha256  85253abf097eb5013b988a400eb022eed0e0626e7e0a7daa3ab4b6bcabbced9a  linux-5.10.147.tar.xz
+sha256  2bb826cdf9b2cfce385fb5d51fc8070fe428e467bd3df4ae2a7eb6f0c0cc2e63  linux-5.4.217.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  2283c1af5373c43e79adca6987174d932989a8b2551405e83e2e39ebe31e06d2  linux-4.9.327.tar.xz
-sha256  70f4df21901a654632ebbb533884ccaf117a29b14e6f2b672f0c36613c3e897d  linux-4.14.292.tar.xz
-sha256  eadd13aa70f37cdf50eef45c5964bd7146d353b61a1fd026d4fa0b2a68a3ea47  linux-4.19.257.tar.xz
+sha256  bf021936a450e9292e10cc7db9909cd0d336406191d22aadd22bdcc51ca2595f  linux-4.9.330.tar.xz
+sha256  62ccb9ba94a7da5115bc923eebf8dffee9229801da02be87d90ae68ab9a76a6b  linux-4.14.295.tar.xz
+sha256  bec33298bd0470b5e725c7dc29a2dd4daf02065cb01cd4a54f6adee6ff582cb2  linux-4.19.261.tar.xz
 # Locally computed
 sha256  4594c147bdc493c7c286688542bbe65e550fb7bd58e0649ec587a2fe893ec0ee  linux-cip-5.10.145-cip17.tar.gz
 sha256  a5598f7f673b3ef819d6ed24f08d539eecb6febd11673a1d4752a1c05d4ee289  linux-cip-5.10.145-cip17-rt7.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 7aee67de56..8679241a2c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -392,14 +392,14 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.9.327"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.292"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.257"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.212"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.142"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.67"	if BR2_KERNEL_HEADERS_5_15
-	default "5.19.13"	if BR2_KERNEL_HEADERS_5_19
-	default "6.0"		if BR2_KERNEL_HEADERS_6_0
+	default "4.9.330"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.295"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.261"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.217"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.147"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.73"	if BR2_KERNEL_HEADERS_5_15
+	default "5.19.15"	if BR2_KERNEL_HEADERS_5_19
+	default "6.0.1"		if BR2_KERNEL_HEADERS_6_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
