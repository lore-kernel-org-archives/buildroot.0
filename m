From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 15 Mar 2018 23:50:10 +0100
Subject: [Buildroot] [PATCH 4/6] package/x11r7/xkeyboard-config: install to
 staging
In-Reply-To: <20180315225012.9845-1-romain.naour@gmail.com>
References: <20180315225012.9845-1-romain.naour@gmail.com>
Message-ID: <20180315225012.9845-4-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

enlightenment doesn't detect xkeyboard-config since it's missing
from staging.

Fixes:
Dependency xkeyboard-config found: NO

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
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
 
-- 
2.14.3
