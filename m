From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Dec 2019 13:50:10 +0100
Subject: [Buildroot] [git commit] package/binutils: switch to use 2.32 as
 the default version
Message-ID: <20191202134425.5744883933@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cac5d01ce6a7a3ac6811632b9e29ecdf864a5edd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that binutils 2.33.1 has been released, it is time to move to
binutils 2.32 as the default binutils version, instead of 2.31.1.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/binutils/Config.in.host | 2 +-
 package/binutils/binutils.mk    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index cf2542a8c6..b63f63d962 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -7,7 +7,7 @@ config BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI
 
 choice
 	prompt "Binutils Version"
-	default BR2_BINUTILS_VERSION_2_31_X if !BR2_arc && !BR2_csky
+	default BR2_BINUTILS_VERSION_2_32_X if !BR2_arc && !BR2_csky
 	default BR2_BINUTILS_VERSION_ARC if BR2_arc
 	default BR2_BINUTILS_VERSION_CSKY if BR2_csky
 	help
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index f492be8383..a19d6940f7 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -11,7 +11,7 @@ ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
 BINUTILS_VERSION = arc-2019.09-rc1
 else
-BINUTILS_VERSION = 2.31.1
+BINUTILS_VERSION = 2.32
 endif
 endif # BINUTILS_VERSION
 
