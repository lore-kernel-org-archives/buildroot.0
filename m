Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F62FC25B4F
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 20:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A15FA820F0;
	Mon,  6 May 2024 20:06:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SYzXPyKBCcoL; Mon,  6 May 2024 20:06:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A022B82271
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A022B82271;
	Mon,  6 May 2024 20:06:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7D34D1BF33C
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7531241481
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:06:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IRCoi4P-VXQc for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 20:06:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DCFD4057C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DCFD4057C
 for <buildroot@buildroot.org>; Mon,  6 May 2024 20:06:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 967E6868B6; Mon,  6 May 2024 20:06:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 May 2024 22:03:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 36b06928c8d63ef82cc785aaa72c5818c8dec0bc
X-Git-Newrev: 314e9549a4533cf94707cf0c1736dcbf5b0266ac
X-Patchwork-Hint: ignore
Message-Id: <20240506200643.967E6868B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/optee-os: bump to release v4.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=314e9549a4533cf94707cf0c1736dcbf5b0266ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump OP-TEE to the latest tagged release

Signed-off-by: Bryan Brattlof <bb@ti.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/optee-os/Config.in     | 4 ++--
 boot/optee-os/optee-os.hash | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index 75bf00d450..34ea993136 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -18,7 +18,7 @@ choice
 	  Select the version of OP-TEE OS you want to use
 
 config BR2_TARGET_OPTEE_OS_LATEST
-	bool "4.0.0"
+	bool "4.2.0"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	select BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY
 	help
@@ -70,7 +70,7 @@ endif
 
 config BR2_TARGET_OPTEE_OS_VERSION
 	string
-	default "4.0.0"		if BR2_TARGET_OPTEE_OS_LATEST
+	default "4.2.0"		if BR2_TARGET_OPTEE_OS_LATEST
 	default "custom"	if BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL
 	default BR2_TARGET_OPTEE_OS_CUSTOM_REPO_VERSION \
 				if BR2_TARGET_OPTEE_OS_CUSTOM_GIT
diff --git a/boot/optee-os/optee-os.hash b/boot/optee-os/optee-os.hash
index 1f13931ca2..663640b2ce 100644
--- a/boot/optee-os/optee-os.hash
+++ b/boot/optee-os/optee-os.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_os/archive/4.0.0/optee-os-4.0.0.tar.gz
-sha256  2c2c9525b36c96dfad6216520721b8e9663e6cacc61d0108a0c8bffc0ea175f1  optee-os-4.0.0.tar.gz
+# From https://github.com/OP-TEE/optee_os/archive/4.2.0/optee-os-4.2.0.tar.gz
+sha256  ce70f0d177001bf4855cd6cd6396f515af6126e4bba9b12c716a437a5cb40c7b  optee-os-4.2.0.tar.gz
 # Locally computed
 sha256  1247ee90858f4037b6cac63cbffddfed435d0d73c631b37d78c1e6e6ab3e5d1a  LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
