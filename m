From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 16 May 2011 14:43:51 +0200
Subject: [Buildroot] [git commit] libnl: depend on host-bison
Message-ID: <20110516124542.EF60C83539@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5c22f20f4b12395a34ce47c1aba608fccaf1fbe0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libnl build breaks with bison <2.4 with:

bison -y -d  -o route/cls/ematch_syntax.c route/cls/ematch_syntax.y
route/cls/ematch_syntax.y:31.9-16: syntax error, unexpected
identifier, expecting string

So build our own known good version and use instead.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libnl/libnl.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index 767e957..8d3b9ad 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -8,6 +8,7 @@ LIBNL_VERSION = 3.0
 LIBNL_SOURCE = libnl-$(LIBNL_VERSION).tar.gz
 LIBNL_SITE = http://www.infradead.org/~tgr/libnl/files/
 LIBNL_INSTALL_STAGING = YES
+LIBNL_DEPENDENCIES = host-bison
 
 define LIBNL_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/lib/libnl.so*
-- 
1.7.3.4
