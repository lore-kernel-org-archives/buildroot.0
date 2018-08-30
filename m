From: Asaf Kahlon <asafka7@gmail.com>
Date: Thu, 30 Aug 2018 13:14:30 +0300
Subject: [Buildroot] [PATCH 1/1] package/libsoup: needs host-python3
Message-ID: <20180830101430.14862-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The tld-parser script in libsoup is now written in Python,
and needs python3 to run.

Fixes:
http://autobuild.buildroot.net/results/91c2d6a1ca011787130db06695d6cd9e882f7258
http://autobuild.buildroot.net/results/a318e595f02937534b3f8698ef4c04194a8b34af

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>

---

Maybe this specific script can run even with python2, but I don't think patchting the
"/usr/bin/env python3" line would be the right solution, especially considering
the fact that they already have python3-only code in recent commits.
---
 package/libsoup/libsoup.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 95bd682010..ef17f27fcd 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -14,7 +14,7 @@ LIBSOUP_INSTALL_STAGING = YES
 LIBSOUP_CONF_ENV = ac_cv_path_GLIB_GENMARSHAL=$(LIBGLIB2_HOST_BINARY)
 LIBSOUP_CONF_OPTS = --disable-glibtest --enable-vala=no --with-gssapi=no
 LIBSOUP_DEPENDENCIES = host-pkgconf host-libglib2 \
-	libglib2 libxml2 sqlite host-intltool
+	libglib2 libxml2 sqlite host-intltool host-python3
 
 ifeq ($(BR2_PACKAGE_LIBSOUP_GNOME),y)
 LIBSOUP_CONF_OPTS += --with-gnome
-- 
2.17.1
