From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 15:09:00 +0200
Subject: [Buildroot] [git commit] package/iputils: bump version to s20161105
Message-ID: <20170605130940.3714E7FCE1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=05324c4ecef27e17e94c8f1c83fa18ae7ecacd71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump package to latest tagged release, fix typo and check-package
errors.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/iputils/Config.in    | 5 +++--
 package/iputils/iputils.hash | 2 +-
 package/iputils/iputils.mk   | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/iputils/Config.in b/package/iputils/Config.in
index c83e414..b5d9141 100644
--- a/package/iputils/Config.in
+++ b/package/iputils/Config.in
@@ -2,7 +2,8 @@ config BR2_PACKAGE_IPUTILS
 	bool "iputils"
 	depends on BR2_USE_MMU # fork()
 	help
-	  This package is set of small useful utilities for Linux networking.
-	  It includes complete versions of ping, traceroute, etc.
+	  This package is set of small useful utilities for Linux
+	  networking. It includes complete versions of ping, traceroute,
+	  etc.
 
 	  https://github.com/iputils/iputils
diff --git a/package/iputils/iputils.hash b/package/iputils/iputils.hash
index d7d3f5c..a19348a 100644
--- a/package/iputils/iputils.hash
+++ b/package/iputils/iputils.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	79e22e940b6f52c37810657c8f12e7ba85692b517d6cd6e90cbceac2d94fc5e8	iputils-55828d1fef3fed7f07abcbf7be9282a9662e78c7.tar.gz
+sha256 f813092f03d17294fd23544b129b95cdb87fe19f7970a51908a6b88509acad8a  iputils-s20161105.tar.gz
diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index a3ab836..57dc660 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -7,11 +7,11 @@
 # The original upstream was forked to the github repository in 2014 to
 # pull fixes from other distribution and centralize the changes after
 # the upstream seemed to have gone dormant.  The fork contains the
-# latest changes including msul support, removing a libsysfs dependency
+# latest changes including musl support, removing a libsysfs dependency
 # and IPv6 updates.
 # http://www.spinics.net/lists/netdev/msg279881.html
 
-IPUTILS_VERSION = 55828d1fef3fed7f07abcbf7be9282a9662e78c7
+IPUTILS_VERSION = s20161105
 IPUTILS_SITE = $(call github,iputils,iputils,$(IPUTILS_VERSION))
 IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause, BSD-4-Clause
 # Only includes a license file for BSD
