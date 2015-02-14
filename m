From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 14 Feb 2015 23:28:42 +0100
Subject: [Buildroot] [RFC 1/3] package/efl/libevas: add missing dependency
	on fontconfig
Message-ID: <1423952924-6322-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/efl/libevas/libevas.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
index b5a2d72..30d9f7c 100644
--- a/package/efl/libevas/libevas.mk
+++ b/package/efl/libevas/libevas.mk
@@ -205,6 +205,13 @@ else
 LIBEVAS_CONF_OPTS += --disable-font-loader-eet
 endif
 
+ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
+LIBEVAS_CONF_OPTS += --enable-fontconfig
+LIBEVAS_DEPENDENCIES += fontconfig
+else
+LIBEVAS_CONF_OPTS += --disable-fontconfig
+endif
+
 # libevas installs the source code of examples on the target, which
 # are generally not useful.
 define LIBEVAS_REMOVE_EXAMPLES
-- 
1.9.3
