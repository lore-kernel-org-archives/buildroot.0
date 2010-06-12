From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Jun 2010 16:22:06 +0200
Subject: [Buildroot] [PATCH 32/49] nasm: new package, needed for syslinux
In-Reply-To: <cover.1276352307.git.thomas.petazzoni@free-electrons.com>
References: <cover.1276352307.git.thomas.petazzoni@free-electrons.com>
Message-ID: <da8d09b716a7dea65697efcadd1067d5e9b4f7f7.1276352309.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nasm/nasm.mk |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 package/nasm/nasm.mk

diff --git a/package/nasm/nasm.mk b/package/nasm/nasm.mk
new file mode 100644
index 0000000..08983e1
--- /dev/null
+++ b/package/nasm/nasm.mk
@@ -0,0 +1,19 @@
+############################################################
+#
+# nasm
+#
+# This is special case: nasm is used to build syslinux and
+# pxelinux. As these are for the target, we should cross-compile
+# nasm. However, as nasm is x86-only, there's no point in
+# cross-compiling it. So we just build it for the host. The target
+# variant is only provided because of a bug in the package
+# infrastructure that prevents having only a host variant.
+############################################################
+
+NASM_VERSION=2.08.01
+NASM_SOURCE=nasm-$(NASM_VERSION).tar.bz2
+NASM_SITE=http://www.nasm.us/pub/nasm/releasebuilds/2.08.01/
+NASM_LIBTOOL_PATCH=NO
+
+$(eval $(call AUTOTARGETS,package,nasm))
+$(eval $(call AUTOTARGETS,package,nasm,host))
-- 
1.7.0.4
