From: Clark Rawlins <clark.rawlins@escient.com>
Date: Sat, 02 Jan 2010 17:46:16 -0500
Subject: [Buildroot] [PATCH] Permit building grub with an external toolchain.
Message-ID: <1262472376.23927.19.camel@venture>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Grub build failed at the link stage because it
couldn't find libcurses. Adding these variable
invocations to the configure line make it work.

Signed-off-by: Clark Rawlins <clark.rawlins@escient.com>
---
 target/x86/grub/grub.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/target/x86/grub/grub.mk b/target/x86/grub/grub.mk
index af46244..21f089f 100644
--- a/target/x86/grub/grub.mk
+++ b/target/x86/grub/grub.mk
@@ -81,6 +81,8 @@ $(GRUB_DIR)/.unpacked: $(DL_DIR)/$(GRUB_SOURCE) $(DL_DIR)/$(GRUB_PATCH)
 $(GRUB_DIR)/.configured: $(GRUB_DIR)/.unpacked
 	(cd $(GRUB_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
+		$(TARGET_CONFIGURE_ENV) \
 		CFLAGS="$(TARGET_CFLAGS)" \
 		CPPFLAGS="$(GRUB_CFLAGS)" \
 		./configure $(QUIET) \
-- 
1.6.3.3
