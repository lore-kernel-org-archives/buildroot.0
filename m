From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Wed, 12 Dec 2018 08:45:35 +0100
Subject: [Buildroot] [PATCH v2 10/14] httping: update package to use new
 fftw structure
In-Reply-To: <20181212074539.11656-1-gwenj@trabucayre.com>
References: <20181212074539.11656-1-gwenj@trabucayre.com>
Message-ID: <20181212074539.11656-10-gwenj@trabucayre.com>
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
index 955ee3131b..b3a625a8e1 100644
--- a/package/httping/httping.mk
+++ b/package/httping/httping.mk
@@ -17,9 +17,9 @@ HTTPING_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
 	$(if $(BR2_PACKAGE_NCURSES_WCHAR),ncurses) \
 	$(if $(BR2_PACKAGE_OPENSSL),openssl) \
-	$(if $(BR2_PACKAGE_FFTW),fftw)
+	$(if $(BR2_PACKAGE_FFTW_DOUBLE),fftw-double)
 HTTPING_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) \
-	FW=$(if $(BR2_PACKAGE_FFTW),yes,no) \
+	FW=$(if $(BR2_PACKAGE_FFTW_DOUBLE),yes,no) \
 	NC=$(if $(BR2_PACKAGE_NCURSES_WCHAR),yes,no) \
 	SSL=$(if $(BR2_PACKAGE_OPENSSL),yes,no) \
 	TFO=$(if $(BR2_PACKAGE_HTTPING_TFO),yes,no) \
-- 
2.19.2
