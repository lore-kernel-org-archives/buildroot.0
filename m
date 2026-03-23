Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B83F410ED652
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 10:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EF7F612CB;
	Fri, 27 Mar 2026 10:01:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1d5c6z3Upgl3; Fri, 27 Mar 2026 10:01:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F69F612B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774605706;
	bh=Dy8+GoPjd+f2PwYJEQFa/zX1a3oB95g2xDaFYUdMD/k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=m5mobQT4fBOUDiofbyvSkZl7lYyyb2ofLOLhT18/D3mL6rJHTK4jQoo3Ca8PNdpXB
	 4rayuuUW9VTt4DDhXirSD4kvVbvHExDhuif6ByWioZup860AX04DJ64f168zDq+sXy
	 2DDYaPBNgbs1KaT6R/m5hyG7L02Li2Dg2fkvB47Doxn9DJR3ugUUq3KwXunayrz4bn
	 HzomjnsnOoqarhm7BgmWxL5ZJxDt8FOmORwJuxXnWdMMNp8MdTOduNFDvAoRvuO2DB
	 5ya/7syGFAHn5NK1jHw9iQpAnBN5Fh4xFjxjQiYeT8fkZJMFSI4hanKHiGpJEmIRBt
	 rVtfVEJEEnRGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F69F612B0;
	Fri, 27 Mar 2026 10:01:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C7AFB3B8
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9553612A5
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:01:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zhip1G_lVp5C for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 10:01:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF400612A1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF400612A1
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:01:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F51F7FBB8; Fri, 27 Mar 2026 10:01:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 23 Mar 2026 11:26:05 +0100
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 7a454d52bd82da9aa1379d5ceecd7da1a71020f8
X-Git-Newrev: c68605456a33f43634ba5f81595b31de49a72e7a
X-Patchwork-Hint: ignore
Message-Id: <20260327100141.1F51F7FBB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] {linux,
 linux-headers}: bump 6.19.x, 6.18.x series
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c68605456a33f43634ba5f81595b31de49a72e7a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Update the latest kernel releases to:
 - 6.19.8 -> 6.19.9
 - 6.18.18 -> 6.18.19

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 linux/Config.in                      | 2 +-
 linux/from-6.17/linux.hash           | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 44f8b08e71..6e76f8cb8f 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.19.8" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.19.9" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 5e4f727a84..3e30028505 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  aada4722db8bcfa0b9732851856d405082b6a4fa2e3ab067be8db17cdd115b38  linux-6.19.8.tar.xz
-sha256  f4855f382c1b735c84072bdef36db5bcd5dc7b0c37e42f5104317149a0a486ef  linux-6.18.18.tar.xz
+sha256  c16068a3af12e3943dee3b1eef57ca70229c069128bfa1184fb3f48b219d55bf  linux-6.19.9.tar.xz
+sha256  eaaf78271cd07c68ad9c4c9a70c72718b33abbd716239d82bac96b1751eb090c  linux-6.18.19.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 5b1f090a2a..a9165978d0 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -469,8 +469,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.1.166"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.129"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.77"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.18"	if BR2_KERNEL_HEADERS_6_18
-	default "6.19.8"	if BR2_KERNEL_HEADERS_6_19
+	default "6.18.19"	if BR2_KERNEL_HEADERS_6_18
+	default "6.19.9"	if BR2_KERNEL_HEADERS_6_19
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
