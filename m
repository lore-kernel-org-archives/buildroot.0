From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jul 2012 09:17:56 +0200
Subject: [Buildroot] [git commit] pkg-generic: fix SUBDIR handling
Message-ID: <20120724072703.CDE2696E28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8e26abecd00f4899fb122c3eeb03fbdf20cda32e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 9ba9bfb9a02706fa414bcf4c6dcceac1b68a5c9a inverted the logic to
define $(2)_SUBDIR, breaking the build of things using the _SUBDIR
feature, like the tcl package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 8a730c0..d1f4f2a 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -204,11 +204,11 @@ $(2)_BASE_NAME	=  $(1)-$$($(2)_VERSION)
 $(2)_DL_DIR	=  $$(DL_DIR)/$$($(2)_BASE_NAME)
 $(2)_DIR	=  $$(BUILD_DIR)/$$($(2)_BASE_NAME)
 
-ifndef $(3)_SUBDIR
- ifdef $(2)_SUBDIR
-  $(3)_SUBDIR = $$($(2)_SUBDIR)
+ifndef $(2)_SUBDIR
+ ifdef $(3)_SUBDIR
+  $(2)_SUBDIR = $$($(3)_SUBDIR)
  else
-  $(3)_SUBDIR ?=
+  $(2)_SUBDIR ?=
  endif
 endif
 
