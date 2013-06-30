From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 30 Jun 2013 10:20:35 +0200
Subject: [Buildroot] [git commit] haserl: fix download URLs
Message-ID: <20130630082440.7A2229B16D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=daee3e30baa60dcb84d5b3ac44c32d8adea94a11
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 0.8.0 version is at /projects/haserl/haserl/0.8.0, and 0.9.x versions
at /projects/haserl/haserl-devel/.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/haserl/haserl.mk |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/haserl/haserl.mk b/package/haserl/haserl.mk
index 767ce24..56240c7 100644
--- a/package/haserl/haserl.mk
+++ b/package/haserl/haserl.mk
@@ -5,7 +5,11 @@
 ################################################################################
 
 HASERL_VERSION = $(call qstrip,$(BR2_PACKAGE_HASERL_VERSION))
-HASERL_SITE = http://downloads.sourceforge.net/project/haserl/haserl-devel/$(HASERL_VERSION)
+ifeq ($(BR2_PACKAGE_HASERL_VERSION_0_8_X),y)
+HASERL_SITE = http://downloads.sourceforge.net/project/haserl/haserl/$(HASERL_VERSION)
+else
+HASERL_SITE = http://downloads.sourceforge.net/project/haserl/haserl-devel
+endif
 HASERL_LICENSE = GPLv2
 HASERL_LICENSE_FILES = COPYING
 
