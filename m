From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Dec 2019 23:33:54 +0100
Subject: [Buildroot] [git commit] package/pipewire: use "config" instead of
 "menuconfig"
Message-ID: <20191218222548.DBBFD837A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43959c561602596502d20c232b3d46707a373054
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pipewire doesn't have enough sub-options to warrant having its own
menuconfig.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pipewire/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pipewire/Config.in b/package/pipewire/Config.in
index d7a4a51b38..80e28d3614 100644
--- a/package/pipewire/Config.in
+++ b/package/pipewire/Config.in
@@ -1,4 +1,4 @@
-menuconfig BR2_PACKAGE_PIPEWIRE
+config BR2_PACKAGE_PIPEWIRE
 	bool "pipewire"
 	depends on BR2_PACKAGE_HAS_UDEV # libudev
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib
