From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Nov 2019 21:52:48 +0100
Subject: [Buildroot] [git commit] package/libftdi: don't override license
 files variable
Message-ID: <20191125204455.E9F06835CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=080fadc115914e84113cc5f67853b65d8a5ce844
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
  package/libftdi/libftdi.mk:22: conditional override of variable LIBFTDI_LICENSE_FILES

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libftdi/libftdi.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libftdi/libftdi.mk b/package/libftdi/libftdi.mk
index cafa40eed4..257342622f 100644
--- a/package/libftdi/libftdi.mk
+++ b/package/libftdi/libftdi.mk
@@ -19,7 +19,7 @@ LIBFTDI_CONF_OPTS = --without-examples
 # configure detect it automaticaly so we need to force it
 ifeq ($(BR2_PACKAGE_LIBFTDI_CPP),y)
 LIBFTDI_LICENSE += , GPL-2.0 with exception (ftdipp)
-LIBFTDI_LICENSE_FILES = COPYING.GPL
+LIBFTDI_LICENSE_FILES += COPYING.GPL
 LIBFTDI_DEPENDENCIES += boost
 LIBFTDI_CONF_OPTS += --enable-libftdipp
 else
