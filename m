From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 19 Apr 2015 06:48:21 -0300
Subject: [Buildroot] [PATCH v3 06/11] librsvg: add host variant
In-Reply-To: <1429436906-15222-1-git-send-email-gustavo@zacarias.com.ar>
References: <1429436906-15222-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1429436906-15222-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Required by the midori build process (rsvg-convert).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/librsvg/librsvg.mk | 2 ++
 1 file changed, 2 insertions(+)

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
-- 
2.0.5
