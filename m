From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 23:13:50 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] libpjsip: fix ssl support
Message-ID: <20171126222348.DB0AC81490@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=867f1b7320230c2e53d5defb8e67923011fb5586
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Currently, ssl support is implicitely disabled in the initial configure
options. This overrides the check for openssl below.

libpjsip is also currently only compatible with libopenssl. Change
the check to LIBOPENSSL instead of openssl, and depend on libopenssl.

[Peter: drop libopenssl change]
Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 9e479e65dcf1582b20433ca1b120efb66e806a04)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpjsip/libpjsip.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 2ee30f2..86c9938 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -50,7 +50,6 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-openh264 \
 	--disable-libyuv \
 	--disable-ipp \
-	--disable-ssl \
 	--disable-silk \
 	--with-external-srtp
 
