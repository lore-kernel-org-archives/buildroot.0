From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 16 Mar 2014 08:49:17 -0300
Subject: [Buildroot] [PATCH] httping: needs host-gettext
Message-ID: <1394970557-15905-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For msgfmt, fixes:
http://autobuild.buildroot.net/results/9ce/9ce9b4c52a7e0d0159b5b4b9835b9e3e7f8b2a08/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/httping/httping.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/httping/httping.mk b/package/httping/httping.mk
index 42d694f..610cecb 100644
--- a/package/httping/httping.mk
+++ b/package/httping/httping.mk
@@ -10,7 +10,7 @@ HTTPING_SITE = http://www.vanheusden.com/httping
 HTTPING_LICENSE = GPLv2
 HTTPING_LICENSE_FILES = license.txt
 HTTPING_LDFLAGS = $(if $(BR2_NEEDS_GETTEXT),-lintl) $(TARGET_LDFLAGS)
-HTTPING_DEPENDENCIES = \
+HTTPING_DEPENDENCIES = host-gettext \
 	$(if $(BR2_NEEDS_GETTEXT),gettext) \
 	$(if $(BR2_PACKAGE_OPENSSL),openssl) \
 	$(if $(BR2_PACKAGE_FFTW),fftw)
-- 
1.8.3.2
