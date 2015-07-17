From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 17 Jul 2015 21:44:43 +0200
Subject: [Buildroot] [PATCH 1/1] kmod: remove unnecessary autoreconf
Message-ID: <1437162283-20292-1-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Commit 047fea1d4fa33c4c934272a05649907a59186015 removed a patch on kmod that
was the reason for autoreconfiguring kmod, but autoreconf itself was not
removed.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 package/kmod/kmod.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index ae09330..e07e601 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -8,8 +8,6 @@ KMOD_VERSION = 20
 KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
 KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod
 KMOD_INSTALL_STAGING = YES
-# For kmod-0002-add-backup-implementation-of-be32toh.patch
-KMOD_AUTORECONF = YES
 KMOD_DEPENDENCIES = host-pkgconf
 HOST_KMOD_DEPENDENCIES = host-pkgconf
 
-- 
1.8.5.1
