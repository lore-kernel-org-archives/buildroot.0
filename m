From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Aug 2016 09:17:33 +0200
Subject: [Buildroot] [git commit] gnupg: disable assembly optimization for
	coldfire
Message-ID: <20160805071803.9A17D818DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=63c5a63acac345cad3bbd53edb007042e5fc2a5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/d25425cff055a14b9285cefb0775bc138eb2f914/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnupg/gnupg.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/gnupg/gnupg.mk b/package/gnupg/gnupg.mk
index 8893a1c..54f4d97 100644
--- a/package/gnupg/gnupg.mk
+++ b/package/gnupg/gnupg.mk
@@ -13,6 +13,11 @@ GNUPG_DEPENDENCIES = zlib ncurses $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 GNUPG_CONF_ENV = ac_cv_sys_symbol_underscore=no
 GNUPG_CONF_OPTS = --disable-rpath --enable-minimal --disable-regex
 
+# gnupg doesn't support assembly for coldfire
+ifeq ($(BR2_m68k_cf),y)
+GNUPG_CONF_OPTS += --disable-asm
+endif
+
 ifeq ($(BR2_PACKAGE_BZIP2),y)
 GNUPG_CONF_OPTS += --enable-bzip2
 GNUPG_DEPENDENCIES += bzip2
