From: spdawson at gmail.com <spdawson@gmail.com>
Date: Thu,  5 Dec 2013 14:00:43 +0000
Subject: [Buildroot] [PATCH] libglib2: bump version to 2.37.7
Message-ID: <1386252043-12389-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

libglib2 can fail to build for arm, with the following error.

  gatomic.c:668:2: error: #error G_ATOMIC_LOCK_FREE defined, but incapable of lock-free atomics.

The following upstream commit fixes the problem.

  commit 996edb0c46356d8a326f886b91a77a6af9a2de3e
  Author: Antoine Jacoutot <antoine@mtier.org>
  Date:   Wed Aug 28 09:35:27 2013 +0200

    fix atomic ops detection

    AC_TRY_LINK should be used instead of AC_TRY_COMPILE because the code
    will compile everywhere, either producing ``atomic'' code, or an
    external reference to __sync_bool_compare_and_swap.

    https://bugzilla.gnome.org/show_bug.cgi?id=706958

The upstream commit went into version 2.37.7, so this is the lowest version
that we can bump to, in order to fix the atomic operations problem.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/libglib2/libglib2.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index f770d3a..10220d6 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGLIB2_VERSION_MAJOR = 2.36
-LIBGLIB2_VERSION_MINOR = 3
+LIBGLIB2_VERSION_MAJOR = 2.37
+LIBGLIB2_VERSION_MINOR = 7
 LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).$(LIBGLIB2_VERSION_MINOR)
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
-- 
1.8.3.2
