From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 12 May 2013 10:53:52 -0300
Subject: [Buildroot] [PATCH 4/4] httping: bump to version 2.2.1
In-Reply-To: <1368366832-30354-1-git-send-email-gustavo@zacarias.com.ar>
References: <1368366832-30354-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1368366832-30354-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/httping/httping.mk | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/httping/httping.mk b/package/httping/httping.mk
index 2ebc75e..8f7cb97 100644
--- a/package/httping/httping.mk
+++ b/package/httping/httping.mk
@@ -4,13 +4,18 @@
 #
 #############################################################
 
-HTTPING_VERSION = 1.6
+HTTPING_VERSION = 2.2.1
 HTTPING_SOURCE = httping-$(HTTPING_VERSION).tgz
 HTTPING_SITE = http://www.vanheusden.com/httping
 HTTPING_LICENSE = GPLv2
 HTTPING_LICENSE_FILES = license.txt
-HTTPING_DEPENDENCIES = $(if $(BR2_PACKAGE_OPENSSL),openssl)
+HTTPING_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_OPENSSL),openssl) \
+	$(if $(BR2_PACKAGE_NCURSES),ncurses) \
+	$(if $(BR2_PACKAGE_FFTW),fftw)
 HTTPING_MAKE_OPT = $(TARGET_CONFIGURE_OPTS) \
+	FW=$(if $(BR2_PACKAGE_FFTW),yes,no) \
+	NC=$(if $(BR2_PACKAGE_NCURSES),yes,no) \
 	SSL=$(if $(BR2_PACKAGE_OPENSSL),yes,no) \
 	TFO=$(if $(BR2_PACKAGE_HTTPING_TFO),yes,no)
 
-- 
1.8.1.5
