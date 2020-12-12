From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Dec 2020 23:01:24 +0100
Subject: [Buildroot] [PATCH 2/4 v3] package/ti-sgx-demos: use KMS-based demos
In-Reply-To: <cover.1607810474.git.yann.morin.1998@free.fr>
References: <cover.1607810474.git.yann.morin.1998@free.fr>
Message-ID: <40c318c363f0075a22291f650d301709a35ebdb3.1607810474.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Weston does not work with the ti-sgx SDK, so switch to using the
KMS-based demos.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
[yann.morin.1998 at free.fr: split off into its own patch]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
 
-- 
2.25.1
