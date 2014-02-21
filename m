From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 21 Feb 2014 21:57:46 +0100
Subject: [Buildroot] [git commit] tvheadend: fix error compiling with ccache
Message-ID: <20140221211152.179299CAC0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1889207631a87bedbf6c47329a8fcde0124d4d2a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The tvheadend configure script fails to correctly handle spaces in any of
the options passed to it.  If ccache is used the configure script fails to
handle the space in the --cc option and errors.  Also the --cflags option
fails to handle multiple entries and only uses the first one.  This patch
simple removes setting the --cc and --cflags options as the configure
script will correctly use the CC and CFLAGS variables already passed in
TARGET_CONFIGURE_OPTS.

Signed-off-by: Martin Bark <martin@barkynet.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tvheadend/tvheadend.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 43bc382..85240a0 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -28,8 +28,6 @@ define TVHEADEND_CONFIGURE_CMDS
 	 $(TARGET_CONFIGURE_ARGS)		\
 	 ./configure				\
 	 --prefix=/usr				\
-	 --cc="$(TARGET_CC)"			\
-	 --cflags="$(TARGET_CFLAGS)"		\
 	 --arch="$(ARCH)"			\
 	 --cpu="$(BR2_GCC_TARGET_CPU)"		\
 	 --python="$(HOST_DIR)/usr/bin/python"	\
