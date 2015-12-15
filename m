From: Romain Naour <romain.naour@openwide.fr>
Date: Tue, 15 Dec 2015 23:40:28 +0100
Subject: [Buildroot] [PATCH v10 16/28] package/dbus-cpp: switch to libefl
In-Reply-To: <1450219240-16938-1-git-send-email-romain.naour@openwide.fr>
References: <1450219240-16938-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1450219240-16938-17-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The libecore package will be removed in a followup
patch, so switch to libefl package which contain an
updated version of libecore.

Reported-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
v6: new patch
---
 package/dbus-cpp/dbus-cpp.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dbus-cpp/dbus-cpp.mk b/package/dbus-cpp/dbus-cpp.mk
index 37d12e7..9236ba7 100644
--- a/package/dbus-cpp/dbus-cpp.mk
+++ b/package/dbus-cpp/dbus-cpp.mk
@@ -26,9 +26,9 @@ DBUS_CPP_AUTORECONF = YES
 DBUS_CPP_LICENSE = LGPLv2.1+
 DBUS_CPP_LICENSE_FILES = COPYING
 
-ifeq ($(BR2_PACKAGE_LIBECORE),y)
+ifeq ($(BR2_PACKAGE_EFL),y)
 DBUS_CPP_CONF_OPTS += --enable-ecore
-DBUS_CPP_DEPENDENCIES += libecore
+DBUS_CPP_DEPENDENCIES += libefl
 else
 DBUS_CPP_CONF_OPTS += --disable-ecore
 endif
-- 
2.4.3
