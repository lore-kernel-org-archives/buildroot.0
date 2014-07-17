From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jul 2014 22:57:29 +0200
Subject: [Buildroot] [git commit] linux: fix fallout from
	c78d57637cd57a383e44713eb27e654b3071340e
Message-ID: <20140717205743.6E6549D25E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f8f3073b18895bbf6938a5c310f6e6134f8bd6cb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The new variable LINUX_TARGET_NAME is unconditionally used but it may be
unset leading to a default kernel build (which might not be uImage or
other requested format).
See http://lists.busybox.net/pipermail/buildroot/2014-July/102069.html

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 928d93d..2a9bf3e 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -106,7 +106,9 @@ LINUX_IMAGE_NAME = vmlinux
 else ifeq ($(BR2_LINUX_KERNEL_VMLINUZ),y)
 LINUX_IMAGE_NAME = vmlinuz
 endif
+LINUX_TARGET_NAME = $(LINUX_IMAGE_NAME)
 endif
+
 ifeq ($(LINUX_IMAGE_NAME),)
 LINUX_IMAGE_NAME = $(LINUX_TARGET_NAME)
 endif
