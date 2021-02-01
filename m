From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Feb 2021 18:26:48 +0100
Subject: [Buildroot] [git commit] package/binutils: switch to 2.35.x as the
 default version
Message-ID: <20210201170854.624088104C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb2143dcecfe67290808f2223d90a7b20cc47c2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that 2.36 has been released, let's use 2.35.x as the default
binutils version.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/binutils/Config.in.host | 2 +-
 package/binutils/binutils.mk    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 237aafc136..d857c485d3 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -7,7 +7,7 @@ config BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI
 
 choice
 	prompt "Binutils Version"
-	default BR2_BINUTILS_VERSION_2_34_X if !BR2_arc && !BR2_csky
+	default BR2_BINUTILS_VERSION_2_35_X if !BR2_arc && !BR2_csky
 	default BR2_BINUTILS_VERSION_ARC if BR2_arc
 	default BR2_BINUTILS_VERSION_CSKY if BR2_csky
 	help
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index aff7f4ba86..e469febbb4 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -11,7 +11,7 @@ ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
 BINUTILS_VERSION = arc-2020.09-release
 else
-BINUTILS_VERSION = 2.34
+BINUTILS_VERSION = 2.35.2
 endif
 endif # BINUTILS_VERSION
 
