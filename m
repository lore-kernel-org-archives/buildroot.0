From: Aaron Sierra <asierra@xes-inc.com>
Date: Mon, 13 Jul 2020 13:47:51 -0500
Subject: [Buildroot] [PATCH RESEND 2/2] package/x11r7/xfont_font-*: make
 outputs reproducible
In-Reply-To: <20200713184751.23534-1-asierra@xes-inc.com>
References: <20200713184751.23534-1-asierra@xes-inc.com>
Message-ID: <20200713184751.23534-3-asierra@xes-inc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The default gzip compression of Portable Compiled Format fonts makes the
output of these packages non-reproducible. This is because gzip defaults
to using the -N option, which embeds the timestamp of the original file
within the compressed copy.

The other options, compress (.Z); bzip2; and none, are all reproducible.

This makes bzip2 the default compression for PCF fonts.

Reported-by: Jordan Speicher <jspeicher@xes-inc.com>
Signed-off-by: Aaron Sierra <asierra@xes-inc.com>
---
 package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk | 1 +
 package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk   | 1 +
 .../xfont_font-adobe-utopia-100dpi.mk                            | 1 +
 .../xfont_font-adobe-utopia-75dpi.mk                             | 1 +
 package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk   | 1 +
 package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk       | 1 +
 package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk         | 1 +
 .../xfont_font-bh-lucidatypewriter-100dpi.mk                     | 1 +
 .../xfont_font-bh-lucidatypewriter-75dpi.mk                      | 1 +
 .../xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk   | 1 +
 .../xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk     | 1 +
 .../xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk     | 1 +
 package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk   | 1 +
 package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk   | 1 +
 package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk         | 1 +
 package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk       | 1 +
 package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk         | 1 +
 package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk     | 1 +
 .../x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk   | 1 +
 package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk       | 1 +
 package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk       | 1 +
 .../xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk     | 1 +
 .../xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk     | 1 +
 package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk       | 1 +
 package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk         | 1 +
 .../xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk | 1 +
 26 files changed, 26 insertions(+)

diff --git a/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk b/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
index bc05a2165c..544ff87922 100644
--- a/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
+++ b/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
@@ -10,6 +10,7 @@ XFONT_FONT_ADOBE_100DPI_SITE = http://xorg.freedesktop.org/releases/individual/f
 XFONT_FONT_ADOBE_100DPI_LICENSE = MIT
 XFONT_FONT_ADOBE_100DPI_LICENSE_FILES = COPYING
 
+XFONT_FONT_ADOBE_100DPI_CONF_OPTS = --with-compression=bzip2
 XFONT_FONT_ADOBE_100DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_ADOBE_100DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_ADOBE_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk b/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
index f77c1706cd..b17b5dd721 100644
--- a/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
+++ b/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
@@ -10,6 +10,7 @@ XFONT_FONT_ADOBE_75DPI_SITE = http://xorg.freedesktop.org/releases/individual/fo
 XFONT_FONT_ADOBE_75DPI_LICENSE = MIT
 XFONT_FONT_ADOBE_75DPI_LICENSE_FILES = COPYING
 
+XFONT_FONT_ADOBE_75DPI_CONF_OPTS = --with-compression=bzip2
 XFONT_FONT_ADOBE_75DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_ADOBE_75DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_ADOBE_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk b/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
index 1c157dd4cf..51c7c292c0 100644
--- a/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
+++ b/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
@@ -10,6 +10,7 @@ XFONT_FONT_ADOBE_UTOPIA_100DPI_SITE = http://xorg.freedesktop.org/releases/indiv
 XFONT_FONT_ADOBE_UTOPIA_100DPI_LICENSE = Adobe License (no modification allowed)
 XFONT_FONT_ADOBE_UTOPIA_100DPI_LICENSE_FILES = COPYING
 
+XFONT_FONT_ADOBE_UTOPIA_100DPI_CONF_OPTS = --with-compression=bzip2
 XFONT_FONT_ADOBE_UTOPIA_100DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_ADOBE_UTOPIA_100DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_ADOBE_UTOPIA_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk b/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
index cd60b34fce..0c6d57e470 100644
--- a/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
+++ b/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
@@ -10,6 +10,7 @@ XFONT_FONT_ADOBE_UTOPIA_75DPI_SITE = http://xorg.freedesktop.org/releases/indivi
 XFONT_FONT_ADOBE_UTOPIA_75DPI_LICENSE = Adobe License (no modification allowed)
 XFONT_FONT_ADOBE_UTOPIA_75DPI_LICENSE_FILES = COPYING
 
+XFONT_FONT_ADOBE_UTOPIA_75DPI_CONF_OPTS = --with-compression=bzip2
 XFONT_FONT_ADOBE_UTOPIA_75DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_ADOBE_UTOPIA_75DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_ADOBE_UTOPIA_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk b/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
index e8f6f3d2e6..66b822c4d7 100644
--- a/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
+++ b/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
@@ -10,6 +10,7 @@ XFONT_FONT_ARABIC_MISC_SITE = http://xorg.freedesktop.org/releases/individual/fo
 XFONT_FONT_ARABIC_MISC_LICENSE = MIT
 XFONT_FONT_ARABIC_MISC_LICENSE_FILES = COPYING
 
+XFONT_FONT_ARABIC_MISC_CONF_OPTS = --with-compression=bzip2
 XFONT_FONT_ARABIC_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_ARABIC_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_ARABIC_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk b/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
index d1176d54e5..fa9cf94a6d 100644
--- a/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
+++ b/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
@@ -10,6 +10,7 @@ XFONT_FONT_BH_100DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_BH_100DPI_LICENSE = Bigelow & Holmes License (no modification)
 XFONT_FONT_BH_100DPI_LICENSE_FILES = COPYING
 
+XFONT_FONT_BH_100DPI_CONF_OPTS = --with-compression=bzip2
 XFONT_FONT_BH_100DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_BH_100DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_BH_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk b/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
index 5b05f5f797..8e09c70ea3 100644
--- a/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
+++ b/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
@@ -10,6 +10,7 @@ XFONT_FONT_BH_75DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_BH_75DPI_LICENSE = Bigelow & Holmes License (no modification)
 XFONT_FONT_BH_75DPI_LICENSE_FILES = COPYING
 
+XFONT_FONT_BH_75DPI_CONF_OPTS = --with-compression=bzip2
 XFONT_FONT_BH_75DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_BH_75DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_BH_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk b/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
index 4afec6ce69..d54486ee88 100644
--- a/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
+++ b/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
@@ -10,6 +10,7 @@ XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_SITE = http://xorg.freedesktop.org/release
 XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_LICENSE = Bigelow & Holmes License (no modification)
 XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_LICENSE_FILES = COPYING
 
+XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_CONF_OPTS = --with-compression=bzip2
 XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk b/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
index 7a36c11053..1518be3a57 100644
--- a/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
+++ b/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
@@ -10,6 +10,7 @@ XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_SITE = http://xorg.freedesktop.org/releases
 XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_LICENSE = Bigelow & Holmes License (no modification)
 XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_LICENSE_FILES = COPYING
 
+XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_CONF_OPTS = --with-compression=bzip2
 XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk b/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
index 9812ddc1b7..3db1f2d2f7 100644
--- a/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
+++ b/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
@@ -10,6 +10,7 @@ XFONT_FONT_BITSTREAM_100DPI_SITE = http://xorg.freedesktop.org/releases/individu
 XFONT_FONT_BITSTREAM_100DPI_LICENSE = MIT
 XFONT_FONT_BITSTREAM_100DPI_LICENSE_FILES = COPYING
 
+XFONT_FONT_BITSTREAM_100DPI_CONF_OPTS = --with-compression=bzip2
 XFONT_FONT_BITSTREAM_100DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_BITSTREAM_100DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_BITSTREAM_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk b/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
index 91dfeb2ac8..0528a7a725 100644
--- a/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
+++ b/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
@@ -10,6 +10,7 @@ XFONT_FONT_BITSTREAM_75DPI_SITE = http://xorg.freedesktop.org/releases/individua
 XFONT_FONT_BITSTREAM_75DPI_LICENSE = MIT
 XFONT_FONT_BITSTREAM_75DPI_LICENSE_FILES = COPYING
 
+XFONT_FONT_BITSTREAM_75DPI_CONF_OPTS = --with-compression=bzip2
 XFONT_FONT_BITSTREAM_75DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_BITSTREAM_75DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_BITSTREAM_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk b/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
index 28329a36bb..d13e9e6a38 100644
--- a/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
+++ b/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
@@ -10,6 +10,7 @@ XFONT_FONT_CRONYX_CYRILLIC_SITE = http://xorg.freedesktop.org/releases/individua
 XFONT_FONT_CRONYX_CYRILLIC_LICENSE = MIT
 XFONT_FONT_CRONYX_CYRILLIC_LICENSE_FILES = COPYING
 
+XFONT_FONT_CRONYX_CYRILLIC_CONF_OPTS = --with-compression=bzip2
 XFONT_FONT_CRONYX_CYRILLIC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_CRONYX_CYRILLIC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_CRONYX_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk b/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
index 9e8852aeee..76e34f6224 100644
--- a/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
+++ b/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
@@ -10,6 +10,7 @@ XFONT_FONT_CURSOR_MISC_SITE = http://xorg.freedesktop.org/releases/individual/fo
 XFONT_FONT_CURSOR_MISC_LICENSE = unencumbered
 XFONT_FONT_CURSOR_MISC_LICENSE_FILES = COPYING
 
+XFONT_FONT_CURSOR_MISC_CONF_OPTS = --with-compression=bzip2
 XFONT_FONT_CURSOR_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_CURSOR_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_CURSOR_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk b/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
index f591b8b80b..07d190af65 100644
--- a/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
+++ b/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
@@ -9,6 +9,7 @@ XFONT_FONT_DAEWOO_MISC_SOURCE = font-daewoo-misc-$(XFONT_FONT_DAEWOO_MISC_VERSIO
 XFONT_FONT_DAEWOO_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_DAEWOO_MISC_LICENSE_FILES = COPYING
 
+XFONT_FONT_DAEWOO_MISC_CONF_OPTS = --with-compression=bzip2
 XFONT_FONT_DAEWOO_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_DAEWOO_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_DAEWOO_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk b/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
index 10d24c6c57..2f61e3af86 100644
--- a/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
+++ b/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
@@ -10,6 +10,7 @@ XFONT_FONT_DEC_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_DEC_MISC_LICENSE = MIT
 XFONT_FONT_DEC_MISC_LICENSE_FILES = COPYING
 
+XFONT_FONT_DEC_MISC_CONF_OPTS = --with-compression=bzip2
 XFONT_FONT_DEC_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_DEC_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_DEC_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk b/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
index 721f93d80f..402762094b 100644
--- a/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
+++ b/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
@@ -10,6 +10,7 @@ XFONT_FONT_ISAS_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_ISAS_MISC_LICENSE = MIT
 XFONT_FONT_ISAS_MISC_LICENSE_FILES = COPYING
 
+XFONT_FONT_ISAS_MISC_CONF_OPTS = --with-compression=bzip2
 XFONT_FONT_ISAS_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_ISAS_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_ISAS_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk b/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
index 1736aed179..e4e532de17 100644
--- a/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
+++ b/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
@@ -9,6 +9,7 @@ XFONT_FONT_JIS_MISC_SOURCE = font-jis-misc-$(XFONT_FONT_JIS_MISC_VERSION).tar.bz
 XFONT_FONT_JIS_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_JIS_MISC_LICENSE_FILES = COPYING
 
+XFONT_FONT_JIS_MISC_CONF_OPTS = --with-compression=bzip2
 XFONT_FONT_JIS_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_JIS_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_JIS_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk b/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
index 60105427df..f99ffbeb5f 100644
--- a/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
+++ b/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
@@ -10,6 +10,7 @@ XFONT_FONT_MICRO_MISC_SITE = http://xorg.freedesktop.org/releases/individual/fon
 XFONT_FONT_MICRO_MISC_LICENSE = Public Domain
 XFONT_FONT_MICRO_MISC_LICENSE_FILES = COPYING
 
+XFONT_FONT_MICRO_MISC_CONF_OPTS = --with-compression=bzip2
 XFONT_FONT_MICRO_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_MICRO_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_MICRO_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk b/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
index 2263972084..070727807b 100644
--- a/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
+++ b/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
@@ -10,6 +10,7 @@ XFONT_FONT_MISC_CYRILLIC_SITE = http://xorg.freedesktop.org/releases/individual/
 XFONT_FONT_MISC_CYRILLIC_LICENSE = MIT / Public Domain
 XFONT_FONT_MISC_CYRILLIC_LICENSE_FILES = COPYING
 
+XFONT_FONT_MISC_CYRILLIC_CONF_OPTS = --with-compression=bzip2
 XFONT_FONT_MISC_CYRILLIC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_MISC_CYRILLIC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_MISC_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk b/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
index dd62f05026..92b5f9e865 100644
--- a/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
+++ b/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
@@ -10,6 +10,7 @@ XFONT_FONT_MISC_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_MISC_MISC_LICENSE = Public Domain
 XFONT_FONT_MISC_MISC_LICENSE_FILES = COPYING
 
+XFONT_FONT_MISC_MISC_CONF_OPTS = --with-compression=bzip2
 XFONT_FONT_MISC_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_MISC_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_MISC_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk b/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
index 475fc68b2a..c3fffede0f 100644
--- a/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
+++ b/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
@@ -10,6 +10,7 @@ XFONT_FONT_MUTT_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_MUTT_MISC_LICENSE = MIT
 XFONT_FONT_MUTT_MISC_LICENSE_FILES = COPYING
 
+XFONT_FONT_MUTT_MISC_CONF_OPTS = --with-compression=bzip2
 XFONT_FONT_MUTT_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_MUTT_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_MUTT_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk b/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
index b50ed57688..bffe842921 100644
--- a/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
+++ b/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
@@ -10,6 +10,7 @@ XFONT_FONT_SCHUMACHER_MISC_SITE = http://xorg.freedesktop.org/releases/individua
 XFONT_FONT_SCHUMACHER_MISC_LICENSE = MIT
 XFONT_FONT_SCHUMACHER_MISC_LICENSE_FILES = COPYING
 
+XFONT_FONT_SCHUMACHER_MISC_CONF_OPTS = --with-compression=bzip2
 XFONT_FONT_SCHUMACHER_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_SCHUMACHER_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_SCHUMACHER_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk b/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
index dd444594ed..ed4d77c58a 100644
--- a/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
+++ b/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
@@ -10,6 +10,7 @@ XFONT_FONT_SCREEN_CYRILLIC_SITE = http://xorg.freedesktop.org/releases/individua
 XFONT_FONT_SCREEN_CYRILLIC_LICENSE = MIT
 XFONT_FONT_SCREEN_CYRILLIC_LICENSE_FILES = COPYING
 
+XFONT_FONT_SCREEN_CYRILLIC_CONF_OPTS = --with-compression=bzip2
 XFONT_FONT_SCREEN_CYRILLIC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_SCREEN_CYRILLIC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_SCREEN_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk b/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
index ae4444e597..0ad1140c3f 100644
--- a/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
+++ b/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
@@ -10,6 +10,7 @@ XFONT_FONT_SONY_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_SONY_MISC_LICENSE = MIT
 XFONT_FONT_SONY_MISC_LICENSE_FILES = COPYING
 
+XFONT_FONT_SONY_MISC_CONF_OPTS = --with-compression=bzip2
 XFONT_FONT_SONY_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_SONY_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_SONY_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk b/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
index c1e2dac72e..1c9d217f22 100644
--- a/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
+++ b/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
@@ -10,6 +10,7 @@ XFONT_FONT_SUN_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_SUN_MISC_LICENSE = MIT
 XFONT_FONT_SUN_MISC_LICENSE_FILES = COPYING
 
+XFONT_FONT_SUN_MISC_CONF_OPTS = --with-compression=bzip2
 XFONT_FONT_SUN_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_SUN_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_SUN_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
diff --git a/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk b/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
index 8e83d44665..22f5fdf02d 100644
--- a/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
+++ b/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
@@ -10,6 +10,7 @@ XFONT_FONT_WINITZKI_CYRILLIC_SITE = http://xorg.freedesktop.org/releases/individ
 XFONT_FONT_WINITZKI_CYRILLIC_LICENSE = Public Domain
 XFONT_FONT_WINITZKI_CYRILLIC_LICENSE_FILES = COPYING
 
+XFONT_FONT_WINITZKI_CYRILLIC_CONF_OPTS = --with-compression=bzip2
 XFONT_FONT_WINITZKI_CYRILLIC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_WINITZKI_CYRILLIC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_WINITZKI_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
-- 
2.17.1
