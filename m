From: Sergio Monteiro Basto <sergio@sergiomb.no-ip.org>
Date: Sun, 06 Mar 2011 19:59:54 +0000
Subject: [Buildroot] [Fwd: Fix somepackage with gold or recent gcc releases.]
Message-ID: <1299441594.352.3.camel@segulix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From Xorg-devel list I found this thread that maybe useful for buildroot
packages. 


Some references:

http://wiki.debian.org/ToolChain/DSOLinking
https://fedoraproject.org/wiki/UnderstandingDSOLinkChange
---
 configure.ac |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/configure.ac b/configure.ac
index 39a3655..13a2a58 100644
--- a/configure.ac
+++ b/configure.ac
@@ -79,6 +79,9 @@ AM_CONDITIONAL(HAVE_ARC4RANDOM, test x$HAVE_ARC4RANDOM = xyes)
 
 # Function crypt() comes from the C library or the -lcrypt data encryption library
 AC_SEARCH_LIBS(crypt, crypt)
+
+# Function dl() comes from the C library or -ldl
+AC_SEARCH_LIBS([dlopen], [dl])
 #------------------------------------------------------------------------------
 
 # Checks for header files.
@@ -287,7 +290,7 @@ AC_SUBST(SHELL_CMD)
 
 # Checks for pkg-config packages
 
-PKG_CHECK_MODULES(XDM, xmu x11 xau)
+PKG_CHECK_MODULES(XDM, xmu x11 xau xext)
 
 PKG_CHECK_EXISTS(xinerama, [
 	AC_DEFINE([USE_XINERAMA], 1, 
-- 
1.7.4.1

_______________________________________________
xorg-devel at lists.x.org: X.Org development
Archives: http://lists.x.org/archives/xorg-devel
Info: http://lists.x.org/mailman/listinfo/xorg-devel

-- 
S?rgio M. B.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 3309 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110306/82451c93/attachment.bin>
