From: guoren at kernel.org <guoren@kernel.org>
Date: Sun,  2 Jun 2019 17:41:50 +0800
Subject: [Buildroot] [PATCH V5 2/2] board/qemu/csky/readme.txt: Add C-SKY
 Qemu run Documentation
In-Reply-To: <1559468510-22085-1-git-send-email-guoren@kernel.org>
References: <1559468510-22085-1-git-send-email-guoren@kernel.org>
Message-ID: <1559468510-22085-2-git-send-email-guoren@kernel.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Guo Ren <ren_guo@c-sky.com>

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Cc: Liu Zhiwei <zhiwei_liu@c-sky.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/qemu/csky/readme.txt | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 board/qemu/csky/readme.txt

diff --git a/board/qemu/csky/readme.txt b/board/qemu/csky/readme.txt
new file mode 100644
index 0000000..c36c755d
--- /dev/null
+++ b/board/qemu/csky/readme.txt
@@ -0,0 +1,16 @@
+Run with qemu:
+
+ wget https://gitlab.com/c-sky/buildroot/-/jobs/197192514/artifacts/raw/output/images/csky_toolchain_csky_860_fpga_4.9_glibc_br_defconfig_56683a5a67ecf1dd0e67b05b9541de74530d0047.tar.xz;
+ mkdir tools;
+ tar -Jxf csky_toolchain_csky_860_fpga_4.9_glibc_br_defconfig_56683a5a67ecf1dd0e67b05b9541de74530d0047.tar.xz -C tools;
+ LD_LIBRARY_PATH=./tools/lib ./tools/csky-qemu/bin/qemu-system-cskyv2 -M virt -cpu ck860 -smp 2 -kernel output/images/vmlinux -nographic;
+
+For ck810/ck807:
+ LD_LIBRARY_PATH=./tools/lib ./tools/csky-qemu/bin/qemu-system-cskyv2 -M virt -kernel output/images/vmlinux -nographic;
+
+For ck610:
+ LD_LIBRARY_PATH=./tools/lib ./tools/csky-qemu/bin/qemu-system-cskyv1 -M virt -kernel output/images/vmlinux -nographic;
+
+The login prompt will appear in the terminal that started Qemu. Username is root and no password.
+
+Tested with QEMU 3.0 in https://gitlab.com/guoren83/qemu, C-SKY qemu upstream is on its way.
-- 
2.7.4
