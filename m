From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Jul 2009 10:35:33 +0200
Subject: [Buildroot] [PATCH 6/8] external toolchain: copy the C++ standard
	library if needed
In-Reply-To: <cover.1247819731.git.thomas.petazzoni@free-electrons.com>
References: <cover.1247819731.git.thomas.petazzoni@free-electrons.com>
Message-ID: <28aa0b47fb5bcb46ddcc24fdb5cc5466c094024f.1247819731.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
1.6.0.4
