Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1136C49EA1
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 18:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 613B440395;
	Sat,  3 Aug 2024 18:29:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o9mg_sCYJN-T; Sat,  3 Aug 2024 18:29:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E23C403A6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E23C403A6;
	Sat,  3 Aug 2024 18:29:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4647B1BF364
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 18:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4157D81441
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 18:29:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TJAHOVExi6ua for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 18:29:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5732C8143C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5732C8143C
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 18:29:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4567D83C5D; Sat,  3 Aug 2024 18:29:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Aug 2024 20:28:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ea301ef80c810791a6b673d46b4f16b6c2f62a29
X-Git-Newrev: 179bf242d564e18db278b39fdf67e43ec6806e28
X-Patchwork-Hint: ignore
Message-Id: <20240803182913.4567D83C5D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 6.{1, 6,
 10}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=179bf242d564e18db278b39fdf67e43ec6806e28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 6 +++---
 package/linux-headers/Config.in.host | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 4bdca6fafe..429a7eabef 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -134,7 +134,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.10.2" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.10.3" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index d1d0132c96..b6ab8b3267 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  73d8520dd9cba5acfc5e7208e76b35d9740b8aae38210a9224e32ec4c0d29b70  linux-6.10.2.tar.xz
+sha256  fa5f22fd67dd05812d39dca579320c493048e26c4a556048a12385e7ae6fc698  linux-6.10.3.tar.xz
 sha256  5ae7cc4e0e2f6b9ba630f643985ba0522c7d5e5b9571ba478a3cb513edd4cf22  linux-6.9.12.tar.xz
-sha256  0ad83b1a1a780a1aad948d55aa55ee63c50c626f2d46910b9d2180028d100a5e  linux-6.6.43.tar.xz
-sha256  1ba5f93b411ead7587fe48b2eec6c656f6796d31f5e406d236913c77512497ec  linux-6.1.102.tar.xz
+sha256  93218296934915636fe6ba08e125948424cc270fd8948502c0ab91087a9fccd8  linux-6.6.44.tar.xz
+sha256  5eb4706f898f50881552ff5146d892132d3ffc5298033bffe27087d3a44c4573  linux-6.1.103.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  ec6098faed64b8a47ba1772e812a6eb444385f7aa3c60d3e4739ab2fd3b29186  linux-5.15.164.tar.xz
 sha256  ca09d86a6b79706c33382d3f8606f476eb07918417a87fb1815f6a4aa81f2ba1  linux-5.10.223.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index d745e31155..e235689700 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -431,10 +431,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.4.281"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.223"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.164"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.102"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.43"	if BR2_KERNEL_HEADERS_6_6
+	default "6.1.103"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.44"	if BR2_KERNEL_HEADERS_6_6
 	default "6.9.12"	if BR2_KERNEL_HEADERS_6_9
-	default "6.10.2"	if BR2_KERNEL_HEADERS_6_10
+	default "6.10.3"	if BR2_KERNEL_HEADERS_6_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
