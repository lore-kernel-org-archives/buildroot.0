From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan@astylos.dk>
Date: Tue, 19 May 2020 15:47:07 +0200
Subject: [Buildroot] [PATCH] package/cracklib: Force usage of buildroot
 python2 binary
Message-ID: <20200519134707.3070779-1-stefan.sorensen@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  http://autobuild.buildroot.net/results/638f2e67b20d99994f1ccc08a9ecc32a2e3c3a40

Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
---
 package/cracklib/cracklib.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/cracklib/cracklib.mk b/package/cracklib/cracklib.mk
index 91d510ff34..f17c717025 100644
--- a/package/cracklib/cracklib.mk
+++ b/package/cracklib/cracklib.mk
@@ -21,7 +21,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 CRACKLIB_CONF_OPTS += --with-python
-CRACKLIB_DEPENDENCIES += python
+CRACKLIB_DEPENDENCIES += python host-python
+CRACKLIB_CONF_ENV += PYTHON=$(HOST_DIR)/bin/python2
 else
 CRACKLIB_CONF_OPTS += --without-python
 endif
-- 
2.25.4
