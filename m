From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 14 Dec 2019 23:55:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/libkrb5: needs host-pkgconf for
 libedit
Message-ID: <20191214225506.3334271-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-pkgconf is needed to find libedit

Fixes:
 - http://autobuild.buildroot.org/results/45eee300788f46975d292b21eead97f9e9a8b5d8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libkrb5/libkrb5.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
index 7c199129a3..44a20b3707 100644
--- a/package/libkrb5/libkrb5.mk
+++ b/package/libkrb5/libkrb5.mk
@@ -41,7 +41,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBEDIT),y)
 LIBKRB5_CONF_OPTS += --with-libedit
-LIBKRB5_DEPENDENCIES += libedit
+LIBKRB5_DEPENDENCIES += host-pkgconf libedit
 else
 LIBKRB5_CONF_OPTS += --without-libedit
 endif
-- 
2.24.0
