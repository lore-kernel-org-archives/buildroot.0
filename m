From: Min Xu <xuminready@gmail.com>
Date: Mon, 11 Jun 2018 11:18:22 -0700
Subject: [Buildroot] [PATCH v2 2/3] shadowsocks-libev: Adding the pthreads
 dependency
In-Reply-To: <20180611181823.2722-1-xuminready@gmail.com>
References: <20180611181823.2722-1-xuminready@gmail.com>
Message-ID: <20180611181823.2722-2-xuminready@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Min Xu <xuminready@gmail.com>
---
 package/shadowsocks-libev/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/shadowsocks-libev/Config.in b/package/shadowsocks-libev/Config.in
index d02e5a9..82c88e9 100644
--- a/package/shadowsocks-libev/Config.in
+++ b/package/shadowsocks-libev/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SHADOWSOCKS_LIBEV
 	bool "shadowsocks-libev"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # require pthreads
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_C_ARES
 	select BR2_PACKAGE_LIBEV
-- 
2.11.0
