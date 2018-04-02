From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  2 Apr 2018 13:58:27 +0200
Subject: [Buildroot] [PATCH 2/4] package/libevent: add support for libressl
In-Reply-To: <20180402115829.16778-1-bernd.kuhls@t-online.de>
References: <20180402115829.16778-1-bernd.kuhls@t-online.de>
Message-ID: <20180402115829.16778-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libevent builds fine with current libressl 2.7.2.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
-- 
2.14.2
