From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Tue,  4 Feb 2020 18:01:32 +0100
Subject: [Buildroot] [PATCH 1/1] package/libimxvpuapi: use external waf
Message-ID: <20200204170132.7334-1-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This makes libimxvpuapi use the Waf package ditributed in Buildroot,
instead of its own one, as the latter does not support Python3.

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
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
-- 
2.24.1
