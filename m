From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 31 Jan 2020 19:05:43 +0100
Subject: [Buildroot] [PATCH 1/2] package/file: add xz optional dependency
Message-ID: <20200131180544.1135547-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

xz is an optional dependency since version 5.38 and
https://github.com/file/file/commit/b259a07ea95827f565faa20f0316e5b2704064f7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/file/file.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/file/file.mk b/package/file/file.mk
index 3ae7c85976..8d0968e6b2 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -21,5 +21,12 @@ else
 FILE_CONF_OPTS += --disable-libseccomp
 endif
 
+ifeq ($(BR2_PACKAGE_XZ),y)
+FILE_CONF_OPTS += --enable-xzlib
+FILE_DEPENDENCIES += xz
+else
+FILE_CONF_OPTS += --disable-xzlib
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.24.1
