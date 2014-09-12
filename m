From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri, 12 Sep 2014 17:50:01 +0200
Subject: [Buildroot] [PATCH 02/12] xapp_xkbevd: depends on MMU
In-Reply-To: <1410537011-29662-1-git-send-email-jezz@sysmic.org>
References: <1410537011-29662-1-git-send-email-jezz@sysmic.org>
Message-ID: <1410537011-29662-3-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes http://sysmic.org/~jezz/results/a9ec03bd:

xkbevd.o: In function `_main':
xkbevd.c:(.text+0x3ca): undefined reference to `_fork'
collect2: ld returned 1 exit status

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/x11r7/xapp_xkbevd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xapp_xkbevd/Config.in b/package/x11r7/xapp_xkbevd/Config.in
index cf31565..0cbb9e4 100644
--- a/package/x11r7/xapp_xkbevd/Config.in
+++ b/package/x11r7/xapp_xkbevd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_XKBEVD
 	bool "xkbevd"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_XLIB_LIBXKBFILE
 	help
 	  XKB event daemon
-- 
2.1.0
