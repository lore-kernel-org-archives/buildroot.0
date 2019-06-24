From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Jun 2019 21:51:44 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/lmbench: install
 the lmbench script on the target
Message-ID: <20190624195256.D6FD58270B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=77c2189b9738160acb701e5059f740773771995b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

We want to install the lmbench script along with the other executables,
so we add it to the appropriate list.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1956fbe5a4735dfeb4f448f022f42e32c018dca8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...kefile-add-lmbench-to-list-of-executables.patch | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/lmbench/0002-src-Makefile-add-lmbench-to-list-of-executables.patch b/package/lmbench/0002-src-Makefile-add-lmbench-to-list-of-executables.patch
new file mode 100644
index 0000000000..f5067a6b08
--- /dev/null
+++ b/package/lmbench/0002-src-Makefile-add-lmbench-to-list-of-executables.patch
@@ -0,0 +1,29 @@
+From c158a02561c64d0cd236f86db24cc20d0378eb72 Mon Sep 17 00:00:00 2001
+From: Markus Mayer <mmayer@broadcom.com>
+Date: Thu, 13 Jun 2019 12:28:54 -0700
+Subject: [PATCH] src/Makefile: add lmbench to list of executables
+
+We want to install the lmbench script along with the other executables,
+so we add it to the appropriate list.
+
+Signed-off-by: Markus Mayer <mmayer@broadcom.com>
+---
+ src/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index 4962815b5fe7..70dbc6794898 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -98,7 +98,7 @@ EXES =	$O/bw_file_rd $O/bw_mem $O/bw_mmap_rd $O/bw_pipe $O/bw_tcp 	\
+ 	$O/lat_select $O/lat_pipe $O/lat_rpc $O/lat_syscall $O/lat_tcp	\
+ 	$O/lat_udp $O/lat_mmap $O/mhz $O/lat_proc $O/lat_pagefault	\
+ 	$O/lat_connect $O/lat_fs $O/lat_sig $O/lat_mem_rd $O/lat_ctx	\
+-	$O/lat_sem 							\
++	$O/lat_sem $O/lmbench						\
+ 	$O/memsize $O/lat_unix $O/lmdd $O/timing_o $O/enough		\
+ 	$O/msleep $O/loop_o $O/lat_fifo $O/lmhttp $O/lat_http		\
+ 	$O/lat_fcntl $O/disk $O/lat_unix_connect $O/flushdisk		\
+-- 
+2.17.1
+
