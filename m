From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 31 Jul 2014 02:16:46 +0200
Subject: [Buildroot] [PATCH 11/14 v4] [RFC] package/libinput: needs libudev,
	not a udev daemon
In-Reply-To: <cover.1406765723.git.yann.morin.1998@free.fr>
References: <cover.1406765723.git.yann.morin.1998@free.fr>
Message-ID: <273410357b70e8cb7ec690b8b47fddc6799f3ea8.1406765723.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libinput is happy enough with just a libudev, and does
not require a udev daemon.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/libinput/Config.in   | 6 +++---
 package/libinput/libinput.mk | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libinput/Config.in b/package/libinput/Config.in
index 14e4e70..a958e37 100644
--- a/package/libinput/Config.in
+++ b/package/libinput/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBINPUT
 	bool "libinput"
-	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_PACKAGE_HAS_LIBUDEV
 	select BR2_PACKAGE_LIBEVDEV
 	select BR2_PACKAGE_MTDEV
 	help
@@ -13,5 +13,5 @@ config BR2_PACKAGE_LIBINPUT
 
 	  http://freedesktop.org/wiki/Software/libinput/
 
-comment "libinput needs udev /dev management"
-	depends on !BR2_PACKAGE_HAS_UDEV
+comment "libinput needs a libudev provider to be selected"
+	depends on !BR2_PACKAGE_HAS_LIBUDEV
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index b52101a..3f225cc 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -10,7 +10,7 @@ LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_LICENSE = MIT
 LIBINPUT_LICENSE_FILES = COPYING
 
-LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
+LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev libudev
 LIBINPUT_INSTALL_STAGING = YES
 
 # Tests need fork, so just disable them everywhere.
-- 
1.9.1
