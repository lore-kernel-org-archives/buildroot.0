From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri, 12 Sep 2014 17:50:05 +0200
Subject: [Buildroot] [PATCH 06/12] xapp_xdm: depends on MMU
In-Reply-To: <1410537011-29662-1-git-send-email-jezz@sysmic.org>
References: <1410537011-29662-1-git-send-email-jezz@sysmic.org>
Message-ID: <1410537011-29662-7-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes http://sysmic.org/~jezz/results/e891eb7e:

dm.o: In function `_StartDisplay':
dm.c:(.text+0xd6e): undefined reference to `_fork'
server.o: In function `_StartServerOnce':
server.c:(.text+0x266): undefined reference to `_fork'
session.o: In function `_runAndWait':
session.c:(.text+0x67a): undefined reference to `_fork'
session.o: In function `_ManageSession':
session.c:(.text+0xa2a): undefined reference to `_fork'
collect2: ld returned 1 exit status

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/x11r7/xapp_xdm/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xapp_xdm/Config.in b/package/x11r7/xapp_xdm/Config.in
index 477cd77..6982970 100644
--- a/package/x11r7/xapp_xdm/Config.in
+++ b/package/x11r7/xapp_xdm/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_XDM
 	bool "xdm"
+	depends on BR2_USE_MMU # fork()
 	# Runtime dependency: can't start an X server unless there is one
 	depends on BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XAPP_SESSREG
-- 
2.1.0
