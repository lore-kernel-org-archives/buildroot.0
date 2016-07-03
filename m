From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 12:43:39 +0200
Subject: [Buildroot] [git commit] cups: reformat patch with Git
Message-ID: <20160703104344.8F65981E64@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0071464e8b92a270fe9c8031b0ea0e4a7fd9cbee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

All patches in the cups package are Git formatted, except
0004-remove-pie.patch, so this commit makes things consistent by also
making this patch Git formatted.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...patch => 0004-Remove-PIE-flags-from-the-build.patch} | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/package/cups/0004-remove-pie.patch b/package/cups/0004-Remove-PIE-flags-from-the-build.patch
similarity index 59%
rename from package/cups/0004-remove-pie.patch
rename to package/cups/0004-Remove-PIE-flags-from-the-build.patch
index 3d81941..492418f 100644
--- a/package/cups/0004-remove-pie.patch
+++ b/package/cups/0004-Remove-PIE-flags-from-the-build.patch
@@ -1,16 +1,22 @@
-Remove PIE flags from the build
+From b341a1e1fce48012fc5bcf39337488fd33210616 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sun, 3 Jul 2016 12:20:21 +0200
+Subject: [PATCH] Remove PIE flags from the build
 
 Generating a statically linked binary built with PIE requires the
 Scrt1.o file, which isn't part of Buildroot uClibc toolchains. To
 solve this, we simply disable the PIE flags.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Makedefs.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: b/Makedefs.in
-===================================================================
+diff --git a/Makedefs.in b/Makedefs.in
+index 3afef0a..299b297 100644
 --- a/Makedefs.in
 +++ b/Makedefs.in
-@@ -142,7 +142,7 @@
+@@ -142,7 +142,7 @@ IPPFIND_BIN	=	@IPPFIND_BIN@
  IPPFIND_MAN	=	@IPPFIND_MAN@
  LDFLAGS		=	-L../cgi-bin -L../cups -L../filter -L../ppdc \
  			-L../scheduler @LDARCHFLAGS@ \
@@ -19,3 +25,6 @@ Index: b/Makedefs.in
  LINKCUPS	=	@LINKCUPS@ $(LIBGSSAPI) $(DNSSDLIBS) $(LIBZ)
  LINKCUPSIMAGE	=	@LINKCUPSIMAGE@
  LIBS		=	$(LINKCUPS) $(COMMONLIBS)
+-- 
+2.7.4
+
