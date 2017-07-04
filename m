From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:48:21 +0200
Subject: [Buildroot] [PATCH 041/100] libftdi1: use the new gettext logic
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-42-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit switches to use the new gettext logic, which involves
using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
on gettext/host-gettext.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libftdi1/libftdi1.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/libftdi1/libftdi1.mk b/package/libftdi1/libftdi1.mk
index deeff39..6b84b95 100644
--- a/package/libftdi1/libftdi1.mk
+++ b/package/libftdi1/libftdi1.mk
@@ -28,9 +28,8 @@ LIBFTDI1_CONF_OPTS += -DPYTHON_BINDINGS=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LIBFTDI1_FDTI_EEPROM),y)
-# ftdi_eeprom optionally depends on libintl, so make sure gettext is built
-# _before_ libfitdi1 when gettext is enbaled.
-LIBFTDI1_DEPENDENCIES += libconfuse $(if $(BR2_PACKAGE_GETTEXT),gettext)
+# ftdi_eeprom optionally depends on libintl
+LIBFTDI1_DEPENDENCIES += libconfuse $(TARGET_NLS_DEPENDENCIES)
 LIBFTDI1_CONF_OPTS += -DFTDI_EEPROM=ON
 else
 LIBFTDI1_CONF_OPTS += -DFTDI_EEPROM=OFF
-- 
2.9.4
