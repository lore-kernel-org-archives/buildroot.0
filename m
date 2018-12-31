From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 14:30:24 +0100
Subject: [Buildroot] [PATCH v3 11/17] package/httping: use the new
 fftw-double package
In-Reply-To: <20181231133030.25991-1-thomas.petazzoni@bootlin.com>
References: <20181231133030.25991-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181231133030.25991-12-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
2.20.1
