From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  2 Feb 2016 16:31:35 +0100
Subject: [Buildroot] [PATCH v3 17/18] freerdp: add missing
	BR2_TOOLCHAIN_HAS_SYNC_4 dependency
In-Reply-To: <1454427096-20967-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1454427096-20967-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1454427096-20967-18-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.org/results/0501e63cbebe4cda4012ace6f7ec5f43342be5c5/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/freerdp/Config.in | 2 ++
 package/weston/Config.in  | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/package/freerdp/Config.in b/package/freerdp/Config.in
index f8dbb68..9dd2505 100644
--- a/package/freerdp/Config.in
+++ b/package/freerdp/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_FREERDP
 	depends on !BR2_STATIC_LIBS # uses dlfcn.h
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # libglib2
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_LIBGLIB2
@@ -84,5 +85,6 @@ config BR2_PACKAGE_FREERDP_CLIENT_WL
 endif
 
 comment "freerdp needs a toolchain w/ wchar, dynamic library, threads, C++"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
 		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/weston/Config.in b/package/weston/Config.in
index c5525e1..4c820e9 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -44,6 +44,7 @@ config BR2_PACKAGE_WESTON_RDP
 	bool "RDP compositor"
 	depends on BR2_USE_WCHAR # freerdp
 	depends on BR2_USE_MMU # freerdp, libglib2
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	select BR2_PACKAGE_FREERDP
 	select BR2_PACKAGE_WESTON_HAS_COMPOSITOR
 	help
@@ -61,6 +62,7 @@ config BR2_PACKAGE_WESTON_RDP
 
 comment "RDP compositor needs a toolchain w/ wchar"
 	depends on BROKEN # needs FreeRDP master
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR
 
 # rpi-userland is an EGL/GLES provider, so we can't select it
-- 
2.6.4
