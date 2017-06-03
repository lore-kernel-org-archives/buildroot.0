From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Jun 2017 19:34:59 +0200
Subject: [Buildroot] [PATCH 2/2] package/gdbm: add optional support for
	readline
In-Reply-To: <20170603173459.1012-1-bernd.kuhls@t-online.de>
References: <20170603173459.1012-1-bernd.kuhls@t-online.de>
Message-ID: <20170603173459.1012-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

readline support was added in version 1.13:

http://puszcza.gnu.org.ua/forum/forum.php?forum_id=1145
"The gdbmtool utility now offers the usual line-editing facilities
 (if the package has been compiled with GNU Readline."

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gdbm/gdbm.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gdbm/gdbm.mk b/package/gdbm/gdbm.mk
index 290e8410e..4e3ed76e8 100644
--- a/package/gdbm/gdbm.mk
+++ b/package/gdbm/gdbm.mk
@@ -14,4 +14,11 @@ ifeq ($(BR2_PACKAGE_GETTEXT),y)
 GDBM_DEPENDENCIES += gettext
 endif
 
+ifeq ($(BR2_PACKAGE_READLINE),y)
+GDBM_CONF_OPTS += --with-readline
+GDBM_DEPENDENCIES += readline
+else
+GDBM_CONF_OPTS += --without-readline
+endif
+
 $(eval $(autotools-package))
-- 
2.11.0
