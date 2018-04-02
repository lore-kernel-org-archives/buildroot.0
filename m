From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 18:29:46 +0200
Subject: [Buildroot] [git commit] package/libevent: add support for libressl
Message-ID: <20180402162949.5A80281502@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=46a14966b65a1de7538b350ce22163dc0eca16c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Libevent builds fine with current libressl 2.7.2.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libevent/libevent.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index 65bf1c2b7b..f0c989afa1 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -24,8 +24,8 @@ ifneq ($(BR2_PACKAGE_PYTHON),y)
 LIBEVENT_POST_INSTALL_TARGET_HOOKS += LIBEVENT_REMOVE_PYSCRIPT
 endif
 
-ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
-LIBEVENT_DEPENDENCIES += host-pkgconf libopenssl
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBEVENT_DEPENDENCIES += host-pkgconf openssl
 LIBEVENT_CONF_OPTS += --enable-openssl
 else
 LIBEVENT_CONF_OPTS += --disable-openssl
