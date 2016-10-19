From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Wed, 19 Oct 2016 23:11:54 +0530
Subject: [Buildroot] [PATCH 1/3] kmod: annotate licenses with components
Message-ID: <1476898916-7434-1-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

library libkmod.so is licensed under LGPLv2.1+ and kmod tools are
licensed under GPLv2+.

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 package/kmod/kmod.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 1753b1d..7492b92 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -12,7 +12,7 @@ KMOD_DEPENDENCIES = host-pkgconf
 HOST_KMOD_DEPENDENCIES = host-pkgconf
 
 # license info for libkmod only, conditionally add more below
-KMOD_LICENSE = LGPLv2.1+
+KMOD_LICENSE = LGPLv2.1+ (library)
 KMOD_LICENSE_FILES = libkmod/COPYING
 
 # static linking not supported, see
@@ -40,7 +40,7 @@ endif
 ifeq ($(BR2_PACKAGE_KMOD_TOOLS),y)
 
 # add license info for kmod tools
-KMOD_LICENSE += GPLv2+
+KMOD_LICENSE := $(KMOD_LICENSE), GPLv2+ (tools)
 KMOD_LICENSE_FILES += COPYING
 
 # take precedence over busybox implementation
-- 
2.6.2
