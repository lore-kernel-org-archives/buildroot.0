From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Jun 2019 20:28:05 +0200
Subject: [Buildroot] [git commit] package/gdb: disable for nds32
Message-ID: <20190617182724.2036A815E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=93173c614ef04c988e04647c653381727e2d3092
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is no support for nds32 in gdb.

Fixes:
  http://autobuild.buildroot.net/results/1a40b1ac5f06c856c2e30dbbb4e485022c438c72

Signed-off-by: Nylon Chen <nylon7@andestech.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gdb/Config.in      | 1 +
 package/gdb/Config.in.host | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index ab3d2157b6..6340bc49d5 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_GDB_ARCH_SUPPORTS
 	depends on !BR2_microblaze
 	depends on !BR2_nios2
 	depends on !BR2_or1k
+	depends on !BR2_nds32
 
 comment "gdb/gdbserver needs a toolchain w/ threads, threads debug"
 	depends on BR2_PACKAGE_GDB_ARCH_SUPPORTS
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 83ca8c8ff2..6c17ceb0b2 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -8,6 +8,7 @@ config BR2_PACKAGE_HOST_GDB_ARCH_SUPPORTS
 	depends on !BR2_nios2
 	depends on !BR2_or1k
 	depends on !BR2_riscv
+	depends on !BR2_nds32
 
 comment "Host GDB Options"
 	depends on !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
