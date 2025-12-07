Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BABC3D3B7E7
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 16:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91D4560BAA;
	Sun,  7 Dec 2025 16:02:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Id_J1dE9uahw; Sun,  7 Dec 2025 16:02:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 995FB60B90
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765123352;
	bh=90X+J5ZmAvNOXxUmM2TIP9tWq9F6F8CJqFGAxyrFb+Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=B738A5yRQ4SOWbzAsoFJHG2ERv6006OH2LxVPdkRKwOp8ZqFkbuQWa1BGAW+sigoi
	 9xlHppN4+1Q8N2YtZz5InjsqcOuUyNfDwoeC39tAwUL3k55v9d6eKqIaI7X3KnjP4q
	 s/56YWOSJQyygz7WGy5JJQ1fedcJ0cQCzrcnsqnpAkbs2Y4J78wFsOQxU9hRwNm4lP
	 ugS0PIIDax3kIluM0WCzllvRWHJ1hmEqRFeOjWBMR1X5lW9lgbsEl4tguweKrqoo9c
	 6QAksrKSwTL1pJfSbSG++ksbv6+dxk4B+BxA85Rw6N0VQOmopsCYb9H00F0xBe0vaL
	 plRw4SdUhKO1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 995FB60B90;
	Sun,  7 Dec 2025 16:02:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 455AAE7
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3475440296
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M2QxT6DQrGYA for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 16:02:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C7F440166
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C7F440166
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:02:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1A9DF86719; Sun,  7 Dec 2025 16:02:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 14:17:47 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: cb2e7531df00a4307841794df75489102f04d654
X-Git-Newrev: 50580a046f30bfd5256b13afd5825cb1d076185c
X-Patchwork-Hint: ignore
Message-Id: <20251207160225.1A9DF86719@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/docopt-cpp: fix cmake
 4 compatibility
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

commit: https://git.buildroot.net/buildroot/commit/?id=50580a046f30bfd5256b13afd5825cb1d076185c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...02-Increase-cmake_minimum_required-to-3.5.patch | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/docopt-cpp/0002-Increase-cmake_minimum_required-to-3.5.patch b/package/docopt-cpp/0002-Increase-cmake_minimum_required-to-3.5.patch
new file mode 100644
index 0000000000..2bc7d33593
--- /dev/null
+++ b/package/docopt-cpp/0002-Increase-cmake_minimum_required-to-3.5.patch
@@ -0,0 +1,40 @@
+From 05d507da0d153faff381f44968833ebffdc03447 Mon Sep 17 00:00:00 2001
+From: Eero Aaltonen <eero.aaltonen@vaisala.com>
+Date: Wed, 1 Nov 2023 13:39:42 +0200
+Subject: [PATCH] Increase cmake_minimum_required to 3.5
+
+CMake version 3.27 deprecates compatibility with versions older than
+3.5. Increase the minimum required so that the project can be built
+without warnings.
+
+Upstream: https://github.com/docopt/docopt.cpp/commit/05d507da0d153faff381f44968833ebffdc03447
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ README.rst     | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 28da614..246e90e 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.1)
++cmake_minimum_required(VERSION 3.5)
+ project(docopt.cpp VERSION 0.6.2)
+ 
+ include(GNUInstallDirs)
+diff --git a/README.rst b/README.rst
+index 5fe8b4f..6d7012d 100644
+--- a/README.rst
++++ b/README.rst
+@@ -87,7 +87,7 @@ Alternatively manual installation is done using (unix)::
+ To link *docopt.cpp*, the simplest is to use CMake. The general structure of your
+ ``CMakeLists.txt`` would be as follows::
+ 
+-    cmake_minimum_required(VERSION 3.1)
++    cmake_minimum_required(VERSION 3.5)
+ 
+     project(example)
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
