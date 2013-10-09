From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Oct 2013 18:30:39 -0300
Subject: [Buildroot] [PATCH 1/8] rtorrent: needs mmu
Message-ID: <1381354246-29140-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/rtorrent/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rtorrent/Config.in b/package/rtorrent/Config.in
index 7b21b5a..218cc6d 100644
--- a/package/rtorrent/Config.in
+++ b/package/rtorrent/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_RTORRENT
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBSIGC
 	select BR2_PACKAGE_LIBTORRENT
-- 
1.8.1.5
