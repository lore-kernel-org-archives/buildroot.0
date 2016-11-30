From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Nov 2016 22:57:30 +0100
Subject: [Buildroot] [git commit branch/next] Revert "jasper: Disable
	debugging when building for xtensa"
Message-ID: <20161130215745.26A8281861@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c43b09a99fca22cd2e03e9d8370a23aaf4066a19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This reverts commit 71d9b0c1f06896f113b09e941aa84d979bff5710.
Now that -mauto-litpools is in TARGET_ABI when building for xtensa, -O0
builds succeed, so this workaround is no longer needed.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/jasper/jasper.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index db86ae8..b2da07d 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -14,10 +14,4 @@ JASPER_LICENSE_FILES = LICENSE
 # needed to fix rpath issue (http://autobuild.buildroot.net/results/307/307cac65287420252a5bb64715d9a1edd90e72fa/)
 JASPER_AUTORECONF = YES
 
-# Xtensa gcc is unable to generate correct code with -O0 enabled by
-# --enable-debug. Allow package build but disable debug.
-ifeq ($(BR2_xtensa)$(BR2_ENABLE_DEBUG),yy)
-JASPER_CONF_OPTS += --disable-debug
-endif
-
 $(eval $(autotools-package))
