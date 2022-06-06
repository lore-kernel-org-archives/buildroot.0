Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9ECC43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 09:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54A27840F0;
	Mon,  6 Jun 2022 09:49:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hzimXDyvwJo9; Mon,  6 Jun 2022 09:49:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58FC0840CD;
	Mon,  6 Jun 2022 09:49:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A1CBF1BF3C6
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 09:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9EBC5416F7
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 09:49:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LdZHiV_pIW4h for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 09:49:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86771416EA
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 09:49:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A2BD586C91; Mon,  6 Jun 2022 09:37:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Jun 2022 11:48:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fb3fbb261b809cf8ce2d9b16984f0dffbc0c1147
X-Git-Newrev: 3176d9febb1b0b47c7f7b8be0c9a4e6f8d88dbc9
X-Patchwork-Hint: ignore
Message-Id: <20220606093721.A2BD586C91@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 4.{9, 14,
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3176d9febb1b0b47c7f7b8be0c9a4e6f8d88dbc9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 14 +++++++-------
 package/linux-headers/Config.in.host | 14 +++++++-------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index fd3605a559..b2da6dffd9 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.17.7" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.17.13" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.104-cip3" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.104-cip3-rt3" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 3190813a0c..ab7bc0ebae 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  22f67ef6b12ef6c0c0353be4b90b4bf4b9b18b858c16c346fa495b67ec718c99  linux-5.17.7.tar.xz
-sha256  888641634f9e0e38cd0efcfec92ea3c126d381b24a514740d3fe3dc9988fd7ad  linux-5.15.39.tar.xz
-sha256  f5e417b32f89318b6d0a230109a592ffd68997817463dc4692fa49ec7fe42f71  linux-5.10.115.tar.xz
-sha256  0d16d343956d311e3f4ab3f032fd626d8e6b67c0db94edd32f561407d374f2a0  linux-5.4.193.tar.xz
+sha256  ea47fd08a16bd9001aacc8b88abd24af489bd87a364dd0545e0b6823a68bef53  linux-5.17.13.tar.xz
+sha256  b2390d7d977c66036ef0ceb294e408f2bdaab6dfeeb8ff4f4e0a84b71f8d8754  linux-5.15.45.tar.xz
+sha256  5b7a756004158ece2f5e41795ba523ec201743a736e34ce41cbe09177f7d0e8b  linux-5.10.120.tar.xz
+sha256  c2ad17b3fc70cd05d9e0766abe9b5aa9409fc2cc86a200eaa57c8f837afe36a8  linux-5.4.197.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  e03b777861fae559cb7ed635500cde305bc2ca34dee4dc2fe806de0060c87bdc  linux-4.9.313.tar.xz
-sha256  3cd6d4eeb3a5d1c906b35c08f0d602f329410c291233bee1a7a2b168c7378bbe  linux-4.14.278.tar.xz
-sha256  59bcfd094ec26b03ca506199224cff53c13325e62d22bd4e31ef4ccafe7265a2  linux-4.19.242.tar.xz
+sha256  7ea3369b915c99b38528dbf68c491f3f9324b2f4e56eac980dd7524d2fc30d1b  linux-4.9.317.tar.xz
+sha256  6637c8470c3093a477d2de6fa9e0f63c55810438a411c73bcd723634371657a3  linux-4.14.282.tar.xz
+sha256  00ad2f5a36c91221a2ade0078b93bf84b60d494bd1ef51eaccb5bdb6277dba3a  linux-4.19.246.tar.xz
 # Locally computed
 sha256  63e6df81c4a747c60eed535ffc2f6f1ddb0c17ec349e860316d9a700c69ab38e  linux-cip-5.10.104-cip3.tar.gz
 sha256  9a45929d91ebaddbf6a0ef29750775e33d3c3f56f42f0a9e95e77e5b4eba3c6e  linux-cip-5.10.104-cip3-rt3.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 859f772624..d17686be4c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -379,13 +379,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.9.313"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.278"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.242"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.193"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.115"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.39"	if BR2_KERNEL_HEADERS_5_15
-	default "5.17.7"	if BR2_KERNEL_HEADERS_5_17
+	default "4.9.317"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.282"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.246"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.197"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.120"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.45"	if BR2_KERNEL_HEADERS_5_15
+	default "5.17.13"	if BR2_KERNEL_HEADERS_5_17
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
