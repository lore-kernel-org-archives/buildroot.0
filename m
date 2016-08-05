From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Aug 2016 15:48:48 +0200
Subject: [Buildroot] [git commit] libsepol: fix static build
Message-ID: <20160805134911.8C96082268@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5879f0192e99982880aeff7da5bb934b202a6262
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit a3ebe45dcb3e (libsepol: bump to version 2.5, 2016-06-26) didn't refresh
correctly the patch adding static build support. Do this now.

Fixes:
http://autobuild.buildroot.net/results/14b/14bbb7c9c59e7f68f3ae7ad63e075e27a0da2b1e/
http://autobuild.buildroot.net/results/97f/97f61d5e46a7f479e8de5dd19d49f7a3d84cc86e/
http://autobuild.buildroot.net/results/920/920e1ddac6bf93707a187e64a4ef7d95aff09e6c/

Cc: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsepol/0001-support-static-only.patch | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/libsepol/0001-support-static-only.patch b/package/libsepol/0001-support-static-only.patch
index 3e9a84f..3e6d555 100644
--- a/package/libsepol/0001-support-static-only.patch
+++ b/package/libsepol/0001-support-static-only.patch
@@ -30,8 +30,12 @@ index db6c2ba..0006285 100644
  
 
  $(LIBA):  $(OBJS)
-@@ -70,7 +74,11 @@ install: all
- 	install -m 755 $(LIBSO) $(SHLIBDIR)
+@@ -66,11 +70,13 @@
+ install: all
+ 	test -d $(LIBDIR) || install -m 755 -d $(LIBDIR)
+ 	install -m 644 $(LIBA) $(LIBDIR)
+-	test -d $(SHLIBDIR) || install -m 755 -d $(SHLIBDIR)
+-	install -m 755 $(LIBSO) $(SHLIBDIR)
  	test -d $(LIBDIR)/pkgconfig || install -m 755 -d $(LIBDIR)/pkgconfig
  	install -m 644 $(LIBPC) $(LIBDIR)/pkgconfig
 +ifeq ($(STATIC),)
