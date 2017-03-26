From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Mar 2017 15:50:17 +0200
Subject: [Buildroot] [git commit] package/gcc: use macro to extract Xtensa
	overlay
Message-ID: <20170326135524.B0059819C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2b34da9b9d900881441f3ffb31a713f10ff40033
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index e50e1e0..b52f945 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -25,7 +25,7 @@ endif
 # Xtensa special hook
 #
 define HOST_GCC_XTENSA_OVERLAY_EXTRACT
-	tar xf $(ARCH_XTENSA_OVERLAY_TAR) -C $(@D) --strip-components=1 gcc
+	$(call arch-xtensa-overlay-extract,$(@D),gcc)
 endef
 
 #
