From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 8 Jul 2018 12:22:14 +0200
Subject: [Buildroot] [git commit] package/busybox: invert dependency with
 unzip
Message-ID: <20180708110809.F39E1863D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=faa21d4d22e1d8aac2313dcdc2f4bb9274ca59f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/busybox/busybox.mk | 1 +
 package/unzip/unzip.mk     | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 817f7a9c63..45153731af 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_UNZIP),unzip) \
 	$(if $(BR2_PACKAGE_USBUTILS),usbutils) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX),util-linux) \
 	$(if $(BR2_PACKAGE_VIM),vim) \
diff --git a/package/unzip/unzip.mk b/package/unzip/unzip.mk
index 7d48d25309..cff5951ac0 100644
--- a/package/unzip/unzip.mk
+++ b/package/unzip/unzip.mk
@@ -7,8 +7,6 @@
 UNZIP_VERSION = 60
 UNZIP_SOURCE = unzip$(UNZIP_VERSION).tgz
 UNZIP_SITE = ftp://ftp.info-zip.org/pub/infozip/src
-# take precedence over busybox implementation
-UNZIP_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
 UNZIP_LICENSE = Info-ZIP
 UNZIP_LICENSE_FILES = LICENSE
 
