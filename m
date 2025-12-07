Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE1B8D2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 16:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFE4940754;
	Sun,  7 Dec 2025 16:02:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bujB0KA6FQX3; Sun,  7 Dec 2025 16:02:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E186040756
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765123368;
	bh=soRVmSG48dtiUI8GZ4xnb/Wot/5Am366xMN/vV740Qo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Q+0kw4zkuWh1/v6wrUYk0nCm2Sz2+754MlMCA/n2fLmxZtt9jqUlZUqAd8b2N0PpQ
	 fdTW/etlNoKVr0vkompJeTzgl36qGVgsQBdXwNb7kprUR6dBOpRkoXom8oLHnvC0i6
	 r7YIjLmiA66sSNqvRzbxXS/Sp5Kuz/qOER80RK1V29k4Y1mR87T9ilodYscmPo8TwW
	 Ts8tSl4I5XAlP5c6cWiFL2VbzYrScjg8t+O4UjA+7kIKWiVuXt8fxvMZYsKOhrZRCe
	 GVZzM52odE7YaE1hfzzaaCVZ4rzi3ltqzyUQGeGq3Q6GToFf0928ZLaDLiPOvMHsbI
	 WOxNMqfaT1XUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E186040756;
	Sun,  7 Dec 2025 16:02:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 47C77151
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4CA7822CB
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lgnCPWADF_4q for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 16:02:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E207822AF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E207822AF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:02:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2711186715; Sun,  7 Dec 2025 16:02:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 14:19:11 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 50580a046f30bfd5256b13afd5825cb1d076185c
X-Git-Newrev: ababaabb05b26a800622789f87408a038f956045
X-Patchwork-Hint: ignore
Message-Id: <20251207160225.2711186715@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/double-conversion: fix
 cmake 4 compatibility
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ababaabb05b26a800622789f87408a038f956045
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...0001-CMake-Raised-required-version-to-3.5.patch | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/package/double-conversion/0001-CMake-Raised-required-version-to-3.5.patch b/package/double-conversion/0001-CMake-Raised-required-version-to-3.5.patch
new file mode 100644
index 0000000000..9d8482d5d2
--- /dev/null
+++ b/package/double-conversion/0001-CMake-Raised-required-version-to-3.5.patch
@@ -0,0 +1,27 @@
+From 101e1ba89dc41ceb75090831da97c43a76cd2906 Mon Sep 17 00:00:00 2001
+From: Heiko Becker <mail@heiko-becker.de>
+Date: Thu, 20 Feb 2025 15:20:07 +0100
+Subject: [PATCH] CMake: Raised required version to 3.5 (#240)
+
+CMake >= 4.0.0-rc1 removed compatibility with versions < 3.5 and errors
+out with such versions passed to cmake_minimum_required(). 3.5.0 has
+been released 9 years ago, so I'd assume it's available almost
+everywhere.
+
+Upstream: https://github.com/google/double-conversion/commit/101e1ba89dc41ceb75090831da97c43a76cd2906
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 8749ef86..31457723 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.0)
++cmake_minimum_required(VERSION 3.5)
+ project(double-conversion VERSION 3.3.0)
+ 
+ option(BUILD_SHARED_LIBS "Build shared libraries (.dll/.so) instead of static ones (.lib/.a)" OFF)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
