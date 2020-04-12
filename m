From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Apr 2020 10:29:59 +0200
Subject: [Buildroot] [PATCH 2/2] package/mc: add optional dependency to gmp
In-Reply-To: <20200412082959.853319-1-bernd.kuhls@t-online.de>
References: <20200412082959.853319-1-bernd.kuhls@t-online.de>
Message-ID: <20200412082959.853319-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mc/mc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/mc/mc.mk b/package/mc/mc.mk
index ca93da1756..3deffeefee 100644
--- a/package/mc/mc.mk
+++ b/package/mc/mc.mk
@@ -11,6 +11,13 @@ MC_LICENSE = GPL-3.0+
 MC_LICENSE_FILES = COPYING
 MC_DEPENDENCIES = libglib2 host-pkgconf
 
+ifeq ($(BR2_PACKAGE_GMP),y)
+MC_CONF_OPTS += --with-gpm-mouse
+MC_DEPENDENCIES += gpm
+else
+MC_CONF_OPTS += --without-gpm-mouse
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSSH2),y)
 MC_CONF_OPTS += --enable-vfs-sftp
 MC_DEPENDENCIES += libssh2
-- 
2.25.0
