Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4AE1EED628
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 17:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43920406EF;
	Fri,  2 Jan 2026 17:19:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1AP7MlGG15is; Fri,  2 Jan 2026 17:19:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC728406E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767374367;
	bh=fEVdMXr46/PTg0ogCOmcewMCNzLGB3ynuq7kAd11TY8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=l9NHstar2SHkADqaAVBB1fSYlzMDFqgx/0evGmvlAZQncsWp0KniAK+rHsZRaVs2V
	 cUJHVpXcaTESI3XHwgOhlYbujFbeGse4ifmN8Y+21u7zSRjIB1yKBWilPRJ3WMaxTr
	 ah7eLk9fCT0mngDkOf+gRoVL4hQMWfZmInSZdiZDwHMeFxdGYPQJEBndt2vo8/Jadw
	 mI7TzUyvCOvFUUl50W5bqD/yaVH3k7Z2HFiLXbG+GKGSyW+l+JBgadxHkb712/ot1R
	 Du0Ec5IvbeSUSCZaSAnaxgy0lmzraHCay8lU6Ml2TNhW3HPLCAsPuV0GqqdGfP9eRL
	 XEKcXz8b6zOlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC728406E9;
	Fri,  2 Jan 2026 17:19:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D389619D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5AF4401A2
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:19:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pbxUQDIvUW93 for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 17:19:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE3434000B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE3434000B
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:19:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D5EE387F13; Fri,  2 Jan 2026 17:19:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 18:17:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c2df8bab97d7f7b8b61ce055b4820ceb1bd34a48
X-Git-Newrev: 02053569051b8f5d58b386ff8be733df31ad04e7
X-Patchwork-Hint: ignore
Message-Id: <20260102171924.D5EE387F13@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lensfun: fix build with cmake 4
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=02053569051b8f5d58b386ff8be733df31ad04e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
https://autobuild.buildroot.net/results/dce/dced550d78ca4365c6b334d442a4995d6b8dec46/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lensfun/0001-cmake4.patch | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/lensfun/0001-cmake4.patch b/package/lensfun/0001-cmake4.patch
new file mode 100644
index 0000000000..d7973f4cb7
--- /dev/null
+++ b/package/lensfun/0001-cmake4.patch
@@ -0,0 +1,29 @@
+From 011de2e85813ff496a85404b30891352555de077 Mon Sep 17 00:00:00 2001
+From: Jonas <git@jonas-ott.de>
+Date: Fri, 17 Feb 2023 18:26:01 +0100
+Subject: [PATCH] cmake: use FindPython3 (#1983)
+
+@jonas-ott Thank you for contributing!
+
+Upstream: https://github.com/lensfun/lensfun/commit/011de2e85813ff496a85404b30891352555de077
+
+[Bernd: partial backport to version 0.3.4]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt       |  4 ++--
+ apps/CMakeLists.txt  | 55 +++++++++++++++++++++-----------------------
+ tests/CMakeLists.txt |  4 ++--
+ 3 files changed, 30 insertions(+), 33 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 5ccb9976d..7bb7a6878 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,5 +1,5 @@
+-# require at least cmake 2.8.12
+-CMAKE_MINIMUM_REQUIRED(VERSION 2.8.12 FATAL_ERROR )
++# require at least cmake 3.12
++CMAKE_MINIMUM_REQUIRED(VERSION 3.12 FATAL_ERROR)
+ 
+ # path for helper modules
+ set(CMAKE_MODULE_PATH "${CMAKE_MODULE_PATH}" "${CMAKE_SOURCE_DIR}/cmake/modules")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
