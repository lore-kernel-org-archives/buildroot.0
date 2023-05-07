Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF1BBC77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 21:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9261C417BE;
	Sun,  7 May 2023 21:33:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9261C417BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IXWpzC3A047O; Sun,  7 May 2023 21:33:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE3EB40639;
	Sun,  7 May 2023 21:33:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE3EB40639
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C7011BF863
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:32:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2232C4181F
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:32:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2232C4181F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dpi32_Ozo8A1 for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 21:32:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1342C4181E
 for <buildroot@buildroot.org>; Sun,  7 May 2023 21:32:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1342C4181E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F204C860AF; Sun,  7 May 2023 21:32:23 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 May 2023 23:28:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b01a20694c7eae222a1dd64ffb458ce8d6e7ab4b
X-Git-Newrev: 65647f7b426b05eeb8e13e3d098d0df7aed798e3
X-Patchwork-Hint: ignore
Message-Id: <20230507213223.F204C860AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/optee-os: bump to version 3.21.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=65647f7b426b05eeb8e13e3d098d0df7aed798e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bumps OP-TEE OS package version to OP-TEE release 3.21.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/optee-os/Config.in     | 4 ++--
 boot/optee-os/optee-os.hash | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index a3cb8390b4..cc2c90b5ac 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -18,7 +18,7 @@ choice
 	  Select the version of OP-TEE OS you want to use
 
 config BR2_TARGET_OPTEE_OS_LATEST
-	bool "3.19.0"
+	bool "3.21.0"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	select BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY
 	help
@@ -70,7 +70,7 @@ endif
 
 config BR2_TARGET_OPTEE_OS_VERSION
 	string
-	default "3.19.0"	if BR2_TARGET_OPTEE_OS_LATEST
+	default "3.21.0"	if BR2_TARGET_OPTEE_OS_LATEST
 	default "custom"	if BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL
 	default BR2_TARGET_OPTEE_OS_CUSTOM_REPO_VERSION \
 				if BR2_TARGET_OPTEE_OS_CUSTOM_GIT
diff --git a/boot/optee-os/optee-os.hash b/boot/optee-os/optee-os.hash
index a87f21a9bf..cf3ee7a36e 100644
--- a/boot/optee-os/optee-os.hash
+++ b/boot/optee-os/optee-os.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_os/archive/3.19.0/optee-os-3.19.0.tar.gz
-sha256  5e0c03bbc4d106f262a6bd33333c002c3380205ae6b82334aa7b644721ff7868  optee-os-3.19.0.tar.gz
+# From https://github.com/OP-TEE/optee_os/archive/3.21.0/optee-os-3.21.0.tar.gz
+sha256  92a16e841b0bdb4bfcb1c20b6a1bd3309092203d534ed167dfdb5a5f395bf60b  optee-os-3.21.0.tar.gz
 # Locally computed
 sha256  1247ee90858f4037b6cac63cbffddfed435d0d73c631b37d78c1e6e6ab3e5d1a  LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
