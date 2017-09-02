From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  2 Sep 2017 19:03:12 +0200
Subject: [Buildroot] [PATCH 1/2] package/netatalk: remove patch applied
	upstream
Message-ID: <20170902170313.13215-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Link to upstream commit:
https://sourceforge.net/p/netatalk/code/ci/d48ecb55ac4c916cd78bbaf4de53a04abf6d47fb/

Fixes
http://autobuild.buildroot.net/results/0a7/0a7c94e074da5a4944f2046cd33fdcc51d3884e5/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/netatalk/0002-no-acl.patch | 15 ---------------
 1 file changed, 15 deletions(-)
 delete mode 100644 package/netatalk/0002-no-acl.patch

diff --git a/package/netatalk/0002-no-acl.patch b/package/netatalk/0002-no-acl.patch
deleted file mode 100644
index 165141b47..000000000
--- a/package/netatalk/0002-no-acl.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Fix builds without acl, from http://sourceforge.net/p/netatalk/bugs/574/
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura netatalk-3.1.7.orig/include/atalk/acl.h netatalk-3.1.7/include/atalk/acl.h
---- netatalk-3.1.7.orig/include/atalk/acl.h	2014-12-03 17:34:49.895524464 -0300
-+++ netatalk-3.1.7/include/atalk/acl.h	2014-12-03 17:34:58.735243283 -0300
-@@ -61,6 +61,7 @@
- #else /* HAVE_ACLS=no */
- 
- #define O_NETATALK_ACL 0
-+#define O_IGNORE 0
- #define chmod_acl chmod
- 
- #endif /* HAVE_ACLS */
-- 
2.11.0
