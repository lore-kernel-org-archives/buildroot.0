From: Markus Mayer <mmayer@broadcom.com>
Date: Wed, 12 Jun 2019 16:39:34 -0700
Subject: [Buildroot] [PATCH 2/2] lmbench: install the lmbench script on the
 target
In-Reply-To: <20190612233934.14805-1-mmayer@broadcom.com>
References: <20190612233934.14805-1-mmayer@broadcom.com>
Message-ID: <20190612233934.14805-3-mmayer@broadcom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lmbench seems to be forgetting to install its main script when "make
install" is being performed. Rectify this by adding lmbench to the list
of executables.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---
 package/lmbench/0002-install_lmbench.patch | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 package/lmbench/0002-install_lmbench.patch

diff --git a/package/lmbench/0002-install_lmbench.patch b/package/lmbench/0002-install_lmbench.patch
new file mode 100644
index 000000000000..7397ea7e3a33
--- /dev/null
+++ b/package/lmbench/0002-install_lmbench.patch
@@ -0,0 +1,11 @@
+--- lmbench-3.0-a9/src/Makefile.orig	2007-04-10 05:16:49.000000000 -0700
++++ lmbench-3.0-a9/src/Makefile	2019-06-12 16:11:49.955136809 -0700
+@@ -98,7 +98,7 @@
+ 	$O/lat_select $O/lat_pipe $O/lat_rpc $O/lat_syscall $O/lat_tcp	\
+ 	$O/lat_udp $O/lat_mmap $O/mhz $O/lat_proc $O/lat_pagefault	\
+ 	$O/lat_connect $O/lat_fs $O/lat_sig $O/lat_mem_rd $O/lat_ctx	\
+-	$O/lat_sem 							\
++	$O/lat_sem $O/lmbench						\
+ 	$O/memsize $O/lat_unix $O/lmdd $O/timing_o $O/enough		\
+ 	$O/msleep $O/loop_o $O/lat_fifo $O/lmhttp $O/lat_http		\
+ 	$O/lat_fcntl $O/disk $O/lat_unix_connect $O/flushdisk		\
-- 
2.17.1
