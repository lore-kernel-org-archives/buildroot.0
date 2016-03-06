From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Mar 2016 16:06:23 +0100
Subject: [Buildroot] [PATCH 2/2] binutils: switch to version 2.25 by default
In-Reply-To: <1457276783-27985-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1457276783-27985-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1457276783-27985-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

binutils 2.26 has been released, it is time to switch to 2.25 as the
default version.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/Config.in.host | 2 +-
 package/binutils/binutils.mk    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index b5b0154..b1389fe 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -3,7 +3,7 @@ comment "Binutils Options"
 choice
 	prompt "Binutils Version"
 	depends on !BR2_arc
-	default BR2_BINUTILS_VERSION_2_24_X
+	default BR2_BINUTILS_VERSION_2_25_X
 	help
 	  Select the version of binutils you wish to use.
 
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 0f75c1d..a40fdb7 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -11,7 +11,7 @@ ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
 BINUTILS_VERSION = arc-2015.12
 else
-BINUTILS_VERSION = 2.24
+BINUTILS_VERSION = 2.25
 endif
 endif # BINUTILS_VERSION
 
-- 
2.6.4
