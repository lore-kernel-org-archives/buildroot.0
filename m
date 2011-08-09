From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 10 Aug 2011 00:12:52 +0200
Subject: [Buildroot] [PATCH 19/22] dbus: remove --program-prefix
In-Reply-To: <1312927975-15543-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1312927975-15543-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1312927975-15543-19-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--program-prefix is now set in the auto-target infrastructure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 package/dbus/dbus.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 7c2bddd..d693039 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -12,8 +12,7 @@ DBUS_INSTALL_TARGET = YES
 DBUS_DEPENDENCIES = host-pkg-config
 
 DBUS_CONF_ENV = ac_cv_have_abstract_sockets=yes
-DBUS_CONF_OPT = --program-prefix="" \
-		--with-dbus-user=dbus \
+DBUS_CONF_OPT = --with-dbus-user=dbus \
 		--disable-tests \
 		--disable-asserts \
 		--enable-abstract-sockets \
-- 
1.7.2.5
