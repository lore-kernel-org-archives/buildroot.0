Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F7F2FF885D
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 16:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CC52616A9;
	Sun, 26 Apr 2026 16:47:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sVjBv1WX7V7t; Sun, 26 Apr 2026 16:47:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF964615EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777222061;
	bh=G6CKXrlu+NKhs9ojkPe1cgOAGd0hMmePj2C5xG4t77s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nbI01teQO3vhu3FEV7QCZzCmKHgerAhZ0LEDdC98XuGSn2K9hvYUSM8bejhQdNtV1
	 yhjoV7OynWJR7nAEJOfkLpNhsYaUsljunwTS9ks1G3wVhEwOCv2zr2eRggckv90fLl
	 gVd7wa77e/fSqNzNNG4A3kyZZ8owHNUsNyI/AOe/vwIm9ToyatYXwYHwfnVjj/gxCt
	 pWtynYs7C7vkNiFUr97k9bBZ+RdWu554SjCpQh6HJlXrroClR16J0eoOWtQu2Cnxuu
	 SJHRnLQoN7v2S9LF6S/W+8Jg/gcx3EJD4IaB9UnNUUqRGpcp+AY83DQDkqWRRCZXDl
	 yUFqyCDcqzo4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF964615EA;
	Sun, 26 Apr 2026 16:47:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 67B2D2DF
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 16:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C06E845C1
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 16:47:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HcZjugbRcXG8 for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 16:47:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DE7C84586
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DE7C84586
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 16:47:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 41190836D1; Sun, 26 Apr 2026 16:47:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 26 Apr 2026 18:35:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c1a34838b9f88b04a2bd18610056368c092ddd1a
X-Git-Newrev: 316f0eed459e1d63b6c1fd4de5d1f43d8f00e651
X-Patchwork-Hint: ignore
Message-Id: <20260426164739.41190836D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cmake: bump version to 4.3.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/316f0eed459e1d63b6c1fd4de5d1f43d8f00e651
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://cmake.org/cmake/help/latest/release/4.3.html#id2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Tested-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index 5367ae2cd5..f531e73c31 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v4.3/cmake-4.3.1-SHA-256.txt
-sha256  0798f4be7a1a406a419ac32db90c2956936fecbf50db3057d7af47d69a2d7edb  cmake-4.3.1.tar.gz
+# From https://cmake.org/files/v4.3/cmake-4.3.2-SHA-256.txt
+sha256  b0231eb39b3c3cabdc568c619df78208a7bd95ea10c9b2236d61218bac1b367d  cmake-4.3.2.tar.gz
 
 # Locally calculated
 sha256  4382e7c1879ac90e3f101a395d23846fa4dbcaa1eed7265b43681e348754825d  LICENSE.rst
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 4fdd294f5a..0223e65551 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
 CMAKE_VERSION_MAJOR = 4.3
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).1
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).2
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = LICENSE.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
