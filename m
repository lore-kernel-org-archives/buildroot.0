From: guillaume.bressaix at gmail.com <guillaume.bressaix@gmail.com>
Date: Sat, 20 Feb 2021 18:38:15 +0100
Subject: [Buildroot] [PATCH] package/libxcrypt: --disable-werror to fix
 problem with sensitive compilers
Message-ID: <20210220173815.28154-1-guillaume.bressaix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>

Fixes: http://autobuild.buildroot.net/results/e9a058a8c98daf197cd9d7ac632e0cb5707d524f

Some sensitive compilers may raise warnings that turn into errors.

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 package/libxcrypt/libxcrypt.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libxcrypt/libxcrypt.mk b/package/libxcrypt/libxcrypt.mk
index 63132edd9d..ccbb1a282c 100644
--- a/package/libxcrypt/libxcrypt.mk
+++ b/package/libxcrypt/libxcrypt.mk
@@ -11,4 +11,7 @@ LIBXCRYPT_LICENSE_FILES = LICENSING COPYING.LIB
 LIBXCRYPT_INSTALL_STAGING = YES
 LIBXCRYPT_AUTORECONF = YES
 
+# Some warnings turn into errors with some sensitive compilers
+LIBXCRYPT_CONF_OPTS = --disable-werror
+
 $(eval $(autotools-package))
-- 
2.20.1
