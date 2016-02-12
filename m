From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 12 Feb 2016 11:38:21 -0300
Subject: [Buildroot] [PATCH 1/2] samba4: add optional libbsd dependency
Message-ID: <1455287902-12495-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's used for some small functions like md5 support, non-essential since
samba has an internal fallback for those, but still add it for
predictability.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/samba4/samba4.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 4e796a6..118a4ae 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -11,6 +11,7 @@ SAMBA4_INSTALL_STAGING = YES
 SAMBA4_LICENSE = GPLv3+
 SAMBA4_LICENSE_FILES = COPYING
 SAMBA4_DEPENDENCIES = host-e2fsprogs host-heimdal e2fsprogs popt python zlib \
+	$(if $(BR2_PACKAGE_LIBBSD),libbsd) \
 	$(if $(BR2_PACKAGE_LIBCAP),libcap) \
 	$(if $(BR2_PACKAGE_READLINE),readline)
 
-- 
2.4.10
