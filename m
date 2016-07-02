From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:21:38 +0200
Subject: [Buildroot] [PATCH 69/69] tar: remove empty host dependencies
	definition
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-70-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Note that host-tar dependencies were broken with automatic derivation
of host dependencies:
host-tar could depend (or not) on host-attr (and even on non-existing
host-acl!), depending on BR2_PACKAGE_BUSYBOX.

Now, host-tar has no dependency.

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/tar/tar.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index 767c02f9f990..26f113a4d2ab 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -16,7 +16,6 @@ TAR_LICENSE_FILES = COPYING
 # Prefer full-blown tar over buybox's version
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 TAR_DEPENDENCIES += busybox
-HOST_TAR_DEPENDENCIES =
 endif
 
 ifeq ($(BR2_PACKAGE_ACL),y)
-- 
2.1.0
