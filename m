From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Thu, 17 Sep 2015 14:23:33 +0200
Subject: [Buildroot] [PATCH v3 2/5] package/hplip: Un-deprecate and bump
	version to 3.15.7
In-Reply-To: <1442492616-12626-1-git-send-email-olivier.schonken@gmail.com>
References: <1442492616-12626-1-git-send-email-olivier.schonken@gmail.com>
Message-ID: <1442492616-12626-3-git-send-email-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
 package/hplip/Config.in  | 1 -
 package/hplip/hplip.hash | 2 +-
 package/hplip/hplip.mk   | 2 +-
 3 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/hplip/Config.in b/package/hplip/Config.in
index a8a5f69..780c69e 100644
--- a/package/hplip/Config.in
+++ b/package/hplip/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_HPLIP
 	bool "hplip"
 	# because of cups security issues
-	depends on BR2_DEPRECATED_SINCE_2015_05
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_CUPS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
diff --git a/package/hplip/hplip.hash b/package/hplip/hplip.hash
index fb7d4e7..98f4262 100644
--- a/package/hplip/hplip.hash
+++ b/package/hplip/hplip.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  a8122cd824398ac6374154f86152e24fdf5c0100b5c1d6518e853308362e627d  hplip-3.13.10.tar.gz
+sha256  d310903048f3600f93422e5a8c39ddd682511e0849cd9abc5e943f9a10bdd49d	hplip-3.15.7.tar.gz
diff --git a/package/hplip/hplip.mk b/package/hplip/hplip.mk
index 2cdddca..d0a25c8 100644
--- a/package/hplip/hplip.mk
+++ b/package/hplip/hplip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HPLIP_VERSION = 3.13.10
+HPLIP_VERSION = 3.15.7
 HPLIP_SITE = http://downloads.sourceforge.net/hplip/hplip
 HPLIP_AUTORECONF = YES
 HPLIP_DEPENDENCIES = cups libusb jpeg
-- 
1.9.1
