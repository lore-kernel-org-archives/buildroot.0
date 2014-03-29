From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 23:11:26 +0100
Subject: [Buildroot] [git commit] pkgconf: rewrite variable sdkdir,
	needed by xdriver_xf86-video-intel
Message-ID: <20140329222157.E36C89C41F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f467e8d91a328aaa3a4821ea1b7366b506f1318e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- rename patch file to include the apply order

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ariable.patch => pkgconf-01-fix-variable.patch} |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

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
