From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 May 2019 23:00:42 +0200
Subject: [Buildroot] [git commit branch/next] package/linux-headers:
 restrict versions available on C-SKY
Message-ID: <20190531210133.F0116811FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac652bef62bb806cd46a0185056e81db76548d02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The C-SKY architecture was merged in the upstream Linux kernel
4.20. Therefore, kernel headers from a Linux version earlier than that
cannot be used to build a C-SKY toolchain.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-headers/Config.in.host | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 2042702eb9..2945bbf09e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -29,20 +29,24 @@ config BR2_KERNEL_HEADERS_AS_KERNEL
 config BR2_KERNEL_HEADERS_4_4
 	bool "Linux 4.4.x kernel headers"
 	depends on !BR2_riscv
+	depends on !BR2_csky
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
 
 config BR2_KERNEL_HEADERS_4_9
 	bool "Linux 4.9.x kernel headers"
 	depends on !BR2_riscv
+	depends on !BR2_csky
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 
 config BR2_KERNEL_HEADERS_4_14
 	bool "Linux 4.14.x kernel headers"
 	depends on !BR2_riscv
+	depends on !BR2_csky
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
 
 config BR2_KERNEL_HEADERS_4_19
 	bool "Linux 4.19.x kernel headers"
+	depends on !BR2_csky
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 
 config BR2_KERNEL_HEADERS_5_0
