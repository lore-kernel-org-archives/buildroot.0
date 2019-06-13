From: Markus Mayer <mmayer@broadcom.com>
Date: Thu, 13 Jun 2019 12:50:47 -0700
Subject: [Buildroot] [PATCH v2 2/2] lmbench: install the lmbench script on
 the target
In-Reply-To: <20190613195047.24870-1-mmayer@broadcom.com>
References: <20190613195047.24870-1-mmayer@broadcom.com>
Message-ID: <20190613195047.24870-3-mmayer@broadcom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We want to install the lmbench script along with the other executables,
so we add it to the appropriate list.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---
 ...e-add-lmbench-to-list-of-executables.patch | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/lmbench/0002-src-Makefile-add-lmbench-to-list-of-executables.patch

diff --git a/package/lmbench/0002-src-Makefile-add-lmbench-to-list-of-executables.patch b/package/lmbench/0002-src-Makefile-add-lmbench-to-list-of-executables.patch
new file mode 100644
index 000000000000..5b8f44ae1d21
--- /dev/null
+++ b/package/lmbench/0002-src-Makefile-add-lmbench-to-list-of-executables.patch
@@ -0,0 +1,29 @@
+From c158a02561c64d0cd236f86db24cc20d0378eb72 Mon Sep 17 00:00:00 2001
+From: Markus Mayer <mmayer@broadcom.com>
+Date: Thu, 13 Jun 2019 12:28:54 -0700
+Subject: [PATCH 2/2] src/Makefile: add lmbench to list of executables
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
-- 
2.17.1
