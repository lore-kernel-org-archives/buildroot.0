From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 25 Jun 2020 14:13:01 +0200
Subject: [Buildroot] [PATCH 2/3] package/binutils: switch to use 2.33.1 as
 the default version
In-Reply-To: <20200625121302.2286527-1-romain.naour@gmail.com>
References: <20200625121302.2286527-1-romain.naour@gmail.com>
Message-ID: <20200625121302.2286527-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that binutils 2.34 has been released, it is time to move to
binutils 2.33.1 as the default binutils version, instead of 2.32.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/binutils/Config.in.host | 2 +-
 package/binutils/binutils.mk    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index ab646eea26..dfe7d548f1 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -7,7 +7,7 @@ config BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI
 
 choice
 	prompt "Binutils Version"
-	default BR2_BINUTILS_VERSION_2_32_X if !BR2_arc && !BR2_csky
+	default BR2_BINUTILS_VERSION_2_33_X if !BR2_arc && !BR2_csky
 	default BR2_BINUTILS_VERSION_ARC if BR2_arc
 	default BR2_BINUTILS_VERSION_CSKY if BR2_csky
 	help
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 6e4687aeeb..326e6e2639 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -11,7 +11,7 @@ ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
 BINUTILS_VERSION = arc-2020.03-release
 else
-BINUTILS_VERSION = 2.32
+BINUTILS_VERSION = 2.33.1
 endif
 endif # BINUTILS_VERSION
 
-- 
2.25.4
