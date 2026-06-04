Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA563CD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFB0540C68;
	Fri,  5 Jun 2026 12:41:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WFUmg3vtrjkG; Fri,  5 Jun 2026 12:41:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA18840C8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663267;
	bh=aHA9ctivXsh0cdXKiEL3dkC9jl4rnujpj+GTfo92194=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DbY0oHqxPD4HV5fbd6qqkw733Lgc28EQcmLTuTH+sDegoNVXVTwvNIa30xFzIiKHi
	 gGuGr8i9UYtl7lHHzpZEomkEKmTbbJgTvYlMn2sMEdOrgKK+mVgfsgduHQaMBpj3e2
	 GRGBqfTemqAVlu4FO4+LiAbyc1ue7Z7XCA+DAxLYwpJlLFul5nzXSPAeAw274f4D2R
	 70XtXk6XXTWYS7myVlsG2HTW2AjKA467FEhanv6Lm6WpxSHdPJ9qG0toLbEhC7DhOv
	 BfRW1+S4kRKrqFCH5zqROASHL8+Kg+FZit7uPCscSjaAe8XVYJGKVc40IsFIi52qZk
	 01asUI7N2WMtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA18840C8F;
	Fri,  5 Jun 2026 12:41:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 05D85388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2C1181FEF
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id szPWivTdztoS for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82DC081FC2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82DC081FC2
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ACD7387B39; Fri,  5 Jun 2026 12:38:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:25:01 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: aed5d21b8c07eb05c2de89591ccf3952cbc9bc69
X-Git-Newrev: 8f26816379bc7340953d9250ad67d19d9277602e
X-Patchwork-Hint: ignore
Message-Id: <20260605123839.ACD7387B39@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/mrp: fix cmake 4
 compatibility
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8f26816379bc7340953d9250ad67d19d9277602e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Fixes:
https://autobuild.buildroot.net/results/d93/d938025a881a14003c1b50065f163115e36cf33e/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Horatiu Vultur <horatiu.vultur@microchip.com>
Reviewed-by: Michael Cullen <michael@michaelcullen.name>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 299567b78eb393b0b90a28c208f7b1716a8a1f7b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
