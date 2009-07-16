From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Jul 2009 00:26:23 +0200
Subject: [Buildroot] [git commit] external toolchain: copy the C++ standard
	library if needed
Message-ID: <20090717205405.56010775BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=28aa0b47fb5bcb46ddcc24fdb5cc5466c094024f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Obey the BR2_INSTALL_LIBSTDCPP configuration option to copy the C++
standard library to the target. Suggested by Lionel Landwerlin
<lionel.landwerlin@openwide.fr>.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/external-toolchain/ext-tool.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/toolchain/external-toolchain/ext-tool.mk b/toolchain/external-toolchain/ext-tool.mk
index 6df48f0..e772cda 100644
--- a/toolchain/external-toolchain/ext-tool.mk
+++ b/toolchain/external-toolchain/ext-tool.mk
@@ -190,6 +190,10 @@ else
 EXTERNAL_LIBS+=ld-linux.so libnss_files.so
 endif
 
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+EXTERNAL_LIBS+=libstdc++.so
+endif
+
 SYSROOT_DIR=$(shell LANG=C $(TARGET_CC) -v 2>&1 | grep ^Configured | tr " " "\n" | grep -- "--with-sysroot" | cut -f2 -d=)
 
 $(STAMP_DIR)/ext-toolchain-installed:
-- 
1.6.3.3
