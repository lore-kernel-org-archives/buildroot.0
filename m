From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 29 Dec 2013 23:06:19 +0100
Subject: [Buildroot] [v2 1/1] xenomai: fix build failure when HAVE_OPEN64 is
	undefined
Message-ID: <1388354779-17875-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fixes: http://autobuild.buildroot.org/results/d59/d590be34637a4043c929ce615f9db504484be435/build-end.log

Upstream patch:
http://git.xenomai.org/xenomai-2.6.git/commit/?id=71345fe15f126ae3a596af309945d0af6edfbbbb

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 ...uild-failure-when-HAVE_OPEN64-is-undefine.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/xenomai/xenomai-0002-posix-fix-build-failure-when-HAVE_OPEN64-is-undefine.patch

diff --git a/package/xenomai/xenomai-0002-posix-fix-build-failure-when-HAVE_OPEN64-is-undefine.patch b/package/xenomai/xenomai-0002-posix-fix-build-failure-when-HAVE_OPEN64-is-undefine.patch
new file mode 100644
index 0000000..ce43676
--- /dev/null
+++ b/package/xenomai/xenomai-0002-posix-fix-build-failure-when-HAVE_OPEN64-is-undefine.patch
@@ -0,0 +1,30 @@
+From 71345fe15f126ae3a596af309945d0af6edfbbbb Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Sun, 29 Dec 2013 18:00:25 +0100
+Subject: [PATCH 1/1] posix: fix build failure when HAVE_OPEN64 is undefined.
+
+fixes: http://autobuild.buildroot.org/results/d59/d590be34637a4043c929ce615f9db504484be435/build-end.log
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ src/skins/posix/rtdm.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/skins/posix/rtdm.c b/src/skins/posix/rtdm.c
+index 5840c64..d6c87dc 100644
+--- a/src/skins/posix/rtdm.c
++++ b/src/skins/posix/rtdm.c
+@@ -107,8 +107,9 @@ int __wrap_open64(const char *path, int oflag, ...)
+ 			errno = EMFILE;
+ 			ret = -1;
+ 		}
++	}
+ #endif
+-	} else {
++	else {
+ 		errno = -ret;
+ 		ret = -1;
+ 	}
+-- 
+1.8.1.4
+
-- 
1.8.1.4
