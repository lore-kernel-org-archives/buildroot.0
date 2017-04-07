From: Jack Breese <jack@kumunetworks.com>
Date: Thu,  6 Apr 2017 18:09:43 -0700
Subject: [Buildroot] [PATCH v2] gnupg: Add options for SHA-256 and SHA-512
	hashes
In-Reply-To: <20170406010908.95234-1-jack@kumunetworks.com>
References: <20170406010908.95234-1-jack@kumunetworks.com>
Message-ID: <20170407010943.80192-1-jack@kumunetworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jack Breese <jack@kumunetworks.com>

---
Changes v1 -> v2:
 - Enable SHA-256 and SHA-512 unconditionally because
   size difference is small. (~6k on armv7l) (Suggested by Baruch)

Binary size without SHA256 + SHA512:
-rwxr-xr-x 1 root root 550K Apr  6 10:03 gpg

Binary size with both:
-rwxr-xr-x 1 root root 555.9K Mar 31 22:50 gpg

Signed-off-by: Jack Breese <jack@kumunetworks.com>
---
 package/gnupg/gnupg.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/gnupg/gnupg.mk b/package/gnupg/gnupg.mk
index caa9d2c46..b3578b87d 100644
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
-- 
2.11.0 (Apple Git-81)
