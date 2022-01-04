Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D611FC433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 18:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91BB160B97;
	Tue,  4 Jan 2022 18:10:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZWxeYUzeJMki; Tue,  4 Jan 2022 18:10:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4C0760B38;
	Tue,  4 Jan 2022 18:10:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 19B391BF5DB
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5D2081C6F
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:09:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u6Szb8Yp-EgW for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 18:09:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8B11812DB
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 18:09:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0897E82BA6; Tue,  4 Jan 2022 18:02:57 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 4 Jan 2022 18:32:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5f6f3b99fbac974e4b8d977810e97500126ef4d1
X-Git-Newrev: 5dbdb2535c649ee617595b8c4ae3cbba0ee37b97
X-Patchwork-Hint: ignore
Message-Id: <20220104180257.0897E82BA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xxhash: bump to version 0.8.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=5dbdb2535c649ee617595b8c4ae3cbba0ee37b97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop first patch (already in version)
- Refresh upstream status of latest patch
- Update hash of LICENSE and add cli/COPYING:
  https://github.com/Cyan4973/xxHash/commit/85e1ea2ab0d90463b804f4a65b0f67d99718c6f8

https://github.com/Cyan4973/xxHash/releases/tag/v0.8.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ....patch => 0001-fix-man-page-installation.patch} |  0
 .../xxhash/0001-fixed-man-page-installation.patch  | 31 ----------------------
 ...2-Makefile-add-dedicated-install-targets.patch} |  8 +++---
 package/xxhash/xxhash.hash                         |  5 ++--
 package/xxhash/xxhash.mk                           |  4 +--
 5 files changed, 8 insertions(+), 40 deletions(-)

diff --git a/package/xxhash/0002-fix-man-page-installation.patch b/package/xxhash/0001-fix-man-page-installation.patch
similarity index 100%
rename from package/xxhash/0002-fix-man-page-installation.patch
rename to package/xxhash/0001-fix-man-page-installation.patch
diff --git a/package/xxhash/0001-fixed-man-page-installation.patch b/package/xxhash/0001-fixed-man-page-installation.patch
deleted file mode 100644
index a9f68db4b4..0000000000
--- a/package/xxhash/0001-fixed-man-page-installation.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From e345ccaf4daa8c35698ab02c0de346fcc0ca9ef6 Mon Sep 17 00:00:00 2001
-From: Yann Collet <cyan@fb.com>
-Date: Fri, 6 Aug 2021 15:29:32 -0700
-Subject: [PATCH] fixed man page installation
-
-[Retrieved from:
-https://github.com/Cyan4973/xxHash/commit/e345ccaf4daa8c35698ab02c0de346fcc0ca9ef6]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- Makefile | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index b8552a9f..556a32a0 100644
---- a/Makefile
-+++ b/Makefile
-@@ -498,10 +498,10 @@ endif
- 	$(Q)ln -sf xxhsum $(DESTDIR)$(BINDIR)/xxh64sum
- 	$(Q)ln -sf xxhsum $(DESTDIR)$(BINDIR)/xxh128sum
- 	@echo Installing man pages
--	$(Q)$(INSTALL_DATA) xxhsum.1 $(DESTDIR)$(MANDIR)/xxhsum.1
--	$(Q)ln -sf xxhsum.1 $(DESTDIR)$(MANDIR)/xxh32sum.1
--	$(Q)ln -sf xxhsum.1 $(DESTDIR)$(MANDIR)/xxh64sum.1
--	$(Q)ln -sf xxhsum.1 $(DESTDIR)$(MANDIR)/xxh128sum.1
-+	$(Q)$(INSTALL_DATA) $(MAN) $(DESTDIR)$(MANDIR)/xxhsum.1
-+	$(Q)ln -sf $(MAN) $(DESTDIR)$(MANDIR)/xxh32sum.1
-+	$(Q)ln -sf $(MAN) $(DESTDIR)$(MANDIR)/xxh64sum.1
-+	$(Q)ln -sf $(MAN) $(DESTDIR)$(MANDIR)/xxh128sum.1
- 	@echo xxhash installation completed
- 
- .PHONY: uninstall
diff --git a/package/xxhash/0003-Makefile-add-dedicated-install-targets.patch b/package/xxhash/0002-Makefile-add-dedicated-install-targets.patch
similarity index 94%
rename from package/xxhash/0003-Makefile-add-dedicated-install-targets.patch
rename to package/xxhash/0002-Makefile-add-dedicated-install-targets.patch
index 0607c8ee82..17d34a0823 100644
--- a/package/xxhash/0003-Makefile-add-dedicated-install-targets.patch
+++ b/package/xxhash/0002-Makefile-add-dedicated-install-targets.patch
@@ -10,13 +10,14 @@ This is especially useful on embedded systems where dynamic library is
 not always supported by toolchains
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/Cyan4973/xxHash/pull/665]
+[Retrieved from:
+https://github.com/Cyan4973/xxHash/commit/db9c199e99f7b4d419647b1ef49c547fc2547516]
 ---
  Makefile | 18 +++++++++++++++---
  1 file changed, 15 insertions(+), 3 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index 8d4fcd2..5fe7297 100644
+index 8d4fcd21..5fe72972 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -505,11 +505,14 @@ libxxhash.pc: libxxhash.pc.in
@@ -68,6 +69,3 @@ index 8d4fcd2..5fe7297 100644
  	@echo xxhash installation completed
  
  .PHONY: uninstall
--- 
-2.33.0
-
diff --git a/package/xxhash/xxhash.hash b/package/xxhash/xxhash.hash
index feb5000808..2c99236a45 100644
--- a/package/xxhash/xxhash.hash
+++ b/package/xxhash/xxhash.hash
@@ -1,3 +1,4 @@
 # locally computed
-sha256  7054c3ebd169c97b64a92d7b994ab63c70dd53a06974f1f630ab782c28db0f4f  xxhash-0.8.0.tar.gz
-sha256  9da63520e9293d82c4b1613be5c84058cadb82b02f5972179bad13731d589910  LICENSE
+sha256  3bb6b7d6f30c591dd65aaaff1c8b7a5b94d81687998ca9400082c739a690436c  xxhash-0.8.1.tar.gz
+sha256  553d0035773ddd1590045f8fdc3a4c6ead31e36336721aeca8421e88ed1c9f80  LICENSE
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  cli/COPYING
diff --git a/package/xxhash/xxhash.mk b/package/xxhash/xxhash.mk
index 3e7f3244b3..a8f8d1d179 100644
--- a/package/xxhash/xxhash.mk
+++ b/package/xxhash/xxhash.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-XXHASH_VERSION = 0.8.0
+XXHASH_VERSION = 0.8.1
 XXHASH_SITE = $(call github,Cyan4973,xxHash,v$(XXHASH_VERSION))
 XXHASH_LICENSE = BSD-2-Clause (library), GPL-2.0+ (xxhsum)
-XXHASH_LICENSE_FILES = LICENSE
+XXHASH_LICENSE_FILES = LICENSE cli/COPYING
 XXHASH_INSTALL_STAGING = YES
 
 XXHASH_TARGETS = xxhsum
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
