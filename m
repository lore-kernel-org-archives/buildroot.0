From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 23 Oct 2010 14:53:08 +0200
Subject: [Buildroot] [git commit master 1/1] busybox: 1.17.3 sort fix
Message-ID: <20101023143216.33E1A8D3C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6644da4087264e51136854b65c2b153ceac5fd07
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../busybox-1.17.3/busybox-1.17.3-sort.patch       |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 package/busybox/busybox-1.17.3/busybox-1.17.3-sort.patch

diff --git a/package/busybox/busybox-1.17.3/busybox-1.17.3-sort.patch b/package/busybox/busybox-1.17.3/busybox-1.17.3-sort.patch
new file mode 100644
index 0000000..ebc9bf9
--- /dev/null
+++ b/package/busybox/busybox-1.17.3/busybox-1.17.3-sort.patch
@@ -0,0 +1,12 @@
+diff -urpN busybox-1.17.3/coreutils/sort.c busybox-1.17.3-sort/coreutils/sort.c
+--- busybox-1.17.3/coreutils/sort.c	2010-10-09 21:57:13.000000000 +0200
++++ busybox-1.17.3-sort/coreutils/sort.c	2010-10-20 15:17:35.320293543 +0200
+@@ -412,7 +412,7 @@ int sort_main(int argc UNUSED_PARAM, cha
+ #if ENABLE_FEATURE_SORT_BIG
+ 	/* Open output file _after_ we read all input ones */
+ 	if (option_mask32 & FLAG_o)
+-		xmove_fd(xopen3(str_o, O_WRONLY, 0666), STDOUT_FILENO);
++		xmove_fd(xopen3(str_o, O_WRONLY|O_CREAT|O_TRUNC, 0666), STDOUT_FILENO);
+ #endif
+ 	flag = (option_mask32 & FLAG_z) ? '\0' : '\n';
+ 	for (i = 0; i < linecount; i++)
-- 
1.7.1
