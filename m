From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 14:19:57 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/qwt: add missing
 qt5svg dependency
Message-ID: <20200314140059.5F6BD82AEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b5f00906a7dfe92a33448e0b0cfe462593db9987
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit bd99e4e54de06c1183c7823f14b05a3be8061296)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qwt/qwt.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
index f381ebbb7a..3988ab336a 100644
--- a/package/qwt/qwt.mk
+++ b/package/qwt/qwt.mk
@@ -19,6 +19,7 @@ QWT_CONFIG += -e 's%/features%/mkspecs/features%'
 
 ifeq ($(BR2_PACKAGE_QWT_SVG),y)
 QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtSvg.*$$/QWT_CONFIG += QwtSvg/'
+QWT_DEPENDENCIES += qt5svg
 else
 QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtSvg.*$$/\# QWT_CONFIG += QwtSvg/'
 endif
