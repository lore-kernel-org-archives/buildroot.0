From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2016 14:53:55 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/libarchive: Remove unneeded
	CONF_OPTS for xz support
In-Reply-To: <1455976435-2614-1-git-send-email-bernd.kuhls@t-online.de>
References: <1455976435-2614-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1455976435-2614-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

configure.ac always checks xz support unless --without-lzma is used:
https://github.com/libarchive/libarchive/blob/master/configure.ac#L365

Having --with-lzma is therefore useless.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: First revision

 package/libarchive/libarchive.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index f438d6e..e0a10fb 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -93,7 +93,6 @@ endif
 
 ifeq ($(BR2_PACKAGE_XZ),y)
 LIBARCHIVE_DEPENDENCIES += xz
-LIBARCHIVE_CONF_OPTS += --with-lzma
 else
 LIBARCHIVE_CONF_OPTS += --without-lzma
 endif
-- 
2.7.0
