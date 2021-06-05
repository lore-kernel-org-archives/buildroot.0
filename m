From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 5 Jun 2021 21:36:00 +0200
Subject: [Buildroot] [git commit] package/gptfdisk: security bump version to
 1.0.7
Message-ID: <20210605190548.4A88D81398@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=75d5e8fb9cd68388f1ae2f3724fef988b0fb4b70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://sourceforge.net/p/gptfdisk/code/ci/master/tree/NEWS

Version 1.0.6 fixes CVE-2020-0256 & CVE-2021-0308.

Removed md5 hash.

Rebased patch due to upstream commit
https://sourceforge.net/p/gptfdisk/code/ci/6180deb472c302c47f4d4acff8f2123d10824364/#diff-3

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...0001-gptcurses-partially-revert-Tweaks-for-building-on-th.patch | 2 +-
 package/gptfdisk/gptfdisk.hash                                     | 7 +++----
 package/gptfdisk/gptfdisk.mk                                       | 2 +-
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/gptfdisk/0001-gptcurses-partially-revert-Tweaks-for-building-on-th.patch b/package/gptfdisk/0001-gptcurses-partially-revert-Tweaks-for-building-on-th.patch
index 518639387a..02f954531a 100644
--- a/package/gptfdisk/0001-gptcurses-partially-revert-Tweaks-for-building-on-th.patch
+++ b/package/gptfdisk/0001-gptcurses-partially-revert-Tweaks-for-building-on-th.patch
@@ -29,7 +29,7 @@ index 1b18cf2..4ebfde1 100644
  #include <iostream>
  #include <string>
  #include <sstream>
--#ifdef __APPLE__
+-#if defined (__APPLE__) || (__FreeBSD__)
  #include <ncurses.h>
 -#else
 -#include <ncursesw/ncurses.h>
diff --git a/package/gptfdisk/gptfdisk.hash b/package/gptfdisk/gptfdisk.hash
index bff17dcc21..7894f2187d 100644
--- a/package/gptfdisk/gptfdisk.hash
+++ b/package/gptfdisk/gptfdisk.hash
@@ -1,6 +1,5 @@
-# From http://sourceforge.net/projects/gptfdisk/files/gptfdisk/1.0.5/
-md5  58dac67c85e46ca87b587231549aefe6  gptfdisk-1.0.5.tar.gz
-sha1  b642aa628cbc9fa63e9a73dad5acc588042527ac  gptfdisk-1.0.5.tar.gz
+# From http://sourceforge.net/projects/gptfdisk/files/gptfdisk/1.0.7/
+sha1  406ab2596e1911c916dce677ce7e903076d94c6d  gptfdisk-1.0.7.tar.gz
 # Locally computed
-sha256  0e7d3987cd0488ecaf4b48761bc97f40b1dc089e5ff53c4b37abe30bc67dcb2f  gptfdisk-1.0.5.tar.gz
+sha256  754004b7f85b279287c7ac3c0469b1d7e0eae043a97a2e587b0560ca5f3828c0  gptfdisk-1.0.7.tar.gz
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/gptfdisk/gptfdisk.mk b/package/gptfdisk/gptfdisk.mk
index e848837b76..d92a527105 100644
--- a/package/gptfdisk/gptfdisk.mk
+++ b/package/gptfdisk/gptfdisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GPTFDISK_VERSION = 1.0.5
+GPTFDISK_VERSION = 1.0.7
 GPTFDISK_SITE = http://downloads.sourceforge.net/sourceforge/gptfdisk
 GPTFDISK_LICENSE = GPL-2.0+
 GPTFDISK_LICENSE_FILES = COPYING
