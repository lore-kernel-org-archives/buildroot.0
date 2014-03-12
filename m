From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 11 Mar 2014 21:30:43 -0300
Subject: [Buildroot] [PATCH 2/2] httping: disable ncurses support
In-Reply-To: <1394584243-8501-1-git-send-email-gustavo@zacarias.com.ar>
References: <1394584243-8501-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1394584243-8501-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The new version requires ncursesw support so disable it until we've got
support for it. Fixes:
http://autobuild.buildroot.net/results/588/58840df1254034bf77cde3935fd900d1da13de56/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/httping/httping.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

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
 
-- 
1.8.3.2
