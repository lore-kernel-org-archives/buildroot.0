From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Mar 2021 13:23:27 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/babeltrace2: link
 with libatomic if needed
Message-ID: <20210305120445.D4A92862BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c2387ab585d9f45c557225f3b4a18ac95e1859b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Fix build of babeltrace2 in version 2.0.3 with Bootlin SPARC uclibc
toolchain added with commit 1348c569d0cb7f67eca30f170b782aa8b51cc259

Fixes:
 - http://autobuild.buildroot.org/results/31770bf70f9ce4e3be8fb310d084b214820c6829

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c79f050de7ae5cd63ea3bfc8be3896a539ce9103)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
