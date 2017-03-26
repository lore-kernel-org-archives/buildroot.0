From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Mar 2017 15:49:28 +0200
Subject: [Buildroot] [git commit] package/gdb: use the Xtensa variables
Message-ID: <20170326135524.67DE0819C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0a4ecbbf7a9f989e8c0808caf5156420d5f0c938
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

... instead of re-computing them over-and-over-again.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/gdb.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index d829990..0e4d384 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -44,11 +44,9 @@ HOST_GDB_MAKE_OPTS += MAKEINFO=true
 HOST_GDB_INSTALL_OPTS += MAKEINFO=true install
 
 # Apply the Xtensa specific patches
-XTENSA_CORE_NAME = $(call qstrip, $(BR2_XTENSA_CORE_NAME))
-ifneq ($(XTENSA_CORE_NAME),)
+ifneq ($(ARCH_XTENSA_CORE_NAME),)
 define GDB_XTENSA_PRE_PATCH
-	tar xf $(BR2_XTENSA_OVERLAY_DIR)/xtensa_$(XTENSA_CORE_NAME).tar \
-		-C $(@D) --strip-components=1 gdb
+	tar xf $(ARCH_XTENSA_OVERLAY_TAR) -C $(@D) --strip-components=1 gdb
 endef
 GDB_PRE_PATCH_HOOKS += GDB_XTENSA_PRE_PATCH
 HOST_GDB_PRE_PATCH_HOOKS += GDB_XTENSA_PRE_PATCH
