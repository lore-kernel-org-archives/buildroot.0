From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Sep 2015 14:58:06 +0200
Subject: [Buildroot] [git commit] package/texinfo: remove package
Message-ID: <20150920125827.824C57FBAD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7ebdace8ea085cbae7f50b48049758db7a9a98c1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Having checked that binutils doesn't need to depend on host-texinfo...

  http://patchwork.ozlabs.org/patch/515914/

...and having fixed gdb to not build the documentation...

  http://patchwork.ozlabs.org/patch/515821/

...we can now safely remove this host package since there aren't any
packages depending on it.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/texinfo/texinfo.hash |    2 --
 package/texinfo/texinfo.mk   |   17 -----------------
 2 files changed, 0 insertions(+), 19 deletions(-)

diff --git a/package/texinfo/texinfo.hash b/package/texinfo/texinfo.hash
deleted file mode 100644
index 656c390..0000000
--- a/package/texinfo/texinfo.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated after checking pgp signature
-sha256	1303e91a1c752b69a32666a407e9fbdd6e936def4b09bc7de30f416301530d68	texinfo-4.13a.tar.gz
diff --git a/package/texinfo/texinfo.mk b/package/texinfo/texinfo.mk
deleted file mode 100644
index 184288b..0000000
--- a/package/texinfo/texinfo.mk
+++ /dev/null
@@ -1,17 +0,0 @@
-################################################################################
-#
-# texinfo
-#
-################################################################################
-
-# We are intentionally not using the latest version 5.x, because it
-# causes issues with the documentation building process when creating
-# a toolchain with the Crosstool-NG backend.
-
-TEXINFO_VERSION = 4.13a
-TEXINFO_SITE = $(BR2_GNU_MIRROR)/texinfo
-TEXINFO_LICENSE = GPLv3+
-TEXINFO_LICENSE_FILES = COPYING
-TEXINFO_DEPENDENCIES = ncurses
-
-$(eval $(host-autotools-package))
