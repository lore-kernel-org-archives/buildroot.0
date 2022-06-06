Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A0CC433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 13:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B28FC410C3;
	Mon,  6 Jun 2022 13:22:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1YDGSV-oI_yP; Mon,  6 Jun 2022 13:22:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62DD5410C1;
	Mon,  6 Jun 2022 13:22:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 28ADE1BF982
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 13:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 17A3960EF5
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 13:21:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zxBZaEW934hj for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 13:21:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2032B60E2E
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 13:21:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D87C486DB0; Mon,  6 Jun 2022 13:09:55 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 6 Jun 2022 15:21:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3a7a49fdb1077040e29bd06eac4f652b94d2fc83
X-Git-Newrev: 2810b51e52177147cf9b2e113b2afd3ab1194d3f
X-Patchwork-Hint: ignore
Message-Id: <20220606130955.D87C486DB0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: update cip/cip-rt kernels to latest
 versions
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

commit: https://git.buildroot.net/buildroot/commit/?id=2810b51e52177147cf9b2e113b2afd3ab1194d3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 linux/Config.in  | 8 ++++----
 linux/linux.hash | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index b2da6dffd9..e4922fd44e 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -32,7 +32,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_17 if BR2_KERNEL_HEADERS_AS_KERNEL
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (5.10.104-cip3)"
+	bool "Latest CIP SLTS version (5.10.115-cip7)"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
 	help
 	  CIP launched in the spring of 2016 to address the needs of
@@ -52,7 +52,7 @@ config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	  https://www.cip-project.org
 
 config BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
-	bool "Latest CIP RT SLTS version (5.10.104-cip3-rt3)"
+	bool "Latest CIP RT SLTS version (5.10.109-cip5-rt4)"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
 	help
 	  Same as the CIP version, but this is the PREEMPT_RT realtime
@@ -129,8 +129,8 @@ endif
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "5.17.13" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "5.10.104-cip3" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	default "5.10.104-cip3-rt3" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
+	default "5.10.115-cip7" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	default "5.10.109-cip5-rt4" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
diff --git a/linux/linux.hash b/linux/linux.hash
index ab7bc0ebae..9e4c41d94f 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -8,8 +8,8 @@ sha256  7ea3369b915c99b38528dbf68c491f3f9324b2f4e56eac980dd7524d2fc30d1b  linux-
 sha256  6637c8470c3093a477d2de6fa9e0f63c55810438a411c73bcd723634371657a3  linux-4.14.282.tar.xz
 sha256  00ad2f5a36c91221a2ade0078b93bf84b60d494bd1ef51eaccb5bdb6277dba3a  linux-4.19.246.tar.xz
 # Locally computed
-sha256  63e6df81c4a747c60eed535ffc2f6f1ddb0c17ec349e860316d9a700c69ab38e  linux-cip-5.10.104-cip3.tar.gz
-sha256  9a45929d91ebaddbf6a0ef29750775e33d3c3f56f42f0a9e95e77e5b4eba3c6e  linux-cip-5.10.104-cip3-rt3.tar.gz
+sha256  f3559be277be9200897022282be18cfc0278d1d8baec8058305b04b9cd72002a  linux-cip-5.10.115-cip7.tar.gz
+sha256  71fba4ed5cb48fa7869e9fe271b68b77fed26775ce5cf2f50891aa8f71c388b3  linux-cip-5.10.109-cip5-rt4.tar.gz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
