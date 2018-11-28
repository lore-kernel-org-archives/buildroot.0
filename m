From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Wed, 28 Nov 2018 17:12:37 +0100
Subject: [Buildroot] [PATCH 07/11] httping: update package to use new fftw
 structure
In-Reply-To: <1543421561-37355-6-git-send-email-gwenj@trabucayre.com>
References: <1543421561-37355-1-git-send-email-gwenj@trabucayre.com>
 <1543421561-37355-2-git-send-email-gwenj@trabucayre.com>
 <1543421561-37355-3-git-send-email-gwenj@trabucayre.com>
 <1543421561-37355-4-git-send-email-gwenj@trabucayre.com>
 <1543421561-37355-5-git-send-email-gwenj@trabucayre.com>
 <1543421561-37355-6-git-send-email-gwenj@trabucayre.com>
Message-ID: <1543421561-37355-7-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/httping/httping.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/httping/httping.mk b/package/httping/httping.mk
index 955ee3131b..9b44a8fca3 100644
--- a/package/httping/httping.mk
+++ b/package/httping/httping.mk
@@ -17,9 +17,9 @@ HTTPING_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
 	$(if $(BR2_PACKAGE_NCURSES_WCHAR),ncurses) \
 	$(if $(BR2_PACKAGE_OPENSSL),openssl) \
-	$(if $(BR2_PACKAGE_FFTW),fftw)
+	$(if $(BR2_PACKAGE_FFTW),fftw-double)
 HTTPING_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) \
-	FW=$(if $(BR2_PACKAGE_FFTW),yes,no) \
+	FW=$(if $(BR2_PACKAGE_FFTW_PRECISION_DOUBLE),yes,no) \
 	NC=$(if $(BR2_PACKAGE_NCURSES_WCHAR),yes,no) \
 	SSL=$(if $(BR2_PACKAGE_OPENSSL),yes,no) \
 	TFO=$(if $(BR2_PACKAGE_HTTPING_TFO),yes,no) \
-- 
2.19.2
