From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 21:51:21 +0100
Subject: [Buildroot] [git commit] ofono: depends on BR2_TOOLCHAIN_HAS_SYNC_4
Message-ID: <20160225210308.55D687FCBD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0a4ea533d4ea096b83b7ebb3c0c19da8e41ddbda
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It uses __sync_fetch_and_add_4() and other 32-bit atomics, fixes:
http://autobuild.buildroot.net/results/7ec/7ec4142d0f41234309a226a21a7da7acbece90e9/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/connman/Config.in | 1 +
 package/ofono/Config.in   | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index 556de48..26406c8 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -55,6 +55,7 @@ config BR2_PACKAGE_CONNMAN_NEARD
 config BR2_PACKAGE_CONNMAN_OFONO
 	bool "enable ofono support"
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII # libcap-ng
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # ofono
 	select BR2_PACKAGE_OFONO
 
 config BR2_PACKAGE_CONNMAN_DEBUG
diff --git a/package/ofono/Config.in b/package/ofono/Config.in
index f8365d8..2e3ca22 100644
--- a/package/ofono/Config.in
+++ b/package/ofono/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_OFONO
 	depends on BR2_USE_MMU # dbus, libglib2
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII # libcap-ng
 	depends on !BR2_STATIC_LIBS # dlopen()
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	select BR2_PACKAGE_LIBCAP_NG
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
@@ -18,5 +19,6 @@ config BR2_PACKAGE_OFONO
 
 comment "ofono needs a toolchain w/ dynamic library, wchar, threads"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
