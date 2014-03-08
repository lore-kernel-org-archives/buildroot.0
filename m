From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Mar 2014 11:08:45 +0100
Subject: [Buildroot] [git commit] Revert "libenca: Move build host tool to
	PRE_BUILD_HOOKS"
Message-ID: <20140308100938.F35269BE58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ffca352ac3c9de9c7f64598545f0ceb3f7b168de
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 0644378b51f1db66ee3a09ed236f675d40dbc9d8, because
the PRE_BUILD_HOOKS support has not been merged yet.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libenca/libenca.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libenca/libenca.mk b/package/libenca/libenca.mk
index 66fcfaa..d998c66 100644
--- a/package/libenca/libenca.mk
+++ b/package/libenca/libenca.mk
@@ -21,6 +21,6 @@ define LIBENCA_MAKE_HOST_TOOL
 	$(MAKE) -C $(@D)/tools $(HOST_CONFIGURE_OPTS) make_hash
 endef
 
-LIBENCA_PRE_BUILD_HOOKS += LIBENCA_MAKE_HOST_TOOL
+LIBENCA_POST_CONFIGURE_HOOKS += LIBENCA_MAKE_HOST_TOOL
 
 $(eval $(autotools-package))
