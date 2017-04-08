From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Apr 2017 15:32:08 +0200
Subject: [Buildroot] [git commit] gnupg: enable support for SHA-256 and
	SHA-512 hashes
Message-ID: <20170408133220.9285F82306@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2be9ba9f58280ebe0094ef715ab14c31a22c9204
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jack Breese <jack@kumunetworks.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnupg/gnupg.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/gnupg/gnupg.mk b/package/gnupg/gnupg.mk
index caa9d2c..b3578b8 100644
--- a/package/gnupg/gnupg.mk
+++ b/package/gnupg/gnupg.mk
@@ -11,7 +11,12 @@ GNUPG_LICENSE = GPL-3.0+
 GNUPG_LICENSE_FILES = COPYING
 GNUPG_DEPENDENCIES = zlib ncurses $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 GNUPG_CONF_ENV = ac_cv_sys_symbol_underscore=no
-GNUPG_CONF_OPTS = --disable-rpath --enable-minimal --disable-regex
+GNUPG_CONF_OPTS = \
+	--disable-rpath \
+	--enable-minimal \
+	--disable-regex \
+	--enable-sha256 \
+	--enable-sha512
 
 # gnupg doesn't support assembly for coldfire
 ifeq ($(BR2_m68k_cf),y)
