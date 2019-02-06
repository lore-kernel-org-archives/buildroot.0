From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 17:21:30 +0100
Subject: [Buildroot] [git commit] package/pkg-cmake: <pkg>_SUBDIR cleanup
Message-ID: <20190206162018.BD3BB81F17@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0febedaf4fe8f7dd5e4f9d70b10cb9ff88ebe3ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No functional change is brought by this modification.

This patch removes redundant <pkg>_SRCDIR declaration
  (already defined in pkg-generic.mk)

Signed-off-by: Lionel Orry <lionel.orry@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-cmake.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 51a1929ebb..b9ce8ff622 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -60,8 +60,6 @@ $(2)_INSTALL_OPTS		?= install
 $(2)_INSTALL_STAGING_OPTS	?= DESTDIR=$$(STAGING_DIR) install/fast
 $(2)_INSTALL_TARGET_OPTS		?= DESTDIR=$$(TARGET_DIR) install/fast
 
-$(2)_SRCDIR			= $$($(2)_DIR)/$$($(2)_SUBDIR)
-
 $(3)_SUPPORTS_IN_SOURCE_BUILD ?= YES
 
 
