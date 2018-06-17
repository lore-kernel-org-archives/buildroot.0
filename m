From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jun 2018 15:41:51 +0200
Subject: [Buildroot] [git commit] shadowsocks-libev: add dependency on
 thread support
Message-ID: <20180617133941.C478A882E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c3be7d770cdaed65eb98497b797aea3a6bcc27a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

shadowsocks-libev needs thread support, otherwise the configure script
fails with:

configure: error: Can not find pthreads.  This is required.

Signed-off-by: Min Xu <xuminready@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/shadowsocks-libev/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/shadowsocks-libev/Config.in b/package/shadowsocks-libev/Config.in
index d02e5a93ef..56914e8e9d 100644
--- a/package/shadowsocks-libev/Config.in
+++ b/package/shadowsocks-libev/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SHADOWSOCKS_LIBEV
 	bool "shadowsocks-libev"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_C_ARES
 	select BR2_PACKAGE_LIBEV
@@ -11,3 +12,7 @@ config BR2_PACKAGE_SHADOWSOCKS_LIBEV
 	  embedded devices and low-end boxes.
 
 	  https://github.com/shadowsocks/shadowsocks-libev
+
+comment "shadowsocks-libev needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
