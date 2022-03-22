Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7266EC433F5
	for <buildroot@archiver.kernel.org>; Tue, 22 Mar 2022 08:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D42E40499;
	Tue, 22 Mar 2022 08:29:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sxr1Kx0NaCni; Tue, 22 Mar 2022 08:29:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C83D40360;
	Tue, 22 Mar 2022 08:29:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E8C701BF2CD
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 08:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6EEE40457
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 08:29:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nsi0Ox0pPNp7 for <buildroot@lists.busybox.net>;
 Tue, 22 Mar 2022 08:29:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8783740199
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 08:29:46 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 722DA6000A;
 Tue, 22 Mar 2022 08:29:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nWZtf-00928M-HB; Tue, 22 Mar 2022 09:29:43 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 22 Mar 2022 09:29:38 +0100
Message-Id: <20220322082939.2153092-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] {linux, linux-headers}: bump 4.{9, 14,
 19}.x / 5.{4, 10, 15, 16}.x series
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

4.4.x is now EOL, so no more updates for that series.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 14 +++++++-------
 package/linux-headers/Config.in.host | 14 +++++++-------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index f21beb4222..f25b662aa5 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -125,7 +125,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.15.26" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.15.30" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.104-cip3" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.104-cip3-rt3" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 976f1d07c0..87a0f0465b 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  bb5a1df15a10a715807a44872ff4fe775337aae445285181f1d1ba0c78b1d7f2  linux-5.16.12.tar.xz
-sha256  58122134f2613fcbb200bb2399ef2117852166a8e11eed4b632a86b20b6bbe3a  linux-5.15.26.tar.xz
-sha256  4fb8ad55e6430342e4fbc94d54e594e9be8eb6a8bea1d71eccf835948d08580a  linux-5.10.103.tar.xz
-sha256  b2f1201f64f010e9e3c85d6f303a559a7944a80a0244a86b8f5035bd23f1f40d  linux-5.4.182.tar.xz
+sha256  cca7d6e053e33f44af1b39f7becec73a387911d81ede5a84ecf671692533138f  linux-5.16.16.tar.xz
+sha256  254ea2fe08f0aa07e4f7fffe95d12463df7fa6ff8a9ba72f321da15e50fa7132  linux-5.15.30.tar.xz
+sha256  c467c3077946370fb26c9277313b601d6c48bb557abc889f4892caf627fcdfea  linux-5.10.107.tar.xz
+sha256  61f7cd24cb8a38d41891d9066c1dfd14a688a9dff7f485922e385654ea8b39b9  linux-5.4.186.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256  35017bb40b604e0b577fc2b87e727632b46608a2ba3a4f5858b9177f58f376b3  linux-4.4.302.tar.xz
-sha256  295e4bb3ba3244a9f4c48139ad13f78145f3e6402e11aa25b20aadb9ae9f2b25  linux-4.9.304.tar.xz
-sha256  03a65f405c3acae4dd8cd952444b7cd931f972c01a42e20a471319a2f6c018d2  linux-4.14.269.tar.xz
-sha256  4fcfe814780d63dc56e907bf41596ff162e9601978bdc1a60eab64cc3903a22c  linux-4.19.232.tar.xz
+sha256  47470f83aa64e0098830a53176c959740742973663fead7ca7cc7b84e1f9d0f7  linux-4.9.307.tar.xz
+sha256  9b6178099cf33c534c971f3f065c0debe92788f0f504d54badb2f8c2ee089d69  linux-4.14.272.tar.xz
+sha256  530c5ac848111bbf7d1ad407a4ce8173ef8f9a4554477a32c695c5a4eaf02598  linux-4.19.235.tar.xz
 # Locally computed
 sha256  63e6df81c4a747c60eed535ffc2f6f1ddb0c17ec349e860316d9a700c69ab38e  linux-cip-5.10.104-cip3.tar.gz
 sha256  9a45929d91ebaddbf6a0ef29750775e33d3c3f56f42f0a9e95e77e5b4eba3c6e  linux-cip-5.10.104-cip3-rt3.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 8cfbd41831..479f64b72e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -381,13 +381,13 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.4.302"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.304"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.269"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.232"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.182"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.103"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.26"	if BR2_KERNEL_HEADERS_5_15
-	default "5.16.12"	if BR2_KERNEL_HEADERS_5_16
+	default "4.9.307"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.272"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.235"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.186"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.107"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.30"	if BR2_KERNEL_HEADERS_5_15
+	default "5.16.16"	if BR2_KERNEL_HEADERS_5_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
