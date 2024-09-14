Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DBABC0218B
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 09:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B8A784762;
	Sat, 14 Sep 2024 09:23:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0c-iA7seP9ki; Sat, 14 Sep 2024 09:23:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1271B84774
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1271B84774;
	Sat, 14 Sep 2024 09:23:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0EC751BF280
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:22:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 042674037C
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:22:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oFoK0HJv9Om7 for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 09:22:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1B8B403C9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1B8B403C9
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 09:22:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9B11187070; Sat, 14 Sep 2024 09:22:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 11:22:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ed2013938f5962ad638d85232de96599bde231b5
X-Git-Newrev: a862fe17656ff3c2564506c0e8ac4a128d9ef69d
X-Patchwork-Hint: ignore
Message-Id: <20240914092253.9B11187070@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lz4: bump to version 1.10.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=a862fe17656ff3c2564506c0e8ac4a128d9ef69d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

remove merged patch

programs/COPYING: update gpl license to 2.0-or-later
    see https://github.com/lz4/lz4/commit/aafb56ee2ed40fb6b994f87af4e8560865df7c85

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 .../lz4/0001-build-Support-BUILD_SHARED-no.patch   | 42 ----------------------
 package/lz4/lz4.hash                               |  4 +--
 package/lz4/lz4.mk                                 |  2 +-
 4 files changed, 3 insertions(+), 46 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 643a48e092..3b564578e0 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -840,7 +840,6 @@ package/lugaru/0001-ImageIO-fix-invalid-conversion.patch lib_patch.Upstream
 package/lugaru/0002-Fix-mismatched-usage-length-build-fail-on-g.patch lib_patch.Upstream
 package/lvm2/0001-cmdline-use-freopen-to-reopen-standard-streams.patch lib_patch.Upstream
 package/lvm2/0002-log-use-freopen-to-reopen-standard-streams.patch lib_patch.Upstream
-package/lz4/0001-build-Support-BUILD_SHARED-no.patch lib_patch.Upstream
 package/lzma/0001-Remove-static-from-LDFLAGS.patch lib_patch.Upstream
 package/lzop/0001-allow-overriding-modification-time.patch lib_patch.Upstream
 package/macchanger/0001-Fix-missing-include-for-caddr_t.patch lib_patch.Upstream
diff --git a/package/lz4/0001-build-Support-BUILD_SHARED-no.patch b/package/lz4/0001-build-Support-BUILD_SHARED-no.patch
deleted file mode 100644
index d2d8639a3b..0000000000
--- a/package/lz4/0001-build-Support-BUILD_SHARED-no.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 5ccbd38277989ae6a728171d59ae03bad6f2f4d5 Mon Sep 17 00:00:00 2001
-From: Fotis Xenakis <foxen@windowslive.com>
-Date: Tue, 13 Sep 2022 20:09:36 +0300
-Subject: [PATCH] build: Support BUILD_SHARED=no
-
-Since e585a438c714652e866a59371b287f52aa4d2dc3, the BUILD_SHARED
-Makefile variable only takes effect for the install target (i.e. the
-shared libraries always built). This restores the original behaviour.
-
-[Retrieved from:
-https://github.com/lz4/lz4/commit/5ccbd38277989ae6a728171d59ae03bad6f2f4d5]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- lib/Makefile | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/lib/Makefile b/lib/Makefile
-index 06503cb2a..ee262c0df 100644
---- a/lib/Makefile
-+++ b/lib/Makefile
-@@ -112,17 +112,21 @@ liblz4-dll.o: liblz4-dll.rc
- 	$(WINDRES) -i liblz4-dll.rc -o liblz4-dll.o
- 
- $(LIBLZ4): $(SRCFILES) liblz4-dll.o
-+ifeq ($(BUILD_SHARED),yes)
- 	@echo compiling dynamic library $(LIBVER)
- 	$(CC) $(FLAGS) -DLZ4_DLL_EXPORT=1 -shared $^ -o dll/$@.dll -Wl,--out-implib,dll/$(LIBLZ4_EXP)
-+endif
- 
- else   # not windows
- 
- $(LIBLZ4): $(SRCFILES)
-+ifeq ($(BUILD_SHARED),yes)
- 	@echo compiling dynamic library $(LIBVER)
- 	$(CC) $(FLAGS) -shared $^ -fPIC -fvisibility=hidden $(SONAME_FLAGS) -o $@
- 	@echo creating versioned links
- 	$(LN_SF) $@ liblz4.$(SHARED_EXT_MAJOR)
- 	$(LN_SF) $@ liblz4.$(SHARED_EXT)
-+endif
- 
- endif
- 
diff --git a/package/lz4/lz4.hash b/package/lz4/lz4.hash
index 04bd118cfe..548bb21e65 100644
--- a/package/lz4/lz4.hash
+++ b/package/lz4/lz4.hash
@@ -1,4 +1,4 @@
 # sha256 locally computed
-sha256  0b0e3aa07c8c063ddf40b082bdf7e37a1562bda40a0ff5272957f3e987e0e54b  lz4-1.9.4.tar.gz
+sha256  537512904744b35e232912055ccf8ec66d768639ff3abe5788d90d792ec5f48b  lz4-1.10.0.tar.gz
 sha256  8b58c446121a109ccf32edc094bba3010a3d85e4ee3702950db55e4d3e87736c  lib/LICENSE
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  programs/COPYING
+sha256  609b910ef05c9c855ecc1da155a36ed0f57514eac452cf93446530b5ea4b3bc3  programs/COPYING
diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
index 202dc172f7..60d321babe 100644
--- a/package/lz4/lz4.mk
+++ b/package/lz4/lz4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LZ4_VERSION = 1.9.4
+LZ4_VERSION = 1.10.0
 LZ4_SITE = $(call github,lz4,lz4,v$(LZ4_VERSION))
 LZ4_INSTALL_STAGING = YES
 LZ4_LICENSE = BSD-2-Clause (library), GPL-2.0+ (programs)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
