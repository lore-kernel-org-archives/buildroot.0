From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Feb 2015 14:51:43 +0100
Subject: [Buildroot] [git commit] package/gcc: rename the conditional patch
	according to the new policy
Message-ID: <20150203141442.E840E80E35@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dd798a45c571063595c45278e28ed4f614f2cf32
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0-powerpc-link-with-math-lib.patch.conditional} |    0
 ...0-powerpc-link-with-math-lib.patch.conditional} |    0
 ...0-powerpc-link-with-math-lib.patch.conditional} |    0
 ...0-powerpc-link-with-math-lib.patch.conditional} |    0
 package/gcc/gcc.mk                                 |    2 +-
 5 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gcc/4.5.4/powerpc-link-with-math-lib.patch.conditional b/package/gcc/4.5.4/1000-powerpc-link-with-math-lib.patch.conditional
similarity index 100%
rename from package/gcc/4.5.4/powerpc-link-with-math-lib.patch.conditional
rename to package/gcc/4.5.4/1000-powerpc-link-with-math-lib.patch.conditional
diff --git a/package/gcc/4.7.4/powerpc-link-with-math-lib.patch.conditional b/package/gcc/4.7.4/1000-powerpc-link-with-math-lib.patch.conditional
similarity index 100%
rename from package/gcc/4.7.4/powerpc-link-with-math-lib.patch.conditional
rename to package/gcc/4.7.4/1000-powerpc-link-with-math-lib.patch.conditional
diff --git a/package/gcc/4.8.4/powerpc-link-with-math-lib.patch.conditional b/package/gcc/4.8.4/1000-powerpc-link-with-math-lib.patch.conditional
similarity index 100%
rename from package/gcc/4.8.4/powerpc-link-with-math-lib.patch.conditional
rename to package/gcc/4.8.4/1000-powerpc-link-with-math-lib.patch.conditional
diff --git a/package/gcc/4.9.2/powerpc-link-with-math-lib.patch.conditional b/package/gcc/4.9.2/1000-powerpc-link-with-math-lib.patch.conditional
similarity index 100%
rename from package/gcc/4.9.2/powerpc-link-with-math-lib.patch.conditional
rename to package/gcc/4.9.2/1000-powerpc-link-with-math-lib.patch.conditional
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 2e8b412..3af8290 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -37,7 +37,7 @@ endef
 ifeq ($(ARCH),powerpc)
 ifneq ($(BR2_SOFT_FLOAT),)
 define HOST_GCC_APPLY_POWERPC_PATCH
-	$(APPLY_PATCHES) $(@D) package/gcc/$(GCC_VERSION) powerpc-link-with-math-lib.patch.conditional
+	$(APPLY_PATCHES) $(@D) package/gcc/$(GCC_VERSION) 1000-powerpc-link-with-math-lib.patch.conditional
 endef
 endif
 endif
