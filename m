Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C0F6CD6E51
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 07:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF224851D4;
	Sun, 31 May 2026 07:01:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5tdnxKqcxi18; Sun, 31 May 2026 07:01:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56F7185212
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780210867;
	bh=e+6is/MN/g2pxtUmkaP7TOmxST+4PIJXjw4IIM842kI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RjLLONttuaMew9ybHYr47XAFY6TpszhIq87yyL3cVjGdQknjqSqiq2WN9NOk84ffz
	 zzBNdBmNkGFz1KdvEFm4coX9mVjYj+JNG3C0orl+mBIffnnJQDuCcAm+vgVu4H6aYm
	 2Y6E6swsv6H+RAdjdMQy8lhF9lVlOXVCzQpMfte1VGNREPI88qSQcqNf3F1Y3lmcwY
	 HI/yRzG8Q250L6AA2YwWMhbEBPTwKA8S14F7O/Tx7Yef0I3HQmHuuj74Z8PStMTwrx
	 jKmv2AyBC578hz+0t86NBlmSf4SLtGZRhI2PcqN5sl9KWdJSsA+QvwBaXaZ370mhaC
	 rOzrIZYGBElng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56F7185212;
	Sun, 31 May 2026 07:01:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4AC35397
 for <buildroot@buildroot.org>; Sun, 31 May 2026 07:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 304B8847BF
 for <buildroot@buildroot.org>; Sun, 31 May 2026 07:01:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jNLl1gemxTNw for <buildroot@buildroot.org>;
 Sun, 31 May 2026 07:01:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63A6D84788
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63A6D84788
 for <buildroot@buildroot.org>; Sun, 31 May 2026 07:01:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 03194876A1; Sun, 31 May 2026 07:00:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 31 May 2026 09:00:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1eeed7e97867feaffff38bfac501eb3f5624e411
X-Git-Newrev: 299567b78eb393b0b90a28c208f7b1716a8a1f7b
X-Patchwork-Hint: ignore
Message-Id: <20260531070051.03194876A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mrp: fix cmake 4 compatibility
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/299567b78eb393b0b90a28c208f7b1716a8a1f7b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes:
https://autobuild.buildroot.net/results/d93/d938025a881a14003c1b50065f163115e36cf33e/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Horatiu Vultur <horatiu.vultur@microchip.com>
Reviewed-by: Michael Cullen <michael@michaelcullen.name>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...inimum-required-version-to-3.5-for-CMake-.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/mrp/0001-cmake-Set-minimum-required-version-to-3.5-for-CMake-.patch b/package/mrp/0001-cmake-Set-minimum-required-version-to-3.5-for-CMake-.patch
new file mode 100644
index 0000000000..7ddf08cd6d
--- /dev/null
+++ b/package/mrp/0001-cmake-Set-minimum-required-version-to-3.5-for-CMake-.patch
@@ -0,0 +1,41 @@
+From 23877eaf1042b56e1bdca1883447e9a83d5e8263 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 18 Jan 2026 14:26:05 +0100
+Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
+ compatibility
+
+Fixes:
+CMake Error at CMakeLists.txt:6 (cmake_minimum_required):
+  Compatibility with CMake < 3.5 has been removed from CMake.
+
+  Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+  to tell CMake that the project requires at least <min> but has been updated
+  to work with policies introduced by <max> or earlier.
+
+  Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+
+-- Configuring incomplete, errors occurred!
+
+Upstream: https://github.com/microchip-ung/mrp/pull/2
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index d7a3798..a0ae196 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -3,7 +3,7 @@
+ 
+ project (mrp C)
+ 
+-cmake_minimum_required(VERSION 2.6)
++cmake_minimum_required(VERSION 3.5)
+ 
+ ## libnl ################################################
+ find_path(LibNL_INCLUDE_DIR netlink/netlink.h
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
