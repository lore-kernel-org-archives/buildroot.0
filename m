From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 8 Jul 2018 13:08:05 +0200
Subject: [Buildroot] [git commit] package/busybox: invert dependency with
 debianutils
Message-ID: <20180708110811.46CDC863D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=00d8894dfc9f4fb85b539b30aa6da2bfbc44339b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/busybox/busybox.mk         | 1 +
 package/debianutils/debianutils.mk | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index dbb4a9b93f..20459f123a 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_DEBIANUTILS),debianutils) \
 	$(if $(BR2_PACKAGE_DIFFUTILS),diffutils) \
 	$(if $(BR2_PACKAGE_DOS2UNIX),dos2unix) \
 	$(if $(BR2_PACKAGE_E2FSPROGS),e2fsprogs) \
diff --git a/package/debianutils/debianutils.mk b/package/debianutils/debianutils.mk
index 86f201da1c..189d983732 100644
--- a/package/debianutils/debianutils.mk
+++ b/package/debianutils/debianutils.mk
@@ -8,8 +8,6 @@ DEBIANUTILS_VERSION = 4.8.1
 DEBIANUTILS_SOURCE = debianutils_$(DEBIANUTILS_VERSION).tar.xz
 DEBIANUTILS_SITE = http://snapshot.debian.org/archive/debian/20161118T033019Z/pool/main/d/debianutils
 DEBIANUTILS_CONF_OPTS = --exec-prefix=/
-# Make sure we override the busybox tools, such as which
-DEBIANUTILS_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
 DEBIANUTILS_LICENSE = GPL-2.0+, SMAIL (savelog)
 DEBIANUTILS_LICENSE_FILES = debian/copyright
 
