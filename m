From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Oct 2014 01:17:06 +0100
Subject: [Buildroot] [git commit] geoip: bump version
Message-ID: <20141027002037.331A3B0DB7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5d595b178e23b97e5cd19c2b2a6049e0b7afea77
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The tarball from the release contains the configure and Makefile.in,
there's no longer need to AUTORECONF.

Add a hash file since the tarball has been uploaded by the maintainer.

[Peter: fix _LICENSE_FILES]
Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/geoip/geoip.hash |    2 ++
 package/geoip/geoip.mk   |    7 +++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/geoip/geoip.hash b/package/geoip/geoip.hash
new file mode 100644
index 0000000..717bec4
--- /dev/null
+++ b/package/geoip/geoip.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  8ef059ee3680b39db967248331ec41188f4b45f86a4a77e39247ff41b61efd7c  GeoIP-1.6.2.tar.gz
diff --git a/package/geoip/geoip.mk b/package/geoip/geoip.mk
index bbfa014..5664f03 100644
--- a/package/geoip/geoip.mk
+++ b/package/geoip/geoip.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-GEOIP_VERSION = 1.6.0
+GEOIP_VERSION = 1.6.2
 GEOIP_SOURCE = GeoIP-$(GEOIP_VERSION).tar.gz
-GEOIP_SITE = $(call github,maxmind,geoip-api-c,v$(GEOIP_VERSION))
-GEOIP_AUTORECONF = YES
+GEOIP_SITE = https://github.com/maxmind/geoip-api-c/releases/download/v$(GEOIP_VERSION)/
 GEOIP_INSTALL_STAGING = YES
 GEOIP_LICENSE = LGPLv2.1+
-GEOIP_LICENSE_FILES = LICENSE COPYING
+GEOIP_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
