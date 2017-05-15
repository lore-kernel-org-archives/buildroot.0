From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 May 2017 14:50:14 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/bluez_utils:
	select BR2_PACKAGE_CHECK
Message-ID: <20170515125328.AE69E80649@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fbd7120c8ac119604341f52c445f7256eb2d96b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Commit [1] added check package to bluez_utils dependencies without
selecting it at Kconfig level.

Fixes:
Makefile:535: *** check is in the dependency chain of bluez_utils that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.

[1] 8554be9f82301282161cf6310bacdb6067fefb16

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 00f6de5fc77e38ae80c6ef1a0f0a74b57373344b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
