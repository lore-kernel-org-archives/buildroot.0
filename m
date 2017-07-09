From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Jul 2017 15:42:26 +0200
Subject: [Buildroot] [git commit] arch/xtensa: accept the overlay to be
	compressed
Message-ID: <20170709151526.7B1C681F7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0645fb80843e45ecc3843f5013801233f37e77eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/arch.mk.xtensa | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arch.mk.xtensa b/arch/arch.mk.xtensa
index 6d9fd63..ecb9c10 100644
--- a/arch/arch.mk.xtensa
+++ b/arch/arch.mk.xtensa
@@ -21,5 +21,7 @@ ARCH_XTENSA_OVERLAY_FILE = $(call qstrip,$(BR2_XTENSA_OVERLAY_FILE))
 #   $(call arch-xtensa-overlay-extract,/path/to/overlay.tar,$(@D),gcc)
 ################################################################################
 define arch-xtensa-overlay-extract
-	tar xf $(ARCH_XTENSA_OVERLAY_FILE) -C $(1) --strip-components=1 $(2)
+	$(call suitable-extractor,$(ARCH_XTENSA_OVERLAY_FILE)) \
+		$(ARCH_XTENSA_OVERLAY_FILE) | \
+	$(TAR) --strip-components=1 -C $(1) $(TAR_OPTIONS) - $(2)
 endef
