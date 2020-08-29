From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Aug 2020 22:42:52 +0200
Subject: [Buildroot] [PATCH] infra/kconfig-package: quote HOSTCC_NOCCACHE
Message-ID: <20200829204252.31225-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

HOSTCC may contain spaces, so needs to be quoted.

Most of the places hwere it is already quoted use double-quotes, so we
use that.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-kconfig.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 45faf50e71..2aecf2e203 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -28,7 +28,7 @@ define kconfig-package-update-config
 endef
 
 PKG_KCONFIG_COMMON_OPTS = \
-	HOSTCC=$(HOSTCC_NOCCACHE)
+	HOSTCC="$(HOSTCC_NOCCACHE)"
 
 # Macro to save the defconfig file
 # $(1): the name of the package in upper-case letters
-- 
2.20.1
