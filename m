From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 21:37:04 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] libglib2: needs autoreconf
Message-ID: <20171126213911.0DE7D8157F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b1c134376ab9a31828cee275c8eebfbd16f47ab3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Patch 0002-disable-tests.patch modifies Makefile.am, so we have to
autoreconf. It hasn't been seen until now, but becomes very clear
since the bump of automake to 1.15.1, as we're seeing build failures
such as:

configure.ac:66: error: version mismatch.  This is Automake 1.15.1,
configure.ac:66: but the definition used by this AM_INIT_AUTOMAKE
configure.ac:66: comes from Automake 1.15.  You should recreate
configure.ac:66: aclocal.m4 with aclocal and run automake again.

Fixes:

  http://autobuild.buildroot.net/results/3402357d8e90f1866dfeaee7bb61119d80dc8bcb/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 45fbec12e79dfd8416b20afa4c2590aecd3ddc5d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libglib2/libglib2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index e23c4a2..1c11166 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -10,6 +10,8 @@ LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPLv2+
 LIBGLIB2_LICENSE_FILES = COPYING
+# 0002-disable-tests.patch
+LIBGLIB2_AUTORECONF = YES
 
 LIBGLIB2_INSTALL_STAGING = YES
 LIBGLIB2_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
