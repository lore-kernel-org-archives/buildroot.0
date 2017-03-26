From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Mar 2017 15:50:06 +0200
Subject: [Buildroot] [git commit] package/binutils: use macro to extract
	Xtensa overlay
Message-ID: <20170326135524.960F982489@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=96f57fa5e43ee35478a7f0a5788624fc487db798
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/binutils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 914393e..5ab346c 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -123,7 +123,7 @@ endif
 
 ifneq ($(ARCH_XTENSA_CORE_NAME),)
 define BINUTILS_XTENSA_PRE_PATCH
-	tar xf $(ARCH_XTENSA_OVERLAY_TAR) -C $(@D) --strip-components=1 binutils
+	$(call arch-xtensa-overlay-extract,$(@D),binutils)
 endef
 BINUTILS_PRE_PATCH_HOOKS += BINUTILS_XTENSA_PRE_PATCH
 HOST_BINUTILS_PRE_PATCH_HOOKS += BINUTILS_XTENSA_PRE_PATCH
