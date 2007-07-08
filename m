From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Sun, 8 Jul 2007 15:49:03 +0200 (CEST)
Subject: [Buildroot] curl needs more love too
Message-ID: <0707081547390.3987@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Index: package/curl/curl.mk
===================================================================
--- package/curl/curl.mk	(revision 19036)
+++ package/curl/curl.mk	(working copy)
@@ -3,7 +3,7 @@
 # curl
 #
 #############################################################
-CURL_VERSION:=7.13.1
+CURL_VERSION:=7.16.3
 CURL_SOURCE:=curl-$(CURL_VERSION).tar.bz2
 CURL_SITE:=http://curl.haxx.se/download/
 CURL_CAT:=$(BZCAT)
@@ -17,7 +17,7 @@

 $(CURL_DIR)/.unpacked: $(DL_DIR)/$(CURL_SOURCE)
 	$(CURL_CAT) $(DL_DIR)/$(CURL_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(CURL_DIR) package/curl/ \*.patch*
+	toolchain/patch-kernel.sh $(CURL_DIR) package/curl curl-$(CURL_VERSION)-\*.patch*
 	touch $(CURL_DIR)/.unpacked

 $(CURL_DIR)/.configured: $(CURL_DIR)/.unpacked


-- 
Cristian
