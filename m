From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jul 2017 23:36:47 +0200
Subject: [Buildroot] [git commit] pkg-generic: make PKG_DL_DIR equal to
	DL_DIR
Message-ID: <20170722213537.6584781673@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=827fa4f917b1b4abc126e22631d0b98dd2293aed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This variable is currently not used by anyone.
The value is changed to match the path to DL_DIR.

The next patch will introduce the use of PKG_DL_DIR for packages that
use specific EXTRACT_CMDS.

And then we will be able to change the value of PKG_DL_DIR to create a
new directory structure in DL_DIR with a subdirectory for each package.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index b2b3af7..130fd67 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -434,7 +434,7 @@ endif
 
 $(2)_BASE_NAME	= $$(if $$($(2)_VERSION),$(1)-$$($(2)_VERSION),$(1))
 $(2)_RAW_BASE_NAME = $$(if $$($(2)_VERSION),$$($(2)_RAWNAME)-$$($(2)_VERSION),$$($(2)_RAWNAME))
-$(2)_DL_DIR	=  $$(DL_DIR)/$$($(2)_BASE_NAME)
+$(2)_DL_DIR	=  $$(DL_DIR)
 $(2)_DIR	=  $$(BUILD_DIR)/$$($(2)_BASE_NAME)
 
 ifndef $(2)_SUBDIR
