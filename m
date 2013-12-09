From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Dec 2013 11:41:19 +0100
Subject: [Buildroot] [git commit] libglib2: bump version to 2.38.2
Message-ID: <20131209105306.109F89BFA2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=95282538fd18927fd8306ffd566d214de759296f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
that we can bump to, in order to fix the atomic operations problem. However,
2.37.x is a development version, so we bump to 2.38.2 instead.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libglib2/libglib2.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index f770d3a..d29b938 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGLIB2_VERSION_MAJOR = 2.36
-LIBGLIB2_VERSION_MINOR = 3
+LIBGLIB2_VERSION_MAJOR = 2.38
+LIBGLIB2_VERSION_MINOR = 2
 LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).$(LIBGLIB2_VERSION_MINOR)
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
