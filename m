Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73EEAC54E60
	for <buildroot@archiver.kernel.org>; Sun, 17 Mar 2024 14:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4338881763;
	Sun, 17 Mar 2024 14:37:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ag5AHrgGpiFU; Sun, 17 Mar 2024 14:37:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4592281765
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4592281765;
	Sun, 17 Mar 2024 14:37:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 126F21BF303
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 14:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0053E404E9
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 14:37:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eTXdy7lG5Xw5 for <buildroot@lists.busybox.net>;
 Sun, 17 Mar 2024 14:37:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3724040350
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3724040350
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 14:37:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3121082792; Sun, 17 Mar 2024 14:37:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 17 Mar 2024 13:51:36 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 55f1c453b2f68f8a27c7f2fb5cf669473dde8d4d
X-Git-Newrev: ec409c8221f3e58b19768cab746ad4236bdfe950
X-Patchwork-Hint: ignore
Message-Id: <20240317143733.3121082792@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] {linux,
 linux-headers}: bump 4.19.x / 5.{4, 10, 15}.x / 6.{1, 6}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=ec409c8221f3e58b19768cab746ad4236bdfe950
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 05ca551c3b4b88c7a97cfc7a8dc3971ecd33c7de)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 773cb4fbb5..07d6b2b5ec 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.6.16" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.6.18" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 35e04a38b5..9b726ef7da 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  b21d5795a3bead4f112916423222faa8a0f519e4201df343e3eb88dc9e4aaa30  linux-6.6.16.tar.xz
+sha256  4e43d8c5fba14f7c82597838011648056487b7550fd83276ad534559e8499b1d  linux-6.6.18.tar.xz
 sha256  78fbd43822f4c56bc16e89e8874767f592532e1a0ffcd1af4dd279559b5fcbb5  linux-6.5.13.tar.xz
-sha256  3b54ec567716cdfb3618caf38c58a8aab1372cc41c16430633febe9ccdb3f91d  linux-6.1.77.tar.xz
+sha256  faa49ca22fb55ed4d5ca2a55e07dd10e4e171cfc3b92568a631453cd2068b39b  linux-6.1.79.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  c48575c97fd9f4767cbe50a13b1b2b40ee42830aba3182fabd35a03259a6e5d8  linux-5.15.148.tar.xz
-sha256  44e22fad647c638726a8eae23703c4263bead612d17c89ca7ad7ab32b5ce88d5  linux-5.10.209.tar.xz
-sha256  afc8aca6cb56fea489f6508bc24357df1cf8a8f3d7dcfbcccd94b7f968492620  linux-5.4.268.tar.xz
+sha256  bd84809a367eb400eb04e0e70294e6ba12fc03b6bfb5a7dfaca548f8947501b0  linux-5.15.149.tar.xz
+sha256  4ea63c5a90fdc3c459ab35c11ee8c93d2364a7cdbfb101100f8cab70d490ef6d  linux-5.10.210.tar.xz
+sha256  ff54bec6d053c7994f3bb8c45021de2858ff9f740d2ccbbcf072b87821a918cf  linux-5.4.269.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  b91be40fa61ff7d42958e2154a4b7602dc071982128b9b58b6d911dec111be19  linux-4.19.306.tar.xz
+sha256  83eeff613405d0045d0f717c6ac14c178678fe0a163c41d9dd8878ac0f73e352  linux-4.19.307.tar.xz
 sha256  0820fdb7971c6974338081c11fbf2dc869870501e7bdcac4d0ed58ba1f57b61c  linux-4.14.336.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 1447c4aa30..b974ab298e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -413,13 +413,13 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.14.336"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.306"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.268"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.209"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.148"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.77"	if BR2_KERNEL_HEADERS_6_1
+	default "4.19.307"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.269"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.210"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.149"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.79"	if BR2_KERNEL_HEADERS_6_1
 	default "6.5.13"	if BR2_KERNEL_HEADERS_6_5
-	default "6.6.16"	if BR2_KERNEL_HEADERS_6_6
+	default "6.6.18"	if BR2_KERNEL_HEADERS_6_6
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
