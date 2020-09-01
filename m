From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Sep 2020 20:41:40 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/pkg-kconfig:
 quote HOSTCC_NOCCACHE
Message-ID: <20200901183528.C693E875B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aadc2bb445a248e429c16f39dccfc259564f16b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

HOSTCC may contain spaces, so needs to be quoted.

Most of the places where it is already quoted use double-quotes, so we
use that.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 94bb89ad578cbab1624af6492b25b74130500c29)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
