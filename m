From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Nov 2011 09:55:54 +0100
Subject: [Buildroot] [PATCH 1/3] gdb: do not allow native gdb on SuperH
	architecture
In-Reply-To: <cover.1321174528.git.thomas.petazzoni@free-electrons.com>
References: <cover.1321174528.git.thomas.petazzoni@free-electrons.com>
Message-ID: <580ee5a2e102380760ba80bc4f1c9601352046ef.1321174528.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The gdb debugger does not have support for running as the native
debugger on the SuperH architecture:

 configure: error: "*** Gdb does not support native target sh4-unknown-linux-gnu"

See also http://lists.debian.org/debian-superh/2010/04/msg00000.html.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/gdb/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/toolchain/gdb/Config.in b/toolchain/gdb/Config.in
index e593698..af6e56a 100644
--- a/toolchain/gdb/Config.in
+++ b/toolchain/gdb/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_GDB
 	bool "Build gdb debugger for the Target"
 	select BR2_PACKAGE_NCURSES
 	depends on BR2_USE_WCHAR
+	depends on !BR2_sh && !BR2_sh64
 	help
 	    Build the full gdb debugger to run on the target.
 
-- 
1.7.4.1
