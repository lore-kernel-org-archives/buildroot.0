From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Aug 2011 23:35:03 +0200
Subject: [Buildroot] [PATCH 4/7] support: move libtool patches in
	support/libtool
In-Reply-To: <cover.1314826483.git.thomas.petazzoni@free-electrons.com>
References: <cover.1314826483.git.thomas.petazzoni@free-electrons.com>
Message-ID: <46da6b8d6dbbb3cb6ed6b194c6ca6cea55fef735.1314826483.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.autotools.in                      |    6 +++---
 .../libtool}/buildroot-libtool-v1.5.patch          |    0
 .../libtool}/buildroot-libtool-v2.2.patch          |    0
 .../libtool}/buildroot-libtool-v2.4.patch          |    0
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename {package => support/libtool}/buildroot-libtool-v1.5.patch (100%)
 rename {package => support/libtool}/buildroot-libtool-v2.2.patch (100%)
 rename {package => support/libtool}/buildroot-libtool-v2.4.patch (100%)

diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index 46ab861..d502d21 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -151,11 +151,11 @@ define LIBTOOL_PATCH_HOOK
 			ltmain_version=`sed -n '/^[ 	]*VERSION=/{s/^[ 	]*VERSION=//;p;q;}' $$$$i | \
 			sed -e 's/\([0-9].[0-9]*\).*/\1/' -e 's/\"//'`; \
 			if test $$$${ltmain_version} = '1.5'; then \
-				toolchain/patch-kernel.sh $$$${i%/*} package buildroot-libtool-v1.5.patch; \
+				toolchain/patch-kernel.sh $$$${i%/*} support/libtool buildroot-libtool-v1.5.patch; \
 			elif test $$$${ltmain_version} = "2.2"; then\
-				toolchain/patch-kernel.sh $$$${i%/*} package buildroot-libtool-v2.2.patch; \
+				toolchain/patch-kernel.sh $$$${i%/*} support/libtool buildroot-libtool-v2.2.patch; \
 			elif test $$$${ltmain_version} = "2.4"; then\
-				toolchain/patch-kernel.sh $$$${i%/*} package buildroot-libtool-v2.4.patch; \
+				toolchain/patch-kernel.sh $$$${i%/*} support/libtool buildroot-libtool-v2.4.patch; \
 			fi \
 		done \
 	fi
diff --git a/package/buildroot-libtool-v1.5.patch b/support/libtool/buildroot-libtool-v1.5.patch
similarity index 100%
rename from package/buildroot-libtool-v1.5.patch
rename to support/libtool/buildroot-libtool-v1.5.patch
diff --git a/package/buildroot-libtool-v2.2.patch b/support/libtool/buildroot-libtool-v2.2.patch
similarity index 100%
rename from package/buildroot-libtool-v2.2.patch
rename to support/libtool/buildroot-libtool-v2.2.patch
diff --git a/package/buildroot-libtool-v2.4.patch b/support/libtool/buildroot-libtool-v2.4.patch
similarity index 100%
rename from package/buildroot-libtool-v2.4.patch
rename to support/libtool/buildroot-libtool-v2.4.patch
-- 
1.7.4.1
