From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Nov 2015 23:46:47 +0100
Subject: [Buildroot] [git commit] package/skeleton: qstrip path before using
	it
Message-ID: <20151110232250.3A7C07FC50@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8d9b39a979efde32cc2ebc35912f0f8fdc1ba8fe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/skeleton/skeleton.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index d1b797d..11a609b 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -14,7 +14,7 @@ SKELETON_SOURCE =
 SKELETON_ADD_TOOLCHAIN_DEPENDENCY = NO
 
 ifeq ($(BR2_ROOTFS_SKELETON_CUSTOM),y)
-SKELETON_PATH = $(BR2_ROOTFS_SKELETON_CUSTOM_PATH)
+SKELETON_PATH = $(call qstrip,$(BR2_ROOTFS_SKELETON_CUSTOM_PATH))
 else
 SKELETON_PATH = system/skeleton
 endif
