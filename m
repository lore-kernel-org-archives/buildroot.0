From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 12 May 2013 21:39:27 +0200
Subject: [Buildroot] [git commit branch/next] httping: bump to version 2.2.1
Message-ID: <20130512194314.5D7A19A0CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a2f30cacd95d7d850a22a6824ec748e448b1e772
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/httping/httping.mk |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

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
 
