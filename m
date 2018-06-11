From: Min Xu <xuminready@gmail.com>
Date: Mon, 11 Jun 2018 11:18:23 -0700
Subject: [Buildroot] [PATCH v2 3/3] shadowsocks-libev: Adding the __sync
 related dependency
In-Reply-To: <20180611181823.2722-1-xuminready@gmail.com>
References: <20180611181823.2722-1-xuminready@gmail.com>
Message-ID: <20180611181823.2722-3-xuminready@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To fixup libcork linking errors:
"undefined reference to `__sync_val_compare_and_swap_4'"
Fixes
http://autobuild.buildroot.net/results/552b09ffe951c429422529c895f4c3ec723cf5ab

http://autobuild.buildroot.net/results/4810526381e15a194767753d324875bfbf5e3dde
http://autobuild.buildroot.net/results/9cb76805c2f2952aa434d143831ee03c7d43aa52

http://autobuild.buildroot.net/results/d00c5f9e1e7a6a40fac5763a06977b351b7875da
http://autobuild.buildroot.net/results/0612f2dc09a8763fdf2111ee8d0c223c8531262a

Signed-off-by: Min Xu <xuminready@gmail.com>
---
 package/shadowsocks-libev/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/shadowsocks-libev/Config.in b/package/shadowsocks-libev/Config.in
index 82c88e9..972e329 100644
--- a/package/shadowsocks-libev/Config.in
+++ b/package/shadowsocks-libev/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_SHADOWSOCKS_LIBEV
 	bool "shadowsocks-libev"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # for libcork
+	depends on BR2_TOOLCHAIN_HAS_SYNC_8 || !BR2_ARCH_IS_64 # for libcork
 	depends on BR2_TOOLCHAIN_HAS_THREADS # require pthreads
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_C_ARES
-- 
2.11.0
