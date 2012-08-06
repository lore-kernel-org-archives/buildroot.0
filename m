From: Sonic Zhang <sonic.adi@gmail.com>
Date: Mon, 6 Aug 2012 19:17:27 +0800
Subject: [Buildroot] [PATCH 3/3] buildroot: toolchain: Allow to build
	gdbserver when external toolchain is selected.
In-Reply-To: <1344251847-7709-1-git-send-email-sonic.adi@gmail.com>
References: <1344251847-7709-1-git-send-email-sonic.adi@gmail.com>
Message-ID: <1344251847-7709-3-git-send-email-sonic.adi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sonic Zhang <sonic.zhang@analog.com>

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
---
 toolchain/gdb/Config.in |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/toolchain/gdb/Config.in b/toolchain/gdb/Config.in
index fd6956b..8a440d8 100644
--- a/toolchain/gdb/Config.in
+++ b/toolchain/gdb/Config.in
@@ -14,14 +14,13 @@ comment "Gdb debugger for the target needs WCHAR support in toolchain"
 
 config BR2_PACKAGE_GDB_SERVER
 	bool "Build gdb server for the Target"
-	depends on !BR2_TOOLCHAIN_EXTERNAL
 	help
 	    Build the gdbserver stub to run on the target.
 	    A full gdb is needed to debug the progam.
 
 config BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
 	bool "Copy gdb server to the Target"
-	depends on BR2_TOOLCHAIN_EXTERNAL
+	depends on BR2_TOOLCHAIN_EXTERNAL && !BR2_PACKAGE_GDB_SERVER
 	help
 	  Copy the gdbserver provided by the external toolchain to the
 	  target.
-- 
1.7.0.4
