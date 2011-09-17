From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 17 Sep 2011 08:22:12 +0200
Subject: [Buildroot] [git commit] support: move libtool patches in
	support/libtool
Message-ID: <20110917063643.02AC58D728@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=20f8a7dec6fc25f6c475163c0273147580128867
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
index 7f04c36..90c8924 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -152,11 +152,11 @@ define LIBTOOL_PATCH_HOOK
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
1.7.3.4
