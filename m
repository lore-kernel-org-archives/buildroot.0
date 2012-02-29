From: Ismael Luceno <ismael.luceno@gmail.com>
Date: Wed, 29 Feb 2012 21:27:58 -0200
Subject: [Buildroot] [PATCH 2/2] openssl: Add -march and -mcpu flags
In-Reply-To: <1330558078-3978-1-git-send-email-ismael.luceno@gmail.com>
References: <1330558078-3978-1-git-send-email-ismael.luceno@gmail.com>
Message-ID: <1330558078-3978-2-git-send-email-ismael.luceno@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Ismael Luceno <ismael.luceno@gmail.com>
---
 package/openssl/openssl.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index fda935a..c228458 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -18,6 +18,8 @@ else
 OPENSSL_CFLAGS = $(TARGET_CFLAGS)
 endif
 
+OPENSSL_CFLAGS += -march=$(BR2_GCC_TARGET_ARCH) -mcpu=$(BR2_GCC_TARGET_TUNE)
+
 ifeq ($(BR2_PACKAGE_OPENSSL_OCF),y)
 OPENSSL_CFLAGS += -DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS
 
-- 
1.7.9.1
