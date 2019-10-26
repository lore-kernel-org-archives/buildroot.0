From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 13:56:21 +0200
Subject: [Buildroot] [git commit] package/kmod: needs AUTORECONF = YES
Message-ID: <20191026115114.70E6E88350@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b6ccd822d67ead697b34e4164f2e6391125d942
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 95fd2b593ef7194a23a20a64dac1e21e4e650ef2 ("package/kmod: add
patch fixing the build with Python 3.8") added a patch that touches
Makefile.am, but forgot to add AUTORECONF = YES. Let's fix this.

Fixes:

  http://autobuild.buildroot.net/results/5185deba0c18072928a0a6867f15f77448228b0b/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kmod/kmod.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index a5bcf2f2d6..01bd85e06f 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -8,6 +8,8 @@ KMOD_VERSION = 26
 KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
 KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod
 KMOD_INSTALL_STAGING = YES
+# 0002-Do-not-check-for-undefined-symbols-when-building-the.patch
+KMOD_AUTORECONF = YES
 KMOD_DEPENDENCIES = host-pkgconf
 HOST_KMOD_DEPENDENCIES = host-pkgconf
 
