From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 14:40:45 +0200
Subject: [Buildroot] [git commit] librsvg: add host variant
Message-ID: <20150419124107.8B11A7FD0D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ceb184f3db0f6978bf80a4bcebdc15165f97bc81
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Required by the midori build process (rsvg-convert).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/librsvg/librsvg.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
index 674dca4..5c385dc 100644
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -10,6 +10,7 @@ LIBRSVG_SITE = http://ftp.gnome.org/pub/GNOME/sources/librsvg/$(LIBRSVG_VERSION_
 LIBRSVG_INSTALL_STAGING = YES
 LIBRSVG_CONF_OPTS = --disable-tools
 LIBRSVG_DEPENDENCIES = libxml2 cairo pango libglib2 gdk-pixbuf
+HOST_LIBRSVG_DEPENDENCIES = host-libxml2 host-cairo host-pango host-libglib2 host-gdk-pixbuf
 LIBRSVG_LICENSE = LGPLv2+
 LIBRSVG_LICENSE_FILES = COPYING.LIB
 
@@ -20,3 +21,4 @@ LIBRSVG_DEPENDENCIES += libgtk2
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
