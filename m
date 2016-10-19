From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Oct 2016 23:28:09 +0200
Subject: [Buildroot] [git commit] kmod: annotate licenses with components
Message-ID: <20161019212834.D6EAD81971@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ab240a14b9149fff4832ef6a9cf3798639b5dfd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

library libkmod.so is licensed under LGPLv2.1+ and kmod tools are
licensed under GPLv2+.

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
