Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E779E6529D
	for <buildroot@archiver.kernel.org>; Sun,  1 Feb 2026 20:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12F3460EB3;
	Sun,  1 Feb 2026 20:41:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QAn3eFnN6l3u; Sun,  1 Feb 2026 20:41:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25B146106D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769978469;
	bh=sC0g4YT/IevuHFza2R/r6DvKTa2YWIudYH9wVhfD548=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=djMs/ZCIQfjqitsnIc3zAgEEC/iXO6N4QnDTtC7ReM1zrp2U4Trej16GQEeU4yoQO
	 WlNvsc2nxDSFU1E70MO+hX8S9I79GAxQlLChMZf59Ju5hLdxOKjm96SuChgyZwK6ne
	 3zIqa4NnEcjELddKC0EBUxGejvBgyWEZSUHF+mNJVlyM0bYepJrK3uAi+zZaBMnVDZ
	 NYvWmEId/PyZjX9JVR0IRi/Te2IArjzDM5pjittL/XCN7SWW341RkRUkF+rFSu9eSP
	 60pVtu+zexehlsmlRoPoAc5I8ZxP4iD2ji5EmL8+e668mDn8Dx0jRDNnRNm4glIIRX
	 2BHWE8bfiGXLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25B146106D;
	Sun,  1 Feb 2026 20:41:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4541923E
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED0B68271D
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:40:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LpoDJC2TdWNi for <buildroot@buildroot.org>;
 Sun,  1 Feb 2026 20:40:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 970A1826C0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 970A1826C0
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:40:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7F9DA8616F; Sun,  1 Feb 2026 20:40:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Feb 2026 21:27:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4367b88a0f83c75c870592aa3483c192e1ee7b91
X-Git-Newrev: 91523ae39c9798e04162e25721826cc691d11cda
X-Patchwork-Hint: ignore
Message-Id: <20260201204055.7F9DA8616F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 6.{6, 12,
 18}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=91523ae39c9798e04162e25721826cc691d11cda
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 6 +++---
 package/linux-headers/Config.in.host | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 6b6c745e08..0ce6035e41 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.18.7" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.18.8" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 64f8411046..2ba90714d3 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  b726a4d15cf9ae06219b56d87820776e34d89fbc137e55fb54a9b9c3015b8f1e  linux-6.18.7.tar.xz
-sha256  16805dc62e1fa5ef8a3f466f3f44a2efb171b5206d6840ced4ba5475cf12c432  linux-6.12.67.tar.xz
-sha256  76af9d4fce24cc5a1c9f1fcbba2e23c4e87bbc8e20525b1691206801f24d14ba  linux-6.6.121.tar.xz
+sha256  37f0c5d5c242c1d604e87d48f08795e861a5a85f725b4ca11d0a538f12ff8cff  linux-6.18.8.tar.xz
+sha256  d367c7504bd4da520dd01eb08125d2d0ac088bc8af4cd56d236f2074dd4225b7  linux-6.12.68.tar.xz
+sha256  d48e0d9de04bef2fb9740bdb0124548bcab8867cdca00ff9712c110282b299d6  linux-6.6.122.tar.xz
 sha256  b41666bda7223600386a07ebe1802f5029da2fe81f6a85d691b6ec6a707e5a29  linux-6.1.161.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  5d4c0994580dd3bbd5ffc5fcb81c22dd305b844c9d8c7b176cc41b28f7e29743  linux-5.15.198.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 4727ba2048..c80ff97208 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -459,9 +459,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.10.248"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.198"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.161"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.121"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.67"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.7"	if BR2_KERNEL_HEADERS_6_18
+	default "6.6.122"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.68"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.8"	if BR2_KERNEL_HEADERS_6_18
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
