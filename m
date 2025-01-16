Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F46C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:59:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 330C070663;
	Fri, 28 Feb 2025 16:59:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LbcM3PSQuufp; Fri, 28 Feb 2025 16:59:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FB0A70773
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FB0A70773;
	Fri, 28 Feb 2025 16:59:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A423711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 53101424DC
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pvsL5RsGOiSA for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8F1642581
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8F1642581
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B51C982A68; Fri, 28 Feb 2025 16:30:12 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 16 Jan 2025 23:16:19 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 93bcd8b06a952ab34c1d53541b324a48f8eb6dc0
X-Git-Newrev: 30b05ce90d3368c0c74d2602735afdadbe50ec54
X-Patchwork-Hint: ignore
Message-Id: <20250228163012.B51C982A68@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libzenoh-pico: bump to
 version 1.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=30b05ce90d3368c0c74d2602735afdadbe50ec54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixed CMakeLists.txt patch

https://github.com/eclipse-zenoh/zenoh-pico/releases/tag/1.1.0

Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...eLists.txt-don-t-override-the-optimization-level.patch | 15 +++++++++------
 package/libzenoh-pico/libzenoh-pico.hash                  |  2 +-
 package/libzenoh-pico/libzenoh-pico.mk                    |  2 +-
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/package/libzenoh-pico/0001-CMakeLists.txt-don-t-override-the-optimization-level.patch b/package/libzenoh-pico/0001-CMakeLists.txt-don-t-override-the-optimization-level.patch
index 9f911a750b..e9a3520407 100644
--- a/package/libzenoh-pico/0001-CMakeLists.txt-don-t-override-the-optimization-level.patch
+++ b/package/libzenoh-pico/0001-CMakeLists.txt-don-t-override-the-optimization-level.patch
@@ -30,10 +30,10 @@ Upstream: https://github.com/eclipse-zenoh/zenoh-pico/pull/847
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 7a9fb6d1..97fba56a 100644
+index 25b62fb5..623d13f8 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -85,13 +85,13 @@ string(TOUPPER ${CMAKE_BUILD_TYPE} CMAKE_BUILD_TYPE)
+@@ -86,15 +86,15 @@ string(TOUPPER ${CMAKE_BUILD_TYPE} CMAKE_BUILD_TYPE)
  # Compile options
  if(CMAKE_BUILD_TYPE MATCHES "RELEASE" OR "Release")
    if(UNIX)
@@ -44,13 +44,16 @@ index 7a9fb6d1..97fba56a 100644
 +    add_compile_options(-pipe)
    endif()
  else()
-   if(UNIX)
+   if(CMAKE_SYSTEM_NAME MATCHES "PICO")
+-    add_compile_options(-c -Wall -Wextra -Wno-unused -Wno-strict-prototypes -pipe -g -O0)
++    add_compile_options(-c -Wall -Wextra -Wno-unused -Wno-strict-prototypes -pipe -g)
+   elseif(UNIX)
 -    add_compile_options(-c -Wall -Wextra -Werror -Wshadow -Wunused -Wstrict-prototypes -pipe -g -O0)
 +    add_compile_options(-c -Wall -Wextra -Werror -Wshadow -Wunused -Wstrict-prototypes -pipe -g)
      # C99 pedantic doesn't like struct anonymous in unix header
      if (NOT CMAKE_C_STANDARD STREQUAL "99")
        add_compile_options(-Wpedantic)
-@@ -100,7 +100,7 @@ else()
+@@ -103,7 +103,7 @@ else()
    elseif(MSVC)
      add_compile_options(/W4 /WX /Od /wd4127)
    elseif(CMAKE_SYSTEM_NAME MATCHES "Generic")
@@ -58,7 +61,7 @@ index 7a9fb6d1..97fba56a 100644
 +    add_compile_options(-Wall -Wextra -Wno-unused-parameter -Wmissing-prototypes -pipe -g)
    endif()
  endif()
- 
--- 
+
+--
 2.47.1
 
diff --git a/package/libzenoh-pico/libzenoh-pico.hash b/package/libzenoh-pico/libzenoh-pico.hash
index 4f95f2215e..5bf924987a 100644
--- a/package/libzenoh-pico/libzenoh-pico.hash
+++ b/package/libzenoh-pico/libzenoh-pico.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c9002b4e348337c6fa522a2c80e175f512fa94d1837a9332fe095cf254e77242  libzenoh-pico-1.0.4.tar.gz
+sha256  4033d3867a8e94e587355639de2ad9045c0a1ed0409c7901a93dbd2cf2d9308b  libzenoh-pico-1.1.0.tar.gz
 sha256  d386df32cf327bbb25abe894277d3d7e0f447bafc59f4ad362615b0136f30db5  LICENSE
diff --git a/package/libzenoh-pico/libzenoh-pico.mk b/package/libzenoh-pico/libzenoh-pico.mk
index bd1dd763d6..e243ec64fe 100644
--- a/package/libzenoh-pico/libzenoh-pico.mk
+++ b/package/libzenoh-pico/libzenoh-pico.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBZENOH_PICO_VERSION = 1.0.4
+LIBZENOH_PICO_VERSION = 1.1.0
 LIBZENOH_PICO_SITE = $(call github,eclipse-zenoh,zenoh-pico,$(LIBZENOH_PICO_VERSION))
 LIBZENOH_PICO_LICENSE = Apache-2.0 or EPL-2.0
 LIBZENOH_PICO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
