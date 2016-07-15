From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 19:36:24 +0200
Subject: [Buildroot] [git commit] package/rtl8821au: set CONFIG_RTL8821AU
	properly
Message-ID: <20160715173635.AE81D82257@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d33573aa52fbb2e42f9182b0868ddb0d0d5701b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Due to a recent update in the code, CONFIG_RTL8821AU=m is the expected
kernel configuration environment variable to be set, not
CONFIG_RTL8812AU_8821AU=m as was previously set.

Presently the package does effectively nothing.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rtl8821au/rtl8821au.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rtl8821au/rtl8821au.mk b/package/rtl8821au/rtl8821au.mk
index cf8f4cd..ebb1665 100644
--- a/package/rtl8821au/rtl8821au.mk
+++ b/package/rtl8821au/rtl8821au.mk
@@ -10,7 +10,7 @@ RTL8821AU_LICENSE = GPLv2, proprietary (rtl8821au.bin firmware)
 RTL8821AU_LICENSE_FILES = COPYING
 
 RTL8821AU_MODULE_MAKE_OPTS = \
-	CONFIG_RTL8812AU_8821AU=m \
+	CONFIG_RTL8821AU=m \
 	KVER=$(LINUX_VERSION_PROBED) \
 	USER_EXTRA_CFLAGS=-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN
 
