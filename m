From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 Aug 2018 21:35:50 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] package/znc: python
 support depends on icu
Message-ID: <20180823193313.0B4B38E405@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fcb1e07ccd73d712f0b4aaaa5757dd464120cda4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Upstream checks for icu when build with python support:
https://github.com/znc/znc/commit/4fe4a45dd62411ba9ede04750ca44f071e7d6cbb

Fixes
http://autobuild.buildroot.net/results/9e4/9e44159820789f1d25efcbd24318b0e05e132371/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0f095a5318bb8c33d4435b5727283eb64d539e4c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/znc/znc.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/znc/znc.mk b/package/znc/znc.mk
index 33ac266dd3..2a04c66377 100644
--- a/package/znc/znc.mk
+++ b/package/znc/znc.mk
@@ -32,7 +32,8 @@ else
 ZNC_CONF_OPTS += --disable-zlib
 endif
 
-ifeq ($(BR2_PACKAGE_PYTHON3),y)
+# python support depends on icu
+ifeq ($(BR2_PACKAGE_ICU)$(BR2_PACKAGE_PYTHON3),yy)
 ZNC_DEPENDENCIES += python3 host-swig
 ZNC_CONF_OPTS += --enable-python=python3
 else
