From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Jul 2015 15:11:38 +0200
Subject: [Buildroot] [git commit] Revert "busybox: added linux-pam support"
Message-ID: <20150720132825.D75248193A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c32bd82941dcd8e2d3d4512b2fcf69bdd154c989
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 083aeac94e19cde6abd4b29cf29db589327d8c49.

Commit f21b2558a097 (busybox: added linux-pam support, 2015-06-02) added
linux-pam support already, no need to do this again. Commit 083aeac94e19
(busybox: added linux-pam support, 2015-07-14) also effectively annulled the
build failure fix from commit 98e1848db11e (busybox: PAM support needs thread
support, 2015-07-04). Revert it.

Fixes:
http://autobuild.buildroot.net/results/8df/8df14bde19a41b78aa6422a1649a570914f747ee/
http://autobuild.buildroot.net/results/30d/30dd11b576b590de513031fce5e034353f2f5544/
http://autobuild.buildroot.net/results/de6/de628d84b0ed49be8f5d021c789357b2e66f2b02/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/busybox.mk |    7 -------
 1 files changed, 0 insertions(+), 7 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index ce6652b..65ce7ef 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -141,13 +141,6 @@ define BUSYBOX_SET_INIT
 endef
 endif
 
-ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
-define BUSYBOX_LINUX_PAM
-	$(call KCONFIG_ENABLE_OPT,CONFIG_PAM,$(BUSYBOX_BUILD_CONFIG))
-endef
-BUSYBOX_DEPENDENCIES += linux-pam
-endif
-
 ifeq ($(BR2_PACKAGE_BUSYBOX_SELINUX),y)
 BUSYBOX_DEPENDENCIES += host-pkgconf libselinux libsepol
 define BUSYBOX_SET_SELINUX
