From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 13 Nov 2019 19:55:56 +0100
Subject: [Buildroot] [git commit] package/connman: clarify license of client
 code
Message-ID: <20191113184835.4F7E58EE47@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7d0ee8b4b8b162e010341f63821410100903370d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While the core connman code is licensed under GPL-2.0, the client code is
GPL-2.0+ for compatibility with readline (which is GPL-3.0+).

Extend the _LICENSE with this info to clarify that linking against
readline is OK licensing wise.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/connman/connman.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 839bc7a0e2..7ca49726dd 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -39,6 +39,7 @@ define CONNMAN_INSTALL_INIT_SYSTEMD
 endef
 
 ifeq ($(BR2_PACKAGE_CONNMAN_CLIENT),y)
+CONNMAN_LICENSE += , GPL-2.0+ (client)
 CONNMAN_CONF_OPTS += --enable-client
 CONNMAN_DEPENDENCIES += readline
 
