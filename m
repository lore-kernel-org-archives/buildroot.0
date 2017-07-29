From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Jul 2017 15:09:05 +0200
Subject: [Buildroot] [PATCH 3/4] binutils: switch to use 2.28.x as the
	default version
In-Reply-To: <20170729130906.2140-1-thomas.petazzoni@free-electrons.com>
References: <20170729130906.2140-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170729130906.2140-4-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that binutils 2.29 has been released, it is time to move to
binutils 2.28.x as the default binutils version, instead of 2.27.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/Config.in.host | 3 +--
 package/binutils/binutils.mk    | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 0840e8a..ef6aadb 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -2,8 +2,7 @@ comment "Binutils Options"
 
 choice
 	prompt "Binutils Version"
-	default BR2_BINUTILS_VERSION_2_27_X
-	default BR2_BINUTILS_VERSION_2_28_X if (BR2_arm && !BR2_USE_MMU)
+	default BR2_BINUTILS_VERSION_2_28_X
 	depends on !BR2_arc
 	help
 	  Select the version of binutils you wish to use.
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 2e09ba7..768f084 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -11,7 +11,7 @@ ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
 BINUTILS_VERSION = arc-2017.03
 else
-BINUTILS_VERSION = 2.27
+BINUTILS_VERSION = 2.28.1
 endif
 endif # BINUTILS_VERSION
 
-- 
2.9.4
