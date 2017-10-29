From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Oct 2017 16:04:20 +0100
Subject: [Buildroot] [PATCH 2/2] package/libnfs: allow parallel build
In-Reply-To: <20171029150420.3384-1-bernd.kuhls@t-online.de>
References: <20171029150420.3384-1-bernd.kuhls@t-online.de>
Message-ID: <20171029150420.3384-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tested with BR2_JLEVEL=100.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libnfs/libnfs.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libnfs/libnfs.mk b/package/libnfs/libnfs.mk
index 3636a2acee..d961fd1d4e 100644
--- a/package/libnfs/libnfs.mk
+++ b/package/libnfs/libnfs.mk
@@ -8,7 +8,6 @@ LIBNFS_VERSION = libnfs-2.0.0
 LIBNFS_SITE = $(call github,sahlberg,libnfs,$(LIBNFS_VERSION))
 LIBNFS_INSTALL_STAGING = YES
 LIBNFS_AUTORECONF = YES
-LIBNFS_MAKE = $(MAKE1)
 LIBNFS_LICENSE = LGPL-2.1+
 LIBNFS_LICENSE_FILES = LICENCE-LGPL-2.1.txt
 LIBNFS_DEPENDENCIES = host-pkgconf
-- 
2.11.0
