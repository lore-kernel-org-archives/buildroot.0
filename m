From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Aug 2019 19:24:28 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/libgtk2: fix
 build with NLS
Message-ID: <20190804201500.3128D8E430@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=011eec29a4b11ad7cea8e3048f570dc47760e91c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Fixes:
 - http://autobuild.buildroot.org/results/20644475a745c04fec4a87c639bd13e4f333805a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 81c126bc8ff15e0356510626169cc05482e5bd1e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgtk2/libgtk2.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index 8f60573a5e..710e6e47db 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -21,7 +21,10 @@ LIBGTK2_CONF_ENV = \
 
 LIBGTK2_CONF_OPTS = --disable-glibtest --enable-explicit-deps=no
 
-LIBGTK2_DEPENDENCIES = host-pkgconf host-libgtk2 libglib2 cairo pango atk gdk-pixbuf
+LIBGTK2_DEPENDENCIES = host-pkgconf host-libgtk2 libglib2 cairo pango atk \
+	gdk-pixbuf $(TARGET_NLS_DEPENDENCIES)
+
+LIBGTK2_MAKE_OPTS = LIBS=$(TARGET_NLS_LIBS)
 
 # Xorg dependencies
 LIBGTK2_CONF_OPTS += \
