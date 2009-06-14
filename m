From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 14 Jun 2009 20:12:40 +0200
Subject: [Buildroot] [git commit] busybox: 1.14.1 ash fix
Message-ID: <20090615112814.47C6B77425@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=56d63b6193954320fac13e10d3981fd385ec3245
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/busybox-1.14.1-ash.patch |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 package/busybox/busybox-1.14.1-ash.patch

diff --git a/package/busybox/busybox-1.14.1-ash.patch b/package/busybox/busybox-1.14.1-ash.patch
new file mode 100644
index 0000000..eee0542
--- /dev/null
+++ b/package/busybox/busybox-1.14.1-ash.patch
@@ -0,0 +1,13 @@
+diff -urpN busybox-1.14.1/shell/ash.c busybox-1.14.1-ash/shell/ash.c
+--- busybox-1.14.1/shell/ash.c	2009-05-27 18:00:23.000000000 +0200
++++ busybox-1.14.1-ash/shell/ash.c	2009-06-14 19:44:24.000000000 +0200
+@@ -11909,7 +11909,8 @@ find_dot_file(char *name)
+ 			 */
+ 			return fullname;
+ 		}
+-		stunalloc(fullname);
++		if (fullname != name)
++			stunalloc(fullname);
+ 	}
+ 
+ 	/* not found in the PATH */
-- 
1.6.0.6
