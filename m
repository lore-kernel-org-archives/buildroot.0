From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Fri, 28 Jul 2017 19:44:43 -0700
Subject: [Buildroot] [PATCH] package/libgpiod: install to staging
Message-ID: <20170729024443.23726-1-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Install to staging to make API headers discoverable by other packages.

Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 package/libgpiod/libgpiod.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libgpiod/libgpiod.mk b/package/libgpiod/libgpiod.mk
index c95ea44514..26ea0fffca 100644
--- a/package/libgpiod/libgpiod.mk
+++ b/package/libgpiod/libgpiod.mk
@@ -8,6 +8,7 @@ LIBGPIOD_VERSION = v0.2
 LIBGPIOD_SITE = $(call github,brgl,libgpiod,$(LIBGPIOD_VERSION))
 LIBGPIOD_LICENSE = LGPL-2.1+
 LIBGPIOD_LICENSE_FILES = COPYING
+LIBGPIOD_INSTALL_STAGING = YES
 
 # Needed for autoreconf to work properly
 define LIBGPIOD_FIXUP_M4_DIR
-- 
2.13.3
