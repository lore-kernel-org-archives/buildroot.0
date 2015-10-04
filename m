From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 4 Oct 2015 13:28:51 +0100
Subject: [Buildroot] [PATCH v2 11/18] cryptodev-linux: remove now-redundant
	fix-ccache-compile patch
In-Reply-To: <1443961738-12149-1-git-send-email-arnout@mind.be>
References: <1443961738-12149-1-git-send-email-arnout@mind.be>
Message-ID: <1443961738-12149-12-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
---
v2: No change
---
 .../cryptodev-linux/0002-fix-ccache-compile.patch    | 20 --------------------
 1 file changed, 20 deletions(-)
 delete mode 100644 package/cryptodev-linux/0002-fix-ccache-compile.patch

diff --git a/package/cryptodev-linux/0002-fix-ccache-compile.patch b/package/cryptodev-linux/0002-fix-ccache-compile.patch
deleted file mode 100644
index 058fb43..0000000
--- a/package/cryptodev-linux/0002-fix-ccache-compile.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Fix compilation with ccache enabled
-
-When ccache is enabled the CROSS_COMPILE variable contains a space, so
-it must be properly quoted.
-
-Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
-
-Index: cryptodev-linux-1.7/Makefile
-===================================================================
---- cryptodev-linux-1.7.orig/Makefile
-+++ cryptodev-linux-1.7/Makefile
-@@ -18,7 +18,7 @@ ifneq (${ARCH},)
- KERNEL_MAKE_OPTS += ARCH=${ARCH}
- endif
- ifneq (${CROSS_COMPILE},)
--KERNEL_MAKE_OPTS += CROSS_COMPILE=${CROSS_COMPILE}
-+KERNEL_MAKE_OPTS += CROSS_COMPILE="${CROSS_COMPILE}"
- endif
- 
- build: version.h
-- 
2.5.3
