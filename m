From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Sun, 22 Mar 2015 16:10:45 +0200
Subject: [Buildroot] [PATCH 4/8] package/poppler: bump version to 0.32.0
In-Reply-To: <1427033449-20179-1-git-send-email-olivier.schonken@gmail.com>
References: <1427033449-20179-1-git-send-email-olivier.schonken@gmail.com>
Message-ID: <1427033449-20179-4-git-send-email-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
 package/poppler/poppler.hash | 2 +-
 package/poppler/poppler.mk   | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/poppler/poppler.hash b/package/poppler/poppler.hash
index f3225bc..c4c7f66 100644
--- a/package/poppler/poppler.hash
+++ b/package/poppler/poppler.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	a2654910100c923c44e366242495e226db2798254f2fa2781138867348759f84	poppler-0.24.5.tar.xz
+sha256	4963e31ba5e17530a87b16588e22928bc044e8d28d02303dded981bff6725b98	poppler-0.32.0.tar.xz
diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 2ac7e64..bb18a0b 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -4,14 +4,15 @@
 #
 ################################################################################
 
-POPPLER_VERSION = 0.24.5
+POPPLER_VERSION = 0.32.0
 POPPLER_SOURCE = poppler-$(POPPLER_VERSION).tar.xz
 POPPLER_SITE = http://poppler.freedesktop.org
-POPPLER_DEPENDENCIES = fontconfig
+POPPLER_DEPENDENCIES = fontconfig openjpeg
 POPPLER_LICENSE = GPLv2+
 POPPLER_LICENSE_FILES = COPYING
 POPPLER_INSTALL_STAGING = YES
-POPPLER_CONF_OPTS = --with-font-configuration=fontconfig
+POPPLER_CONF_OPTS = 	--with-font-configuration=fontconfig \
+			--enable-xpdf-headers
 
 ifeq ($(BR2_PACKAGE_LCMS2),y)
 	POPPLER_CONF_OPTS += --enable-cms=lcms2
-- 
1.9.1
