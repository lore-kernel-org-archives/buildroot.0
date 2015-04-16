From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Apr 2015 07:48:15 +0200
Subject: [Buildroot] [git commit] samba4: bump to version 4.2.1
Message-ID: <20150416055852.A460180454@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6ec8adc134145922354a4dbe815a669003e052f8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/samba4/Config.in   |    2 +-
 package/samba4/samba4.hash |    2 +-
 package/samba4/samba4.mk   |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/Config.in b/package/samba4/Config.in
index 5a83ab8..57adadd 100644
--- a/package/samba4/Config.in
+++ b/package/samba4/Config.in
@@ -4,7 +4,7 @@ comment "samba4 needs an (e)glibc toolchain"
 config BR2_PACKAGE_SAMBA4
 	bool "samba4"
 	depends on !BR2_PACKAGE_SAMBA
-	depends on BR2_TOOLCHAIN_USES_GLIBC # needs nss.h, $ORIGIN support
+	depends on BR2_TOOLCHAIN_USES_GLIBC # needs $ORIGIN support
 	depends on !BR2_nios2 # binary too large, relocations don't fit
 	select BR2_PACKAGE_E2FSPROGS
 	select BR2_PACKAGE_POPT
diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 3dbea5a..42bfb93 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	66a6057815a971fee64fbe936ff6cbad542421a4bd52cba8d8d41afc9abc490f	samba-4.2.0.tar.gz
+sha256	37eaa239c116dc2c22c29c5a2931eb178ed22e48b594687247446703119b4ac3	samba-4.2.1.tar.gz
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 78d92ef..e5971fb 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.2.0
+SAMBA4_VERSION = 4.2.1
 SAMBA4_SITE = http://ftp.samba.org/pub/samba
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
