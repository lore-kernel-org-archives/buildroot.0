From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 24 Jan 2016 00:24:21 +0100
Subject: [Buildroot] [PATCH v2] package/libgpgme: fix musl compile
Message-ID: <1453591461-5853-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch ported from http://patchwork.openembedded.org/patch/112715/

Fixes
http://autobuild.buildroot.net/results/1c5/1c518627ae0d02bc6affa2efdf23fba2c7ca0d74/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: added missing package name in subjetc

 package/libgpgme/libgpgme.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index 1868099..b0a3343 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -21,6 +21,9 @@ LIBGPGME_CONF_OPTS = --with-gpg=/usr/bin/gpg \
 	--disable-g13-test \
 	--disable-gpg-test
 
+# needed for musl
+LIBGPGME_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -D__error_t_defined"
+
 # Handle argp-standalone or it errors out during build
 ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
 LIBGPGME_CONF_ENV += LIBS="-largp"
-- 
2.7.0.rc3
