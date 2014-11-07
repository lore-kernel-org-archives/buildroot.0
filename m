From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 7 Nov 2014 09:04:17 +0100
Subject: [Buildroot] [git commit] gdk-pixbuf: host variant needs pkgconfig
	and libglib2 just like target variant
Message-ID: <20141107080632.DAF42B2630@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fc90517b55b6030dbf0bc6686bae4dd01ffff114
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

http://autobuild.buildroot.net/results/576/576d110cb02a8bc655e227bd949bb58ae39c2e38/
http://autobuild.buildroot.net/results/c48/c487a1fff7c74218a31024074aa2fd6255b6d09f/
http://autobuild.buildroot.net/results/b28/b282b7e7a9e3e5a8334d593be9092746509d4702/
http://autobuild.buildroot.net/results/dee/dee288268d81cc19fe685b32d68036b596af260e/

And many more.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdk-pixbuf/gdk-pixbuf.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index a4e3af0..61e7ae9 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -58,6 +58,6 @@ HOST_GDK_PIXBUF_CONF_OPTS = \
 	--without-libjpeg \
 	--without-libtiff
 
-HOST_GDK_PIXBUF_DEPENDENCIES = host-libpng
+HOST_GDK_PIXBUF_DEPENDENCIES = host-libpng host-pkgconf host-libglib2
 
 $(eval $(host-autotools-package))
