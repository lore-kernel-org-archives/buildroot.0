From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 17 Mar 2018 09:54:44 +0100
Subject: [Buildroot] [git commit] package/x11r7/xkeyboard-config: install to
 staging
Message-ID: <20180317085654.54E3783697@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=438041c365fceef7d598f97c27ef94716e146af4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

enlightenment doesn't detect xkeyboard-config since it's missing
from staging.

Fixes:
Dependency xkeyboard-config found: NO

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xkeyboard-config/xkeyboard-config.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index d9998aa489..9a8838dde1 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -10,6 +10,9 @@ XKEYBOARD_CONFIG_SITE = http://www.x.org/releases/individual/data/xkeyboard-conf
 XKEYBOARD_CONFIG_LICENSE = MIT
 XKEYBOARD_CONFIG_LICENSE_FILES = COPYING
 
+# xkeyboard-config.pc
+XKEYBOARD_CONFIG_INSTALL_STAGING = YES
+
 XKEYBOARD_CONFIG_CONF_OPTS = --disable-runtime-deps
 XKEYBOARD_CONFIG_DEPENDENCIES = host-gettext host-intltool host-xapp_xkbcomp
 
