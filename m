Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1862BC433EF
	for <buildroot@archiver.kernel.org>; Tue, 22 Mar 2022 07:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABFFB41687;
	Tue, 22 Mar 2022 07:57:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5ChGxvfqbtgN; Tue, 22 Mar 2022 07:57:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 985D641680;
	Tue, 22 Mar 2022 07:57:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 974391BF9B2
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 07:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94C2784368
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 07:57:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aS_TzE-SJCdb for <buildroot@lists.busybox.net>;
 Tue, 22 Mar 2022 07:57:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD1DC84365
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 07:57:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8000884F2D; Tue, 22 Mar 2022 07:48:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 22 Mar 2022 08:56:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 781a01c9f3d8c7d970d75ca56198161352a91d4b
X-Git-Newrev: 2b6bd9b0de8c60f8acd87bb7ffaefc59be6d8dae
X-Patchwork-Hint: ignore
Message-Id: <20220322074824.8000884F2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: bump CIP-RT kernel to version
 5.10.104-cip3-rt3
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

commit: https://git.buildroot.net/buildroot/commit/?id=2b6bd9b0de8c60f8acd87bb7ffaefc59be6d8dae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in  | 4 ++--
 linux/linux.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index c6590b31ee..f21beb4222 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -50,7 +50,7 @@ config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	  https://www.cip-project.org
 
 config BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
-	bool "Latest CIP RT SLTS version (5.10.100-cip2-rt2)"
+	bool "Latest CIP RT SLTS version (5.10.104-cip3-rt3)"
 	help
 	  Same as the CIP version, but this is the PREEMPT_RT realtime
 	  variant.
@@ -127,7 +127,7 @@ config BR2_LINUX_KERNEL_VERSION
 	string
 	default "5.15.26" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.104-cip3" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	default "5.10.100-cip2-rt2" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
+	default "5.10.104-cip3-rt3" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
diff --git a/linux/linux.hash b/linux/linux.hash
index 18480a87bf..976f1d07c0 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -10,7 +10,7 @@ sha256  03a65f405c3acae4dd8cd952444b7cd931f972c01a42e20a471319a2f6c018d2  linux-
 sha256  4fcfe814780d63dc56e907bf41596ff162e9601978bdc1a60eab64cc3903a22c  linux-4.19.232.tar.xz
 # Locally computed
 sha256  63e6df81c4a747c60eed535ffc2f6f1ddb0c17ec349e860316d9a700c69ab38e  linux-cip-5.10.104-cip3.tar.gz
-sha256  945b63f280c5bd9aad66016ef6fbed57612864192bc0f54f6800562f56cfd518  linux-cip-5.10.100-cip2-rt2.tar.gz
+sha256  9a45929d91ebaddbf6a0ef29750775e33d3c3f56f42f0a9e95e77e5b4eba3c6e  linux-cip-5.10.104-cip3-rt3.tar.gz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
