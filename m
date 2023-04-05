Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF780C7619A
	for <buildroot@archiver.kernel.org>; Wed,  5 Apr 2023 20:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6719761415;
	Wed,  5 Apr 2023 20:36:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6719761415
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GvyTjlZdL4sD; Wed,  5 Apr 2023 20:36:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FF1E61443;
	Wed,  5 Apr 2023 20:36:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FF1E61443
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 29C8B1C2BD5
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 20:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B039760F40
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 20:35:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B039760F40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yn_nSsvHJpMl for <buildroot@lists.busybox.net>;
 Wed,  5 Apr 2023 20:35:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B04261414
 for <buildroot@buildroot.org>; Wed,  5 Apr 2023 20:35:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B04261414
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1909E83946; Wed,  5 Apr 2023 20:35:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 5 Apr 2023 22:33:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 69ee42a26bb3d6965449ed7cd2b0854bbed095d7
X-Git-Newrev: 835d7780310fa94a036c93e85ae26923356ad586
X-Patchwork-Hint: ignore
Message-Id: <20230405203540.1909E83946@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/irrlicht: bump to version 1.8.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=835d7780310fa94a036c93e85ae26923356ad586
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop second patch (not needed since
https://sourceforge.net/p/irrlicht/code/5349/)

https://irrlicht.sourceforge.io/forum/viewtopic.php?f=2&t=52775

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...rride-LDFLAGS-and-remove-obsolete-X11R6-.patch} |  0
 package/irrlicht/0002-remove-sys-sysctl.h.patch    | 38 ----------------------
 package/irrlicht/irrlicht.hash                     |  8 ++---
 package/irrlicht/irrlicht.mk                       |  2 +-
 4 files changed, 5 insertions(+), 43 deletions(-)

diff --git a/package/irrlicht/0003-makefile-override-LDFLAGS-and-remove-obsolete-X11R6-.patch b/package/irrlicht/0002-makefile-override-LDFLAGS-and-remove-obsolete-X11R6-.patch
similarity index 100%
rename from package/irrlicht/0003-makefile-override-LDFLAGS-and-remove-obsolete-X11R6-.patch
rename to package/irrlicht/0002-makefile-override-LDFLAGS-and-remove-obsolete-X11R6-.patch
diff --git a/package/irrlicht/0002-remove-sys-sysctl.h.patch b/package/irrlicht/0002-remove-sys-sysctl.h.patch
deleted file mode 100644
index d9142a9a22..0000000000
--- a/package/irrlicht/0002-remove-sys-sysctl.h.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 5382142d37730f6758753b758c91e257ffd5892c Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Sun, 9 Apr 2017 22:20:19 +0200
-Subject: [PATCH] remove sys/sysctl.h
-
-With musl irrlicht doesn't build due to missing sys/sysctl.h
-
-fatal error: sys/sysctl.h: No such file or directory
-
-From [1]
-"sysctl does not work, and NEVER worked. using it is bogus.
-it was a bogus experimental syscall that was deprecated before
-it was ever used (basically, a broken binary version of
-/proc/sys, without any stability between kernel versions for
-what the binary constants meant)."
-
-[1] https://devsonacid.wordpress.com/tag/musl/
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- source/Irrlicht/COSOperator.cpp | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/source/Irrlicht/COSOperator.cpp b/source/Irrlicht/COSOperator.cpp
-index 0899d1d..ccf5ef5 100644
---- a/source/Irrlicht/COSOperator.cpp
-+++ b/source/Irrlicht/COSOperator.cpp
-@@ -13,7 +13,6 @@
- #include <unistd.h>
- #ifndef _IRR_SOLARIS_PLATFORM_
- #include <sys/types.h>
--#include <sys/sysctl.h>
- #endif
- #endif
- 
--- 
-2.9.3
-
diff --git a/package/irrlicht/irrlicht.hash b/package/irrlicht/irrlicht.hash
index e7cd3ec918..7f9bceb0c1 100644
--- a/package/irrlicht/irrlicht.hash
+++ b/package/irrlicht/irrlicht.hash
@@ -1,8 +1,8 @@
-# From https://sourceforge.net/projects/irrlicht/files/Irrlicht%20SDK/1.8/1.8.4
-md5  9401cfff801395010b0912211f3cbb4f  irrlicht-1.8.4.zip
-sha1  38bf0223fe868d243d6a39d0dc191c8df6e03b3b  irrlicht-1.8.4.zip
+# From https://sourceforge.net/projects/irrlicht/files/Irrlicht%20SDK/1.8/1.8.5
+md5  1fcf67c2906eb84b531af512de8481b1  irrlicht-1.8.5.zip
+sha1  96908ebc379e0172261c240dc018416ce6a3e4e3  irrlicht-1.8.5.zip
 # Locally calculated
-sha256  f42b280bc608e545b820206fe2a999c55f290de5c7509a02bdbeeccc1bf9e433  irrlicht-1.8.4.zip
+sha256  effb7beed3985099ce2315a959c639b4973aac8210f61e354475a84105944f3d  irrlicht-1.8.5.zip
 sha256  cc86e0b830f9d48933feb198f2741a7d9bb7c34fe8a35302d8ce36b8e2ecb27b  doc/aesGladman.txt
 sha256  e8a6b63336018eec09ac3a7cdfe5a80bda635641bc0397a77b8baa25bed03800  doc/bzip2-license.txt
 sha256  ca38f1ba4ab901111f6eee50009bd46dbd866e6beb98d592d843f7c162d73409  doc/irrlicht-license.txt
diff --git a/package/irrlicht/irrlicht.mk b/package/irrlicht/irrlicht.mk
index bd82815cde..c1da50a53c 100644
--- a/package/irrlicht/irrlicht.mk
+++ b/package/irrlicht/irrlicht.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 IRRLICHT_VERSION_MAJOR = 1.8
-IRRLICHT_VERSION = $(IRRLICHT_VERSION_MAJOR).4
+IRRLICHT_VERSION = $(IRRLICHT_VERSION_MAJOR).5
 IRRLICHT_SOURCE = irrlicht-$(IRRLICHT_VERSION).zip
 IRRLICHT_SITE = https://downloads.sourceforge.net/project/irrlicht/Irrlicht%20SDK/$(IRRLICHT_VERSION_MAJOR)/$(IRRLICHT_VERSION)
 IRRLICHT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
