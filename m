From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri, 12 Sep 2014 17:50:04 +0200
Subject: [Buildroot] [PATCH 05/12] xapp_xmh: depends on MMU
In-Reply-To: <1410537011-29662-1-git-send-email-jezz@sysmic.org>
References: <1410537011-29662-1-git-send-email-jezz@sysmic.org>
Message-ID: <1410537011-29662-6-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes http://sysmic.org/~jezz/results/1a0bc183:

command.o: In function `__DoCommandToFileOrPipe':
command.c:(.text+0x35e): undefined reference to `_fork'
collect2: ld returned 1 exit status

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/x11r7/xapp_xmh/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xapp_xmh/Config.in b/package/x11r7/xapp_xmh/Config.in
index 1ef65c7..4e86d0f 100644
--- a/package/x11r7/xapp_xmh/Config.in
+++ b/package/x11r7/xapp_xmh/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_XMH
 	bool "xmh"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_XLIB_LIBXAW
 	select BR2_PACKAGE_XDATA_XBITMAPS
 	help
-- 
2.1.0
