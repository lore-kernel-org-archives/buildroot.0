From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Feb 2020 20:15:47 +0100
Subject: [Buildroot] [git commit] package/qwt: add missing qt5svg dependency
Message-ID: <20200219190449.C38DE8E549@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bd99e4e54de06c1183c7823f14b05a3be8061296
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qwt/qwt.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
index e0ffec765f..a82c786cb1 100644
--- a/package/qwt/qwt.mk
+++ b/package/qwt/qwt.mk
@@ -19,6 +19,7 @@ QWT_CONFIG += -e 's%/features%/mkspecs/features%'
 
 ifeq ($(BR2_PACKAGE_QWT_SVG),y)
 QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtSvg.*$$/QWT_CONFIG += QwtSvg/'
+QWT_DEPENDENCIES += qt5svg
 else
 QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtSvg.*$$/\# QWT_CONFIG += QwtSvg/'
 endif
