From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jan 2016 00:08:07 +0100
Subject: [Buildroot] [PATCH 21/21] neard: add missing
	BR2_TOOLCHAIN_HAS_SYNC_4 dependency
In-Reply-To: <1453676887-31236-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1453676887-31236-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1453676887-31236-22-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.org/results/b8bf7be2efd8e8e369abdde0a5bec564e8cd6f23/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/connman/Config.in | 1 +
 package/neard/Config.in   | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index 655db86..556de48 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -50,6 +50,7 @@ config BR2_PACKAGE_CONNMAN_LOOPBACK
 config BR2_PACKAGE_CONNMAN_NEARD
 	bool "enable neard support"
 	select BR2_PACKAGE_NEARD
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # neard
 
 config BR2_PACKAGE_CONNMAN_OFONO
 	bool "enable ofono support"
diff --git a/package/neard/Config.in b/package/neard/Config.in
index 353d1af..8571e7c 100644
--- a/package/neard/Config.in
+++ b/package/neard/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_NEARD
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl, dbus, libglib2
 	depends on BR2_USE_MMU # dbus, libglib2
 	depends on !BR2_STATIC_LIBS # dlopen
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBNL
@@ -26,4 +27,5 @@ endif
 
 comment "neard needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
-- 
2.6.4
