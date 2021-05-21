From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Fri, 21 May 2021 10:32:11 +0200
Subject: [Buildroot] [PATCH 2/2] package/openocd: add optional dependency on
 libgpiod
In-Reply-To: <20210521083211.25356-1-sebastien.szymanski@armadeus.com>
References: <20210521083211.25356-1-sebastien.szymanski@armadeus.com>
Message-ID: <20210521083211.25356-2-sebastien.szymanski@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To make the Linux GPIOD bitbang adapter driver through libgpiod
available.

Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
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
-- 
2.26.3
