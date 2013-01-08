From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 8 Jan 2013 10:12:02 +0100
Subject: [Buildroot] [git commit] linux: fix double LINUX_APPEND_DTB
Message-ID: <20130108091307.6FCD49A6BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=88ef92dfcb22f398809dc6bff9e675a6e29afa21
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Introduced by 5b33e0b6a (linux: handle new dtb location since 3.8-rc1 for
appended dtbs).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/linux.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 7ec9cd2..fe5f738 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -203,7 +203,6 @@ endif
 
 ifeq ($(BR2_LINUX_KERNEL_APPENDED_UIMAGE),y)
 define LINUX_APPEND_DTB
-define LINUX_APPEND_DTB
 	# dtbs moved from arch/$ARCH/boot to arch/$ARCH/boot/dts since 3.8-rc1
 	cat $(wildcard $(addprefix $(KERNEL_ARCH_PATH)/boot/,\
 		$(KERNEL_DTS_NAME).dtb dts/$(KERNEL_DTS_NAME).dtb)) \
