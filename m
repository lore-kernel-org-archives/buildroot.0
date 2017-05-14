From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 May 2017 21:57:34 +0200
Subject: [Buildroot] [git commit] package/bluez_utils: select
	BR2_PACKAGE_CHECK
Message-ID: <20170514195753.C315D822C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=00f6de5fc77e38ae80c6ef1a0f0a74b57373344b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit [1] added check package to bluez_utils dependencies without
selecting it at Kconfig level.

Fixes:
Makefile:535: *** check is in the dependency chain of bluez_utils that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.

[1] 8554be9f82301282161cf6310bacdb6067fefb16

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bluez_utils/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bluez_utils/Config.in b/package/bluez_utils/Config.in
index 3848162..86c9085 100644
--- a/package/bluez_utils/Config.in
+++ b/package/bluez_utils/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_BLUEZ_UTILS
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib, libglib2
 	depends on BR2_USE_MMU # dbus, libglib2
+	select BR2_PACKAGE_CHECK
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
 	help
