Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C01AC433F5
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 14:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 195C560AF4;
	Sun, 30 Jan 2022 14:57:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OkZPvnda8JJa; Sun, 30 Jan 2022 14:57:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5584160692;
	Sun, 30 Jan 2022 14:57:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D76B41BF425
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D24394053C
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:57:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rSeiYDsqGIUH for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 14:57:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D321F40332
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 14:57:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2516982747; Sun, 30 Jan 2022 14:49:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jan 2022 15:56:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7a2e33c5149c902e8532be7db6b97a6ef4fb9e62
X-Git-Newrev: b4fabac3f7fd55570e1ccddc023a64bef712d2fc
X-Patchwork-Hint: ignore
Message-Id: <20220130144959.2516982747@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/p11-kit: bump to version 0.24.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b4fabac3f7fd55570e1ccddc023a64bef712d2fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version)

https://github.com/p11-glue/p11-kit/releases/tag/0.24.1
https://github.com/p11-glue/p11-kit/releases/tag/0.24.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...t-lists-c-Add-stdint-h-to-fix-compilation.patch | 28 ----------------------
 package/p11-kit/p11-kit.hash                       |  2 +-
 package/p11-kit/p11-kit.mk                         |  2 +-
 3 files changed, 2 insertions(+), 30 deletions(-)

diff --git a/package/p11-kit/0001-p11-kit-lists-c-Add-stdint-h-to-fix-compilation.patch b/package/p11-kit/0001-p11-kit-lists-c-Add-stdint-h-to-fix-compilation.patch
deleted file mode 100644
index d4828666d3..0000000000
--- a/package/p11-kit/0001-p11-kit-lists-c-Add-stdint-h-to-fix-compilation.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 507c394cfcf4edffc5e4450c5d737e545c26b857 Mon Sep 17 00:00:00 2001
-From: Daniel Engberg <daniel.engberg.lists@pyret.net>
-Date: Sat, 12 Dec 2020 18:56:38 +0100
-Subject: [PATCH] p11-kit/lists.c: Add stdint.h to fix compilation
-
-Add stdint.h otherwise compilation fails on FreeBSD 13-CURRENT with "use of undeclared identifier 'SIZE_MAX'"
-
-Signed-off-by: Daniel Engberg <daniel.engberg.lists@pyret.net>
-
-[Retrieved from:
-https://github.com/p11-glue/p11-kit/commit/507c394cfcf4edffc5e4450c5d737e545c26b857]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- p11-kit/lists.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/p11-kit/lists.c b/p11-kit/lists.c
-index 365a6d89..1d9062be 100644
---- a/p11-kit/lists.c
-+++ b/p11-kit/lists.c
-@@ -39,6 +39,7 @@
- 
- #include <assert.h>
- #include <ctype.h>
-+#include <stdint.h>
- #include <string.h>
- #include <stdio.h>
- #include <stdlib.h>
diff --git a/package/p11-kit/p11-kit.hash b/package/p11-kit/p11-kit.hash
index 3481a40b00..e950060c91 100644
--- a/package/p11-kit/p11-kit.hash
+++ b/package/p11-kit/p11-kit.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  8a8f40153dd5a3f8e7c03e641f8db400133fb2a6a9ab2aee1b6d0cb0495ec6b6  p11-kit-0.23.22.tar.xz
+sha256  d8be783efd5cd4ae534cee4132338e3f40f182c3205d23b200094ec85faaaef8  p11-kit-0.24.1.tar.xz
 # Locally computed
 sha256  2e1ba993904df807a10c3eda1e5c272338edc35674b679773a8b3ad460731054  COPYING
diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
index 284eb0fa35..868e3a7c9b 100644
--- a/package/p11-kit/p11-kit.mk
+++ b/package/p11-kit/p11-kit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-P11_KIT_VERSION = 0.23.22
+P11_KIT_VERSION = 0.24.1
 P11_KIT_SOURCE = p11-kit-$(P11_KIT_VERSION).tar.xz
 P11_KIT_SITE = https://github.com/p11-glue/p11-kit/releases/download/$(P11_KIT_VERSION)
 P11_KIT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
