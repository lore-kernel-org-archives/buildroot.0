From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Feb 2017 21:54:59 +0100
Subject: [Buildroot] [git commit] package/cryptodev-linux: fix build with
	recent kernels
Message-ID: <20170209205509.18E7A8218E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d4eb669de285bcb478de9059677a6d3ec191d180
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cryptodev-linux-1.8 build is broken with kernel >= 4.6.0 because of
APIs changes in the kernel. Upstream already fixed this:

https://github.com/cryptodev-linux/cryptodev-linux/commit/2b29be8ac41414ed19cb4f5d5626d9bd0d7b11a8
https://github.com/cryptodev-linux/cryptodev-linux/commit/f126e4837e6334d0464540995df7426fedf6b175
https://github.com/cryptodev-linux/cryptodev-linux/commit/f14b4706b0d04988e7e5bc8c4d2aefef9f029d9d
https://github.com/cryptodev-linux/cryptodev-linux/commit/cb186f682679383e8b5806240927903730ce85d9

Bump to latest commit to fix cryptodev-linux build.

Signed-off-by: S??bastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cryptodev-linux/cryptodev-linux.hash | 4 ++--
 package/cryptodev-linux/cryptodev-linux.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/cryptodev-linux/cryptodev-linux.hash b/package/cryptodev-linux/cryptodev-linux.hash
index d7195ac..6d9efca 100644
--- a/package/cryptodev-linux/cryptodev-linux.hash
+++ b/package/cryptodev-linux/cryptodev-linux.hash
@@ -1,2 +1,2 @@
-# Locally calculated after checking php signature
-sha256	67fabde9fb67b286a96c4f45b594b0eccd0f761b495705c18f2ae9461b831376	cryptodev-linux-1.8.tar.gz
+# Locally calculated
+sha256 a87e354e1218e6a2e3083f7be6a3e351c42ec55515f1aff1b50bd301cee7d8dd cryptodev-linux-2b29be8ac41414ed19cb4f5d5626d9bd0d7b11a8.tar.gz
diff --git a/package/cryptodev-linux/cryptodev-linux.mk b/package/cryptodev-linux/cryptodev-linux.mk
index e23e1e3..709c6ed 100644
--- a/package/cryptodev-linux/cryptodev-linux.mk
+++ b/package/cryptodev-linux/cryptodev-linux.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CRYPTODEV_LINUX_VERSION = 1.8
-CRYPTODEV_LINUX_SITE = http://download.gna.org/cryptodev-linux
+CRYPTODEV_LINUX_VERSION = 2b29be8ac41414ed19cb4f5d5626d9bd0d7b11a8
+CRYPTODEV_LINUX_SITE = $(call github,cryptodev-linux,cryptodev-linux,$(CRYPTODEV_LINUX_VERSION))
 CRYPTODEV_LINUX_INSTALL_STAGING = YES
 CRYPTODEV_LINUX_LICENSE = GPLv2+
 CRYPTODEV_LINUX_LICENSE_FILES = COPYING
