Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E765CD1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 17:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0F0D608A9;
	Sun,  7 Dec 2025 17:01:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4RilH3N_AIdm; Sun,  7 Dec 2025 17:01:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E648C60B4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765126880;
	bh=ZrGeAxuCdaVu5wZNRCYrKf7HCJoAbkikT+CgwKKUzrU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sYsS2Kdu2E4s5QNMDqx0sNdDzEZy6j4XK5Wruh3k1sjX72kQbdjjafesDsiciApIH
	 Uk5zIgEH2M7n8FAjamBQTrqKfhR0eZDgmYVFHC/tMaMgseeghacGdln1XHjgRJ4For
	 HKOY0LqZeT4Fen9qY6rUPv2UCzU2t/m7Efsc4eOqEcTxKOVvqw/nCBedm070uowHIw
	 OTkwAt4jsyi1ZHDgZFRIcpPLGAmI9tbdGXgGQDtm+aJxhdW0SSQiqw9IG2kYWdqKpP
	 z7CBkYRQ9l0WBVdpVBJygmwA4Q3bpKkdn2JN6z7rY81QA4cnLoqcjgZkocXtpDhKVv
	 GdAuPO83cD7fw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E648C60B4E;
	Sun,  7 Dec 2025 17:01:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0552E2CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D8588608A9
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xwxXlUX8yVqT for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 17:01:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9364360B62
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9364360B62
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:01:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 916B3867B5; Sun,  7 Dec 2025 17:01:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 17:10:28 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f3192e35e2437241b4385157c91d8cc16163f97a
X-Git-Newrev: b1c899820e4afdb74153e13f797764f8091ed723
X-Patchwork-Hint: ignore
Message-Id: <20251207170112.916B3867B5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mraa: fix cmake 4
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

commit: https://git.buildroot.net/buildroot/commit/?id=b1c899820e4afdb74153e13f797764f8091ed723
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mraa/0003-cmake-bump-minimum-version.patch | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/package/mraa/0003-cmake-bump-minimum-version.patch b/package/mraa/0003-cmake-bump-minimum-version.patch
new file mode 100644
index 0000000000..8cad2b7ba1
--- /dev/null
+++ b/package/mraa/0003-cmake-bump-minimum-version.patch
@@ -0,0 +1,46 @@
+From 92a1337e110464bbb3aaba2b3ede77dc13b3f175 Mon Sep 17 00:00:00 2001
+From: Alex T <alext.mkrs@gmail.com>
+Date: Sun, 2 Nov 2025 19:06:06 +0100
+Subject: [PATCH] cmake: bump minimum version to address a deprecation warning
+
+This fixes the following warning shown while configuring:
+
+  [cmake] CMake Deprecation Warning at CMakeLists.txt:1 (cmake_minimum_required):
+  [cmake] Compatibility with CMake < 3.10 will be removed from a future version of
+  [cmake] CMake.
+
+We don't have a clearly defined supported distro/versions list, so I
+took Ubuntu 22.04 as arguably the oldest one we'd want to support for
+the reference point. It has CMake 3.22, released in July 2022.
+
+Signed-off-by: Alex T <alext.mkrs@gmail.com>
+
+Upstream: https://github.com/eclipse/mraa/commit/92a1337e110464bbb3aaba2b3ede77dc13b3f175
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 10 ++--------
+ 1 file changed, 2 insertions(+), 8 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 7a13eeb81..34ded2b75 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,15 +1,9 @@
+-cmake_minimum_required (VERSION 2.8.11)
++cmake_minimum_required (VERSION 3.22)
+ project (mraa C)
+ 
+ FIND_PACKAGE (Threads REQUIRED)
+ 
+-if (CMAKE_VERSION VERSION_LESS "3.1")
+-  if (CMAKE_C_COMPILER_ID STREQUAL "GNU")
+-    set (CMAKE_C_FLAGS "-std=gnu99 ${CMAKE_C_FLAGS}")
+-  endif ()
+-else ()
+-  set (CMAKE_C_STANDARD 99)
+-endif ()
++set (CMAKE_C_STANDARD 99)
+ 
+ option (BUILDCPP "Enable C++ (needed by FTDI4222 and tests)" ON)
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
