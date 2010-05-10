From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 May 2010 23:39:48 +0200
Subject: [Buildroot] [PATCH 2/5] hostapd: use internal crypto library
In-Reply-To: <cover.1273527584.git.thomas.petazzoni@free-electrons.com>
References: <cover.1273527584.git.thomas.petazzoni@free-electrons.com>
Message-ID: <d41140013de946b504c5b5f05710bc8e935940aa.1273527584.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When OpenSSL is not enabled, hostapd relies on an internal
library. However, this library must be enabled, otherwise the
compilation of hostapd fails with:

/home/test/ctng-arm-eglibc/bin/../lib/gcc/arm-unknown-linux-gnueabi/4.3.4/../../../../arm-unknown-linux-gnueabi/bin/ld: cannot find -ltommath

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/hostapd/hostapd.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 2359fd3..bde3766 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -45,6 +45,7 @@ endif
 # We take care of that in Config.in
 ifneq ($(BR2_PACKAGE_OPENSSL),y)
 	echo "CONFIG_CRYPTO=internal" >>$(HOSTAPD_CONFIG)
+	echo "CONFIG_INTERNAL_LIBTOMMATH=y" >>$(HOSTAPD_CONFIG)
 	echo "CONFIG_TLS=internal" >>$(HOSTAPD_CONFIG)
 endif
 # WPS
-- 
1.6.3.3
