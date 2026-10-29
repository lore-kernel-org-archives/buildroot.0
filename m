Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C80606A31A
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 20:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=a4mTTcbQ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2835880DAB;
	Thu, 29 Oct 2026 20:23:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T_rfi0yR9pkO; Thu, 29 Oct 2026 20:23:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B9C9C81010
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793305427;
	b=Si8ncvk1Tisjwaq+OROvuwVvFQFUHBeGY9xWD2Y8NQzX1+3OXlyHP/Oi1zzgIywVPaOG
	 xgju766YQ0lEZ4/83OWOm/FDZlavf21xrEIdIXs6hLZh9J9AqRBQyF90ZqNC15A5dzaip
	 gbvMyUqdYzQ1ZCnw5EEl59BOQcFWJMTjVz7abPqexoNLQeCJPaiBEhH0eHmdEH6yanYF8
	 oGp0OfSFWysJd5g5QQpssqT6v6r2z9arfxAMzYpktyc7Y3alL5StgGLtnrWWgl12/Iin0
	 gYxiwwccZkM/iiNPsSWXG4fHTcWPUqR1l9UxhFgLCWxiRPAwvmgjpJYwogH3TMO9u4Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793305427;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=KjoGZXVJCtDkcMSTlHYEsotptBDPLXMqmAny8rCn3x4=;
	b=PLTrdmeJQSPdQnxaTBxvMiR7/Wx8n7GVk7YvE8xBUg5ZYeutTxh1Ar3MoI6UeEDi+kXD
	 1mxN4tEezgygPGLmTZ1kxUgNuutZjaO+9o19k1aLNuYevCKPPnqgLVNzGM0uh/DoIT1x1
	 x6qwFO1WpNCsl0uaAVppQc7Svbnnui0kNVl1bq/RFWEWY+O3vjIgSaeK+aEP+c3FTB2hD
	 DI1Yk4SCo1raNYmyQ2egtiOXMrVMMcnF7OxQHuPPHwHQwQcRo0TD9YQza2s4yuFiLFrWI
	 NWRqf2d/HvSAe72bJtrUXRQ0BQJLjU/f/6OB2B42eIyPJDQPiC0DostC7BagNhCLv4Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793305427;
	bh=KjoGZXVJCtDkcMSTlHYEsotptBDPLXMqmAny8rCn3x4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=a4mTTcbQFdp5Qevwpmbc94xOIvFIAvTcdmtJAehFmAKW3P/vZCPUtf80WVTt+tTZN
	 QICxaPIGKAMXyawGa3cicp6yrOPiKcCSvZIkCXK3DbDlBhmH0uLyZ58tcUjPvaqnB8
	 uWnIcKLE6Eq2Klp2DQjUSncK+t6ZsdIUqxWTIK4gefDaxE6odgK/kxv4oODqDwGxSQ
	 oAcSayRYUwsFOjP1AqKHSgduU0Zr5lkELPHxg4fCaQ8G09Ubem8uh8K1o7jU1lmafM
	 WdPPg25Ll0DD8rGyJFqo5UtpinbTudVPoxkS2nH7MdK4Vfs0RiCfNi7jgn4lyVezAn
	 NhqP0e8a0eTLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9C9C81010;
	Thu, 29 Oct 2026 20:23:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 70BA6D36
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6BC9A404FF
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BO5wEWjfRsQk for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 20:23:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 495DD404F1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793305405;
 b=Ipx1BfZpc8UenA/2ugH6w4NuC+6s9dbAgbh3DRVaB+PO2/GJu6kFc4pmxy5MFgH/8XV+
 qTyhOfJU+Gtc376nNKeBUQtK7MnnvlBKZVhFwmU//NApkGvTVs8O9J0mmYvHTjm1ZI0q8
 pZZHHpVEIihBhodYiHkkfLfRJdi6ktl5d/Cd9M6MnQ95kVjWu7OP/R79sF3Z1u8+4cu6w
 0jRrjvbp8KwBvexT7mzwDL4PQK5Hbyf7bAyQhFO1c9oWRuPGWvFDdtnEzPcM7IkzG5HEp
 EWM1Bcwgx+7wljRJjr8wf7bVHbzsvSRORik3DVqCVk2iqmWXtk1+0QSD45q9W0xc/eA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793305405;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=/Uk2uo7d9QrmNnz+a3VA5+aUs5Qqq+t8LZHyy5c9xc0=;
 b=Wm3+zjW34n7aCoHeCm99/mpjjx1z1hFz50Qo3OuHsOQaDarJ8y5Owfrfjp3z2Zgr2N1M
 EPmDSe1n/APCOfcFF9UwMejrs0OtU0SM11Yy7j5AKloEBAiKwsX445IE1HV/uiTHJnuFO
 xFCAR9QhLzO8Czqs/NPJnxjd7U3y03uery37z1O8Nu2jxn0+3wLxvFsVkZXEYfB8wjnfc
 WspCrXaYakBMD/Y9qYePlui8iQ4RWR1C6HJ7aMzkk0PAby3hS897JtR2es4KzRsYOw6tZ
 Hl2MVhliVPUe+63ZOU96BxCPHV+lKpyTX7tyGfG4G9hXOkwej4DvGd01wC7h6Ak1wvw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 495DD404F1
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C071B9D2E2; Thu, 29 Oct 2026 20:21:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 20:26:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 468653f79e2db4b917e38033111c932782e0ff81
X-Git-Newrev: 89b2165d1dc90b89e5c80c94fe5a310097cb7439
X-Patchwork-Hint: ignore
Message-Id: <20261029202157.C071B9D2E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-screensaver-rsxs: bump
 version to 22.0.5-Piers
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/89b2165d1dc90b89e5c80c94fe5a310097cb7439
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-Fix-build-with-CMake-4.x.patch            | 346 ---------------------
 .../kodi-screensaver-rsxs.hash                     |   2 +-
 .../kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk |   2 +-
 3 files changed, 2 insertions(+), 348 deletions(-)

diff --git a/package/kodi-screensaver-rsxs/0001-Fix-build-with-CMake-4.x.patch b/package/kodi-screensaver-rsxs/0001-Fix-build-with-CMake-4.x.patch
deleted file mode 100644
index e9f80a98c4..0000000000
--- a/package/kodi-screensaver-rsxs/0001-Fix-build-with-CMake-4.x.patch
+++ /dev/null
@@ -1,346 +0,0 @@
-From f6ad95576920944e64a368ae4074812efbcedc4b Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Wed, 11 Mar 2026 21:58:40 +0100
-Subject: [PATCH] Fix build with CMake 4.x
-
-Fixes build errors with CMake 4.x:
-
-CMake Error at lib/Implicit/CMakeLists.txt:1 (cmake_minimum_required):
-  Compatibility with CMake < 3.5 has been removed from CMake.
-
-CMake Error at lib/Rgbhsl/CMakeLists.txt:1 (cmake_minimum_required):
-  Compatibility with CMake < 3.5 has been removed from CMake.
-
-CMake Error at lib/rsMath/CMakeLists.txt:1 (cmake_minimum_required):
-  Compatibility with CMake < 3.5 has been removed from CMake.
-
-Raise minimum version for all addons.
-
-Upstream: https://github.com/xbmc/screensavers.rsxs/commit/0635422964b6797d693866483d16dff51bcf4b57
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- CMakeLists.txt                    | 2 +-
- depends/common/bz2/CMakeLists.txt | 2 +-
- lib/Implicit/CMakeLists.txt       | 2 +-
- lib/Rgbhsl/CMakeLists.txt         | 2 +-
- lib/kodi/gui/gl/CMakeLists.txt    | 2 +-
- lib/rsMath/CMakeLists.txt         | 2 +-
- src/biof/CMakeLists.txt           | 2 +-
- src/busyspheres/CMakeLists.txt    | 2 +-
- src/colorfire/CMakeLists.txt      | 2 +-
- src/cyclone/CMakeLists.txt        | 2 +-
- src/drempels/CMakeLists.txt       | 2 +-
- src/euphoria/CMakeLists.txt       | 2 +-
- src/feedback/CMakeLists.txt       | 2 +-
- src/fieldlines/CMakeLists.txt     | 2 +-
- src/flocks/CMakeLists.txt         | 2 +-
- src/flux/CMakeLists.txt           | 2 +-
- src/helios/CMakeLists.txt         | 2 +-
- src/hufosmoke/CMakeLists.txt      | 2 +-
- src/hufotunnel/CMakeLists.txt     | 2 +-
- src/hyperspace/CMakeLists.txt     | 2 +-
- src/lattice/CMakeLists.txt        | 2 +-
- src/lorenz/CMakeLists.txt         | 2 +-
- src/matrixview/CMakeLists.txt     | 2 +-
- src/microcosm/CMakeLists.txt      | 2 +-
- src/plasma/CMakeLists.txt         | 2 +-
- src/skyrocket/CMakeLists.txt      | 2 +-
- src/solarwinds/CMakeLists.txt     | 2 +-
- src/spirographx/CMakeLists.txt    | 2 +-
- src/sundancer2/CMakeLists.txt     | 2 +-
- 29 files changed, 29 insertions(+), 29 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index e93c31bc..1a9ca89c 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensavers.rsxs)
- 
- set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${PROJECT_SOURCE_DIR})
-diff --git a/depends/common/bz2/CMakeLists.txt b/depends/common/bz2/CMakeLists.txt
-index 6b1a0a56..b83f34dd 100644
---- a/depends/common/bz2/CMakeLists.txt
-+++ b/depends/common/bz2/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(bzip2)
- 
- if(NOT WIN32)
-diff --git a/lib/Implicit/CMakeLists.txt b/lib/Implicit/CMakeLists.txt
-index eef20e3b..14fb63d7 100644
---- a/lib/Implicit/CMakeLists.txt
-+++ b/lib/Implicit/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.0)
-+cmake_minimum_required(VERSION 3.5...4.0)
- 
- project(Implicit)
- 
-diff --git a/lib/Rgbhsl/CMakeLists.txt b/lib/Rgbhsl/CMakeLists.txt
-index 984ce9ba..ca01c592 100644
---- a/lib/Rgbhsl/CMakeLists.txt
-+++ b/lib/Rgbhsl/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.0)
-+cmake_minimum_required(VERSION 3.5...4.0)
- 
- project(Rgbhsl)
- 
-diff --git a/lib/kodi/gui/gl/CMakeLists.txt b/lib/kodi/gui/gl/CMakeLists.txt
-index 6fc4d87b..1b096d79 100644
---- a/lib/kodi/gui/gl/CMakeLists.txt
-+++ b/lib/kodi/gui/gl/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- 
- project(kodiOpenGL)
- 
-diff --git a/lib/rsMath/CMakeLists.txt b/lib/rsMath/CMakeLists.txt
-index cc31d308..76100e89 100644
---- a/lib/rsMath/CMakeLists.txt
-+++ b/lib/rsMath/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.0)
-+cmake_minimum_required(VERSION 3.5...4.0)
- 
- project(rsMath)
- 
-diff --git a/src/biof/CMakeLists.txt b/src/biof/CMakeLists.txt
-index 810bec46..ec344ba8 100644
---- a/src/biof/CMakeLists.txt
-+++ b/src/biof/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.biof)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/busyspheres/CMakeLists.txt b/src/busyspheres/CMakeLists.txt
-index 41650ca6..cc829bd9 100644
---- a/src/busyspheres/CMakeLists.txt
-+++ b/src/busyspheres/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.busyspheres)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/colorfire/CMakeLists.txt b/src/colorfire/CMakeLists.txt
-index 3667cbd4..f8da4884 100644
---- a/src/colorfire/CMakeLists.txt
-+++ b/src/colorfire/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.colorfire)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/cyclone/CMakeLists.txt b/src/cyclone/CMakeLists.txt
-index 8af4172f..084f928b 100644
---- a/src/cyclone/CMakeLists.txt
-+++ b/src/cyclone/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.cyclone)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/drempels/CMakeLists.txt b/src/drempels/CMakeLists.txt
-index 1ebd427f..d4c38a95 100644
---- a/src/drempels/CMakeLists.txt
-+++ b/src/drempels/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.drempels)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/euphoria/CMakeLists.txt b/src/euphoria/CMakeLists.txt
-index d3f55ee3..de2e2f67 100644
---- a/src/euphoria/CMakeLists.txt
-+++ b/src/euphoria/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.euphoria)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/feedback/CMakeLists.txt b/src/feedback/CMakeLists.txt
-index b37c430a..fd417d61 100644
---- a/src/feedback/CMakeLists.txt
-+++ b/src/feedback/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.feedback)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/fieldlines/CMakeLists.txt b/src/fieldlines/CMakeLists.txt
-index de60dda8..b0dc30b6 100644
---- a/src/fieldlines/CMakeLists.txt
-+++ b/src/fieldlines/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.fieldlines)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/flocks/CMakeLists.txt b/src/flocks/CMakeLists.txt
-index c2b4a793..a15db4d8 100644
---- a/src/flocks/CMakeLists.txt
-+++ b/src/flocks/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.flocks)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/flux/CMakeLists.txt b/src/flux/CMakeLists.txt
-index a2de0b2a..6aeda787 100644
---- a/src/flux/CMakeLists.txt
-+++ b/src/flux/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.flux)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/helios/CMakeLists.txt b/src/helios/CMakeLists.txt
-index d64a6194..6feb0ac2 100644
---- a/src/helios/CMakeLists.txt
-+++ b/src/helios/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.helios)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/hufosmoke/CMakeLists.txt b/src/hufosmoke/CMakeLists.txt
-index 44d13231..b4fe79a5 100644
---- a/src/hufosmoke/CMakeLists.txt
-+++ b/src/hufosmoke/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.hufosmoke)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/hufotunnel/CMakeLists.txt b/src/hufotunnel/CMakeLists.txt
-index b18ce736..f8c67c85 100644
---- a/src/hufotunnel/CMakeLists.txt
-+++ b/src/hufotunnel/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.hufotunnel)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/hyperspace/CMakeLists.txt b/src/hyperspace/CMakeLists.txt
-index 6bd303e2..5733be37 100644
---- a/src/hyperspace/CMakeLists.txt
-+++ b/src/hyperspace/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.hyperspace)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/lattice/CMakeLists.txt b/src/lattice/CMakeLists.txt
-index ef884e4c..9f9455f4 100644
---- a/src/lattice/CMakeLists.txt
-+++ b/src/lattice/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.lattice)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/lorenz/CMakeLists.txt b/src/lorenz/CMakeLists.txt
-index ab3026f6..35f749d9 100644
---- a/src/lorenz/CMakeLists.txt
-+++ b/src/lorenz/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.lorenz)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/matrixview/CMakeLists.txt b/src/matrixview/CMakeLists.txt
-index d98a8f14..d5f77ec7 100644
---- a/src/matrixview/CMakeLists.txt
-+++ b/src/matrixview/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.matrixview)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/microcosm/CMakeLists.txt b/src/microcosm/CMakeLists.txt
-index d05b639d..65437c28 100644
---- a/src/microcosm/CMakeLists.txt
-+++ b/src/microcosm/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.microcosm)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/plasma/CMakeLists.txt b/src/plasma/CMakeLists.txt
-index e7fc7956..fd25963f 100644
---- a/src/plasma/CMakeLists.txt
-+++ b/src/plasma/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.plasma)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/skyrocket/CMakeLists.txt b/src/skyrocket/CMakeLists.txt
-index 8a89f28f..8e9e0500 100644
---- a/src/skyrocket/CMakeLists.txt
-+++ b/src/skyrocket/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.skyrocket)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/solarwinds/CMakeLists.txt b/src/solarwinds/CMakeLists.txt
-index f1ef41c7..2417edf0 100644
---- a/src/solarwinds/CMakeLists.txt
-+++ b/src/solarwinds/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.solarwinds)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/spirographx/CMakeLists.txt b/src/spirographx/CMakeLists.txt
-index 2ccb751d..41a245d4 100644
---- a/src/spirographx/CMakeLists.txt
-+++ b/src/spirographx/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.spirographx)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/sundancer2/CMakeLists.txt b/src/sundancer2/CMakeLists.txt
-index a0e47a6d..a3bfbbe9 100644
---- a/src/sundancer2/CMakeLists.txt
-+++ b/src/sundancer2/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.sundancer2)
- 
- message(STATUS "--------------------------------------------------------------------------------")
--- 
-2.47.3
-
diff --git a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
index 86174991f0..b9378e1576 100644
--- a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
+++ b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  76c1df60f3b4bf4c61f827e07ac61173e3b72defe6ab54d1a1fa34f1cd6f38ab  kodi-screensaver-rsxs-21.1.2-Omega.tar.gz
+sha256  4e44e6b6e804b81208c6d47f156e63e24d5af0e61fa46d5959c61e00ba2b36a8  kodi-screensaver-rsxs-22.0.7-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
index dcca031b51..f04daed71c 100644
--- a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
+++ b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_RSXS_VERSION = 21.1.2-Omega
+KODI_SCREENSAVER_RSXS_VERSION = 22.0.7-Piers
 KODI_SCREENSAVER_RSXS_SITE = $(call github,xbmc,screensavers.rsxs,$(KODI_SCREENSAVER_RSXS_VERSION))
 KODI_SCREENSAVER_RSXS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_RSXS_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
