From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Oct 2020 21:50:27 +0200
Subject: [Buildroot] [git commit] package/binutils: switch to use 2.34 as
 the default version
Message-ID: <20201008193943.3C6B480359@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce916eaad1a67dcf7f1666ec9c60b341208d4566
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that binutils 2.35.1 has been released, it is time to move to
binutils 2.34 as the default binutils version, instead of 2.33.1.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 
