From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 20 Aug 2014 11:06:21 -0300
Subject: [Buildroot] [PATCHv2 4/4] httping: enable ncurses support
In-Reply-To: <1408543581-15702-1-git-send-email-gustavo@zacarias.com.ar>
References: <1408543581-15702-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1408543581-15702-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable automatic ncurses support now that we've got wide support.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/httping/httping.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/httping/httping.mk b/package/httping/httping.mk
index ca636c0..719b0db 100644
--- a/package/httping/httping.mk
+++ b/package/httping/httping.mk
@@ -15,11 +15,12 @@ HTTPING_LDFLAGS = $(TARGET_LDFLAGS) \
 HTTPING_DEPENDENCIES = host-gettext \
 	$(if $(BR2_NEEDS_GETTEXT),gettext) \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
+	$(if $(BR2_PACKAGE_NCURSES_WCHAR),ncurses) \
 	$(if $(BR2_PACKAGE_OPENSSL),openssl) \
 	$(if $(BR2_PACKAGE_FFTW),fftw)
 HTTPING_MAKE_OPT = $(TARGET_CONFIGURE_OPTS) \
 	FW=$(if $(BR2_PACKAGE_FFTW),yes,no) \
-	NC=no \
+	NC=$(if $(BR2_PACKAGE_NCURSES_WCHAR),yes,no) \
 	SSL=$(if $(BR2_PACKAGE_OPENSSL),yes,no) \
 	TFO=$(if $(BR2_PACKAGE_HTTPING_TFO),yes,no)
 
-- 
1.8.5.5
