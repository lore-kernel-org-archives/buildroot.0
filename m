Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F45C433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 16:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A4DF81D18;
	Sun, 27 Mar 2022 16:10:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NjIP_FAuHXuD; Sun, 27 Mar 2022 16:10:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19E89827AA;
	Sun, 27 Mar 2022 16:10:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 12F501BF303
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0AA06402BB
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:09:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aveghjsjaTL7 for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 16:09:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E232D40A7A
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 16:09:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 87AB485DB6; Sun, 27 Mar 2022 16:00:39 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 27 Mar 2022 17:59:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 618a23100fe5ff54b90ada1a8f23453f6c5a77dc
X-Git-Newrev: a324bbcf7e44d819fce8584595ca49bde7077e33
X-Patchwork-Hint: ignore
Message-Id: <20220327160039.87AB485DB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mp4v2: bump to version 2.1.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=a324bbcf7e44d819fce8584595ca49bde7077e33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Switch to new active fork:
  https://github.com/enzo1982/mp4v2/discussions/1
  https://github.com/TechSmith/mp4v2/commit/461abd2b1365e14ba28dd0e4a0cb6c3bee1bab41
- C++11 is not needed anymore thanks to
  https://github.com/enzo1982/mp4v2/commit/5a57bc2ce8948f6ffa96761286921ab3e2ebe467
- Drop patch (not needed since
  https://github.com/enzo1982/mp4v2/commit/23f8b907d4a221e1dae9e8b859cb6b1161206866)
- Update license (minor fix:
  https://github.com/enzo1982/mp4v2/commit/0c37402d9d3644ea0b7d55db1d901bfad9723dfc)
- Version 2.1.1 was never released before so no issue is expected
  (except a misunderstanding of users but new upstream is aware of this:
  https://github.com/enzo1982/mp4v2/discussions/1#discussioncomment-2399344)

https://github.com/enzo1982/mp4v2/releases/tag/v2.1.1
https://github.com/enzo1982/mp4v2/releases/tag/v2.1.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...001-Static-cast-to-unsigned-int-for-cases.patch | 99 ----------------------
 package/mp4v2/Config.in                            |  8 +-
 package/mp4v2/mp4v2.hash                           |  4 +-
 package/mp4v2/mp4v2.mk                             |  5 +-
 4 files changed, 8 insertions(+), 108 deletions(-)

diff --git a/package/mp4v2/0001-Static-cast-to-unsigned-int-for-cases.patch b/package/mp4v2/0001-Static-cast-to-unsigned-int-for-cases.patch
deleted file mode 100644
index 6c9b13bed8..0000000000
--- a/package/mp4v2/0001-Static-cast-to-unsigned-int-for-cases.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From a5ca35b044bbf13c0b16f0066bf24646604bb218 Mon Sep 17 00:00:00 2001
-From: "Jason A. Donenfeld" <Jason@zx2c4.com>
-Date: Thu, 6 Aug 2020 15:22:04 +0200
-Subject: [PATCH] Static cast to unsigned int for cases
-
-Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
-[Retrieved from:
-https://gitweb.gentoo.org/repo/gentoo.git/tree/media-libs/libmp4v2/files/libmp4v2-2.0.0-unsigned-int-cast.patch]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- libutil/Utility.cpp  | 2 +-
- util/mp4art.cpp      | 2 +-
- util/mp4chaps.cpp    | 2 +-
- util/mp4file.cpp     | 2 +-
- util/mp4subtitle.cpp | 2 +-
- util/mp4track.cpp    | 2 +-
- 6 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/libutil/Utility.cpp b/libutil/Utility.cpp
-index 76cdd12..d6739d4 100644
---- a/libutil/Utility.cpp
-+++ b/libutil/Utility.cpp
-@@ -493,7 +493,7 @@ Utility::process_impl()
-         if( codes.find( code ) == codes.end() )
-             continue;
- 
--        switch( code ) {
-+        switch( static_cast<unsigned int>( code ) ) {
-             case 'z':
-                 _optimize = true;
-                 break;
-diff --git a/util/mp4art.cpp b/util/mp4art.cpp
-index add935e..6e7f531 100644
---- a/util/mp4art.cpp
-+++ b/util/mp4art.cpp
-@@ -376,7 +376,7 @@ ArtUtility::utility_option( int code, bool& handled )
- {
-     handled = true;
- 
--    switch( code ) {
-+    switch( static_cast<unsigned int> ( code ) ) {
-         case LC_ART_ANY:
-             _artFilter = numeric_limits<uint32_t>::max();
-             break;
-diff --git a/util/mp4chaps.cpp b/util/mp4chaps.cpp
-index 98400f8..ccc8b70 100644
---- a/util/mp4chaps.cpp
-+++ b/util/mp4chaps.cpp
-@@ -632,7 +632,7 @@ ChapterUtility::utility_option( int code, bool& handled )
- {
-     handled = true;
- 
--    switch( code ) {
-+    switch( static_cast<unsigned int> ( code ) ) {
-         case 'A':
-         case LC_CHPT_ANY:
-             _ChapterType = MP4ChapterTypeAny;
-diff --git a/util/mp4file.cpp b/util/mp4file.cpp
-index c27844b..b127cd1 100644
---- a/util/mp4file.cpp
-+++ b/util/mp4file.cpp
-@@ -189,7 +189,7 @@ FileUtility::utility_option( int code, bool& handled )
- {
-     handled = true;
- 
--    switch( code ) {
-+    switch( static_cast<unsigned int>( code ) ) {
-         case LC_LIST:
-             _action = &FileUtility::actionList;
-             break;
-diff --git a/util/mp4subtitle.cpp b/util/mp4subtitle.cpp
-index 7462153..19d977d 100644
---- a/util/mp4subtitle.cpp
-+++ b/util/mp4subtitle.cpp
-@@ -164,7 +164,7 @@ SubtitleUtility::utility_option( int code, bool& handled )
- {
-     handled = true;
- 
--    switch( code ) {
-+    switch( static_cast<unsigned int>( code ) ) {
-         case LC_LIST:
-             _action = &SubtitleUtility::actionList;
-             break;
-diff --git a/util/mp4track.cpp b/util/mp4track.cpp
-index d550506..cd63d7e 100644
---- a/util/mp4track.cpp
-+++ b/util/mp4track.cpp
-@@ -788,7 +788,7 @@ TrackUtility::utility_option( int code, bool& handled )
- {
-     handled = true;
- 
--    switch( code ) {
-+    switch( static_cast<unsigned int>( code ) ) {
-         case LC_TRACK_WILDCARD:
-             _trackMode = TM_WILDCARD;
-             break;
--- 
-2.28.0
-
diff --git a/package/mp4v2/Config.in b/package/mp4v2/Config.in
index 00e80cd358..705a8c9d24 100644
--- a/package/mp4v2/Config.in
+++ b/package/mp4v2/Config.in
@@ -1,12 +1,11 @@
 config BR2_PACKAGE_MP4V2
 	bool "mp4v2"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++11
 	help
 	  The MP4v2 library provides functions to read, create, and
 	  modify mp4 files.
 
-	  https://github.com/TechSmith/mp4v2/
+	  https://mp4v2.org/
 
 if BR2_PACKAGE_MP4V2
 
@@ -19,6 +18,5 @@ config BR2_PACKAGE_MP4V2_UTIL
 
 endif
 
-comment "mp4v2 needs a toolchain w/ C++, gcc >= 5"
-	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
+comment "mp4v2 needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/mp4v2/mp4v2.hash b/package/mp4v2/mp4v2.hash
index 7aa5402c8f..d3f0243650 100644
--- a/package/mp4v2/mp4v2.hash
+++ b/package/mp4v2/mp4v2.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  de31e430e2641f25b67d10c47b0cda35279881b0196120e33bcd71b9cef1bd58  mp4v2-5.0.1.tar.gz
-sha256  15e38684c940176e2fc76331a2299d2ab5115ac997078f768ef31b896af69fc5  COPYING
+sha256  29420c62e56a2e527fd8979d59d05ed6d83ebe27e0e2c782c1ec19a3a402eaee  mp4v2-2.1.1.tar.bz2
+sha256  7187891a4c39ee9e7ec70c71fc7dc8b8ed02c6f56ae1ffc017a34ac66dca5390  COPYING
diff --git a/package/mp4v2/mp4v2.mk b/package/mp4v2/mp4v2.mk
index 6d29228a13..7de837c170 100644
--- a/package/mp4v2/mp4v2.mk
+++ b/package/mp4v2/mp4v2.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-MP4V2_VERSION = 5.0.1
+MP4V2_VERSION = 2.1.1
 MP4V2_SITE = \
-	$(call github,TechSmith,mp4v2,Release-ThirdParty-MP4v2-$(MP4V2_VERSION))
+	https://github.com/enzo1982/mp4v2/releases/download/v$(MP4V2_VERSION)
+MP4V2_SOURCE = mp4v2-$(MP4V2_VERSION).tar.bz2
 MP4V2_INSTALL_STAGING = YES
 MP4V2_LICENSE = MPL-1.1
 MP4V2_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
