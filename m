From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Oct 2016 15:17:19 +0200
Subject: [Buildroot] [git commit] adwaita-icon-theme: install to staging
Message-ID: <20161028131722.54C0B81836@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1eedbe2d601ee5de8dc6aa3894b416f5235adcb0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is required for the upcoming evince package which checks for adwaita
presence via pkgconfig file, which normally resides in staging.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/adwaita-icon-theme/adwaita-icon-theme.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/adwaita-icon-theme/adwaita-icon-theme.mk b/package/adwaita-icon-theme/adwaita-icon-theme.mk
index b9ec0c0..fdf66c8 100644
--- a/package/adwaita-icon-theme/adwaita-icon-theme.mk
+++ b/package/adwaita-icon-theme/adwaita-icon-theme.mk
@@ -8,6 +8,7 @@ ADWAITA_ICON_THEME_VERSION_MAJOR = 3.22
 ADWAITA_ICON_THEME_VERSION = $(ADWAITA_ICON_THEME_VERSION_MAJOR).0
 ADWAITA_ICON_THEME_SITE = http://ftp.gnome.org/pub/gnome/sources/adwaita-icon-theme/$(ADWAITA_ICON_THEME_VERSION_MAJOR)
 ADWAITA_ICON_THEME_SOURCE = adwaita-icon-theme-$(ADWAITA_ICON_THEME_VERSION).tar.xz
+ADWAITA_ICON_THEME_INSTALL_STAGING = YES
 ADWAITA_ICON_THEME_LICENSE = LGPLv3 or CC-BY-SA-3.0
 ADWAITA_ICON_THEME_LICENSE_FILES = COPYING COPYING_LGPL COPYING_CCBYSA3
 ADWAITA_ICON_THEME_DEPENDENCIES = host-intltool host-libgtk3
