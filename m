From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 11:03:12 +0200
Subject: [Buildroot] [git commit] kmod: needs to autoreconf
Message-ID: <20141012090833.5D491B2204@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3d6392e37ea748db0d4dbe29e239e516d2ec79ed
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/7a7/7a70b179f17070d0a0883f71c60030dd7d8a9102/
Didn't see widespread failure because it autoreconfed on its own just
fine if autotools infra was already present.
And didn't work before the automake patch with AUTORECONF=YES because of
an older gtk-doc.m4

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kmod/kmod.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 1f170dd..99ab387 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -8,6 +8,8 @@ KMOD_VERSION = 18
 KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
 KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod
 KMOD_INSTALL_STAGING = YES
+# For kmod-0002-add-backup-implementation-of-be32toh.patch
+KMOD_AUTORECONF = YES
 KMOD_DEPENDENCIES = host-pkgconf
 HOST_KMOD_DEPENDENCIES = host-pkgconf
 
