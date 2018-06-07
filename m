From: Min Xu <xuminready@gmail.com>
Date: Thu,  7 Jun 2018 16:01:44 -0700
Subject: [Buildroot] [PATCH 1/1] shadowsocks-libev: add dependency on
 BR2_TOOLCHAIN_HAS_SYNC_4
Message-ID: <20180607230144.387-1-xuminready@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To fixup linking errors:
"undefined reference to `__sync_val_compare_and_swap_4'"
Fixes
http://autobuild.buildroot.net/results/d00c5f9e1e7a6a40fac5763a06977b351b7875da
http://autobuild.buildroot.net/results/0612f2dc09a8763fdf2111ee8d0c223c8531262a

reference: https://git.buildroot.org/buildroot/commit/?id=7c77d965bdcd301c2644004140faec613c1ee202

Signed-off-by: Min Xu <xuminready@gmail.com>
---
 package/shadowsocks-libev/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/shadowsocks-libev/Config.in b/package/shadowsocks-libev/Config.in
index d02e5a93ef..c914ed778b 100644
--- a/package/shadowsocks-libev/Config.in
+++ b/package/shadowsocks-libev/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_SHADOWSOCKS_LIBEV
 	bool "shadowsocks-libev"
+	# uses __sync_val_compare_and_swap_4
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_C_ARES
 	select BR2_PACKAGE_LIBEV
-- 
2.11.0
