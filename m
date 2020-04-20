From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Apr 2020 17:57:04 +0200
Subject: [Buildroot] [git commit] package/lvm2: add missing dependency to
 lvmetad
Message-ID: <20200420154243.5A0338F4A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d623e3784ce72763e260d98f2e9a2b8f58b78109
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 9889b8ce7fcef50fb5089f6e3e84b54f730d0ca6 forgot to propagate
dependency from lvm2-app-library to lvmetad

Fixes:
 - No autobuilder failures yet

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lvm2/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
index a41bb053b5..a9c5c453fc 100644
--- a/package/lvm2/Config.in
+++ b/package/lvm2/Config.in
@@ -49,6 +49,7 @@ comment "lvm2 application library needs a glibc or uClibc toolchain"
 
 config BR2_PACKAGE_LVM2_LVMETAD
 	bool "install lvmetad"
+	depends on !BR2_TOOLCHAIN_USES_MUSL # lvm2-app-library
 	select BR2_PACKAGE_LVM2_APP_LIBRARY
 	help
 	  Install lvmetad
@@ -60,6 +61,9 @@ config BR2_PACKAGE_LVM2_LVMETAD
 	  system.  lvmetad can be a disadvantage when disk event
 	  notifications from the system are unreliable.
 
+comment "lvmetad daemon needs a glibc or uClibc toolchain"
+	depends on BR2_TOOLCHAIN_USES_MUSL
+
 endif
 
 comment "lvm2 needs a toolchain w/ threads, dynamic library"
