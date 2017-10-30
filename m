From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Oct 2017 20:43:36 +0100
Subject: [Buildroot] [git commit] package/cryptodev-linux: bump to the
	latest version (0a54e38)
Message-ID: <20171030193655.5CA1B81047@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a2a23a9a506b64e82f8ebab974ae25ceac4cc87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The build of the cryptodev-linux version used in Buildroot is currently
broken for kernels >= 4.13. A fix was pushed upstream:
https://github.com/cryptodev-linux/cryptodev-linux/commit/f0d69774afb27ffc62bf353465fba145e70cb85a

This patch bumps the cryptodev-linux package version to use the latest
available one, which includes the commit fixing the build for recent
kernels.

Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cryptodev-linux/cryptodev-linux.hash | 2 +-
 package/cryptodev-linux/cryptodev-linux.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cryptodev-linux/cryptodev-linux.hash b/package/cryptodev-linux/cryptodev-linux.hash
index 6d9efca..48d608e 100644
--- a/package/cryptodev-linux/cryptodev-linux.hash
+++ b/package/cryptodev-linux/cryptodev-linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 a87e354e1218e6a2e3083f7be6a3e351c42ec55515f1aff1b50bd301cee7d8dd cryptodev-linux-2b29be8ac41414ed19cb4f5d5626d9bd0d7b11a8.tar.gz
+sha256 90a4c5e46d7d5fcc0c6155f1add824e73c27de9b1ff0b7fe2017a104cf9398dd cryptodev-linux-0a54e38b264d9a3bed74c642a61b88191660d0f8.tar.gz
diff --git a/package/cryptodev-linux/cryptodev-linux.mk b/package/cryptodev-linux/cryptodev-linux.mk
index 91802a7..dacb29d 100644
--- a/package/cryptodev-linux/cryptodev-linux.mk
+++ b/package/cryptodev-linux/cryptodev-linux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRYPTODEV_LINUX_VERSION = 2b29be8ac41414ed19cb4f5d5626d9bd0d7b11a8
+CRYPTODEV_LINUX_VERSION = 0a54e38b264d9a3bed74c642a61b88191660d0f8
 CRYPTODEV_LINUX_SITE = $(call github,cryptodev-linux,cryptodev-linux,$(CRYPTODEV_LINUX_VERSION))
 CRYPTODEV_LINUX_INSTALL_STAGING = YES
 CRYPTODEV_LINUX_LICENSE = GPL-2.0+
