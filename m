From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Feb 2020 13:16:50 +0100
Subject: [Buildroot] [git commit] package/libtomcrypt: annotate _IGNORE_CVES
 for the included security patches
Message-ID: <20200220120646.8EBEA8E5C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f80814a6a450c98fb9d1e46258aefc22c5fbabc9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
