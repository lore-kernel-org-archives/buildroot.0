From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:21:30 +0200
Subject: [Buildroot] [PATCH 61/69] dosfstools: remove empty host
	dependencies definition
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-62-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/dosfstools/dosfstools.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index 28a7b421c227..67c6f7310319 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -12,9 +12,6 @@ DOSFSTOOLS_LICENSE_FILES = COPYING
 DOSFSTOOLS_CONF_OPTS = --enable-compat-symlinks --exec-prefix=/
 HOST_DOSFSTOOLS_CONF_OPTS = --enable-compat-symlinks
 
-# Avoid target dosfstools dependencies, no host-libiconv
-HOST_DOSFSTOOLS_DEPENDENCIES =
-
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 DOSFSTOOLS_CONF_OPTS += --with-udev
 DOSFSTOOLS_DEPENDENCIES += udev
-- 
2.1.0
