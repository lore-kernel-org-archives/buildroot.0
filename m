From: Romain Naour <romain.naour@gmail.com>
Date: Fri,  2 Oct 2020 17:57:51 +0200
Subject: [Buildroot] [PATCH 2/2] package/binutils: switch to use 2.34 as the
 default version
In-Reply-To: <20201002155751.1529784-1-romain.naour@gmail.com>
References: <20201002155751.1529784-1-romain.naour@gmail.com>
Message-ID: <20201002155751.1529784-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that binutils 2.35.1 has been released, it is time to move to
binutils 2.34 as the default binutils version, instead of 2.33.1.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/binutils/Config.in.host | 2 +-
 package/binutils/binutils.mk    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 1154354aeb..728193ed01 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -7,7 +7,7 @@ config BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI
 
 choice
 	prompt "Binutils Version"
-	default BR2_BINUTILS_VERSION_2_33_X if !BR2_arc && !BR2_csky
+	default BR2_BINUTILS_VERSION_2_34_X if !BR2_arc && !BR2_csky
 	default BR2_BINUTILS_VERSION_ARC if BR2_arc
 	default BR2_BINUTILS_VERSION_CSKY if BR2_csky
 	help
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 326e6e2639..461bc2b838 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -11,7 +11,7 @@ ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
 BINUTILS_VERSION = arc-2020.03-release
 else
-BINUTILS_VERSION = 2.33.1
+BINUTILS_VERSION = 2.34
 endif
 endif # BINUTILS_VERSION
 
-- 
2.25.4
