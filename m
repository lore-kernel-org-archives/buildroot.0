From: Mike Williams <mike@mikebwilliams.com>
Date: Fri, 20 Mar 2015 15:14:06 -0400
Subject: [Buildroot] [PATCH v2 15/25] modem-manager: move udev rules to
	/usr/lib
In-Reply-To: <1426878856-15747-1-git-send-email-mike@mikebwilliams.com>
References: <1426878856-15747-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <1426878856-15747-16-git-send-email-mike@mikebwilliams.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
---
 package/modem-manager/modem-manager.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index a6e1b36..ce282b0 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -12,6 +12,8 @@ MODEM_MANAGER_LICENSE_FILES = COPYING
 MODEM_MANAGER_DEPENDENCIES = host-pkgconf udev dbus-glib host-intltool
 MODEM_MANAGER_INSTALL_STAGING = YES
 
+MODEM_MANAGER_CONF_OPTS += --with-udev-base-dir=/usr/lib/udev/
+
 ifeq ($(BR2_PACKAGE_MODEM_MANAGER_LIBQMI),y)
 	MODEM_MANAGER_DEPENDENCIES += libqmi
 	MODEM_MANAGER_CONF_OPTS += --with-qmi
-- 
2.1.0
