From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Feb 2015 22:26:59 +0100
Subject: [Buildroot] [git commit] util-linux: disable more command host
	build because of ncurses dependency
Message-ID: <20150201212704.5C67B8014B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4a5832fd4244d25505bf447776ce3f9832e3b599
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build on host without ncurses/curses development files and option
HOST_UTIL_LINUX enabled (introduced by [1]) failes because of
text-utils/more.c ncurses dependency (see old commit [2] for details).

[1] http://git.buildroot.net/buildroot/commit/?id=2b18d093cd8a5baaf2e22ce13cc9e527c1937777
[2] http://git.buildroot.net/buildroot/commit/?id=e55532fa08266be268fa35c32a5ee763329a9396

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/util-linux/util-linux.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index a70363f..0b99618 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -120,6 +120,8 @@ HOST_UTIL_LINUX_CONF_OPTS += \
 
 ifeq ($(BR2_PACKAGE_HOST_UTIL_LINUX),y)
 HOST_UTIL_LINUX_CONF_OPTS += --disable-makeinstall-chown
+# disable more command because of ncurses dependency
+HOST_UTIL_LINUX_CONF_OPTS += --disable-more
 else
 HOST_UTIL_LINUX_CONF_OPTS += --disable-all-programs
 endif
