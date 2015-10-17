From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 17 Oct 2015 11:45:57 +0200
Subject: [Buildroot] [PATCH 1/2] package/rtmpdump: Remove optional
	dependency to PolarSSL
Message-ID: <1445075158-16762-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The makefile of rtmpdump has no support for PolarSSL, so lets remove
support for it, as supposed by Gustavo:
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/129531

Fixes
http://autobuild.buildroot.net/results/45d/45dd9adbac449ce0ed66af5b4655b4d9b37faa62/
http://autobuild.buildroot.net/results/ae0/ae0c4bab7975ed2ad77a9f9fd6a300d1327d56b9/
http://autobuild.buildroot.net/results/029/029695a022ba12ff177521ebc3334d7ac2373ddc/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/rtmpdump/rtmpdump.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/rtmpdump/rtmpdump.mk b/package/rtmpdump/rtmpdump.mk
index 613f1cd..6e0685e 100644
--- a/package/rtmpdump/rtmpdump.mk
+++ b/package/rtmpdump/rtmpdump.mk
@@ -16,9 +16,6 @@ RTMPDUMP_DEPENDENCIES = zlib
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 RTMPDUMP_DEPENDENCIES += gnutls
 RTMPDUMP_CRYPTO = GNUTLS
-else ifeq ($(BR2_PACKAGE_POLARSSL),y)
-RTMPDUMP_DEPENDENCIES += polarssl
-RTMPDUMP_CRYPTO = POLARSSL
 else ifeq ($(BR2_PACKAGE_OPENSSL),y)
 RTMPDUMP_DEPENDENCIES += openssl
 RTMPDUMP_CRYPTO = OPENSSL
-- 
2.6.1
