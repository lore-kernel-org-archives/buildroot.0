From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 23 Oct 2011 20:51:12 +0200
Subject: [Buildroot] [PATCH] crosstool-ng: fix ccache dependencies order
Message-ID: <1319395872-9051-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

avoid gawk complaining when running 'make ctng-menuconfig' in a
clean/distclean tree in which ccache and crosstool-ng are enabled

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/crosstool-ng/crosstool-ng.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/crosstool-ng/crosstool-ng.mk b/package/crosstool-ng/crosstool-ng.mk
index 8f53a77..84e218e 100644
--- a/package/crosstool-ng/crosstool-ng.mk
+++ b/package/crosstool-ng/crosstool-ng.mk
@@ -4,6 +4,6 @@ CROSSTOOL_NG_SITE              = http://crosstool-ng.org/download/crosstool-ng/
 CROSSTOOL_NG_INSTALL_STAGING   = NO
 CROSSTOOL_NG_INSTALL_TARGET    = NO
 CROSSTOOL_NG_MAKE              = $(MAKE1)
-HOST_CROSSTOOL_NG_DEPENDENCIES = host-gawk host-automake $(if $(BR2_CCACHE),host-ccache)
+HOST_CROSSTOOL_NG_DEPENDENCIES = $(if $(BR2_CCACHE),host-ccache) host-gawk host-automake
 
 $(eval $(call AUTOTARGETS,host))
-- 
1.7.0.4
