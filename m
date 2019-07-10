From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 10 Jul 2019 22:32:27 +0200
Subject: [Buildroot] [git commit] package/modem-manager: drop host-intltool
Message-ID: <20190710203726.B5B1E81674@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ff0f28add8e386bbb5321d5b4eb9f38886ac42d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

intltool is not needed since
https://gitlab.freedesktop.org/mobile-broadband/ModemManager/commit/984625165e09f02b4d6b8389092d5055fdbb0f03

So drop it and add TARGET_NLS_DEPENDENCIES

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Tested-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/modem-manager/modem-manager.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index a2c38a68c9..61658cf48a 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -9,7 +9,7 @@ MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
 MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
 MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
 MODEM_MANAGER_LICENSE_FILES = COPYING COPYING.LIB
-MODEM_MANAGER_DEPENDENCIES = host-pkgconf host-intltool libglib2
+MODEM_MANAGER_DEPENDENCIES = host-pkgconf libglib2 $(TARGET_NLS_DEPENDENCIES)
 MODEM_MANAGER_INSTALL_STAGING = YES
 MODEM_MANAGER_CONF_OPTS = --disable-more-warnings
 
