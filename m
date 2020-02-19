From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Feb 2020 17:02:00 +0100
Subject: [Buildroot] [PATCH 3/5] package/libtomcrypt: annotate _IGNORE_CVES
 for the included security patches
In-Reply-To: <20200219160203.874-1-peter@korsgaard.com>
References: <20200219160203.874-1-peter@korsgaard.com>
Message-ID: <20200219160203.874-3-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libtomcrypt/libtomcrypt.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libtomcrypt/libtomcrypt.mk b/package/libtomcrypt/libtomcrypt.mk
index 583bcb15ff..c2f1babb49 100644
--- a/package/libtomcrypt/libtomcrypt.mk
+++ b/package/libtomcrypt/libtomcrypt.mk
@@ -13,6 +13,9 @@ LIBTOMCRYPT_INSTALL_STAGING = YES
 LIBTOMCRYPT_INSTALL_TARGET = NO # only static library
 LIBTOMCRYPT_DEPENDENCIES = libtommath
 
+# 0001-fix-CVE-2019-17362.patch
+LIBTOMCRYPT_IGNORE_CVES += CVE-2019-17362
+
 LIBTOMCRYPT_CFLAGS = -I./src/headers $(TARGET_CFLAGS) -DLTC_SOURCE -DLTM_DESC
 
 define LIBTOMCRYPT_BUILD_CMDS
-- 
2.20.1
