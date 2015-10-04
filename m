From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Oct 2015 18:22:20 +0200
Subject: [Buildroot] [git commit] cryptodev-linux: remove now-redundant
	fix-ccache-compile patch
Message-ID: <20151004162325.1C22A81D77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=37d090c6dbad752cd544dcbe4311eacebca8af07
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../cryptodev-linux/0002-fix-ccache-compile.patch  |   20 --------------------
 1 files changed, 0 insertions(+), 20 deletions(-)

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
