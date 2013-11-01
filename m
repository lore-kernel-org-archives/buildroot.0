From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Nov 2013 15:26:07 +0100
Subject: [Buildroot] [git commit] util-linux: Add --without-ncurses to
	host-util-linux
Message-ID: <20131104211054.99CB19BC97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9c7bc3f3c0a02b55b88aa4277c29e86d40698370
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Ncurses not necessary when building host-util-linux, so passing
--without-ncurses avoids from misdetecting an installed host ncurses
on the build machine.

[Thomas: improve commit message]
Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/util-linux/util-linux.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 4db1e52..a694f3d 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -84,7 +84,7 @@ HOST_UTIL_LINUX_CONF_OPT += \
 	--disable-login --disable-mount --disable-partx \
 	--disable-pivot_root --disable-rename --disable-schedutils \
 	--disable-su --disable-switch_root --disable-unshare \
-	--disable-uuidd --disable-wall
+	--disable-uuidd --disable-wall --without-ncurses
 
 # Avoid building the tools if they are disabled since we can't install on
 # a per-directory basis.
