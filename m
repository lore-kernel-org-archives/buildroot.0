From: Ryan Hajdaj <rhajdaj@yahoo.com>
Date: Fri, 5 Dec 2008 04:52:21 -0800 (PST)
Subject: [Buildroot] "find -delete" command
Message-ID: <446097.42813.qm@web31813.mail.mud.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I'd like to request that the following change be made to the top-level buildroot Makefile (lines 340 to 343 of the 20081205 version). This is mainly for portability, as the -delete option is not recognized by earlier versions of the find command.

--- Makefile    2008-12-05 03:15:46.000000000 -0500
+++ Makefile.new        2008-12-05 06:08:53.000000000 -0500
@@ -337,10 +337,10 @@
        ( scripts/copy.sh $(STAGING_DIR) $(TARGET_DIR) )
 else
        rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/lib/pkgconfig
-       find $(TARGET_DIR)/usr/lib -name '*.a' -delete
-       find $(TARGET_DIR)/lib -name '*.a' -delete
-       find $(TARGET_DIR)/usr/lib -name '*.la' -delete
-       find $(TARGET_DIR)/lib -name '*.la' -delete
+       find $(TARGET_DIR)/usr/lib -name '*.a' -exec rm {} \;
+       find $(TARGET_DIR)/lib -name '*.a' -exec rm {} \;
+       find $(TARGET_DIR)/usr/lib -name '*.la' -exec rm {} \;
+       find $(TARGET_DIR)/lib -name '*.la' -exec rm {} \;
 endif


Note: This change also applies to the following files:
.svn/text-base/Makefile.svn-base
package/x11r7/xapp_xman/xapp_xman.mk
package/x11r7/xapp_xman/.svn/text-base/xapp_xman.mk.svn-base
package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
package/x11r7/xdata_xcursor-themes/.svn/text-base/xdata_xcursor-themes.mk.svn-base



      
