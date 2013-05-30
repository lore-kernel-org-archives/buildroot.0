From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 30 May 2013 21:48:00 +0200
Subject: [Buildroot] [git commit branch/next] binutils: apply post-patch
	hook on both the host and target builds
Message-ID: <20130530195804.CCCE59A69D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dc3e6500577b18309699e957257f2d4966790c83
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

When a Xtensa specific patch needs to be applied, it should be applied
both when doing the target and the host build.

This change is part of the effort to remove the differences between
host and target post-extract and post-patch hooks, that are
problematic for the out-of-tree support.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/binutils/binutils.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 081be6a..a2c4150 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -81,6 +81,7 @@ define BINUTILS_XTENSA_PRE_PATCH
 	tar xf $(BR2_XTENSA_OVERLAY_DIR)/xtensa_$(XTENSA_CORE_NAME).tar \
 		-C $(@D) --strip-components=1 binutils
 endef
+BINUTILS_PRE_PATCH_HOOKS += BINUTILS_XTENSA_PRE_PATCH
 HOST_BINUTILS_PRE_PATCH_HOOKS += BINUTILS_XTENSA_PRE_PATCH
 endif
 
