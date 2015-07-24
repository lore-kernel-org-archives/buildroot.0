From: kyak <bas@bmail.ru>
Date: Fri, 24 Jul 2015 17:54:14 +0300
Subject: [Buildroot] [PATCH 1/1] xterm: force detection of libICE
Message-ID: <1437749654-29431-1-git-send-email-bas@bmail.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With some hosts, xterm configure script fails to detect presence of
libICE. This results in error during xterm linking stage, because -lICE
is not passed to linker. This patches forces configure script to detect
libICE.

Signed-off-by: Mikhail Peselnik <bas@bmail.ru>
---
 package/xterm/xterm.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index 56f692d..dd07e35 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -11,5 +11,6 @@ XTERM_DEPENDENCIES = ncurses xlib_libXaw
 XTERM_LICENSE = MIT
 XTERM_LICENSE_FILES = version.c
 XTERM_CONF_OPTS = --enable-256-color
+XTERM_CONF_ENV = ac_cv_lib_ICE_IceConnectionNumber=yes
 
 $(eval $(autotools-package))
-- 
2.4.6
