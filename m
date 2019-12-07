From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  7 Dec 2019 10:17:43 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/alsa-utils: remove --disable-alsatest
Message-ID: <20191207091743.183814-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

atopology is needed to build alsa-utils since version 1.2.1 and
https://github.com/alsa-project/alsa-utils/commit/c8fdd38c74de2e8b7b2b5a4576787d5e9b4ae807

However, atopology is not correctly detected if --disable-alsatest is
passed so drop --disable-alsatest that is not needed since commit
2c03ec15307b567fd2250fe2a7981a89d19b87a9 (from 2002), which removed
AC_TRY_RUN

Fixes:
 - http://autobuild.buildroot.org/results/d0fb760669b02b813115af04adcf24530d35f4e1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Remove --disable-alsatest instead of adding --enable-alsa-topology

 package/alsa-utils/alsa-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 47f07bf7a2..52022e32ab 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -35,7 +35,7 @@ ALSA_UTILS_CONF_OPTS += --disable-alsaloop
 endif
 
 ifneq ($(BR2_PACKAGE_ALSA_UTILS_ALSAMIXER),y)
-ALSA_UTILS_CONF_OPTS += --disable-alsamixer --disable-alsatest
+ALSA_UTILS_CONF_OPTS += --disable-alsamixer
 endif
 
 ifeq ($(BR2_PACKAGE_ALSA_UTILS_BAT),y)
-- 
2.24.0
