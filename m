From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Sep 2014 23:19:59 +0200
Subject: [Buildroot] [git commit] httping: enable ncurses support
Message-ID: <20140918195020.C55899D6DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d47895671977695eaeefe6ca2166332c0f2ebf39
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable automatic ncurses support now that we've got wide support.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/httping/httping.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

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
 
