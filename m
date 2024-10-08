Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9BDCEFC38
	for <buildroot@archiver.kernel.org>; Tue,  8 Oct 2024 18:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7109E605D7;
	Tue,  8 Oct 2024 18:03:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fvmMq5jTxzdv; Tue,  8 Oct 2024 18:02:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5BB46069D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5BB46069D;
	Tue,  8 Oct 2024 18:02:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B0C601BF344
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 18:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9FB918118D
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 18:02:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dgicdfEhcfW5 for <buildroot@lists.busybox.net>;
 Tue,  8 Oct 2024 18:02:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 49EB180EBC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49EB180EBC
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 49EB180EBC
 for <buildroot@buildroot.org>; Tue,  8 Oct 2024 18:02:52 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 06B82B0051E;
 Tue,  8 Oct 2024 20:02:48 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue,  8 Oct 2024 20:02:41 +0200
Message-ID: <20241008180241.336214-1-ju.o@free.fr>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1728410570;
 bh=wNq/OF302CylAuCt/PhFkwaTTBzwyo2YORlYiTK+fGQ=;
 h=From:To:Cc:Subject:Date:From;
 b=oHq5ENflgy+a0rkzrrvEaAqH+eOHuY8glveAL6ZtPjhX/VllLYQOXzAMRzxsxLq1q
 1dqOQySzHp7GI/bC6qfMdzScDYNLoo2ZEf5+KD01+C6GzOyTaNMxf3Jj4WWdxfpBxX
 sYj3cuniOVxvgizCMBy7NLgmbhZs2zjiu/QpF6fYpdcGfDny7BjO1+oVK/XTAyPn01
 9AnaiK7bbPukBG5DliA2Ze0ROSrdghQpDVczkBT6m00h4Qxx/LSmE0mccii7/Gdsxy
 zxcnGLslLpOdRuZS7chK48vrk4OU7kEnEF3H1jnF8dFmHX8Swxw2jtvSUtuIXAmUed
 /p19mj4KvnOFg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=oHq5ENfl
Subject: [Buildroot] [PATCH 1/1] package/screen: bump to version 5.0.0
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See release announce [1].

License hash changed, due to url updates from http to https in [2].

Package patches were reworked for this new version:

- Patch 0001 is removed. It is no longer needed with upstream
  commit [3] and [4].

- Patches 0002 to 0004 are rebased to the new version, and are now
  named 0001 to 0003.

- Patch 0005 is regenerated to rename all occurrences of the renamed
  header file. It is now named 0004.

- Patch 0006 is removed. It is included in the new version,
  in commit [5].

- Patch 0007 is removed. It is fixed alternatively upstream in
  commit [6], included in this version.

Also, the patch entries in ".checkpackageignore" were updated
accordingly.

Since upstream commit [7], included in version 5.0.0, screen needs
wchar support. This change is reflected in the Kconfig Config.in file.

Since upstream commit [8], included in version 5.0.0, screen needs
a C17 compiler. This support was introduced in Gcc 8.1.0, see [9].
This requirement is reflected in the Kconfig Config.in file.

This new version also fixes build failures with GCC 14 originally due
to implicit function declarations which became an error. For the
record, screen 4.9.1 builds were failing with error message:

    pty.c: In function 'OpenPTY':
    pty.c:338:7: error: implicit declaration of function 'openpty'; did you mean 'OpenPTY'? [-Wimplicit-function-declaration]
      338 |   if (openpty(&f, &s, TtyName, NULL, NULL) != 0)
          |       ^~~~~~~
          |       OpenPTY

Fixes:
https://autobuild.buildroot.org/results/d33751d88af521f0e09d74e86d94d3ce20976c20/

[1] https://lists.gnu.org/archive/html/screen-users/2024-08/msg00000.html
[2] https://git.savannah.gnu.org/cgit/screen.git/diff/src/COPYING?id=f66377f9927bf5a1857b1106b28008f3802e1f7b
[3] https://git.savannah.gnu.org/cgit/screen.git/commit/?id=46df054064dce87049eca427b7e778a42674a85c
[4] https://git.savannah.gnu.org/cgit/screen.git/commit/?id=725d8ee4fd4fa75cf9d2d6c2f9c7e13920f6c41e
[5] https://git.savannah.gnu.org/cgit/screen.git/commit/?id=39c5f1c76f1fcef4b5958bf828a63f53426b6984
[6] https://git.savannah.gnu.org/cgit/screen.git/commit/?id=84092e65f95dd2a00aa4cc2ba75682297f33dfea
[7] https://git.savannah.gnu.org/cgit/screen.git/commit/?id=9e8e20596f508da866a1e1469b7e6216810dd7f8
[8] https://git.savannah.gnu.org/cgit/screen.git/commit/?id=35f50657c2d09c9995ccac6d68bfd9e2ee7109b2
[9] https://gcc.gnu.org/onlinedocs/gcc-8.1.0/gcc/C-Dialect-Options.html#index-std-1

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
The remaining package patches are still kept in ".checkpackageignore".
My intent is to try to upstream those, in the future. This commit
already reduced the number of patches from 7 to 4.

This patch was tested on top of branch master at commit a05bb56 with
commands:

    utils/docker-run make check-package
    ...
    0 warnings generated

    utils/test-pkg -a -p screen
                         arm-aarch64 [ 1/41]: OK
               bootlin-aarch64-glibc [ 2/41]: OK
           bootlin-arcle-hs38-uclibc [ 3/41]: OK
                bootlin-armv5-uclibc [ 4/41]: OK
                 bootlin-armv7-glibc [ 5/41]: OK
               bootlin-armv7m-uclibc [ 6/41]: SKIPPED
                  bootlin-armv7-musl [ 7/41]: OK
            bootlin-m68k-5208-uclibc [ 8/41]: SKIPPED
           bootlin-m68k-68040-uclibc [ 9/41]: OK
         bootlin-microblazeel-uclibc [10/41]: OK
            bootlin-mipsel32r6-glibc [11/41]: OK
               bootlin-mipsel-uclibc [12/41]: OK
                 bootlin-nios2-glibc [13/41]: OK
             bootlin-openrisc-uclibc [14/41]: OK
    bootlin-powerpc64le-power8-glibc [15/41]: OK
       bootlin-powerpc-e500mc-uclibc [16/41]: OK
               bootlin-riscv32-glibc [17/41]: OK
               bootlin-riscv64-glibc [18/41]: OK
                bootlin-riscv64-musl [19/41]: OK
             bootlin-s390x-z13-glibc [20/41]: OK
                  bootlin-sh4-uclibc [21/41]: OK
               bootlin-sparc64-glibc [22/41]: OK
                bootlin-sparc-uclibc [23/41]: OK
                bootlin-x86-64-glibc [24/41]: OK
                 bootlin-x86-64-musl [25/41]: OK
               bootlin-x86-64-uclibc [26/41]: OK
               bootlin-x86-i686-musl [27/41]: OK
               bootlin-xtensa-uclibc [28/41]: OK
                        br-arm-basic [29/41]: SKIPPED
                br-arm-full-nothread [30/41]: OK
                  br-arm-full-static [31/41]: OK
               br-i386-pentium4-full [32/41]: OK
                  br-mips64-n64-full [33/41]: OK
             br-mips64r6-el-hf-glibc [34/41]: OK
           br-powerpc-603e-basic-cpp [35/41]: SKIPPED
           br-powerpc64-power7-glibc [36/41]: OK
                   linaro-aarch64-be [37/41]: SKIPPED
                      linaro-aarch64 [38/41]: SKIPPED
                          linaro-arm [39/41]: SKIPPED
                     sourcery-mips64 [40/41]: SKIPPED
                       sourcery-mips [41/41]: SKIPPED
    41 builds, 9 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

It was also runtime tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/8025512869

---
 .checkpackageignore                           |  11 +-
 ...eate-backup-of-old-installed-binary.patch} |  23 +-
 ...y-as-an-alternative-for-bcopy-memmov.patch | 133 ----------
 ...ermission-flags-even-if-chown-fails.patch} |  13 +-
 ...g-SCREEN-to-get-a-non-versioned-bin.patch} |  10 +-
 ...0004-Renamed-sched.h-to-eventqueue.h.patch | 251 ++++++++++++++++++
 ...0005-Renamed-sched.h-to-eventqueue.h.patch |  39 ---
 .../0006-comm.h-now-depends-on-term.h.patch   |  30 ---
 ...-needed-for-list_-display-generic-.o.patch |  37 ---
 package/screen/Config.in                      |   7 +
 package/screen/screen.hash                    |   6 +-
 package/screen/screen.mk                      |   2 +-
 12 files changed, 290 insertions(+), 272 deletions(-)
 rename package/screen/{0002-Do-not-create-backup-of-old-installed-binary.patch => 0001-Do-not-create-backup-of-old-installed-binary.patch} (73%)
 delete mode 100644 package/screen/0001-Do-not-use-memcpy-as-an-alternative-for-bcopy-memmov.patch
 rename package/screen/{0003-Change-binary-permission-flags-even-if-chown-fails.patch => 0002-Change-binary-permission-flags-even-if-chown-fails.patch} (73%)
 rename package/screen/{0004-Support-overriding-SCREEN-to-get-a-non-versioned-bin.patch => 0003-Support-overriding-SCREEN-to-get-a-non-versioned-bin.patch} (81%)
 create mode 100644 package/screen/0004-Renamed-sched.h-to-eventqueue.h.patch
 delete mode 100644 package/screen/0005-Renamed-sched.h-to-eventqueue.h.patch
 delete mode 100644 package/screen/0006-comm.h-now-depends-on-term.h.patch
 delete mode 100644 package/screen/0007-comm.h-needed-for-list_-display-generic-.o.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index ce638a7c39..670bfd65e8 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1150,13 +1150,10 @@ package/samba4/0001-build-find-pre-built-heimdal-build-tools-in-case-of-.patch l
 package/samba4/0002-ldap_message_test.c-include-stdint.h-before-cmoka.h.patch lib_patch.Upstream
 package/samba4/S91smb Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/sane-backends/0001-sane_backend-add-missing-config.h.patch lib_patch.Upstream
-package/screen/0001-Do-not-use-memcpy-as-an-alternative-for-bcopy-memmov.patch lib_patch.Upstream
-package/screen/0002-Do-not-create-backup-of-old-installed-binary.patch lib_patch.Upstream
-package/screen/0003-Change-binary-permission-flags-even-if-chown-fails.patch lib_patch.Upstream
-package/screen/0004-Support-overriding-SCREEN-to-get-a-non-versioned-bin.patch lib_patch.Upstream
-package/screen/0005-Renamed-sched.h-to-eventqueue.h.patch lib_patch.Upstream
-package/screen/0006-comm.h-now-depends-on-term.h.patch lib_patch.Upstream
-package/screen/0007-comm.h-needed-for-list_-display-generic-.o.patch lib_patch.Upstream
+package/screen/0001-Do-not-create-backup-of-old-installed-binary.patch lib_patch.Upstream
+package/screen/0002-Change-binary-permission-flags-even-if-chown-fails.patch lib_patch.Upstream
+package/screen/0003-Support-overriding-SCREEN-to-get-a-non-versioned-bin.patch lib_patch.Upstream
+package/screen/0004-Renamed-sched.h-to-eventqueue.h.patch lib_patch.Upstream
 package/scrub/0001-configure-ac-make-sure-m4-macros-are-included-in-the-build.patch lib_patch.Upstream
 package/sdl/0001-use-correct-directfb-config.patch lib_patch.Upstream
 package/sdl/0002-fix-compilation-with-libx11.patch lib_patch.Upstream
diff --git a/package/screen/0002-Do-not-create-backup-of-old-installed-binary.patch b/package/screen/0001-Do-not-create-backup-of-old-installed-binary.patch
similarity index 73%
rename from package/screen/0002-Do-not-create-backup-of-old-installed-binary.patch
rename to package/screen/0001-Do-not-create-backup-of-old-installed-binary.patch
index ef82cd3e76..4a8a55dcec 100644
--- a/package/screen/0002-Do-not-create-backup-of-old-installed-binary.patch
+++ b/package/screen/0001-Do-not-create-backup-of-old-installed-binary.patch
@@ -1,4 +1,4 @@
-From 86b5c7677c5bef780bd4c28cbbdaa97eda938230 Mon Sep 17 00:00:00 2001
+From fd002bd3ab730a0976dc000477f7dd9e162c0269 Mon Sep 17 00:00:00 2001
 From: Maarten ter Huurne <maarten@treewalker.org>
 Date: Sun, 14 Sep 2014 23:58:34 +0200
 Subject: [PATCH] Do not create backup of old installed binary
@@ -9,30 +9,31 @@ Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
 [baruch: update for 4.6.2]
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 [Julien: rebase on top of 4.9.1]
+[Julien: rebase on top of 5.0.0]
 Signed-off-by: Julien Olivain <ju.o@free.fr>
 ---
- Makefile.in | 4 ----
- 1 file changed, 4 deletions(-)
+ Makefile.in | 5 -----
+ 1 file changed, 5 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 26ec404..3efbbfd 100644
+index 92f434a..860ecd7 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -83,12 +83,9 @@ screen: $(OFILES)
- 	    $(OPTIONS) $(CFLAGS) $<
+@@ -77,12 +77,8 @@ tests/test-%: tests/test-%.c %.o tests/mallocmock.o tests/macros.h tests/signatu
+ 	$(CC) $(CPPFLAGS) $(CFLAGS) $< -o $@ $*.o tests/mallocmock.o
  
- install_bin: .version screen installdirs
+ install_bin: screen installdirs
 -	-if [ -f $(DESTDIR)$(bindir)/$(SCREEN) ] && [ ! -f $(DESTDIR)$(bindir)/$(SCREEN).old ]; \
 -		then mv $(DESTDIR)$(bindir)/$(SCREEN) $(DESTDIR)$(bindir)/$(SCREEN).old; fi
  	$(INSTALL_PROGRAM) screen $(DESTDIR)$(bindir)/$(SCREEN)
  	-chown root $(DESTDIR)$(bindir)/$(SCREEN) && chmod 4755 $(DESTDIR)$(bindir)/$(SCREEN)
- # This doesn't work if $(bindir)/screen is a symlink
+-# This doesn't work if $(bindir)/screen is a symlink
 -	-if [ -f $(DESTDIR)$(bindir)/screen ] && [ ! -f $(DESTDIR)$(bindir)/screen.old ]; then mv $(DESTDIR)$(bindir)/screen $(DESTDIR)$(bindir)/screen.old; fi
  	rm -f $(DESTDIR)$(bindir)/screen
  	(cd $(DESTDIR)$(bindir) && ln -f -s $(SCREEN) screen)
  	cp $(srcdir)/utf8encodings/?? $(DESTDIR)$(SCREENENCODINGS)
-@@ -113,7 +110,6 @@ installdirs:
- uninstall: .version
+@@ -107,7 +103,6 @@ installdirs:
+ uninstall:
  	rm -f $(DESTDIR)$(bindir)/$(SCREEN)
  	rm -f $(DESTDIR)$(bindir)/screen
 -	-mv $(DESTDIR)$(bindir)/screen.old $(DESTDIR)$(bindir)/screen
@@ -40,5 +41,5 @@ index 26ec404..3efbbfd 100644
  	cd doc; $(MAKE) uninstall
  
 -- 
-2.41.0
+2.46.2
 
diff --git a/package/screen/0001-Do-not-use-memcpy-as-an-alternative-for-bcopy-memmov.patch b/package/screen/0001-Do-not-use-memcpy-as-an-alternative-for-bcopy-memmov.patch
deleted file mode 100644
index ab002701d7..0000000000
--- a/package/screen/0001-Do-not-use-memcpy-as-an-alternative-for-bcopy-memmov.patch
+++ /dev/null
@@ -1,133 +0,0 @@
-From 545875ad0b6c9697fae41ae8770e95d117fe3cca Mon Sep 17 00:00:00 2001
-From: Maarten ter Huurne <maarten@treewalker.org>
-Date: Sat, 13 Sep 2014 11:37:59 +0200
-Subject: [PATCH] Do not use memcpy as an alternative for bcopy/memmove
-
-The configure script runs a small test program to check whether
-memcpy can handle overlapping memory areas. However, it is not valid
-to conclude that if a single case of overlapping memory is handled
-correctly, all cases will be handled correctly.
-
-Since screen already has its own bcopy implementation as a fallback
-for the case that bcopy and memmove are unusable, removing the memcpy
-option should not break any systems.
-
-Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
-[Ricardo: rebase on top of 4.3.1]
-Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
-[Bernd: rebase on top of 4.7.0]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[Julien: rebase on top of 4.9.1]
-Signed-off-by: Julien Olivain <ju.o@free.fr>
----
- acconfig.h   |  3 +--
- configure.ac | 22 +---------------------
- os.h         |  8 ++------
- osdef.h.in   | 10 +---------
- 4 files changed, 5 insertions(+), 38 deletions(-)
-
-diff --git a/acconfig.h b/acconfig.h
-index 46d62b0..f83572c 100644
---- a/acconfig.h
-+++ b/acconfig.h
-@@ -476,7 +476,7 @@
- #undef GETTTYENT
- 
- /*
-- * Define USEBCOPY if the bcopy/memcpy from your system's C library
-+ * Define USEBCOPY if the bcopy from your system's C library
-  * supports the overlapping of source and destination blocks.  When
-  * undefined, screen uses its own (probably slower) version of bcopy().
-  * 
-@@ -487,7 +487,6 @@
-  * Their memove fails the test in the configure script. Sigh. (Juergen)
-  */
- #undef USEBCOPY
--#undef USEMEMCPY
- #undef USEMEMMOVE
- 
- /*
-diff --git a/configure.ac b/configure.ac
-index 1a12c04..6f6c2da 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1278,7 +1278,7 @@ AC_TRY_LINK([
-     fdwalk(NULL, NULL);
- ],AC_DEFINE(HAVE_FDWALK))
- 
--AC_CHECKING(whether memcpy/memmove/bcopy handles overlapping arguments)
-+AC_CHECKING(whether memmove/bcopy handles overlapping arguments)
- AC_TRY_RUN([
- #include <string.h>
- #include <stdlib.h>
-@@ -1319,26 +1319,6 @@ main() {
- }], AC_DEFINE(USEMEMMOVE),,
-   AC_NOTE(- skipping check because we are cross compiling; use memmove) AC_DEFINE(USEMEMMOVE))
- 
--AC_TRY_RUN([
--#include <string.h>
--#include <stdlib.h>
--
--#define bcopy(s,d,l) memcpy(d,s,l)
--
--int
--main() {
--  char buf[10];
--  strcpy(buf, "abcdefghi");
--  bcopy(buf, buf + 2, 3);
--  if (strncmp(buf, "ababcf", 6))
--    return 1;
--  strcpy(buf, "abcdefghi");
--  bcopy(buf + 2, buf, 3);
--  if (strncmp(buf, "cdedef", 6))
--    return 1;
--  return 0; /* libc version works properly.  */
--}], AC_DEFINE(USEMEMCPY),,:)
--
- AC_SYS_LONG_FILE_NAMES
- 
- AC_MSG_CHECKING(for vsprintf)
-diff --git a/os.h b/os.h
-index 2a1c2ca..d1ac87e 100644
---- a/os.h
-+++ b/os.h
-@@ -142,12 +142,8 @@ extern int errno;
- # ifdef USEMEMMOVE
- #  define bcopy(s,d,len) memmove(d,s,len)
- # else
--#  ifdef USEMEMCPY
--#   define bcopy(s,d,len) memcpy(d,s,len)
--#  else
--#   define NEED_OWN_BCOPY
--#   define bcopy xbcopy
--#  endif
-+#  define NEED_OWN_BCOPY
-+#  define bcopy xbcopy
- # endif
- #endif
- 
-diff --git a/osdef.h.in b/osdef.h.in
-index 6ddbd66..abdacf7 100644
---- a/osdef.h.in
-+++ b/osdef.h.in
-@@ -58,16 +58,8 @@ extern int   bcmp __P((char *, char *, int));
- extern int   killpg __P((int, int));
- #endif
- 
--#ifndef USEBCOPY
--# ifdef USEMEMCPY
--extern void  memcpy __P((char *, char *, int));
--# else
--#  ifdef USEMEMMOVE
-+#if defined(USEMEMMOVE) && !defined(USEBCOPY)
- extern void  memmove __P((char *, char *, int));
--#  else
--extern void  bcopy __P((char *, char *, int));
--#  endif
--# endif
- #else
- extern void  bcopy __P((char *, char *, int));
- #endif
--- 
-2.41.0
-
diff --git a/package/screen/0003-Change-binary-permission-flags-even-if-chown-fails.patch b/package/screen/0002-Change-binary-permission-flags-even-if-chown-fails.patch
similarity index 73%
rename from package/screen/0003-Change-binary-permission-flags-even-if-chown-fails.patch
rename to package/screen/0002-Change-binary-permission-flags-even-if-chown-fails.patch
index bc3f676af3..406a6dab5d 100644
--- a/package/screen/0003-Change-binary-permission-flags-even-if-chown-fails.patch
+++ b/package/screen/0002-Change-binary-permission-flags-even-if-chown-fails.patch
@@ -1,4 +1,4 @@
-From 4231969c47a8379f9113e0c9c9586bcfdd545c37 Mon Sep 17 00:00:00 2001
+From c348717c7f13efc2c26723670c4d520985eb41f7 Mon Sep 17 00:00:00 2001
 From: Maarten ter Huurne <maarten@treewalker.org>
 Date: Mon, 15 Sep 2014 00:03:05 +0200
 Subject: [PATCH] Change binary permission flags even if chown fails
@@ -8,25 +8,26 @@ the chown will fail. But the chmod can still be done.
 
 Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
 [Julien: rebase on top of 4.9.1]
+[Julien: rebase on top of 5.0.0]
 Signed-off-by: Julien Olivain <ju.o@free.fr>
 ---
  Makefile.in | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 3efbbfd..0315fde 100644
+index 860ecd7..5bb5ed8 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -84,7 +84,8 @@ screen: $(OFILES)
+@@ -78,7 +78,8 @@ tests/test-%: tests/test-%.c %.o tests/mallocmock.o tests/macros.h tests/signatu
  
- install_bin: .version screen installdirs
+ install_bin: screen installdirs
  	$(INSTALL_PROGRAM) screen $(DESTDIR)$(bindir)/$(SCREEN)
 -	-chown root $(DESTDIR)$(bindir)/$(SCREEN) && chmod 4755 $(DESTDIR)$(bindir)/$(SCREEN)
 +	-chown root $(DESTDIR)$(bindir)/$(SCREEN)
 +	-chmod 4755 $(DESTDIR)$(bindir)/$(SCREEN)
- # This doesn't work if $(bindir)/screen is a symlink
  	rm -f $(DESTDIR)$(bindir)/screen
  	(cd $(DESTDIR)$(bindir) && ln -f -s $(SCREEN) screen)
+ 	cp $(srcdir)/utf8encodings/?? $(DESTDIR)$(SCREENENCODINGS)
 -- 
-2.41.0
+2.46.2
 
diff --git a/package/screen/0004-Support-overriding-SCREEN-to-get-a-non-versioned-bin.patch b/package/screen/0003-Support-overriding-SCREEN-to-get-a-non-versioned-bin.patch
similarity index 81%
rename from package/screen/0004-Support-overriding-SCREEN-to-get-a-non-versioned-bin.patch
rename to package/screen/0003-Support-overriding-SCREEN-to-get-a-non-versioned-bin.patch
index 15795874ae..14f4dd6656 100644
--- a/package/screen/0004-Support-overriding-SCREEN-to-get-a-non-versioned-bin.patch
+++ b/package/screen/0003-Support-overriding-SCREEN-to-get-a-non-versioned-bin.patch
@@ -1,4 +1,4 @@
-From 07d6e4d9da8bc7c6ed31aa9b643410ea093d164f Mon Sep 17 00:00:00 2001
+From 4baa4ff25a583456d781e553604a79c51a46bd53 Mon Sep 17 00:00:00 2001
 From: Maarten ter Huurne <maarten@treewalker.org>
 Date: Mon, 15 Sep 2014 00:06:20 +0200
 Subject: [PATCH] Support overriding SCREEN to get a non-versioned binary
@@ -8,21 +8,21 @@ If a packager runs "make install SCREEN=screen", do not create
 
 Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
 [Julien: rebase on top of 4.9.1]
+[Julien: rebase on top of 5.0.0]
 Signed-off-by: Julien Olivain <ju.o@free.fr>
 ---
  Makefile.in | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/Makefile.in b/Makefile.in
-index 0315fde..4718f08 100644
+index 5bb5ed8..d03129e 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -86,9 +86,11 @@ install_bin: .version screen installdirs
+@@ -80,8 +80,10 @@ install_bin: screen installdirs
  	$(INSTALL_PROGRAM) screen $(DESTDIR)$(bindir)/$(SCREEN)
  	-chown root $(DESTDIR)$(bindir)/$(SCREEN)
  	-chmod 4755 $(DESTDIR)$(bindir)/$(SCREEN)
 +ifneq (${SCREEN},screen)
- # This doesn't work if $(bindir)/screen is a symlink
  	rm -f $(DESTDIR)$(bindir)/screen
  	(cd $(DESTDIR)$(bindir) && ln -f -s $(SCREEN) screen)
 +endif
@@ -30,5 +30,5 @@ index 0315fde..4718f08 100644
  
  ###############################################################################
 -- 
-2.41.0
+2.46.2
 
diff --git a/package/screen/0004-Renamed-sched.h-to-eventqueue.h.patch b/package/screen/0004-Renamed-sched.h-to-eventqueue.h.patch
new file mode 100644
index 0000000000..5a7deb7d1d
--- /dev/null
+++ b/package/screen/0004-Renamed-sched.h-to-eventqueue.h.patch
@@ -0,0 +1,251 @@
+From 50041d75d59e7343f1fd45bec5bd0c92b47e0a8e Mon Sep 17 00:00:00 2001
+From: Maarten ter Huurne <maarten@treewalker.org>
+Date: Mon, 15 Sep 2014 00:24:41 +0200
+Subject: [PATCH] Renamed sched.h to eventqueue.h
+
+There is a <sched.h> system header that got shadowed by "sched.h".
+While Screen itself doesn't include <sched.h>, other system headers
+might include it indirectly. This broke the build when using uClibc
+with pthread support.
+
+Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
+[Julien: rebase on top of 4.9.1]
+[Julien: rebase on top of 5.0.0, renamed all occurences of sched.h]
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ Makefile.in             | 66 ++++++++++++++++++++---------------------
+ canvas.h                |  2 +-
+ sched.h => eventqueue.h |  0
+ sched.c                 |  2 +-
+ screen.h                |  2 +-
+ window.h                |  2 +-
+ winmsg.c                |  2 +-
+ 7 files changed, 38 insertions(+), 38 deletions(-)
+ rename sched.h => eventqueue.h (100%)
+
+diff --git a/Makefile.in b/Makefile.in
+index d03129e..69ffe60 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -165,116 +165,116 @@ depend.in: $(CFILES) term.h
+ ###############################################################################
+ 
+ ### Dependencies:
+-screen.o: screen.c config.h screen.h os.h ansi.h sched.h acls.h comm.h \
++screen.o: screen.c config.h screen.h os.h ansi.h eventqueue.h acls.h comm.h \
+  layer.h term.h image.h canvas.h display.h layout.h viewport.h window.h \
+  logfile.h winmsg.h winmsgbuf.h winmsgcond.h backtick.h \
+  fileio.h mark.h attacher.h encoding.h help.h misc.h process.h socket.h \
+  termcap.h tty.h utmp.h
+-ansi.o: ansi.c config.h screen.h os.h ansi.h sched.h acls.h comm.h \
++ansi.o: ansi.c config.h screen.h os.h ansi.h eventqueue.h acls.h comm.h \
+  layer.h term.h image.h canvas.h display.h layout.h viewport.h window.h \
+  logfile.h winmsg.h winmsgbuf.h winmsgcond.h backtick.h encoding.h \
+  fileio.h help.h mark.h misc.h process.h resize.h
+-fileio.o: fileio.c config.h screen.h os.h ansi.h sched.h acls.h comm.h \
++fileio.o: fileio.c config.h screen.h os.h ansi.h eventqueue.h acls.h comm.h \
+  layer.h term.h image.h canvas.h display.h layout.h viewport.h window.h \
+  logfile.h fileio.h misc.h process.h winmsgbuf.h termcap.h encoding.h
+-mark.o: mark.c config.h screen.h os.h ansi.h sched.h acls.h comm.h \
++mark.o: mark.c config.h screen.h os.h ansi.h eventqueue.h acls.h comm.h \
+  layer.h term.h image.h canvas.h display.h layout.h viewport.h window.h \
+  logfile.h encoding.h fileio.h mark.h process.h winmsgbuf.h search.h
+-misc.o: misc.c config.h screen.h os.h ansi.h sched.h acls.h comm.h \
++misc.o: misc.c config.h screen.h os.h ansi.h eventqueue.h acls.h comm.h \
+  layer.h term.h image.h canvas.h display.h layout.h viewport.h window.h \
+  logfile.h
+-resize.o: resize.c config.h screen.h os.h ansi.h sched.h acls.h comm.h \
++resize.o: resize.c config.h screen.h os.h ansi.h eventqueue.h acls.h comm.h \
+  layer.h term.h image.h canvas.h display.h layout.h viewport.h window.h \
+  logfile.h process.h winmsgbuf.h resize.h telnet.h
+-socket.o: socket.c config.h screen.h os.h ansi.h sched.h acls.h comm.h \
++socket.o: socket.c config.h screen.h os.h ansi.h eventqueue.h acls.h comm.h \
+  layer.h term.h image.h canvas.h display.h layout.h viewport.h window.h \
+  logfile.h encoding.h fileio.h list_generic.h misc.h process.h \
+  winmsgbuf.h resize.h socket.h termcap.h tty.h utmp.h
+-search.o: search.c config.h screen.h os.h ansi.h sched.h acls.h comm.h \
++search.o: search.c config.h screen.h os.h ansi.h eventqueue.h acls.h comm.h \
+  layer.h term.h image.h canvas.h display.h layout.h viewport.h window.h \
+  logfile.h mark.h input.h
+-tty.o: tty.c config.h screen.h os.h ansi.h sched.h acls.h comm.h layer.h \
++tty.o: tty.c config.h screen.h os.h ansi.h eventqueue.h acls.h comm.h layer.h \
+  term.h image.h canvas.h display.h layout.h viewport.h window.h logfile.h \
+  fileio.h misc.h pty.h telnet.h tty.h
+ term.o: term.c term.h
+-window.o: window.c config.h screen.h os.h ansi.h sched.h acls.h comm.h \
++window.o: window.c config.h screen.h os.h ansi.h eventqueue.h acls.h comm.h \
+  layer.h term.h image.h canvas.h display.h layout.h viewport.h window.h \
+  logfile.h winmsg.h winmsgbuf.h winmsgcond.h backtick.h fileio.h help.h \
+  input.h mark.h misc.h process.h pty.h resize.h telnet.h termcap.h tty.h \
+  utmp.h
+-utmp.o: utmp.c config.h screen.h os.h ansi.h sched.h acls.h comm.h \
++utmp.o: utmp.c config.h screen.h os.h ansi.h eventqueue.h acls.h comm.h \
+  layer.h term.h image.h canvas.h display.h layout.h viewport.h window.h \
+  logfile.h misc.h tty.h utmp.h
+-help.o: help.c config.h screen.h os.h ansi.h sched.h acls.h comm.h \
++help.o: help.c config.h screen.h os.h ansi.h eventqueue.h acls.h comm.h \
+  layer.h term.h image.h canvas.h display.h layout.h viewport.h window.h \
+  logfile.h misc.h list_generic.h process.h winmsgbuf.h
+-termcap.o: termcap.c config.h screen.h os.h ansi.h sched.h acls.h comm.h \
++termcap.o: termcap.c config.h screen.h os.h ansi.h eventqueue.h acls.h comm.h \
+  layer.h term.h image.h canvas.h display.h layout.h viewport.h window.h \
+  logfile.h encoding.h misc.h process.h winmsgbuf.h resize.h termcap.h
+-input.o: input.c config.h screen.h os.h ansi.h sched.h acls.h comm.h \
++input.o: input.c config.h screen.h os.h ansi.h eventqueue.h acls.h comm.h \
+  layer.h term.h image.h canvas.h display.h layout.h viewport.h window.h \
+  logfile.h misc.h
+-attacher.o: attacher.c config.h screen.h os.h ansi.h sched.h acls.h \
++attacher.o: attacher.c config.h screen.h os.h ansi.h eventqueue.h acls.h \
+  comm.h layer.h term.h image.h canvas.h display.h layout.h viewport.h \
+  window.h logfile.h misc.h socket.h tty.h
+-pty.o: pty.c config.h screen.h os.h ansi.h sched.h acls.h comm.h layer.h \
++pty.o: pty.c config.h screen.h os.h ansi.h eventqueue.h acls.h comm.h layer.h \
+  term.h image.h canvas.h display.h layout.h viewport.h window.h logfile.h
+-process.o: process.c config.h screen.h os.h ansi.h sched.h acls.h comm.h \
++process.o: process.c config.h screen.h os.h ansi.h eventqueue.h acls.h comm.h \
+  layer.h term.h image.h canvas.h display.h layout.h viewport.h window.h \
+  logfile.h winmsg.h winmsgbuf.h winmsgcond.h backtick.h encoding.h \
+  fileio.h help.h input.h kmapdef.h list_generic.h mark.h misc.h process.h \
+  resize.h search.h socket.h telnet.h termcap.h tty.h utmp.h
+-display.o: display.c config.h screen.h os.h ansi.h sched.h acls.h comm.h \
++display.o: display.c config.h screen.h os.h ansi.h eventqueue.h acls.h comm.h \
+  layer.h term.h image.h canvas.h display.h layout.h viewport.h window.h \
+  logfile.h winmsg.h winmsgbuf.h winmsgcond.h backtick.h encoding.h mark.h \
+  misc.h process.h pty.h resize.h termcap.h tty.h
+-comm.o: comm.c config.h os.h screen.h ansi.h sched.h acls.h comm.h \
++comm.o: comm.c config.h os.h screen.h ansi.h eventqueue.h acls.h comm.h \
+  layer.h term.h image.h canvas.h display.h layout.h viewport.h window.h \
+  logfile.h
+ kmapdef.o: kmapdef.c config.h
+-acls.o: acls.c config.h screen.h os.h ansi.h sched.h acls.h comm.h \
++acls.o: acls.c config.h screen.h os.h ansi.h eventqueue.h acls.h comm.h \
+  layer.h term.h image.h canvas.h display.h layout.h viewport.h window.h \
+  logfile.h mark.h misc.h process.h winmsgbuf.h
+-logfile.o: logfile.c config.h screen.h os.h ansi.h sched.h acls.h comm.h \
++logfile.o: logfile.c config.h screen.h os.h ansi.h eventqueue.h acls.h comm.h \
+  layer.h term.h image.h canvas.h display.h layout.h viewport.h window.h \
+  logfile.h misc.h
+-layer.o: layer.c config.h screen.h os.h ansi.h sched.h acls.h comm.h \
++layer.o: layer.c config.h screen.h os.h ansi.h eventqueue.h acls.h comm.h \
+  layer.h term.h image.h canvas.h display.h layout.h viewport.h window.h \
+  logfile.h encoding.h mark.h tty.h
+-winmsg.o: winmsg.c config.h screen.h os.h ansi.h sched.h acls.h comm.h \
++winmsg.o: winmsg.c config.h screen.h os.h ansi.h eventqueue.h acls.h comm.h \
+  layer.h term.h image.h canvas.h display.h layout.h viewport.h window.h \
+  logfile.h winmsg.h winmsgbuf.h winmsgcond.h backtick.h fileio.h \
+  process.h mark.h
+-winmsgbuf.o: winmsgbuf.c winmsgbuf.h screen.h os.h ansi.h sched.h acls.h \
++winmsgbuf.o: winmsgbuf.c winmsgbuf.h screen.h os.h ansi.h eventqueue.h acls.h \
+  comm.h layer.h term.h image.h canvas.h display.h layout.h viewport.h \
+  window.h logfile.h
+ winmsgcond.o: winmsgcond.c winmsgcond.h
+-backtick.o: backtick.c backtick.h screen.h os.h ansi.h sched.h acls.h \
++backtick.o: backtick.c backtick.h screen.h os.h ansi.h eventqueue.h acls.h \
+  comm.h layer.h term.h image.h canvas.h display.h layout.h viewport.h \
+  window.h logfile.h fileio.h
+-sched.o: sched.c config.h screen.h os.h ansi.h sched.h acls.h comm.h \
++sched.o: sched.c config.h screen.h os.h ansi.h eventqueue.h acls.h comm.h \
+  layer.h term.h image.h canvas.h display.h layout.h viewport.h window.h \
+  logfile.h
+ telnet.o: telnet.c config.h comm.h
+-encoding.o: encoding.c config.h screen.h os.h ansi.h sched.h acls.h \
++encoding.o: encoding.c config.h screen.h os.h ansi.h eventqueue.h acls.h \
+  comm.h layer.h term.h image.h canvas.h display.h layout.h viewport.h \
+  window.h logfile.h encoding.h fileio.h
+-canvas.o: canvas.c config.h screen.h os.h ansi.h sched.h acls.h comm.h \
++canvas.o: canvas.c config.h screen.h os.h ansi.h eventqueue.h acls.h comm.h \
+  layer.h term.h image.h canvas.h display.h layout.h viewport.h window.h \
+  logfile.h help.h list_generic.h resize.h
+-layout.o: layout.c config.h screen.h os.h ansi.h sched.h acls.h comm.h \
++layout.o: layout.c config.h screen.h os.h ansi.h eventqueue.h acls.h comm.h \
+  layer.h term.h image.h canvas.h display.h layout.h viewport.h window.h \
+  logfile.h fileio.h misc.h process.h winmsgbuf.h resize.h
+-viewport.o: viewport.c config.h screen.h os.h ansi.h sched.h acls.h \
++viewport.o: viewport.c config.h screen.h os.h ansi.h eventqueue.h acls.h \
+  comm.h layer.h term.h image.h canvas.h display.h layout.h viewport.h \
+  window.h logfile.h
+-list_display.o: list_display.c config.h screen.h os.h ansi.h sched.h \
++list_display.o: list_display.c config.h screen.h os.h ansi.h eventqueue.h \
+  acls.h comm.h layer.h term.h image.h canvas.h display.h layout.h \
+  viewport.h window.h logfile.h list_generic.h misc.h
+-list_generic.o: list_generic.c config.h screen.h os.h ansi.h sched.h \
++list_generic.o: list_generic.c config.h screen.h os.h ansi.h eventqueue.h \
+  acls.h comm.h layer.h term.h image.h canvas.h display.h layout.h \
+  viewport.h window.h logfile.h input.h list_generic.h misc.h
+-list_window.o: list_window.c config.h screen.h os.h ansi.h sched.h acls.h \
++list_window.o: list_window.c config.h screen.h os.h ansi.h eventqueue.h acls.h \
+  comm.h layer.h term.h image.h canvas.h display.h layout.h viewport.h \
+  window.h logfile.h winmsg.h winmsgbuf.h winmsgcond.h backtick.h input.h \
+  list_generic.h misc.h process.h
+diff --git a/canvas.h b/canvas.h
+index 8460d9a..ec5fdaa 100644
+--- a/canvas.h
++++ b/canvas.h
+@@ -31,7 +31,7 @@
+ #define SCREEN_CANVAS_H
+ 
+ #include "layer.h"
+-#include "sched.h"
++#include "eventqueue.h"
+ 
+ #define SLICE_UNKN 0
+ #define SLICE_VERT (1 << 0)
+diff --git a/sched.h b/eventqueue.h
+similarity index 100%
+rename from sched.h
+rename to eventqueue.h
+diff --git a/sched.c b/sched.c
+index 3618f11..dc59b11 100644
+--- a/sched.c
++++ b/sched.c
+@@ -28,7 +28,7 @@
+ 
+ #include "config.h"
+ 
+-#include "sched.h"
++#include "eventqueue.h"
+ 
+ #include <poll.h>
+ #include <stdint.h>
+diff --git a/screen.h b/screen.h
+index 308c365..e39c2b1 100644
+--- a/screen.h
++++ b/screen.h
+@@ -67,7 +67,7 @@ struct mode {
+ #include "ansi.h"
+ #include "image.h"
+ #include "layer.h"
+-#include "sched.h"
++#include "eventqueue.h"
+ #include "term.h"
+ #include "window.h"
+ 
+diff --git a/window.h b/window.h
+index bc08c6c..294aa64 100644
+--- a/window.h
++++ b/window.h
+@@ -35,7 +35,7 @@
+ 
+ #include "config.h"
+ 
+-#include "sched.h"
++#include "eventqueue.h"
+ #include "logfile.h"
+ #include "screen.h"
+ #include "layer.h"
+diff --git a/winmsg.c b/winmsg.c
+index 2418439..891a20a 100644
+--- a/winmsg.c
++++ b/winmsg.c
+@@ -44,7 +44,7 @@
+ #include "logfile.h"
+ #include "mark.h"
+ #include "process.h"
+-#include "sched.h"
++#include "eventqueue.h"
+ 
+ /* TODO: rid global variable (has been renamed to point this out; see commit
+  * history) */
+-- 
+2.46.2
+
diff --git a/package/screen/0005-Renamed-sched.h-to-eventqueue.h.patch b/package/screen/0005-Renamed-sched.h-to-eventqueue.h.patch
deleted file mode 100644
index 24df05de8c..0000000000
--- a/package/screen/0005-Renamed-sched.h-to-eventqueue.h.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 8b066a777b61600ff2c60cad0725f2089299ff56 Mon Sep 17 00:00:00 2001
-From: Maarten ter Huurne <maarten@treewalker.org>
-Date: Mon, 15 Sep 2014 00:24:41 +0200
-Subject: [PATCH] Renamed sched.h to eventqueue.h
-
-There is a <sched.h> system header that got shadowed by "sched.h".
-While Screen itself doesn't include <sched.h>, other system headers
-might include it indirectly. This broke the build when using uClibc
-with pthread support.
-
-Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
-[Julien: rebase on top of 4.9.1]
-Signed-off-by: Julien Olivain <ju.o@free.fr>
----
- sched.h => eventqueue.h | 0
- screen.h                | 2 +-
- 2 files changed, 1 insertion(+), 1 deletion(-)
- rename sched.h => eventqueue.h (100%)
-
-diff --git a/sched.h b/eventqueue.h
-similarity index 100%
-rename from sched.h
-rename to eventqueue.h
-diff --git a/screen.h b/screen.h
-index 4823efb..2d51788 100644
---- a/screen.h
-+++ b/screen.h
-@@ -43,7 +43,7 @@
- #include "osdef.h"
- 
- #include "ansi.h"
--#include "sched.h"
-+#include "eventqueue.h"
- #include "acls.h"
- #include "comm.h"
- #include "layer.h"
--- 
-2.41.0
-
diff --git a/package/screen/0006-comm.h-now-depends-on-term.h.patch b/package/screen/0006-comm.h-now-depends-on-term.h.patch
deleted file mode 100644
index 088dfb340c..0000000000
--- a/package/screen/0006-comm.h-now-depends-on-term.h.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 23a8ca6be87ad374d66854cee66ab758880cc651 Mon Sep 17 00:00:00 2001
-From: Mike Gerwitz <mike@mikegerwitz.com>
-Date: Tue, 24 Dec 2013 22:16:31 -0500
-Subject: [PATCH] comm.h now depends on term.h
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Patch retrieved and updated from:
-http://git.savannah.gnu.org/cgit/screen.git/commit/?id=39c5f1c]
-[Julien: rebase on top of 4.9.1]
-Signed-off-by: Julien Olivain <ju.o@free.fr>
----
- Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index 4718f08..7082a3e 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -132,7 +132,7 @@ kmapdef.c: term.h
- tty.c:	tty.sh 
- 	sh $(srcdir)/tty.sh tty.c
- 
--comm.h: comm.c comm.sh config.h
-+comm.h: comm.c comm.sh config.h term.h
- 	AWK=$(AWK) CC="$(CC) $(CFLAGS)" srcdir=${srcdir} sh $(srcdir)/comm.sh
- 
- osdef.h: osdef.sh config.h osdef.h.in
--- 
-2.41.0
-
diff --git a/package/screen/0007-comm.h-needed-for-list_-display-generic-.o.patch b/package/screen/0007-comm.h-needed-for-list_-display-generic-.o.patch
deleted file mode 100644
index d46bf723b8..0000000000
--- a/package/screen/0007-comm.h-needed-for-list_-display-generic-.o.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 8d8899b3ffd26d5049f8a9ccf12ff9ac65c352b4 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 3 Oct 2018 22:29:32 +0200
-Subject: [PATCH] comm.h needed for list_{display,generic}.o
-
-comm.h is needed to build list_display.o and list_generic.o otherwise
-parallel builds will sometimes fail
-
-Fixes:
- - http://autobuild.buildroot.org/results/43105f14857dbe72d8878fc7b3db67f7bdca93cc
- - http://autobuild.buildroot.org/results/47f4ecbec1355285633df287fc9c4e7cccde9378
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://savannah.gnu.org/bugs/index.php?54776]
-[Julien: rebase on top of 4.9.1]
-Signed-off-by: Julien Olivain <ju.o@free.fr>
----
- Makefile.in | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index 7082a3e..cd363b7 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -349,7 +349,7 @@ layout.o: layout.h viewport.h canvas.h layout.c config.h screen.h os.h osdef.h a
- viewport.o: layout.h viewport.h canvas.h viewport.c config.h screen.h os.h osdef.h ansi.h acls.h \
-  comm.h layer.h term.h image.h display.h window.h extern.h \
-  braille.h
--list_generic.o: list_generic.h list_generic.c layer.h screen.h osdef.h
--list_display.o: list_generic.h list_display.c layer.h screen.h osdef.h
-+list_generic.o: list_generic.h list_generic.c layer.h screen.h osdef.h comm.h
-+list_display.o: list_generic.h list_display.c layer.h screen.h osdef.h comm.h
- list_window.o: list_generic.h list_window.c window.h layer.h screen.h osdef.h comm.h
- 
--- 
-2.41.0
-
diff --git a/package/screen/Config.in b/package/screen/Config.in
index 40cda77b50..81a9bbe4c3 100644
--- a/package/screen/Config.in
+++ b/package/screen/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_SCREEN
 	bool "screen"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C17
 	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_NCURSES
 	help
@@ -13,3 +15,8 @@ config BR2_PACKAGE_SCREEN
 	  multiple character sets).
 
 	  http://www.gnu.org/software/screen/
+
+comment "screen needs a toolchain w/ wchar, gcc >= 8"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
diff --git a/package/screen/screen.hash b/package/screen/screen.hash
index ef32eb0696..208a9cb36d 100644
--- a/package/screen/screen.hash
+++ b/package/screen/screen.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/screen/screen-4.9.1.tar.gz.sig
-sha256  26cef3e3c42571c0d484ad6faf110c5c15091fbf872b06fa7aa4766c7405ac69  screen-4.9.1.tar.gz
+# https://ftp.gnu.org/gnu/screen/screen-5.0.0.tar.gz.sig
+sha256  f04a39d00a0e5c7c86a55338808903082ad5df4d73df1a2fd3425976aed94971  screen-5.0.0.tar.gz
 # Locally calculated
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
diff --git a/package/screen/screen.mk b/package/screen/screen.mk
index 55fecb89bc..9a64780a9a 100644
--- a/package/screen/screen.mk
+++ b/package/screen/screen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SCREEN_VERSION = 4.9.1
+SCREEN_VERSION = 5.0.0
 SCREEN_SITE = $(BR2_GNU_MIRROR)/screen
 SCREEN_LICENSE = GPL-3.0+
 SCREEN_LICENSE_FILES = COPYING
-- 
2.46.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
