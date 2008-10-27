From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 27 Oct 2008 02:45:35 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/pango
Message-ID: <20081027094535.1193D3C6A2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-27 02:45:34 -0700 (Mon, 27 Oct 2008)
New Revision: 23809

Log:
Fix strange problems in pango configure target

The configure target of pango had strange characters in it, preventing
compilation to work. Remove them, they just seem to be mistakes.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Modified:
   trunk/buildroot/package/pango/pango.mk


Changeset:
Modified: trunk/buildroot/package/pango/pango.mk
===================================================================
--- trunk/buildroot/package/pango/pango.mk	2008-10-27 08:27:43 UTC (rev 23808)
+++ trunk/buildroot/package/pango/pango.mk	2008-10-27 09:45:34 UTC (rev 23809)
@@ -39,9 +39,9 @@
 		am_getline_needs_run_time_check=no am_cv_func_working_getline=yes \
 		gl_cv_func_mkdir_trailing_slash_bug=no gl_cv_func_mkstemp_limitations=no \
 		ac_cv_func_working_mktime=yes jm_cv_func_working_re_compile_pattern=yes \
-		ac_use_included_regex=no gl_cv_c_restrict=no)" \
+		ac_use_included_regex=no gl_cv_c_restrict=no \
 		ac_cv_path_GLIB_GENMARSHAL=$(HOST_GLIB)/bin/glib-genmarshal ac_cv_path_FREETYPE_CONFIG=$(STAGING_DIR)/usr/bin/freetype-config
-		
+
 ifneq ($(BR2_PACKAGE_XSERVER_none),y)
         PANGO_CONF_OPT_X = --with-x \
 		--x-includes=$(STAGING_DIR)/usr/include/X11 \
