From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Nov 2011 09:55:56 +0100
Subject: [Buildroot] [PATCH 3/3] target gdb: depend on thread support
In-Reply-To: <cover.1321174528.git.thomas.petazzoni@free-electrons.com>
References: <cover.1321174528.git.thomas.petazzoni@free-electrons.com>
Message-ID: <849ed290aaa79818217390097fda68699ab0cae0.1321174528.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Compiling gdb for the target requires thread support in the C library,
otherwise:

/home/test/outputs/test-888/toolchain/gdb-7.3.1/gdb/gdb_thread_db.h:37:21: fatal error: pthread.h: No such file or directory

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/gdb/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/toolchain/gdb/Config.in b/toolchain/gdb/Config.in
index af6e56a..8a02255 100644
--- a/toolchain/gdb/Config.in
+++ b/toolchain/gdb/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_GDB
 	bool "Build gdb debugger for the Target"
 	select BR2_PACKAGE_NCURSES
 	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_sh && !BR2_sh64
 	help
 	    Build the full gdb debugger to run on the target.
-- 
1.7.4.1
