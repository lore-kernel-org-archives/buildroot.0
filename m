From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Sep 2017 20:12:00 +0200
Subject: [Buildroot] [git commit] package/netatalk: remove patch applied
	upstream
Message-ID: <20170902180512.2A53281DA3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=436b0223039073344d03f6ef99970c7e8faa48a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Link to upstream commit:
https://sourceforge.net/p/netatalk/code/ci/d48ecb55ac4c916cd78bbaf4de53a04abf6d47fb/

Fixes
http://autobuild.buildroot.net/results/0a7/0a7c94e074da5a4944f2046cd33fdcc51d3884e5/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/netatalk/0002-no-acl.patch | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/package/netatalk/0002-no-acl.patch b/package/netatalk/0002-no-acl.patch
deleted file mode 100644
index 165141b..0000000
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
