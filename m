From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 10:24:02 +0200
Subject: [Buildroot] [git commit] tar: remove empty host dependencies
	definition
Message-ID: <20160703082409.EEDA5800F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c0a72b22eb748d0f6c9cb96f16cd104706d2c16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Note that host-tar dependencies were broken with automatic derivation
of host dependencies:
host-tar could depend (or not) on host-attr (and even on non-existing
host-acl!), depending on BR2_PACKAGE_BUSYBOX.

Now, host-tar has no dependency.

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tar/tar.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index 767c02f..26f113a 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -16,7 +16,6 @@ TAR_LICENSE_FILES = COPYING
 # Prefer full-blown tar over buybox's version
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 TAR_DEPENDENCIES += busybox
-HOST_TAR_DEPENDENCIES =
 endif
 
 ifeq ($(BR2_PACKAGE_ACL),y)
