From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Apr 2015 22:59:42 +0200
Subject: [Buildroot] [git commit] system: drop IPv6 depend for systemd
Message-ID: <20150422210724.E7FBB81D89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b7c6e6c1c129139de49c924be6e5e09436ffad5e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The option is a non-option now and will be removed.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/Config.in |    1 -
 system/Config.in          |    1 -
 2 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index d00ac9d..38353d0 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -11,7 +11,6 @@ config BR2_PACKAGE_SYSTEMD
 	bool "systemd"
 	depends on BR2_INIT_SYSTEMD
 	depends on BR2_USE_WCHAR # util-linux
-	depends on BR2_INET_IPV6
 	depends on !BR2_STATIC_LIBS # kmod
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	depends on BR2_USE_MMU # dbus
diff --git a/system/Config.in b/system/Config.in
index 431524d..84cde94 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -81,7 +81,6 @@ config BR2_INIT_SYSTEMD
 	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_USE_WCHAR
-	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HAS_SSP
 	depends on BR2_USE_MMU
