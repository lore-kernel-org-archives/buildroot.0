From: guillaume.bressaix at gmail.com <guillaume.bressaix@gmail.com>
Date: Sat, 20 Feb 2021 17:32:15 +0100
Subject: [Buildroot] [PATCH/next] package/libxcrypt: install to staging
 instead of target
Message-ID: <20210220163215.5529-1-guillaume.bressaix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 package/libxcrypt/libxcrypt.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libxcrypt/libxcrypt.mk b/package/libxcrypt/libxcrypt.mk
index f9799ac006..63132edd9d 100644
--- a/package/libxcrypt/libxcrypt.mk
+++ b/package/libxcrypt/libxcrypt.mk
@@ -8,6 +8,7 @@ LIBXCRYPT_VERSION = 4.4.17
 LIBXCRYPT_SITE = $(call github,besser82,libxcrypt,v$(LIBXCRYPT_VERSION))
 LIBXCRYPT_LICENSE = LGPL-2.1+
 LIBXCRYPT_LICENSE_FILES = LICENSING COPYING.LIB
+LIBXCRYPT_INSTALL_STAGING = YES
 LIBXCRYPT_AUTORECONF = YES
 
 $(eval $(autotools-package))
-- 
2.20.1
