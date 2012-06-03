From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  3 Jun 2012 17:15:12 +0200
Subject: [Buildroot] [PATCH 1/1] libcgi: fix cflags
Message-ID: <1338736512-21375-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes http://autobuild.buildroot.org/results/4000a12a9b237bd12618eb22ea793a913fc73b4f

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/libcgi/libcgi.patch |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
1.7.10.3
