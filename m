From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2015 22:53:26 +0200
Subject: [Buildroot] [git commit branch/next] xterm: x-includes and
	x-libraries must be set for cross-compiling
Message-ID: <20150808105644.414197FD83@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f24bd7273dcec0876779a6c3949a3e5e64d44712
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

These flags need to be set so that the configure script would
correctly use libICE from cross-toolchain rather than from host.

This fix is similar to "package/efl/libevas: x-includes and x-libraries
must be set for cross-compiling" done by Romain Naour on libecore.

Signed-off-by: Mikhail Peselnik <bas@bmail.ru>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xterm/xterm.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

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
