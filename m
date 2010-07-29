From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 29 Jul 2010 23:47:44 +0200
Subject: [Buildroot] [git commit master 1/1] busybox: 1.17.1 mktemp fix
Message-ID: <20100729214845.5948E83697@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a10c15320803028a53e181dcb48f55e1a9d64051
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../busybox-1.17.1/busybox-1.17.1-mktemp.patch     |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 package/busybox/busybox-1.17.1/busybox-1.17.1-mktemp.patch

diff --git a/package/busybox/busybox-1.17.1/busybox-1.17.1-mktemp.patch b/package/busybox/busybox-1.17.1/busybox-1.17.1-mktemp.patch
new file mode 100644
index 0000000..557e337
--- /dev/null
+++ b/package/busybox/busybox-1.17.1/busybox-1.17.1-mktemp.patch
@@ -0,0 +1,12 @@
+diff -urpN busybox-1.17.1/debianutils/mktemp.c busybox-1.17.1-mktemp/debianutils/mktemp.c
+--- busybox-1.17.1/debianutils/mktemp.c	2010-07-25 00:12:56.000000000 +0200
++++ busybox-1.17.1-mktemp/debianutils/mktemp.c	2010-07-27 08:21:26.000000000 +0200
+@@ -50,7 +50,7 @@ int mktemp_main(int argc UNUSED_PARAM, c
+ 	opts = getopt32(argv, "dqtp:", &path);
+ 
+ 	chp = argv[optind] ? argv[optind] : xstrdup("tmp.XXXXXX");
+-	if (chp[0] != '/' || (opts & 8))
++	if (!strchr(chp, '/') || (opts & 8))
+ 		chp = concat_path_file(path, chp);
+ 
+ 	if (opts & 1) { /* -d */
-- 
1.7.1
