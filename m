From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 6 Jun 2012 00:48:07 +0200
Subject: [Buildroot] [git commit] libcgi: fix cflags
Message-ID: <20120605224905.F2BD196E60@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7ab39d39cbbf93dbd59e7a0fdb1a1f5ee7962034
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.org/results/4000a12a9b237bd12618eb22ea793a913fc73b4f

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libcgi/libcgi.patch |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libcgi/libcgi.patch b/package/libcgi/libcgi.patch
index 716d83c..12a7b10 100644
--- a/package/libcgi/libcgi.patch
+++ b/package/libcgi/libcgi.patch
@@ -27,7 +27,7 @@
  exec_prefix = @exec_prefix@
  
 -SHAREDOPT = -shared
-+SHAREDOPT = -shared -fPIC,-Wl,-soname,libcgi.so.0
++SHAREDOPT = -shared -fPIC -Wl,-soname,libcgi.so.0
  LIBDIR = $(prefix)/lib
 -INCDIR = $(prefix)/include
 +INCDIR = $(prefix)/include/libcgi/
