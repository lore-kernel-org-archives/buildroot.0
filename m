From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 15 Sep 2009 08:50:12 +0200
Subject: [Buildroot] [git commit master] DNS resolv problem with glibc
Message-ID: <20090915065045.DF51B7776C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b96253a63e67e45d015e249473765953044004d2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix problem with dns resolv, by copying the libnss_dns.so to the rootfs.

Using glibc from external toolchain, name resolving does not work,
unless libnss_dns.so is available on the target.

Signed-off-by: Anders Darander <ad@datarespons.se>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/external-toolchain/ext-tool.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/external-toolchain/ext-tool.mk b/toolchain/external-toolchain/ext-tool.mk
index 568ac3a..1f5aa19 100644
--- a/toolchain/external-toolchain/ext-tool.mk
+++ b/toolchain/external-toolchain/ext-tool.mk
@@ -198,7 +198,7 @@ EXTERNAL_LIBS=libc.so libcrypt.so libdl.so libgcc_s.so libm.so libnsl.so libpthr
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
 EXTERNAL_LIBS+=ld-uClibc.so
 else
-EXTERNAL_LIBS+=ld-linux.so libnss_files.so
+EXTERNAL_LIBS+=ld-linux.so libnss_files.so libnss_dns.so
 endif
 
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
-- 
1.6.3.3
