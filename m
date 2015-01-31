From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 31 Jan 2015 21:28:31 +0100
Subject: [Buildroot] [PATCH v1] util-linux: disable more command host build
	because of ncurses dependency
Message-ID: <1422736111-11769-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build on host without ncurses/curses development files and option
HOST_UTIL_LINUX enabled (introduced by [1]) failes because of
text-utils/more.c ncurses dependency (see old commit [2] for details).

[1] http://git.buildroot.net/buildroot/commit/?id=2b18d093cd8a5baaf2e22ce13cc9e527c1937777
[2] http://git.buildroot.net/buildroot/commit/?id=e55532fa08266be268fa35c32a5ee763329a9396

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/util-linux/util-linux.mk | 2 ++
 1 file changed, 2 insertions(+)

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
-- 
2.1.2
