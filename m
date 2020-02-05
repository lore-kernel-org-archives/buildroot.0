From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Feb 2020 16:47:37 +0100
Subject: [Buildroot] [git commit] package/libimxvpuapi: use external waf
Message-ID: <20200205153640.288E8802AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e343051cc86b60f71e85364095d60b6a6c06f600
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This makes libimxvpuapi use the Waf package ditributed in Buildroot,
instead of its own one, as the latter does not support Python3.

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libimxvpuapi/libimxvpuapi.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libimxvpuapi/libimxvpuapi.mk b/package/libimxvpuapi/libimxvpuapi.mk
index bcabbf3877..a2a3b21105 100644
--- a/package/libimxvpuapi/libimxvpuapi.mk
+++ b/package/libimxvpuapi/libimxvpuapi.mk
@@ -10,5 +10,6 @@ LIBIMXVPUAPI_LICENSE = LGPL-2.1+
 LIBIMXVPUAPI_LICENSE_FILES = LICENSE
 LIBIMXVPUAPI_DEPENDENCIES = host-pkgconf host-python imx-vpu
 LIBIMXVPUAPI_INSTALL_STAGING = YES
+LIBIMXVPUAPI_NEEDS_EXTERNAL_WAF = YES
 
 $(eval $(waf-package))
