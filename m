From: Romain Naour <romain.naour@openwide.fr>
Date: Sat,  8 Aug 2015 00:47:17 +0200
Subject: [Buildroot] [PATCH 5/7] package/cpio: remove useless comment
In-Reply-To: <1438987639-30593-1-git-send-email-romain.naour@openwide.fr>
References: <1438987639-30593-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1438987639-30593-5-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This comment is about host-cpio which hasn't
been added in Buildroot.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/cpio/cpio.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/cpio/cpio.mk b/package/cpio/cpio.mk
index e18af81..c29305e 100644
--- a/package/cpio/cpio.mk
+++ b/package/cpio/cpio.mk
@@ -16,8 +16,7 @@ CPIO_PATCH = \
 	https://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/app-arch/cpio/files/cpio-2.11-stat.patch
 
 # cpio uses argp.h which is not provided by uclibc or musl by default.
-# Use the argp-standalone package to provide this but make sure
-# the host package does not try to use the host version.
+# Use the argp-standalone package to provide this.
 ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
 CPIO_DEPENDENCIES += argp-standalone
 endif
-- 
2.4.3
