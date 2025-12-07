Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B32ED1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 17:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03CF160BC0;
	Sun,  7 Dec 2025 17:01:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id heb2_-4gsI1x; Sun,  7 Dec 2025 17:01:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BBCB60BBA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765126886;
	bh=66J2eFp/xG/JtpLta/bIqurQ/faoBa8WyoMgqF1+6wQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Js1Vxn/LkJ4RSHujO+H5LtpBfSEEzIYJzO2WjdAQH7hHM4+jAFVW8H71MQS5c/xcV
	 GkaNeV7JRGt4LGUZv3rOOI/jKNDH98dUyTIIZZuGFHd5oasiJNYnI7yPVweHQb4SQ9
	 DfI5KTkKeF1LF4cc7tQSRw82/8Xf2JS/iVhfj+C/LAZkMEn4BK2mhQh/3IO9tSkgOQ
	 AE8PbFbXyAc2gtK+Un1qUVzF4Psq3qMx3v4SRMYRj+z0f3Fi7zsz5/pn2sp7VOy13I
	 ncqW2zcmCwveD3f582EV024mOdySb67CFIEVnmujvWUf0f6oaxMQFhXxLWjwcDh81R
	 gHDuEtH6HqANA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BBCB60BBA;
	Sun,  7 Dec 2025 17:01:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E2F3E7
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C678608A9
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hRaYGTspLb84 for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 17:01:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E3C760B55
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E3C760B55
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:01:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A064867B4; Sun,  7 Dec 2025 17:01:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 17:10:16 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b6d5717f1b9a9a5c419610425ffa1542f4693e16
X-Git-Newrev: 71c6b157db233ec803f0a33f52e4d1a12058ba15
X-Patchwork-Hint: ignore
Message-Id: <20251207170112.6A064867B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libosmium: fix cmake 4
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=71c6b157db233ec803f0a33f52e4d1a12058ba15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-Require-a-more-modern-CMake.patch         | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/package/libosmium/0001-Require-a-more-modern-CMake.patch b/package/libosmium/0001-Require-a-more-modern-CMake.patch
new file mode 100644
index 0000000000..6c39e751fb
--- /dev/null
+++ b/package/libosmium/0001-Require-a-more-modern-CMake.patch
@@ -0,0 +1,45 @@
+From 7ab87418a0697ac9b7b5f005fbd64dcd99a01124 Mon Sep 17 00:00:00 2001
+From: Jochen Topf <jochen@topf.org>
+Date: Tue, 15 Jul 2025 17:19:57 +0200
+Subject: [PATCH] Require a more modern CMake
+
+So it works with CMake 4
+
+See #391
+
+Upstream: https://github.com/osmcode/libosmium/commit/7ab87418a0697ac9b7b5f005fbd64dcd99a01124
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 11 ++---------
+ 1 file changed, 2 insertions(+), 9 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index cfeffa8e..80f6bfe1 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -6,7 +6,7 @@
+ #
+ #-----------------------------------------------------------------------------
+ 
+-cmake_minimum_required(VERSION 2.8.12 FATAL_ERROR)
++cmake_minimum_required(VERSION 3.10.0 FATAL_ERROR)
+ list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
+ 
+ 
+@@ -36,14 +36,7 @@ set(CMAKE_CONFIGURATION_TYPES "Debug;Release;RelWithDebInfo;MinSizeRel;Dev;Cover
+ #
+ #-----------------------------------------------------------------------------
+ 
+-project(libosmium)
+-
+-set(LIBOSMIUM_VERSION_MAJOR 2)
+-set(LIBOSMIUM_VERSION_MINOR 22)
+-set(LIBOSMIUM_VERSION_PATCH 0)
+-
+-set(LIBOSMIUM_VERSION
+-    "${LIBOSMIUM_VERSION_MAJOR}.${LIBOSMIUM_VERSION_MINOR}.${LIBOSMIUM_VERSION_PATCH}")
++project(libosmium VERSION 2.22.0 LANGUAGES CXX C)
+ 
+ set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
