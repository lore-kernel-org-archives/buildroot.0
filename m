From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Apr 2017 22:33:38 +0200
Subject: [Buildroot] [git commit] xenomai: native skin is now called alchemy
Message-ID: <20170420211016.B50F681F7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ef3392f2caa88ad5bd4beed8a2bd4b1c8d932abf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the introduction of Xenomai 3, the native skin is dubbed Alchemy.
Update the config menu (but leave the symbol name to avoid hurting existing
users needlessly) and fix the unselected-skin cleanup code.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xenomai/Config.in  | 5 +++--
 package/xenomai/xenomai.mk | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index 8acf579..e633896 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -113,10 +113,11 @@ config BR2_PACKAGE_XENOMAI_ANALOGY
 	  and libraries
 
 config BR2_PACKAGE_XENOMAI_NATIVE_SKIN
-	bool "Native skin library"
+	bool "Alchemy (native) skin library"
 	default y
 	help
-	  This option allows to install the Native Xenomai skin
+	  This option allows to install the Alchemy Xenomai skin, previously
+	  called 'native'
 
 config BR2_PACKAGE_XENOMAI_POSIX_SKIN
 	bool "POSIX skin library"
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 456f200..e93fcf4 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -92,7 +92,7 @@ endef
 XENOMAI_POST_INSTALL_TARGET_HOOKS += XENOMAI_REMOVE_ANALOGY
 endif
 
-XENOMAI_REMOVE_SKIN_LIST += $(if $(BR2_PACKAGE_XENOMAI_NATIVE_SKIN),,native)
+XENOMAI_REMOVE_SKIN_LIST += $(if $(BR2_PACKAGE_XENOMAI_NATIVE_SKIN),,alchemy)
 XENOMAI_REMOVE_SKIN_LIST += $(if $(BR2_PACKAGE_XENOMAI_POSIX_SKIN),,posix)
 XENOMAI_REMOVE_SKIN_LIST += $(if $(BR2_PACKAGE_XENOMAI_VXWORKS_SKIN),,vxworks)
 XENOMAI_REMOVE_SKIN_LIST += $(if $(BR2_PACKAGE_XENOMAI_PSOS_SKIN),,psos)
