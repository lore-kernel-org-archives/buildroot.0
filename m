From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Mar 2016 23:08:00 +0100
Subject: [Buildroot] [git commit] binutils: switch to version 2.25 by default
Message-ID: <20160310220856.27A9781819@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5eb37d6adcfef996f1cd71effec8c2af42c0aed3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

binutils 2.26 has been released, it is time to switch to 2.25 as the
default version.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/binutils/Config.in.host | 2 +-
 package/binutils/binutils.mk    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index a532283..e42918e 100644
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
 
