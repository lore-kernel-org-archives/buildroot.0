From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 11 Jan 2020 14:24:24 +0100
Subject: [Buildroot] [PATCH v2, 1/1] package/poppler: bump to version 0.84.0
Message-ID: <20200111132424.1086617-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Drop USE_FIXEDPOINT, remove since version 0.80.0 and
  https://gitlab.freedesktop.org/poppler/poppler/commit/5b81ab6ce06f60daa63029a3eb12cd31d6852799
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Fix trailing whitespace in poppler.hash

 package/poppler/poppler.hash | 3 ++-
 package/poppler/poppler.mk   | 6 +++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/poppler/poppler.hash b/package/poppler/poppler.hash
index 2d01754f5c..a06def6653 100644
--- a/package/poppler/poppler.hash
+++ b/package/poppler/poppler.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 7267eb4cbccd64a58244b8211603c1c1b6bf32c7f6a4ced2642865346102f36b  poppler-0.77.0.tar.xz
+sha256 c7a130da743b38a548f7a21fe5940506fb1949f4ebdd3209f0e5b302fa139731  poppler-0.84.0.tar.xz
+sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index ffa65f68ce..e452c2336d 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POPPLER_VERSION = 0.77.0
+POPPLER_VERSION = 0.84.0
 POPPLER_SOURCE = poppler-$(POPPLER_VERSION).tar.xz
 POPPLER_SITE = http://poppler.freedesktop.org
 POPPLER_DEPENDENCIES = fontconfig host-pkgconf
@@ -108,9 +108,9 @@ POPPLER_CONF_OPTS += -DWITH_NSS3=OFF
 endif
 
 ifeq ($(BR2_SOFT_FLOAT),y)
-POPPLER_CONF_OPTS += -USE_FIXEDPOINT=ON -DUSE_FLOAT=OFF
+POPPLER_CONF_OPTS += -DUSE_FLOAT=OFF
 else
-POPPLER_CONF_OPTS += -USE_FIXEDPOINT=OFF -DUSE_FLOAT=ON
+POPPLER_CONF_OPTS += -DUSE_FLOAT=ON
 endif
 
 $(eval $(cmake-package))
-- 
2.24.1
