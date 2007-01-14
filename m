From: andersen at uclibc.org <andersen@uclibc.org>
Date: Sun, 14 Jan 2007 15:27:26 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libgtk2
Message-ID: <20070114232726.D964D48614@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-01-14 15:27:26 -0800 (Sun, 14 Jan 2007)
New Revision: 17310

Log:
oops, embed $(STAGING_DIR) rather than hard coding my home dir...


Modified:
   trunk/buildroot/package/libgtk2/libgtk2.mk


Changeset:
Modified: trunk/buildroot/package/libgtk2/libgtk2.mk
===================================================================
--- trunk/buildroot/package/libgtk2/libgtk2.mk	2007-01-14 23:26:15 UTC (rev 17309)
+++ trunk/buildroot/package/libgtk2/libgtk2.mk	2007-01-14 23:27:26 UTC (rev 17310)
@@ -88,7 +88,7 @@
 	# I dont yet understand why configure is not doing this right
 	# TODO: also remove 'odd-include-problem.patch' when this is fixed
 	$(SED) "s,^GDK_DEP_CFLAGS=.*,GDK_DEP_CFLAGS=\'-pthread -I$(STAGING_DIR)/include/glib-2.0 -I$(STAGING_DIR)/lib/glib-2.0/include -I$(STAGING_DIR)/include/pango-1.0 -I$(STAGING_DIR)/include/cairo\',g" $(LIBGTK2_DIR)/configure
-	$(SED) "s,^GDK_DEP_LIBS=.*,GDK_DEP_LIBS=\'-L/home/andersen/SVN/buildroot/build_i686/staging_dir/lib -lpangocairo-1.0 -lpango-1.0 -lcairo -lgobject-2.0 -lgmodule-2.0 -ldl -lglib-2.0 -lfontconfig -lXext -lXrender -lX11 -lXinerama -lXrandr -lXcursor -lXfixes -lXft -lm\',g" $(LIBGTK2_DIR)/configure
+	$(SED) "s,^GDK_DEP_LIBS=.*,GDK_DEP_LIBS=\'-L$(STAGING_DIR)/lib -lpangocairo-1.0 -lpango-1.0 -lcairo -lgobject-2.0 -lgmodule-2.0 -ldl -lglib-2.0 -lfontconfig -lXext -lXrender -lX11 -lXinerama -lXrandr -lXcursor -lXfixes -lXft -lm\',g" $(LIBGTK2_DIR)/configure
 	(cd $(LIBGTK2_DIR); rm -rf config.cache; \
 		$(LIBGTK2_BUILD_ENV) \
 		./configure \
