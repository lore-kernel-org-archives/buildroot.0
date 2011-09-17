From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 17 Sep 2011 14:16:42 +0200
Subject: [Buildroot] [git commit] Makefile.autotools.in: fix autoreconf
	libtool patching after libtool move
Message-ID: <20110917121852.BAD768D517@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=16d6e9b3420e78a89960b8b68202ea46a618810d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 20f8a7dec6fc (support: move libtool patches in support/libtool)
missed the autoreconf variant of the libtool patching, breaking the build
for packages needing both autoreconf and libtool patching.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.autotools.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index 1394787..4cd63a3 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -190,11 +190,11 @@ define AUTORECONF_HOOK
 		for i in `find $$($$(PKG)_SRCDIR) -name ltmain.sh`; do \
 			ltmain_version=`sed -n '/^[ 	]*VERSION=/{s/^[ 	]*VERSION=//;p;q;}' $$$$i | sed 's/\([0-9].[0-9]*\).*/\1/'`; \
 			if test $$$${ltmain_version} = "1.5"; then \
-				support/scripts/apply-patches.sh $$$${i%/*} package buildroot-libtool-v1.5.patch; \
+				support/scripts/apply-patches.sh $$$${i%/*} support/libtool buildroot-libtool-v1.5.patch; \
 			elif test $$$${ltmain_version} = "2.2"; then\
-				support/scripts/apply-patches.sh $$$${i%/*} package buildroot-libtool-v2.2.patch; \
+				support/scripts/apply-patches.sh $$$${i%/*} support/libtool buildroot-libtool-v2.2.patch; \
 			elif test $$$${ltmain_version} = "2.4"; then\
-				support/scripts/apply-patches.sh $$$${i%/*} package buildroot-libtool-v2.4.patch; \
+				support/scripts/apply-patches.sh $$$${i%/*} support/libtool buildroot-libtool-v2.4.patch; \
 			fi \
 		done \
 	fi
