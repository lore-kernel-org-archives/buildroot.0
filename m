From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Feb 2016 23:46:00 +0100
Subject: [Buildroot] [git commit] toolchain: copy_toolchain_lib_root: rename
	LIBSPATH to LIBPATHS
Message-ID: <20160203224616.BD7358014A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=335f331ff29b825686d74ebb33e59bc400855c82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LIBSPATH is populated based on a find with a pattern that can look like:
    libfoo*.so
and thus the output of the find will contain all file paths that match this
pattern.

Unfortunately, the name LIBSPATH suggests that only one entry is returned,
rather than possibly multiple.

As this code is quite complex, use the more accurate name LIBPATHS iso
LIBSPATH.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/helpers.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 02cc0bb..ee878e8 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -55,13 +55,13 @@ copy_toolchain_lib_root = \
 		$${ARCH_SYSROOT_DIR}/$${ARCH_LIB_DIR} \
 		$${ARCH_SYSROOT_DIR}/usr/$${ARCH_LIB_DIR} \
 		$${SUPPORT_LIB_DIR} ; do \
-		LIBSPATH=`find $${dir} -maxdepth 1 -name "$${LIB}" 2>/dev/null` ; \
-		if test -n "$${LIBSPATH}" ; then \
+		LIBPATHS=`find $${dir} -maxdepth 1 -name "$${LIB}" 2>/dev/null` ; \
+		if test -n "$${LIBPATHS}" ; then \
 			break ; \
 		fi \
 	done ; \
 	mkdir -p $(TARGET_DIR)/$${DESTDIR}; \
-	for LIBPATH in $${LIBSPATH} ; do \
+	for LIBPATH in $${LIBPATHS} ; do \
 		while true ; do \
 			LIBNAME=`basename $${LIBPATH}`; \
 			LIBDIR=`dirname $${LIBPATH}` ; \
