From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 18 Jul 2010 21:30:15 +0200
Subject: [Buildroot] [git commit master 1/1] busybox: 1.17.0 dos2unix fix
Message-ID: <20100718200736.19F9D82BA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=12659c117653623204067288bddc003616de39eb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../busybox-1.17.0/busybox-1.17.0-dos2unix.patch   |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 package/busybox/busybox-1.17.0/busybox-1.17.0-dos2unix.patch

diff --git a/package/busybox/busybox-1.17.0/busybox-1.17.0-dos2unix.patch b/package/busybox/busybox-1.17.0/busybox-1.17.0-dos2unix.patch
new file mode 100644
index 0000000..dde59e0
--- /dev/null
+++ b/package/busybox/busybox-1.17.0/busybox-1.17.0-dos2unix.patch
@@ -0,0 +1,12 @@
+diff -urpN busybox-1.17.0/coreutils/dos2unix.c busybox-1.17.0-dos2unix/coreutils/dos2unix.c
+--- busybox-1.17.0/coreutils/dos2unix.c	2010-06-24 04:40:43.000000000 +0200
++++ busybox-1.17.0-dos2unix/coreutils/dos2unix.c	2010-07-17 22:40:21.021422169 +0200
+@@ -92,7 +92,7 @@ int dos2unix_main(int argc UNUSED_PARAM,
+ 	do {
+ 		/* might be convert(NULL) if there is no filename given */
+ 		convert(*argv, conv_type);
+-	} while (*++argv);
++	} while (*argv && *++argv);
+ 
+ 	return 0;
+ }
-- 
1.7.1
