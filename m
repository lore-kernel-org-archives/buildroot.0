From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 6 Feb 2013 14:42:52 +0100
Subject: [Buildroot] [git commit] mdadm: use BR2_KERNEL_MIRROR for SITE
Message-ID: <20130206134909.7758D9A813@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dc27510ed2b32f26e067fa5bc492695dd9d2b8cb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mdadm/mdadm.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index 7e93449..dd2b49f 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -6,7 +6,7 @@
 
 MDADM_VERSION = 2.6.9
 MDADM_SOURCE = mdadm-$(MDADM_VERSION).tar.bz2
-MDADM_SITE = http://www.kernel.org/pub/linux/utils/raid/mdadm
+MDADM_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/raid/mdadm
 
 MDADM_MAKE_OPT = \
 	CFLAGS="$(TARGET_CFLAGS)" CC="$(TARGET_CC)" -C $(MDADM_DIR) mdadm
