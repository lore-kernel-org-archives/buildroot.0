From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Sep 2015 13:57:27 +0200
Subject: [Buildroot] [git commit] linux-fusion: bump to 9.0.3, use .tar.xz
Message-ID: <20150910122136.E1D7B80E4B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=96b785ee9dd95ad9193c902642e8ac699132eed1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit bumps linux-fusion to the latest upstream version, and
switches to use the more space efficient xz-compressed tarball.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-fusion/linux-fusion.hash |    4 ++--
 package/linux-fusion/linux-fusion.mk   |    3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/linux-fusion/linux-fusion.hash b/package/linux-fusion/linux-fusion.hash
index 307c522..4bf288d 100644
--- a/package/linux-fusion/linux-fusion.hash
+++ b/package/linux-fusion/linux-fusion.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256	96508ab2c27074af6e18474fec23595520379e2256df84c63897fcd9672ee9b1	linux-fusion-9.0.2.tar.gz
+# Locally computed
+sha256 c3c71af364ef774c70d3f6fbc32d14bc786d915df633d6fe733e1fde84ad6e99 linux-fusion-9.0.3.tar.xz
diff --git a/package/linux-fusion/linux-fusion.mk b/package/linux-fusion/linux-fusion.mk
index 326ef88..4d113e7 100644
--- a/package/linux-fusion/linux-fusion.mk
+++ b/package/linux-fusion/linux-fusion.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LINUX_FUSION_VERSION = 9.0.2
+LINUX_FUSION_VERSION = 9.0.3
 LINUX_FUSION_SITE = http://directfb.org/downloads/Core/linux-fusion
+LINUX_FUSION_SOURCE = linux-fusion-$(LINUX_FUSION_VERSION).tar.xz
 LINUX_FUSION_INSTALL_STAGING = YES
 LINUX_FUSION_DEPENDENCIES = linux
 LINUX_FUSION_LICENSE = GPLv2+
