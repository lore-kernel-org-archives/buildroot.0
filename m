From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Feb 2015 00:19:02 +0100
Subject: [Buildroot] [git commit] libgtk2: ensure faq/tutorial isn't
	regenerated
Message-ID: <20150226212251.8316F8046C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=db2cbeee44867d6abe2349dad4be4c89b5af910f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As we don't need them, the tarball already contains generated documentation
and it fails to build with certain versions of db2html:

http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/65165

Reported-by: Justin Swartz <justin.swartz@nym.hush.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgtk2/libgtk2.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index dfc1f5b..f52dfaf 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -69,7 +69,8 @@ LIBGTK2_CONF_ENV = \
 	ac_cv_path_GTK_UPDATE_ICON_CACHE=$(HOST_DIR)/usr/bin/gtk-update-icon-cache \
 	ac_cv_path_GDK_PIXBUF_CSOURCE=$(HOST_DIR)/usr/bin/gdk-pixbuf-csource \
 	ac_cv_prog_F77=no \
-	ac_cv_path_CUPS_CONFIG=no
+	ac_cv_path_CUPS_CONFIG=no \
+	DB2HTML=false
 
 LIBGTK2_CONF_OPTS = --disable-glibtest --enable-explicit-deps=no
 
