From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 15 Apr 2017 19:42:01 +0200
Subject: [Buildroot] [PATCH 3/3] Revert "package/xenomai: disable obstack
	support"
In-Reply-To: <20170415174201.30459-1-romain.naour@gmail.com>
References: <20170415174201.30459-1-romain.naour@gmail.com>
Message-ID: <20170415174201.30459-3-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit e87644cb2abb78c5bf3bd0c3c6955c202e798ef2.

The issue is now fixed in Xenomai, let use Xenomai obstack support
if it's not already available from the libc.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/xenomai/xenomai.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index b7be842..f68ff90 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -38,12 +38,6 @@ else
 XENOMAI_CONF_OPTS += --disable-smp
 endif
 
-# Obstack support in Xenomai is broken when the libc doesn't support
-# obstack support itself. Make sure we disable obstack support for all
-# libc since it was removed in uClibc-ng since 1.0.21 release and it's
-# always disabled with Glibc.
-XENOMAI_CONF_OPTS += CFLAGS="$(TARGET_CFLAGS) -DELIDE_CODE"
-
 define XENOMAI_REMOVE_DEVFILES
 	for i in xeno-config xeno-info wrap-link.sh ; do \
 		rm -f $(TARGET_DIR)/usr/bin/$$i ; \
-- 
2.9.3
