From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Dec 2015 00:04:32 +0100
Subject: [Buildroot] [git commit] package/dbus-cpp: switch to libefl
Message-ID: <20151217230816.83356803E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=68d32f64128ee8419954161d53c47f3d3df87309
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The libecore package will be removed in a followup
patch, so switch to libefl package which contain an
updated version of libecore.

Reported-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
