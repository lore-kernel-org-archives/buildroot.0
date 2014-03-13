From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Thu, 13 Mar 2014 23:18:07 +0100
Subject: [Buildroot] [PATCH v8 4/5] pkgconf: rewrite variable sdkdir,
	needed by xdriver_xf86-video-intel
Message-ID: <BLU0-SMTP105B9B88674FF02C4E59F1D9710@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- rename patch file to include the apply order

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
v8: no changes
v7: renamed patch file (Jerzy), re-formatted changelog
v6: no changes
v5: no changes
v4: added initial version of this patch to v4 of the patch series

 .../{pkgconf-fix-variable.patch => pkgconf-01-fix-variable.patch}  |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename package/pkgconf/{pkgconf-fix-variable.patch => pkgconf-01-fix-variable.patch} (88%)

diff --git a/package/pkgconf/pkgconf-fix-variable.patch b/package/pkgconf/pkgconf-01-fix-variable.patch
similarity index 88%
rename from package/pkgconf/pkgconf-fix-variable.patch
rename to package/pkgconf/pkgconf-01-fix-variable.patch
index e19f76c..4c213d6 100644
--- a/package/pkgconf/pkgconf-fix-variable.patch
+++ b/package/pkgconf/pkgconf-01-fix-variable.patch
@@ -7,17 +7,19 @@ This is sometimes used to find header files (E.G. in gst-plugins configure),
 so ensure the sysroot'ed files are used.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
 
 diff -Nura pkgconf-0.8.9.orig/main.c pkgconf-0.8.9/main.c
 --- pkgconf-0.8.9.orig/main.c	2012-10-24 14:32:08.236508699 -0300
 +++ pkgconf-0.8.9/main.c	2012-10-24 14:54:36.771070217 -0300
-@@ -298,7 +298,12 @@
+@@ -298,7 +298,13 @@
  	if (eflag != PKG_ERRF_OK)
  		return false;
  
 -	printf("%s\n", req.buf);
 +	if ( !strcmp(req.variable, "includedir") ||
 +	  !strcmp(req.variable, "mapdir") ||
++	  !strcmp(req.variable, "sdkdir") ||
 +	  !strcmp(req.variable, "libdir"))
 +		printf("%s%s\n", sysroot_dir, req.buf);
 +	else
-- 
1.7.10.4
