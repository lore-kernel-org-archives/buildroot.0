From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Sun, 14 Oct 2007 02:13:56 +0300
Subject: [Buildroot] PATCH: xerces - provide correct URL and make compile
 not only for x86
Message-ID: <47115134.3070103@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

xerces: - provide correct URL and make compile not only for x86:

Index: package/xerces/xerces.mk
===================================================================
--- package/xerces/xerces.mk    (revision 20237)
+++ package/xerces/xerces.mk    (working copy)
@@ -3,12 +3,12 @@
 # xerces
 #
 #############################################################
-XERCES_VERSION:=2.7.0
-XERCES_SOURCE:=xerces-c-src_2_7_0.tar.gz
-XERCES_SITE:=http://www.apache.org/dist/xml/xerces-c/source/
+XERCES_VERSION:=2.8.0
+XERCES_SOURCE:=xerces-c-src_2_8_0.tar.gz
+XERCES_SITE:=http://www.apache.org/dist/xml/xerces-c/sources/
 XERCES_CAT:=$(ZCAT)
-XERCES_DIR:=$(BUILD_DIR)/xerces-c-src_2_7_0
-XERCES_BINARY:=lib/libxerces-c.so.27.0
+XERCES_DIR:=$(BUILD_DIR)/xerces-c-src_2_8_0
+XERCES_BINARY:=lib/libxerces-c.so.28.0

 $(DL_DIR)/$(XERCES_SOURCE):
         $(WGET) -P $(DL_DIR) $(XERCES_SITE)/$(XERCES_SOURCE)
@@ -26,7 +26,7 @@
                XERCESCROOT=$(XERCES_DIR) \
                ./runConfigure -plinux -minmem \
                -nsocket -tnative -rpthread \
-               -c$(TARGET_CC) -x$(TARGET_CXX) \
+               -C$(TARGET_CONFIGURE_ARGS)-c$(TARGET_CC) -x$(TARGET_CXX) \
        )
        touch $(XERCES_DIR)/.configured

@@ -40,8 +40,8 @@
 $(TARGET_DIR)/usr/$(XERCES_BINARY): $(STAGING_DIR)/$(XERCES_BINARY)
        cp -a $(STAGING_DIR)/lib/libxerces-c.so* $(TARGET_DIR)/usr/lib
        cp -a $(STAGING_DIR)/lib/libxerces-depdom.so* $(TARGET_DIR)/usr/lib
-       $(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libxerces-c.so.27.0
-       $(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libxerces-depdom.so.27.0
+       $(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libxerces-c.so.28.0
+       $(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libxerces-depdom.so.28.0

 xerces: uclibc $(TARGET_DIR)/usr/$(XERCES_BINARY)


-- 
Best regards,
Ivan
--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
