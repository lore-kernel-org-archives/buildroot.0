From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 Dec 2020 10:57:09 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/ti-sgx-demos: use
 KMS-based demos
Message-ID: <20201221124815.3D9CE83E72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e407761975a9458e2572bd27c71d3184c7f46ad3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Weston does not work with the ti-sgx SDK, so switch to using the
KMS-based demos.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
[yann.morin.1998 at free.fr: split off into its own patch]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 29ff603f0845d505c0c331efdccf03cfccfbea42)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ti-sgx-demos/ti-sgx-demos.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ti-sgx-demos/ti-sgx-demos.mk b/package/ti-sgx-demos/ti-sgx-demos.mk
index 8599e88e9b..ea6c6c6b08 100644
--- a/package/ti-sgx-demos/ti-sgx-demos.mk
+++ b/package/ti-sgx-demos/ti-sgx-demos.mk
@@ -12,7 +12,7 @@ TI_SGX_DEMOS_LICENSE = Imagination Technologies License Agreement
 TI_SGX_DEMOS_LICENSE_FILES = LegalNotice.txt
 
 define TI_SGX_DEMOS_INSTALL_TARGET_CMDS
-	cp -dpfr $(@D)/targetfs/arm/Examples/Advanced/Wayland/OGLES* \
+	cp -dpfr $(@D)/targetfs/arm/Examples/Advanced/NullWS/OGLES* \
 		$(TARGET_DIR)/usr/bin/
 endef
 
