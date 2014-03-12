From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 12 Mar 2014 09:04:13 +0100
Subject: [Buildroot] [git commit] httping: disable ncurses support
Message-ID: <20140312081514.AEA0D9042A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1ea6d850891bb4d936bcf1bddbf5432b819d5785
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The new version requires ncursesw support so disable it until we've got
support for it. Fixes:
http://autobuild.buildroot.net/results/588/58840df1254034bf77cde3935fd900d1da13de56/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/httping/httping.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/httping/httping.mk b/package/httping/httping.mk
index dd8abb3..42d694f 100644
--- a/package/httping/httping.mk
+++ b/package/httping/httping.mk
@@ -13,11 +13,10 @@ HTTPING_LDFLAGS = $(if $(BR2_NEEDS_GETTEXT),-lintl) $(TARGET_LDFLAGS)
 HTTPING_DEPENDENCIES = \
 	$(if $(BR2_NEEDS_GETTEXT),gettext) \
 	$(if $(BR2_PACKAGE_OPENSSL),openssl) \
-	$(if $(BR2_PACKAGE_NCURSES),ncurses) \
 	$(if $(BR2_PACKAGE_FFTW),fftw)
 HTTPING_MAKE_OPT = $(TARGET_CONFIGURE_OPTS) \
 	FW=$(if $(BR2_PACKAGE_FFTW),yes,no) \
-	NC=$(if $(BR2_PACKAGE_NCURSES),yes,no) \
+	NC=no \
 	SSL=$(if $(BR2_PACKAGE_OPENSSL),yes,no) \
 	TFO=$(if $(BR2_PACKAGE_HTTPING_TFO),yes,no)
 
