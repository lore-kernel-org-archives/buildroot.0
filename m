From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 19 Apr 2015 09:39:55 -0300
Subject: [Buildroot] [PATCH v2 04/11] system: drop IPv6 depend for systemd
In-Reply-To: <1429447202-13722-1-git-send-email-gustavo@zacarias.com.ar>
References: <1429447202-13722-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1429447202-13722-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The option is a non-option now and will be removed.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/systemd/Config.in | 1 -
 system/Config.in          | 1 -
 2 files changed, 2 deletions(-)

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
-- 
2.0.5
