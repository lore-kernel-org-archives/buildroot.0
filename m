From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Nov 2019 14:01:33 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/connman: clarify
 license of client code
Message-ID: <20191118125359.F0E1B812EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=74edc152b29ab1546ecad5495636e37c8a3561da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

While the core connman code is licensed under GPL-2.0, the client code is
GPL-2.0+ for compatibility with readline (which is GPL-3.0+).

Extend the _LICENSE with this info to clarify that linking against
readline is OK licensing wise.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7d0ee8b4b8b162e010341f63821410100903370d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/connman/connman.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index b67d1c4b86..0431759440 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -39,6 +39,7 @@ define CONNMAN_INSTALL_INIT_SYSTEMD
 endef
 
 ifeq ($(BR2_PACKAGE_CONNMAN_CLIENT),y)
+CONNMAN_LICENSE += , GPL-2.0+ (client)
 CONNMAN_CONF_OPTS += --enable-client
 CONNMAN_DEPENDENCIES += readline
 
