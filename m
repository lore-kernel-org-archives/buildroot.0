Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899DFCD5BB8
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 19:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3875B40DF9;
	Thu,  5 Sep 2024 19:40:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JuFp2SXaCfbB; Thu,  5 Sep 2024 19:40:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4E5540A56
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4E5540A56;
	Thu,  5 Sep 2024 19:40:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E5E591BF423
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 19:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E042F40175
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 19:40:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 16OwuyPpXyoP for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 19:40:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A88DA40391
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A88DA40391
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 19:40:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 243D686DE6; Thu,  5 Sep 2024 19:40:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Sep 2024 21:40:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6a506262e4d7bb1b0bc3b9ab3de9f14dfebd78dc
X-Git-Newrev: f18790aedc9da2d42d94c28f7293b4251cddb5cb
X-Patchwork-Hint: ignore
Message-Id: <20240905194036.243D686DE6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 4.19.x / 5.{4,
 10, 15}.x / 6.{1, 6, 10}.x series
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f18790aedc9da2d42d94c28f7293b4251cddb5cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 14 +++++++-------
 package/linux-headers/Config.in.host | 14 +++++++-------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 526dd9ff00..e38f8104e0 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -134,7 +134,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.10.7" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.10.8" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index ebaad029b8..ffc25f7959 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  900d567ff01824708ce24c3b37faaef03e6f6145411dd447a6ff2edc8c5db3a9  linux-6.10.7.tar.xz
-sha256  6b16df7b2aba3116b78fdfd8aea0b6cd7abe8f0cb699b04a66d3169141772029  linux-6.6.48.tar.xz
-sha256  f43229d1d73011fa0a37400320a26972946f8ff295c404c31c0dd0407228b0e8  linux-6.1.107.tar.xz
+sha256  c0923235779d4606bba87f72b6fe11f796e9e40c1ca9f4d5dbe04cd47ee3c595  linux-6.10.8.tar.xz
+sha256  2c56dac2b70859c16b4ef651befb0d28c227498bd3eee08e8a45a357f22dd3b7  linux-6.6.49.tar.xz
+sha256  3f4e4e89a00e221a6dd1174779e0028794f44f4624ad6a31c79f3b7796688ca2  linux-6.1.108.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  a36dd3e82ceb634afded31f2656568f57c4d9c4b399859f298b18116df11c6fe  linux-5.15.165.tar.xz
-sha256  19b099c67324bba6378e22dc51ad3906e4dcd6a908d137766b4bfa9174ddd11a  linux-5.10.224.tar.xz
-sha256  5582770976d33bb7bf9494e0fa0c49f449aa02b0133d00a5a198b6c208dd7de0  linux-5.4.282.tar.xz
+sha256  e56caae259b85b7685ee589075d58bb7b227024497a60fa27a7b43e0b48839cf  linux-5.15.166.tar.xz
+sha256  85d7bf3a807538b9032e3f798ab978da9b77352bcb526534038c351a4f39e01c  linux-5.10.225.tar.xz
+sha256  250c6a3199b42a1cb1427c9bbeacf5d90fb91bcf9f227195f484a1c877e1f797  linux-5.4.283.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  9d671a12b00301b7ce63022d4e4afa3e40aa318f8f7f25a1147e602fdb1047a1  linux-4.19.320.tar.xz
+sha256  f13aa1465a2578a910f64b65d743d167466edfb1e0671bc70fa2328cb66b06d9  linux-4.19.321.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 51706f582a..52971ca8bd 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -423,13 +423,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.19.320"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.282"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.224"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.165"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.107"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.48"	if BR2_KERNEL_HEADERS_6_6
-	default "6.10.7"	if BR2_KERNEL_HEADERS_6_10
+	default "4.19.321"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.283"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.225"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.166"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.108"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.49"	if BR2_KERNEL_HEADERS_6_6
+	default "6.10.8"	if BR2_KERNEL_HEADERS_6_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
