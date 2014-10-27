From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 27 Oct 2014 01:26:10 +0100
Subject: [Buildroot] [PATCH 1/3] package/gcc: rename the conditional patch
	according to the new policy
In-Reply-To: <1414369572-15695-1-git-send-email-s.martin49@gmail.com>
References: <1414369572-15695-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1414369572-15695-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 ...ch.conditional => 1000-powerpc-link-with-math-lib.patch.conditional} | 0
 ...ch.conditional => 1000-powerpc-link-with-math-lib.patch.conditional} | 0
 ...ch.conditional => 1000-powerpc-link-with-math-lib.patch.conditional} | 0
 .../1000-powerpc-link-with-math-lib.patch.conditional}                  | 0
 .../1000-powerpc-link-with-math-lib.patch.conditional}                  | 0
 package/gcc/gcc.mk                                                      | 2 +-
 6 files changed, 1 insertion(+), 1 deletion(-)
 rename package/gcc/4.4.7/{powerpc-link-with-math-lib.patch.conditional => 1000-powerpc-link-with-math-lib.patch.conditional} (100%)
 rename package/gcc/4.5.4/{powerpc-link-with-math-lib.patch.conditional => 1000-powerpc-link-with-math-lib.patch.conditional} (100%)
 rename package/gcc/4.7.4/{powerpc-link-with-math-lib.patch.conditional => 1000-powerpc-link-with-math-lib.patch.conditional} (100%)
 rename package/gcc/{4.9.1/powerpc-link-with-math-lib.patch.conditional => 4.8.3/1000-powerpc-link-with-math-lib.patch.conditional} (100%)
 rename package/gcc/{4.8.3/powerpc-link-with-math-lib.patch.conditional => 4.9.1/1000-powerpc-link-with-math-lib.patch.conditional} (100%)

diff --git a/package/gcc/4.4.7/powerpc-link-with-math-lib.patch.conditional b/package/gcc/4.4.7/1000-powerpc-link-with-math-lib.patch.conditional
similarity index 100%
rename from package/gcc/4.4.7/powerpc-link-with-math-lib.patch.conditional
rename to package/gcc/4.4.7/1000-powerpc-link-with-math-lib.patch.conditional
diff --git a/package/gcc/4.5.4/powerpc-link-with-math-lib.patch.conditional b/package/gcc/4.5.4/1000-powerpc-link-with-math-lib.patch.conditional
similarity index 100%
rename from package/gcc/4.5.4/powerpc-link-with-math-lib.patch.conditional
rename to package/gcc/4.5.4/1000-powerpc-link-with-math-lib.patch.conditional
diff --git a/package/gcc/4.7.4/powerpc-link-with-math-lib.patch.conditional b/package/gcc/4.7.4/1000-powerpc-link-with-math-lib.patch.conditional
similarity index 100%
rename from package/gcc/4.7.4/powerpc-link-with-math-lib.patch.conditional
rename to package/gcc/4.7.4/1000-powerpc-link-with-math-lib.patch.conditional
diff --git a/package/gcc/4.9.1/powerpc-link-with-math-lib.patch.conditional b/package/gcc/4.8.3/1000-powerpc-link-with-math-lib.patch.conditional
similarity index 100%
rename from package/gcc/4.9.1/powerpc-link-with-math-lib.patch.conditional
rename to package/gcc/4.8.3/1000-powerpc-link-with-math-lib.patch.conditional
diff --git a/package/gcc/4.8.3/powerpc-link-with-math-lib.patch.conditional b/package/gcc/4.9.1/1000-powerpc-link-with-math-lib.patch.conditional
similarity index 100%
rename from package/gcc/4.8.3/powerpc-link-with-math-lib.patch.conditional
rename to package/gcc/4.9.1/1000-powerpc-link-with-math-lib.patch.conditional
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 59f6268..5c972e6 100644
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
-- 
2.1.2
