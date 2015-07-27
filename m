From: Mikhail Peselnik <bas@bmail.ru>
Date: Mon, 27 Jul 2015 17:46:49 +0300
Subject: [Buildroot] [PATCH 1/2] xterm: x-includes and x-libraries must be
	set for cross-compiling
Message-ID: <1438008410-1465-1-git-send-email-bas@bmail.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These flags need to be set so that the configure script would
correctly use libICE from cross-toolchain rather than from host.

This fix is similar to "package/efl/libevas: x-includes and x-libraries
must be set for cross-compiling" done by Romain Naour on libecore.

Signed-off-by: Mikhail Peselnik <bas@bmail.ru>
---
 package/xterm/xterm.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index 56f692d..778b40c 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -10,6 +10,8 @@ XTERM_SITE = ftp://invisible-island.net/xterm
 XTERM_DEPENDENCIES = ncurses xlib_libXaw
 XTERM_LICENSE = MIT
 XTERM_LICENSE_FILES = version.c
-XTERM_CONF_OPTS = --enable-256-color
+XTERM_CONF_OPTS = --enable-256-color \
+	--x-includes=$(STAGING_DIR)/usr/include \
+	--x-libraries=$(STAGING_DIR)/usr/lib
 
 $(eval $(autotools-package))
-- 
2.4.6
