Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD2FC61DA4
	for <buildroot@archiver.kernel.org>; Tue, 14 Feb 2023 17:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A25F40B91;
	Tue, 14 Feb 2023 17:16:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A25F40B91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JBEqAqYdQ8_L; Tue, 14 Feb 2023 17:16:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24E3140B8C;
	Tue, 14 Feb 2023 17:16:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24E3140B8C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 84D0F1BF94D
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 17:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5FF3240B8A
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 17:16:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FF3240B8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4VmeSoPFyOT8 for <buildroot@lists.busybox.net>;
 Tue, 14 Feb 2023 17:16:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72F1C40B8C
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 17:16:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72F1C40B8C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5C23B85E9F; Tue, 14 Feb 2023 17:16:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Feb 2023 18:11:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 86a3bd33c2d52b2d3e014913857abaa7f24f428c
X-Git-Newrev: 36a8be4770d93c0a4346008c56f6ab6862b9b509
X-Patchwork-Hint: ignore
Message-Id: <20230214171654.5C23B85E9F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 4.{14,
 19}.x / 5.{4, 10, 15}.x / 6.1.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=36a8be4770d93c0a4346008c56f6ab6862b9b509
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

4.9.x / 6.0.x is now EOL.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 774f1e0975..11dc5cce07 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.1.9" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.1.11" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index e88abe5bb8..f797d5a61a 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,14 +1,14 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  d60cf185693c386e7acd9f3eb3a94ae30ffbfee0a9447a20e83711e0bdf5922b  linux-6.1.9.tar.xz
+sha256  581b0560077863c5116512c0b5fd93b97814092c80e6ebebabe88101949af7a1  linux-6.1.11.tar.xz
 sha256  abe37eb0e2e331bdc7c4110115664e180e7d43b7336de6b4cd2bd1b123d30207  linux-6.0.19.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  a63c2bb1beb15f1aea9c63cf80559f5b7ab58afd2da2fa5e7670c515ebe1fe80  linux-5.15.91.tar.xz
-sha256  0051a1780e5bda0efc68dafab7c728b8283d2b028fedb439418f478be7d3e1af  linux-5.10.166.tar.xz
-sha256  a74fd32ccc1025b72f3ba7183208761f7c6190fb96e8f484f6d543a5a183e62f  linux-5.4.230.tar.xz
+sha256  e7ed24f2690bf0e11158ccfa8ddc5c0e8a4816d83c4055d205218853da9c5dad  linux-5.15.93.tar.xz
+sha256  d807f97812e566410cd13b3170009e0d7552748d4f22d608ffd4dbd7f85bf9c6  linux-5.10.167.tar.xz
+sha256  8dd0ea7f1db4c1e89d485255798e3c3dfb9be63c0f2af369912a1a37b75f36a8  linux-5.4.231.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256  5385aaec55c766e3f462511453f5c63d7898b2d0e9ea74f22a23ebbedab0b3c6  linux-4.9.337.tar.xz
-sha256  64cbb234e46c196bc12bde74b233c7d3cb3b68d9c8ed48bf06715bd0f5c549d5  linux-4.14.304.tar.xz
-sha256  636d3f9cb48eaf06df14e56bd9d57bfc7c1b5952a75b9f841d41a43b75829d1a  linux-4.19.271.tar.xz
+sha256  a35bcde16b13aa423a1822675775a1b0abf17f5392454febabd8c3757187959a  linux-4.14.305.tar.xz
+sha256  489fb9368bd7ab808264dea1a4acdf607f057bf1ba19f647a17aa18d08f313f9  linux-4.19.272.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 1146231e41..8a76f93d62 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -394,13 +394,13 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.9.337"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.304"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.271"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.230"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.166"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.91"	if BR2_KERNEL_HEADERS_5_15
+	default "4.14.305"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.272"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.231"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.167"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.93"	if BR2_KERNEL_HEADERS_5_15
 	default "6.0.19"	if BR2_KERNEL_HEADERS_6_0
-	default "6.1.9"		if BR2_KERNEL_HEADERS_6_1
+	default "6.1.11"	if BR2_KERNEL_HEADERS_6_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
