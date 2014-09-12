From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri, 12 Sep 2014 17:50:03 +0200
Subject: [Buildroot] [PATCH 04/12] xapp_xsm: depends on MMU
In-Reply-To: <1410537011-29662-1-git-send-email-jezz@sysmic.org>
References: <1410537011-29662-1-git-send-email-jezz@sysmic.org>
Message-ID: <1410537011-29662-5-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes: http://sysmic.org/~jezz/results/455f2788:

remote.o: In function `_remote_start':
remote.c:(.text+0x74): undefined reference to `_fork'
restart.o: In function `_Clone':
restart.c:(.text+0x5a8): undefined reference to `_fork'
restart.o: In function `_Restart':
restart.c:(.text+0xa44): undefined reference to `_fork'
collect2: ld returned 1 exit status

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/x11r7/xapp_xsm/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xapp_xsm/Config.in b/package/x11r7/xapp_xsm/Config.in
index d06dc6c..88f20cf 100644
--- a/package/x11r7/xapp_xsm/Config.in
+++ b/package/x11r7/xapp_xsm/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_XSM
 	bool "xsm"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_XLIB_LIBXAW
 	help
 	  X Session Manager
-- 
2.1.0
