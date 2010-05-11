From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 11 May 2010 09:02:07 +0200
Subject: [Buildroot] [git commit master] hostapd: use internal crypto library
Message-ID: <20100511070254.AD1888D481@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=de73cdf478dd5ad8a7ea5623673144701dd9767c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When OpenSSL is not enabled, hostapd relies on an internal
library. However, this library must be enabled, otherwise the
compilation of hostapd fails with:

/home/test/ctng-arm-eglibc/bin/../lib/gcc/arm-unknown-linux-gnueabi/4.3.4/../../../../arm-unknown-linux-gnueabi/bin/ld: cannot find -ltommath

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
