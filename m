From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 31 Jul 2017 09:53:48 -0400
Subject: [Buildroot] [PATCH 7/9] fix help text wrapping for configs k
In-Reply-To: <20170731135350.9018-1-aduskett@gmail.com>
References: <20170731135350.9018-1-aduskett@gmail.com>
Message-ID: <20170731135350.9018-8-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The check-package script when ran gives warnings on text wrapping
on all of these Config files.  This patch cleans up all warnings
related to the text wrapping for the Config files starting with
the letter k in the package directory.

The appropriate indentation is: <tab><2 spaces><62 chars>
See http://nightly.buildroot.org/#writing-rules-config-in for more
information.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/kexec-lite/Config.in    |  3 ++-
 package/kexec/Config.in         |  3 ++-
 package/kodi-pvr-vbox/Config.in |  3 ++-
 package/kodi/Config.in          |  3 ++-
 package/ktap/Config.in          | 17 +++++++++--------
 package/kvmtool/Config.in       |  4 ++--
 6 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/package/kexec-lite/Config.in b/package/kexec-lite/Config.in
index 97748dcce..cd0e30f2d 100644
--- a/package/kexec-lite/Config.in
+++ b/package/kexec-lite/Config.in
@@ -9,7 +9,8 @@ config BR2_PACKAGE_KEXEC_LITE
 	select BR2_PACKAGE_DTC_PROGRAMS
 	help
 	  Kexec is a user space utiltity for loading another kernel
-	  and asking the currently running kernel to do something with it.
+	  and asking the currently running kernel to do something with
+	  it.
 
 	  This package is a tiny implementation of the kexec userspace
 	  components, for devicetree-based platforms.
diff --git a/package/kexec/Config.in b/package/kexec/Config.in
index d92e6b957..c24dff38e 100644
--- a/package/kexec/Config.in
+++ b/package/kexec/Config.in
@@ -5,7 +5,8 @@ config BR2_PACKAGE_KEXEC
 		BR2_powerpc || BR2_sh4 || BR2_sh4a
 	help
 	  Kexec is a user space utility for loading another kernel
-	  and asking the currently running kernel to do something with it.
+	  and asking the currently running kernel to do something with
+	  it.
 
 	  https://www.kernel.org/pub/linux/utils/kernel/kexec/
 
diff --git a/package/kodi-pvr-vbox/Config.in b/package/kodi-pvr-vbox/Config.in
index 3a5f8c464..c1c22c10d 100644
--- a/package/kodi-pvr-vbox/Config.in
+++ b/package/kodi-pvr-vbox/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_KODI_PVR_VBOX
 	bool "kodi-pvr-vbox"
 	select BR2_PACKAGE_KODI_PLATFORM
 	help
-	  Kodi PVR addon for interfacing with VBox Communications XTi TV Gateway
+	  Kodi PVR addon for interfacing with VBox Communications XTi TV
+	  Gateway
 
 	  https://github.com/kodi-pvr/pvr.vbox
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 68c72e66c..76be9d925 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -207,7 +207,8 @@ config BR2_PACKAGE_KODI_LIBSHAIRPLAY
 	select BR2_PACKAGE_LIBSHAIRPLAY
 	help
 	  Enable Shairport support.
-	  Select this if you want to stream content from an Apple device.
+	  Select this if you want to stream content from an Apple
+	  device.
 
 config BR2_PACKAGE_KODI_LIBSMBCLIENT
 	bool "samba"
diff --git a/package/ktap/Config.in b/package/ktap/Config.in
index c85522846..38293f6dd 100644
--- a/package/ktap/Config.in
+++ b/package/ktap/Config.in
@@ -5,21 +5,22 @@ config BR2_PACKAGE_KTAP
 	help
 	  ktap is a script-based dynamic tracing tool for Linux
 
-	  It uses a scripting language and lets users trace the Linux kernel
-	  dynamically. ktap is designed to give operational insights with
-	  interoperability that allows users to tune, troubleshoot and extend
-	  kernel and application. It's similar to Linux Systemtap and
-	  Solaris Dtrace.
+	  It uses a scripting language and lets users trace the Linux
+	  kernel dynamically. ktap is designed to give operational
+	  insights with interoperability that allows users to tune,
+	  troubleshoot and extend kernel and application.
+	  It's similar to Linux Systemtap and Solaris Dtrace.
 
 	  ktap doesn't support kernels older than 3.1.
 
-	  To be able to resolve symbols in DSO and for sdt, you need to enable
-	  elfutils.
+	  To be able to resolve symbols in DSO and for sdt, you need to
+	  enable elfutils.
 
 	  Your kernel must have CONFIG_EVENT_TRACING,
 	  CONFIG_PERF_EVENTS, and CONFIG_DEBUG_FS enabled to compile.
 
-	  Buildroot automatically enables these in the kernel configuration.
+	  Buildroot automatically enables these in the kernel
+	  configuration.
 
 	  http://www.ktap.org
 
diff --git a/package/kvmtool/Config.in b/package/kvmtool/Config.in
index d2290c5d8..bf19a2537 100644
--- a/package/kvmtool/Config.in
+++ b/package/kvmtool/Config.in
@@ -14,8 +14,8 @@ config BR2_PACKAGE_KVMTOOL
 	help
 	  kvmtool is a lightweight tool for hosting KVM guests.
 	  As a pure virtualization tool it only supports guests using
-	  the same architecture, though it supports running 32-bit guests
-	  on those 64-bit architectures that allow this.
+	  the same architecture, though it supports running 32-bit
+	  guests on those 64-bit architectures that allow this.
 
 	  https://git.kernel.org/cgit/linux/kernel/git/will/kvmtool.git/tree/README
 
-- 
2.13.3
