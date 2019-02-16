From: Adrian Perez de Castro <aperez@igalia.com>
Date: Sat, 16 Feb 2019 15:45:29 +0200
Subject: [Buildroot] [PATCH 2/3] package/woff2: propagate microblaze
 dependecy
In-Reply-To: <20190216134530.14717-1-aperez@igalia.com>
References: <20190216134530.14717-1-aperez@igalia.com>
Message-ID: <20190216134530.14717-3-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The brotli package is disabled for Microblaze, therefore disable
woff2 as well for the architecture.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/woff2/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/woff2/Config.in b/package/woff2/Config.in
index 48672570dd..f451c04984 100644
--- a/package/woff2/Config.in
+++ b/package/woff2/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_WOFF2
 	bool "woff2"
+	depends on !BR2_microblaze # brotli
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_BROTLI
 	help
-- 
2.20.1
