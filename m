From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Mar 2017 15:50:10 +0200
Subject: [Buildroot] [git commit] package/gdb: use macro to extract Xtensa
	overlay
Message-ID: <20170326135524.A35F3819C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b0cd0b907dd1142ab048223402470772d882622b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/gdb.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 0e4d384..13b1ab2 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -46,7 +46,7 @@ HOST_GDB_INSTALL_OPTS += MAKEINFO=true install
 # Apply the Xtensa specific patches
 ifneq ($(ARCH_XTENSA_CORE_NAME),)
 define GDB_XTENSA_PRE_PATCH
-	tar xf $(ARCH_XTENSA_OVERLAY_TAR) -C $(@D) --strip-components=1 gdb
+	$(call arch-xtensa-overlay-extract,$(@D),gdb)
 endef
 GDB_PRE_PATCH_HOOKS += GDB_XTENSA_PRE_PATCH
 HOST_GDB_PRE_PATCH_HOOKS += GDB_XTENSA_PRE_PATCH
