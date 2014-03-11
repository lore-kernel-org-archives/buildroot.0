From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Tue, 11 Mar 2014 19:53:48 +0100
Subject: [Buildroot] [PATCH v5 5/6] pkgconf: rewrite variable sdkdir,
	needed by xdriver_xf86-video-intel
In-Reply-To: <1394564029-528-1-git-send-email-berndkuhls@hotmail.com>
References: <1394564029-528-1-git-send-email-berndkuhls@hotmail.com>
Message-ID: <BLU0-SMTP209C39550276B7F3D320C26D9770@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
v2: no changes

 package/pkgconf/pkgconf-fix-variable.patch |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/pkgconf/pkgconf-fix-variable.patch b/package/pkgconf/pkgconf-fix-variable.patch
index e19f76c..4c213d6 100644
--- a/package/pkgconf/pkgconf-fix-variable.patch
+++ b/package/pkgconf/pkgconf-fix-variable.patch
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
