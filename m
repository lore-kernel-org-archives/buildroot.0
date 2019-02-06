From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 10:14:46 +0100
Subject: [Buildroot] [git commit] package/httping: use the new fftw-double
 package
Message-ID: <20190206091325.7854B8025D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=94b8edf9701d6c8635f775a2d653fc6874fb276f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch add an explicitly dependency to fftw-double (the only compatible
fftw's flavor) instead of default behavior where the package do assumption
about the compatible version.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
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
