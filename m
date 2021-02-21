From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 21 Feb 2021 21:14:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/babeltrace2: link with libatomic if
 needed
Message-ID: <20210221201452.103678-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix build of babeltrace2 in version 2.0.3 with Bootlin SPARC uclibc
toolchain added with commit 1348c569d0cb7f67eca30f170b782aa8b51cc259

Fixes:
 - http://autobuild.buildroot.org/results/31770bf70f9ce4e3be8fb310d084b214820c6829

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/babeltrace2/babeltrace2.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/babeltrace2/babeltrace2.mk b/package/babeltrace2/babeltrace2.mk
index eb29a5928b..1e03f5fdd2 100644
--- a/package/babeltrace2/babeltrace2.mk
+++ b/package/babeltrace2/babeltrace2.mk
@@ -27,5 +27,9 @@ else
 BABELTRACE2_CONF_OPTS += --disable-debug-info
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+BABELTRACE2_CONF_ENV += LIBS=-latomic
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.30.0
