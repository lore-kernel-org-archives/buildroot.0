From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Oct 2020 08:52:04 +0200
Subject: [Buildroot] [git commit] package/netatalk: fix build with gcc 10
Message-ID: <20201003065707.53AF08E1C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=de12c0118767eb908a322141798671a867b71edd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/c3381fd3072901871fdd491dc3d4f66e403c7a70

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-multiple-def-of-invalid_dircache_entries.patch | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/package/netatalk/0002-fix-ftbs-multiple-def-of-invalid_dircache_entries.patch b/package/netatalk/0002-fix-ftbs-multiple-def-of-invalid_dircache_entries.patch
new file mode 100644
index 0000000000..e7ccc52553
--- /dev/null
+++ b/package/netatalk/0002-fix-ftbs-multiple-def-of-invalid_dircache_entries.patch
@@ -0,0 +1,25 @@
+From 32df6e155ccfc83216321925273c3e75e631ebe6 Mon Sep 17 00:00:00 2001
+From: Andrew Bauer <zonexpertconsulting@outlook.com>
+Date: Wed, 22 Jan 2020 09:59:47 -0600
+Subject: [PATCH] fix ftbs multiple def of invalid_dircache_entries
+
+[Retrieved from:
+https://github.com/Netatalk/Netatalk/pull/125/commits/32df6e155ccfc83216321925273c3e75e631ebe6]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ etc/afpd/directory.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/etc/afpd/directory.h b/etc/afpd/directory.h
+index eb89c606..81bfa9cb 100644
+--- a/etc/afpd/directory.h
++++ b/etc/afpd/directory.h
+@@ -91,7 +91,7 @@ struct maccess {
+ #define	AR_UWRITE	(1<<2)
+ #define	AR_UOWN		(1<<7)
+ 
+-q_t *invalid_dircache_entries;
++extern q_t *invalid_dircache_entries;
+ 
+ typedef int (*dir_loop)(struct dirent *, char *, void *);
+ 
