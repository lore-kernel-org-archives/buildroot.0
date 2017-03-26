From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Mar 2017 15:50:22 +0200
Subject: [Buildroot] [git commit] package/binutils: extract Xtensa overlay
	as post-extract hook
Message-ID: <20170326135524.BC50E803EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a1aeddf25b461f549c8fb8315a82dc647696965b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

... like it is done for gcc.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/binutils.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 5ab346c..7dfe4db 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -122,11 +122,11 @@ endef
 endif
 
 ifneq ($(ARCH_XTENSA_CORE_NAME),)
-define BINUTILS_XTENSA_PRE_PATCH
+define BINUTILS_XTENSA_OVERLAY_EXTRACT
 	$(call arch-xtensa-overlay-extract,$(@D),binutils)
 endef
-BINUTILS_PRE_PATCH_HOOKS += BINUTILS_XTENSA_PRE_PATCH
-HOST_BINUTILS_PRE_PATCH_HOOKS += BINUTILS_XTENSA_PRE_PATCH
+BINUTILS_POST_EXTRACT_HOOKS += BINUTILS_XTENSA_OVERLAY_EXTRACT
+HOST_BINUTILS_POST_EXTRACT_HOOKS += BINUTILS_XTENSA_OVERLAY_EXTRACT
 endif
 
 ifeq ($(BR2_BINUTILS_ENABLE_LTO),y)
