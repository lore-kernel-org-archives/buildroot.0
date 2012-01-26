From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jan 2012 13:51:30 -0300
Subject: [Buildroot] [PATCH 11/13] libpcap: bump to version 1.2.1
In-Reply-To: <1327596692-30728-1-git-send-email-gustavo@zacarias.com.ar>
References: <1327596692-30728-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1327596692-30728-11-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libpcap/libpcap.mk |   15 +++++++--------
 1 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 6b44e49..0b88a42 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -4,18 +4,17 @@
 #
 #############################################################
 
-LIBPCAP_VERSION:=1.1.1
-LIBPCAP_SITE:=http://www.tcpdump.org/release
-LIBPCAP_SOURCE:=libpcap-$(LIBPCAP_VERSION).tar.gz
-LIBPCAP_INSTALL_STAGING:=YES
+LIBPCAP_VERSION = 1.2.1
+LIBPCAP_SITE = http://www.tcpdump.org/release
+LIBPCAP_INSTALL_STAGING = YES
 # doesn't have an install-strip
 LIBPCAP_INSTALL_TARGET_OPT= DESTDIR="$(TARGET_DIR)" \
 	$(if $(BR2_PREFER_STATIC_LIB),install,install-shared)
 LIBPCAP_INSTALL_STAGING_OPT= DESTDIR="$(STAGING_DIR)" install \
 	$(if $(BR2_PREFER_STATIC_LIB),,install-shared)
-LIBPCAP_DEPENDENCIES:=zlib
-LIBPCAP_CONF_ENV:=ac_cv_linux_vers=2 \
-		  ac_cv_header_linux_wireless_h=yes # configure misdetects this
-LIBPCAP_CONF_OPT:=--disable-yydebug --with-pcap=linux
+LIBPCAP_DEPENDENCIES = zlib
+LIBPCAP_CONF_ENV = ac_cv_linux_vers=2 \
+		ac_cv_header_linux_wireless_h=yes # configure misdetects this
+LIBPCAP_CONF_OPT = --disable-yydebug --with-pcap=linux
 
 $(eval $(call AUTOTARGETS))
-- 
1.7.3.4
