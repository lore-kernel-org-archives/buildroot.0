From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Aug 2014 22:16:21 +0200
Subject: [Buildroot] [git commit] linux: fix LINUX_SITE for release
	candidates
Message-ID: <20140807201627.13EEF9D3D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a47b633d79ae4b0fd980408a65e9116165fce673
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jean-Baptiste Theou <jtheou@adeneo-embedded.us>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index e433e0d..2fb7437 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -34,7 +34,7 @@ LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v3.x
 endif
 # release candidates are in testing/ subdir
 ifneq ($(findstring -rc,$(LINUX_VERSION)),)
-LINUX_SITE := $(LINUX_SITE)testing/
+LINUX_SITE := $(LINUX_SITE)/testing/
 endif # -rc
 endif
 
