From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:05 -0000
Subject: [Buildroot] [git commit branch/next] kmod: remove unnecessary
	autoreconf
Message-ID: <20150808105636.26B8C7FB5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=51bdd8134c0d3ddf5dca327e896e3b8b941ab425
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit 047fea1d4fa33c4c934272a05649907a59186015 removed a patch on kmod that
was the reason for autoreconfiguring kmod, but autoreconf itself was not
removed.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kmod/kmod.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

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
 
