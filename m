From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  8 Feb 2019 22:40:48 +0100
Subject: [Buildroot] [PATCH v2,
 2/2] package/ncmpc: add pcre optional dependency
In-Reply-To: <20190208214048.11835-1-fontaine.fabrice@gmail.com>
References: <20190208214048.11835-1-fontaine.fabrice@gmail.com>
Message-ID: <20190208214048.11835-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

pcre dependency has been added in version 0.32:
https://github.com/MusicPlayerDaemon/ncmpc/commit/0b3169510014f0f336de58864b97a3cc0f308500

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ncmpc/ncmpc.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/ncmpc/ncmpc.mk b/package/ncmpc/ncmpc.mk
index 4167974490..2e52be27d5 100644
--- a/package/ncmpc/ncmpc.mk
+++ b/package/ncmpc/ncmpc.mk
@@ -14,8 +14,7 @@ NCMPC_LICENSE_FILES = COPYING
 
 NCMPC_CONF_OPTS = \
 	-Dcurses=ncurses \
-	-Ddocumentation=disabled \
-	-Dregex=disabled
+	-Ddocumentation=disabled
 
 ifeq ($(BR2_PACKAGE_LIRC_TOOLS),y)
 NCMPC_DEPENDENCIES += lirc-tools
@@ -24,4 +23,11 @@ else
 NCMPC_CONF_OPTS += -Dlirc=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_PCRE),y)
+NCMPC_DEPENDENCIES += pcre
+NCMPC_CONF_OPTS += -Dregex=enabled
+else
+NCMPC_CONF_OPTS += -Dregex=disabled
+endif
+
 $(eval $(meson-package))
-- 
2.14.1
