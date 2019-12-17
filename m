From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 17 Dec 2019 15:37:04 +0100
Subject: [Buildroot] [PATCH 3/3] package/kmod: remove ld segfault workaround
In-Reply-To: <20191217143704.51115-1-giulio.benetti@benettiengineering.com>
References: <20191217143704.51115-1-giulio.benetti@benettiengineering.com>
Message-ID: <20191217143704.51115-4-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This ld bug has been fixed with binutils version 2.27 and Buildroot
at the moment provides binutils > 2.27, so let's remove the workaround.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/kmod/kmod.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index e21f40a845..6d94e833ac 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -17,12 +17,6 @@ HOST_KMOD_DEPENDENCIES = host-pkgconf
 KMOD_LICENSE = LGPL-2.1+ (library)
 KMOD_LICENSE_FILES = libkmod/COPYING
 
-# --gc-sections triggers binutils ld segfault
-# https://sourceware.org/bugzilla/show_bug.cgi?id=21180
-ifeq ($(BR2_microblaze),y)
-KMOD_CONF_ENV += cc_cv_LDFLAGS__Wl___gc_sections=false
-endif
-
 # static linking not supported, see
 # https://git.kernel.org/cgit/utils/kernel/kmod/kmod.git/commit/?id=b7016153ec8
 KMOD_CONF_OPTS = --disable-static --enable-shared
-- 
2.20.1
