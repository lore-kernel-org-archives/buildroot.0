From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 22:35:30 +0200
Subject: [Buildroot] [git commit] package: use SPDX short identifier for OFL
	license
Message-ID: <20170401203935.72C8F80125@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b06d055c113b2aca30163ea6961631c9817d090a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We want to use SPDX identifier for license string as much as possible.
SPDX short identifier for OFLv1.0/OFLv1.1 is OFL-1.0/OFL-1.1.

This change is done using following command.
find . -name "*.mk" | xargs sed -ri '/LICENSE( )?[\+:]?=/s/OFLv([1]\.[0-1])/OFL-\1/g'

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cantarell/cantarell.mk                     | 2 +-
 package/font-awesome/font-awesome.mk               | 2 +-
 package/googlefontdirectory/googlefontdirectory.mk | 2 +-
 package/inconsolata/inconsolata.mk                 | 2 +-
 package/liberation/liberation.mk                   | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/cantarell/cantarell.mk b/package/cantarell/cantarell.mk
index 3cdf600..2769b35 100644
--- a/package/cantarell/cantarell.mk
+++ b/package/cantarell/cantarell.mk
@@ -9,7 +9,7 @@ CANTARELL_VERSION = $(CANTARELL_VERSION_MAJOR).25
 CANTARELL_SITE = http://ftp.gnome.org/pub/gnome/sources/cantarell-fonts/$(CANTARELL_VERSION_MAJOR)
 CANTARELL_SOURCE = cantarell-fonts-$(CANTARELL_VERSION).tar.xz
 CANTARELL_DEPENDENCIES = host-pkgconf
-CANTARELL_LICENSE = OFLv1.1
+CANTARELL_LICENSE = OFL-1.1
 CANTARELL_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/font-awesome/font-awesome.mk b/package/font-awesome/font-awesome.mk
index 3d2ccca..8933783 100644
--- a/package/font-awesome/font-awesome.mk
+++ b/package/font-awesome/font-awesome.mk
@@ -6,7 +6,7 @@
 
 FONT_AWESOME_VERSION = v4.5.0
 FONT_AWESOME_SITE = $(call github,FortAwesome,Font-Awesome,$(FONT_AWESOME_VERSION))
-FONT_AWESOME_LICENSE = OFLv1.1 (font), MIT (CSS, LESS and Sass files)
+FONT_AWESOME_LICENSE = OFL-1.1 (font), MIT (CSS, LESS and Sass files)
 FONT_AWESOME_DIRECTORIES_LIST = css fonts less scss
 
 define FONT_AWESOME_INSTALL_TARGET_CMDS
diff --git a/package/googlefontdirectory/googlefontdirectory.mk b/package/googlefontdirectory/googlefontdirectory.mk
index 0e60892..c34de3b 100644
--- a/package/googlefontdirectory/googlefontdirectory.mk
+++ b/package/googlefontdirectory/googlefontdirectory.mk
@@ -7,7 +7,7 @@
 GOOGLEFONTDIRECTORY_SITE = \
 	https://s3.amazonaws.com/joemaller_google_webfonts
 GOOGLEFONTDIRECTORY_SOURCE = googlewebfonts.tgz
-GOOGLEFONTDIRECTORY_LICENSE = OFLv1.1
+GOOGLEFONTDIRECTORY_LICENSE = OFL-1.1
 
 GOOGLEFONTDIRECTORY_FONTS = \
 	$(call qstrip,$(BR2_PACKAGE_GOOGLEFONTDIRECTORY_FONTS))
diff --git a/package/inconsolata/inconsolata.mk b/package/inconsolata/inconsolata.mk
index 2f53b98..3fe3895 100644
--- a/package/inconsolata/inconsolata.mk
+++ b/package/inconsolata/inconsolata.mk
@@ -8,7 +8,7 @@ INCONSOLATA_VERSION = 001.010
 INCONSOLATA_SITE = http://snapshot.debian.org/archive/debian/20090524T155154Z/pool/main/t/ttf-inconsolata
 INCONSOLATA_SOURCE = ttf-inconsolata_$(INCONSOLATA_VERSION).orig.tar.gz
 INCONSOLATA_TARGET_DIR = $(TARGET_DIR)/usr/share/fonts/inconsolata
-INCONSOLATA_LICENSE = OFLv1.0
+INCONSOLATA_LICENSE = OFL-1.0
 INCONSOLATA_LICENSE_FILES = OFL.txt
 
 define INCONSOLATA_INSTALL_TARGET_CMDS
diff --git a/package/liberation/liberation.mk b/package/liberation/liberation.mk
index a77c014..cabee17 100644
--- a/package/liberation/liberation.mk
+++ b/package/liberation/liberation.mk
@@ -8,7 +8,7 @@ LIBERATION_VERSION = 2.00.1
 LIBERATION_SITE = https://releases.pagure.org/liberation-fonts
 LIBERATION_SOURCE = liberation-fonts-ttf-$(LIBERATION_VERSION).tar.gz
 LIBERATION_TARGET_DIR = $(TARGET_DIR)/usr/share/fonts/liberation
-LIBERATION_LICENSE = OFLv1.1
+LIBERATION_LICENSE = OFL-1.1
 LIBERATION_LICENSE_FILES = LICENSE
 
 ifeq ($(BR2_PACKAGE_LIBERATION_MONO),y)
