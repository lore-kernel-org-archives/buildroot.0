Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1375ECE8D7A
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 11:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF25541278;
	Thu, 19 Sep 2024 11:29:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fL8KqQpXwy3B; Thu, 19 Sep 2024 11:29:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98C7941282
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 98C7941282;
	Thu, 19 Sep 2024 11:29:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 775F61BF33B
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 11:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 667E94281A
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 11:29:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sInPoHGonhSF for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 11:29:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 442204280D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 442204280D
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 11:29:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD6AB83CBD; Thu, 19 Sep 2024 11:29:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 13:23:50 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 618b1b056c624f397530f64ff4c932bf83cf59e0
X-Git-Newrev: 43d9a911b2dc6a01e86fe74c426cec097f9cf5da
X-Patchwork-Hint: ignore
Message-Id: <20240919112922.AD6AB83CBD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] {linux,
 linux-headers}: bump 6.{1, 6, 10}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=43d9a911b2dc6a01e86fe74c426cec097f9cf5da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ee67e4baffc8bb0577a265ad4ffe814acfad5397)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 6 +++---
 package/linux-headers/Config.in.host | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index e38f8104e0..023fa0a2ec 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -134,7 +134,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.10.8" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.10.9" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index ffc25f7959..5c745f7c7c 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  c0923235779d4606bba87f72b6fe11f796e9e40c1ca9f4d5dbe04cd47ee3c595  linux-6.10.8.tar.xz
-sha256  2c56dac2b70859c16b4ef651befb0d28c227498bd3eee08e8a45a357f22dd3b7  linux-6.6.49.tar.xz
-sha256  3f4e4e89a00e221a6dd1174779e0028794f44f4624ad6a31c79f3b7796688ca2  linux-6.1.108.tar.xz
+sha256  a4489b70e0a7c2dc8f501b9cd7fc76989be2febb5519e163ecf816064f2f6858  linux-6.10.9.tar.xz
+sha256  c065e36daf28210060c91a37ef3e92ac5814784e634577e04e406297ead2e86e  linux-6.6.50.tar.xz
+sha256  732ff40ac63642c5ddbb7d65c24c90ed08b95af0e8c92df4739e9703eec01ac1  linux-6.1.109.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  e56caae259b85b7685ee589075d58bb7b227024497a60fa27a7b43e0b48839cf  linux-5.15.166.tar.xz
 sha256  85d7bf3a807538b9032e3f798ab978da9b77352bcb526534038c351a4f39e01c  linux-5.10.225.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 52971ca8bd..003c2f6a66 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -427,9 +427,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.4.283"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.225"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.166"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.108"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.49"	if BR2_KERNEL_HEADERS_6_6
-	default "6.10.8"	if BR2_KERNEL_HEADERS_6_10
+	default "6.1.109"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.50"	if BR2_KERNEL_HEADERS_6_6
+	default "6.10.9"	if BR2_KERNEL_HEADERS_6_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
