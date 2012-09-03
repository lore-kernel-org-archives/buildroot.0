From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 03 Sep 2012 20:05:35 -0000
Subject: [Buildroot] [git commit] yasm: minor fixes that should have been
	part the commit adding the package
Message-ID: <20120903200533.8B00F9953E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=54fe81fbb49d29a15945bdcf8e2c281bcb1969fd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/yasm/Config.in |    1 +
 package/yasm/yasm.mk   |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/yasm/Config.in b/package/yasm/Config.in
index bb1d417..2dc25aa 100644
--- a/package/yasm/Config.in
+++ b/package/yasm/Config.in
@@ -7,3 +7,4 @@ config BR2_PACKAGE_YASM
 	  and GAS assembler syntaxes and outputs binary, ELF32 and ELF64
 	  object formats.
 
+	  http://www.tortall.net/projects/yasm/
diff --git a/package/yasm/yasm.mk b/package/yasm/yasm.mk
index ac75d2b..fafd1ec 100644
--- a/package/yasm/yasm.mk
+++ b/package/yasm/yasm.mk
@@ -6,7 +6,6 @@
 YASM_VERSION = 1.2.0
 YASM_SOURCE = yasm-$(YASM_VERSION).tar.gz
 YASM_SITE = http://www.tortall.net/projects/yasm/releases/
-YASM_CONF_OPT = --disable-static
 
 define YASM_PRE_CONFIGURE_FIXUP
 # This sed prevents it compiling 2 programs (vsyasm and ytasm) 
@@ -15,6 +14,7 @@ define YASM_PRE_CONFIGURE_FIXUP
 endef
 
 YASM_PRE_CONFIGURE_HOOKS += YASM_PRE_CONFIGURE_FIXUP
+HOST_YASM_PRE_CONFIGURE_HOOKS += YASM_PRE_CONFIGURE_FIXUP
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
