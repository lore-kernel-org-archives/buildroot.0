From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Mar 2017 15:50:27 +0200
Subject: [Buildroot] [git commit] package/gdb: extract Xtensa overlay as
	post-extract hook
Message-ID: <20170326135524.CA4E3803EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8ac4d34e510b4d653be1680b811a3963f1f8d7c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

... like it is done for gcc.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/gdb.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 13b1ab2..1cb1776 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -45,11 +45,11 @@ HOST_GDB_INSTALL_OPTS += MAKEINFO=true install
 
 # Apply the Xtensa specific patches
 ifneq ($(ARCH_XTENSA_CORE_NAME),)
-define GDB_XTENSA_PRE_PATCH
+define GDB_XTENSA_OVERLAY_EXTRACT
 	$(call arch-xtensa-overlay-extract,$(@D),gdb)
 endef
-GDB_PRE_PATCH_HOOKS += GDB_XTENSA_PRE_PATCH
-HOST_GDB_PRE_PATCH_HOOKS += GDB_XTENSA_PRE_PATCH
+GDB_POST_EXTRACT_HOOKS += GDB_XTENSA_OVERLAY_EXTRACT
+HOST_GDB_POST_EXTRACT_HOOKS += GDB_XTENSA_OVERLAY_EXTRACT
 endif
 
 ifeq ($(GDB_FROM_GIT),y)
