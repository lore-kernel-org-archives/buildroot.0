From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Mar 2015 23:00:28 +0100
Subject: [Buildroot] [git commit] package/cmake: add support for xtensa
Message-ID: <20150317220034.D1DE880438@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f8cd961f5fc5444dc645b6b6d324d45c0ca221c6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backported from: ded79a976e2b63bbfd7a63f27ec00bd071410e27
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...IML-Teach-ABI.h-about-Xtensa-architecture.patch |   30 ++++++++++++++++++++
 package/cmake/Config.in                            |    2 +-
 2 files changed, 31 insertions(+), 1 deletions(-)

diff --git a/package/cmake/0002-KWIML-Teach-ABI.h-about-Xtensa-architecture.patch b/package/cmake/0002-KWIML-Teach-ABI.h-about-Xtensa-architecture.patch
new file mode 100644
index 0000000..7d8eec6
--- /dev/null
+++ b/package/cmake/0002-KWIML-Teach-ABI.h-about-Xtensa-architecture.patch
@@ -0,0 +1,30 @@
+From ded79a976e2b63bbfd7a63f27ec00bd071410e27 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Tue, 17 Mar 2015 15:51:04 +0300
+Subject: [PATCH] KWIML: Teach ABI.h about Xtensa architecture
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+ Utilities/KWIML/ABI.h.in | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/Utilities/KWIML/ABI.h.in b/Utilities/KWIML/ABI.h.in
+index 21c9139..6300ada 100644
+--- a/Utilities/KWIML/ABI.h.in
++++ b/Utilities/KWIML/ABI.h.in
+@@ -432,6 +432,12 @@ suppression macro @KWIML at _ABI_NO_VERIFY was defined.
+ #  define @KWIML at _ABI_ENDIAN_ID @KWIML at _ABI_ENDIAN_ID_BIG
+ # endif
+ 
++/* Xtensa */
++#elif defined(__XTENSA_EB__)
++# define @KWIML at _ABI_ENDIAN_ID @KWIML at _ABI_ENDIAN_ID_BIG
++#elif defined(__XTENSA_EL__)
++# define @KWIML at _ABI_ENDIAN_ID @KWIML at _ABI_ENDIAN_ID_LITTLE
++
+ /* Unknown CPU */
+ #elif !defined(@KWIML at _ABI_NO_ERROR_ENDIAN)
+ # error "Byte order of target CPU unknown."
+-- 
+1.8.1.4
+
diff --git a/package/cmake/Config.in b/package/cmake/Config.in
index dbc7d01..f3f0f85 100644
--- a/package/cmake/Config.in
+++ b/package/cmake/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_CMAKE_ARCH_SUPPORTS
 		BR2_m68k      || BR2_mips        || BR2_mips64   || \
 		BR2_mipsel    || BR2_mips64el    || BR2_powerpc  || \
 		BR2_powerpc64 || BR2_powerpc64le || BR2_sparc    || \
-		BR2_i386      || BR2_x86_64
+		BR2_i386      || BR2_x86_64      || BR2_xtensa
 
 config BR2_PACKAGE_CMAKE
 	bool
