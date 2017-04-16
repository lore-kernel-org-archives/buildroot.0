From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Apr 2017 10:39:32 +0200
Subject: [Buildroot] [git commit] Revert "package/xenomai: disable obstack
	support"
Message-ID: <20170416084136.9BF42804F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fe8e6a85a49f96e967f1b408fc79f719f66800a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit e87644cb2abb78c5bf3bd0c3c6955c202e798ef2.

The issue is now fixed in Xenomai, let use Xenomai obstack support
if it's not already available from the libc.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
