Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E015C6FD1F
	for <buildroot@archiver.kernel.org>; Tue, 19 Mar 2024 21:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE778414C5;
	Tue, 19 Mar 2024 21:37:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JO0OQMyF5gVx; Tue, 19 Mar 2024 21:37:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CACD414CF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CACD414CF;
	Tue, 19 Mar 2024 21:37:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 30E5B1BF360
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 21:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6177240438
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 21:37:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YH5Liottyqxn for <buildroot@lists.busybox.net>;
 Tue, 19 Mar 2024 21:37:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 916C74144E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 916C74144E
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 21:37:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7DFAC835FF; Tue, 19 Mar 2024 21:37:22 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 19 Mar 2024 22:36:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e3a3e163253cd702d99ba731d546f2cdb6eedc05
X-Git-Newrev: a904f1530f9a8613c077c17395d92a065cf11737
X-Patchwork-Hint: ignore
Message-Id: <20240319213722.7DFAC835FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/ti-k3-r5-loader: bump to version
 2024.01
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

commit: https://git.buildroot.net/buildroot/commit/?id=a904f1530f9a8613c077c17395d92a065cf11737
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

All in-tree configs with the ti-k3-r5 bootloader use a custom version,
so this patch is mostly for the menuconfig default version.

Keep the old hash so that defconfigs still have a hash to validate
downloads against.

Suggested-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
[yann.morin.1998@free.fr: keep the old hash]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/ti-k3-r5-loader/Config.in            | 4 ++--
 boot/ti-k3-r5-loader/ti-k3-r5-loader.hash | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
index 8c8368a1a5..5f86c045c9 100644
--- a/boot/ti-k3-r5-loader/Config.in
+++ b/boot/ti-k3-r5-loader/Config.in
@@ -16,7 +16,7 @@ choice
 	  here as it is used to build the main U-Boot package.
 
 config BR2_TARGET_TI_K3_R5_LOADER_LATEST_VERSION
-	bool "2022.10"
+	bool "2024.01"
 
 config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION
 	bool "Custom version"
@@ -60,7 +60,7 @@ endif
 
 config BR2_TARGET_TI_K3_R5_LOADER_VERSION
 	string
-	default "2022.10"	if BR2_TARGET_TI_K3_R5_LOADER_LATEST_VERSION
+	default "2024.01"	if BR2_TARGET_TI_K3_R5_LOADER_LATEST_VERSION
 	default BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL
diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash b/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
index c5d1cb8e09..279cb7763a 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
@@ -1,3 +1,4 @@
 # Locally computed:
 sha256  50b4482a505bc281ba8470c399a3c26e145e29b23500bc35c50debd7fa46bdf8  u-boot-2022.10.tar.bz2
+sha256  b99611f1ed237bf3541bdc8434b68c96a6e05967061f992443cb30aabebef5b3  u-boot-2024.01.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
