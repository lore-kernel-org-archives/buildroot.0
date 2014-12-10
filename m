From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  9 Dec 2014 21:40:06 -0300
Subject: [Buildroot] [PATCH] wget: add host-pkgconf dependency
Message-ID: <1418172006-18113-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Uses pkgconfig since 1.16.1+ to find libraries.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/wget/wget.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index b19c987..bd8e378 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -7,6 +7,7 @@
 WGET_VERSION = 1.16.1
 WGET_SOURCE = wget-$(WGET_VERSION).tar.xz
 WGET_SITE = $(BR2_GNU_MIRROR)/wget
+WGET_DEPENDENCIES = host-pkgconf
 WGET_LICENSE = GPLv3+
 WGET_LICENSE_FILES = COPYING
 
-- 
2.0.4
