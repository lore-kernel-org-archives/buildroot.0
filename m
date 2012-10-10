From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 10 Oct 2012 14:55:23 +0200
Subject: [Buildroot] [git commit] package: use http:// for alioth.debian.org
	URLs
Message-ID: <20121010125600.9A38D99808@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=72eb8290d25b98dea2f084451589da69f319e012
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/183a1be6ab1137c90dca0201d4bc72c7c0e659a3

alioth.debian.org uses a SSL certificate signed by spi-inc.org, which isn't
a trusted CA on non-Debian systems, causing wget to refuse download.

Fix it by using http URLs instead.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ccid/ccid.mk           |    2 +-
 package/pcsc-lite/pcsc-lite.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ccid/ccid.mk b/package/ccid/ccid.mk
index 677ac02..d1ebf8c 100644
--- a/package/ccid/ccid.mk
+++ b/package/ccid/ccid.mk
@@ -5,7 +5,7 @@
 # ########################################################
 CCID_VERSION = 1.4.7
 CCID_SOURCE = ccid-$(CCID_VERSION).tar.bz2
-CCID_SITE = https://alioth.debian.org/frs/download.php/3730
+CCID_SITE = http://alioth.debian.org/frs/download.php/3730
 CCID_INSTALL_STAGING = YES
 CCID_DEPENDENCIES = pcsc-lite host-pkg-config libusb
 
diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
index 6c57dbb..49eeec7 100644
--- a/package/pcsc-lite/pcsc-lite.mk
+++ b/package/pcsc-lite/pcsc-lite.mk
@@ -5,7 +5,7 @@
 # ########################################################
 PCSC_LITE_VERSION = 1.8.6
 PCSC_LITE_SOURCE = pcsc-lite-$(PCSC_LITE_VERSION).tar.bz2
-PCSC_LITE_SITE = https://alioth.debian.org/frs/download.php/3757
+PCSC_LITE_SITE = http://alioth.debian.org/frs/download.php/3757
 PCSC_LITE_INSTALL_STAGING = YES
 PCSC_LITE_DEPENDENCIES = host-pkg-config
 
