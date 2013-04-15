From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 15 Apr 2013 08:55:53 +0200
Subject: [Buildroot] [git commit] linux: error out early if user forgot to
	specify dts name(s)
Message-ID: <20130415065717.A3A709B6BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0ffdc16e7dc1d286eeda3447e95381f5a309d492
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/linux.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 2fff2e9..d375cf0 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -58,6 +58,11 @@ else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),y)
 KERNEL_DTS_NAME = $(basename $(notdir $(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)))
 endif
 
+ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT)$(KERNEL_DTS_NAME),y)
+$(error No kernel device tree source specified, check your \
+BR2_LINUX_KERNEL_USE_INTREE_DTS / BR2_LINUX_KERNEL_USE_CUSTOM_DTS settings)
+endif
+
 ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB),y)
 ifneq ($(words $(KERNEL_DTS_NAME)),1)
 $(error Kernel with appended device tree needs exactly one DTS source.\
