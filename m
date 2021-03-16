From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 16 Mar 2021 20:30:37 +0100
Subject: [Buildroot] [PATCH 1/1] package/libxcrypt: disable obsolete API
Message-ID: <20210316193037.2613209-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable obsolete API following upstream feedback as it raises build
failures on some architectures such as nds32le or arc and because this
API is unsecure: https://github.com/besser82/libxcrypt/issues/122

Fixes:
 - http://autobuild.buildroot.org/results/5ae235b6ec66ac86efadaa2847307be58064c167

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libxcrypt/libxcrypt.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libxcrypt/libxcrypt.mk b/package/libxcrypt/libxcrypt.mk
index fd33fb7ab5..3cf0555ac0 100644
--- a/package/libxcrypt/libxcrypt.mk
+++ b/package/libxcrypt/libxcrypt.mk
@@ -14,4 +14,7 @@ LIBXCRYPT_AUTORECONF = YES
 # Some warnings turn into errors with some sensitive compilers
 LIBXCRYPT_CONF_OPTS = --disable-werror
 
+# Disable obsolete and unsecure API
+LIBXCRYPT_CONF_OPTS += --disable-obsolete_api
+
 $(eval $(autotools-package))
-- 
2.30.1
