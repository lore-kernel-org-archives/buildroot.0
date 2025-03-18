Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D09FEC282EC
	for <buildroot@archiver.kernel.org>; Tue, 18 Mar 2025 20:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EB1C40707;
	Tue, 18 Mar 2025 20:41:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ThBB2mkf7shR; Tue, 18 Mar 2025 20:41:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70AEB4081D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70AEB4081D;
	Tue, 18 Mar 2025 20:41:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 61A33D5
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 20:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F7064013D
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 20:41:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qbl2ohhIps4X for <buildroot@buildroot.org>;
 Tue, 18 Mar 2025 20:41:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53E5040132
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53E5040132
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 20:41:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4D7488811B; Tue, 18 Mar 2025 20:41:53 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 18 Mar 2025 21:40:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 29cf86b8d005f1dd1c5080160042395a9ab9bf26
X-Git-Newrev: b8dfcb4f045fce200e5e521bb1f15df8bf58bc8a
X-Patchwork-Hint: ignore
Message-Id: <20250318204153.4D7488811B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 6.13.x series
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=b8dfcb4f045fce200e5e521bb1f15df8bf58bc8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 2 +-
 package/linux-headers/Config.in.host | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 506eccf0ed..c2f730709b 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -137,7 +137,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.13.5" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.13.7" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index b85cad7c3c..a8f37fd097 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  283ecb0784f3fbc16dd822fb1d9642e230ec7515ed33f120e551b839f355e6e2  linux-6.13.5.tar.xz
+sha256  3a39b62038b7ac2f43d26a1f84b4283e197804e1e817ad637e9a3d874c47801d  linux-6.13.7.tar.xz
 sha256  d73bf057bec04434b169d1b61641936f7d0c97ceb923a281f32e35dd4dcc6531  linux-6.12.19.tar.xz
 sha256  894bbbe63b7484a0bc576a1e11a8dbc090fbd476d6424431bdc8435e03c2c208  linux-6.6.83.tar.xz
 sha256  44caf510603b4cbbe78ef828620099d200536d666e909ddb73bb2938c7de5b16  linux-6.1.131.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index eff20e9846..9be5957596 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -442,7 +442,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.1.131"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.83"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.19"	if BR2_KERNEL_HEADERS_6_12
-	default "6.13.5"	if BR2_KERNEL_HEADERS_6_13
+	default "6.13.7"	if BR2_KERNEL_HEADERS_6_13
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
