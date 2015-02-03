From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Feb 2015 17:57:15 +0100
Subject: [Buildroot] [git commit] xterm: add support for 256 colors
Message-ID: <20150203165735.7067680E2B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2aaa5bd7b1fcd3c152cd138d7d68ac46a5188413
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: make the 256 colors support unconditionally enabled.]

Signed-off-by: Thierry Bultel <tbultel@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xterm/xterm.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index 9c6bd21..3f5b978 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -11,5 +11,6 @@ XTERM_DEPENDENCIES = ncurses xlib_libXaw
 XTERM_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install
 XTERM_LICENSE = MIT
 XTERM_LICENSE_FILES = version.c
+XTERM_CONF_OPTS = --enable-256-color
 
 $(eval $(autotools-package))
