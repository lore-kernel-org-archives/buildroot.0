From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 21 May 2021 22:52:09 +0200
Subject: [Buildroot] [git commit branch/next] package/openocd: add optional
 dependency on libgpiod
Message-ID: <20210521202438.49CB588E4E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=636cd56e54672a6782367fa28ed2ac1f96a22166
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

To make the Linux GPIOD bitbang adapter driver through libgpiod
available.

Signed-off-by: S??bastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/openocd/openocd.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index 1460495a88..b74426ff47 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -32,7 +32,8 @@ OPENOCD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_LIBUSB),libusb) \
 	$(if $(BR2_PACKAGE_LIBUSB_COMPAT),libusb-compat) \
 	$(if $(BR2_PACKAGE_LIBHID),libhid) \
-	$(if $(BR2_PACKAGE_HIDAPI),hidapi)
+	$(if $(BR2_PACKAGE_HIDAPI),hidapi) \
+	$(if $(BR2_PACKAGE_LIBGPIOD),libgpiod)
 
 # Adapters
 OPENOCD_CONF_OPTS += \
