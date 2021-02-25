From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 25 Feb 2021 22:27:20 +0100
Subject: [Buildroot] [git commit] package/babeltrace2: link with libatomic
 if needed
Message-ID: <20210225210527.AD9BF843C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c79f050de7ae5cd63ea3bfc8be3896a539ce9103
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix build of babeltrace2 in version 2.0.3 with Bootlin SPARC uclibc
toolchain added with commit 1348c569d0cb7f67eca30f170b782aa8b51cc259

Fixes:
 - http://autobuild.buildroot.org/results/31770bf70f9ce4e3be8fb310d084b214820c6829

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
