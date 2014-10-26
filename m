From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 26 Oct 2014 19:45:14 +0100
Subject: [Buildroot] [PATCH 08/51] geoip: bump version
In-Reply-To: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1414349157-22749-8-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The tarball from the release contains the configure and Makefile.in,
there's no longer need to AUTORECONF.

Add a hash file since the tarball has been uploaded by the maintainer.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/geoip/geoip.hash | 2 ++
 package/geoip/geoip.mk   | 5 ++---
 2 files changed, 4 insertions(+), 3 deletions(-)
 create mode 100644 package/geoip/geoip.hash

diff --git a/package/geoip/geoip.hash b/package/geoip/geoip.hash
new file mode 100644
index 0000000..717bec4
--- /dev/null
+++ b/package/geoip/geoip.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  8ef059ee3680b39db967248331ec41188f4b45f86a4a77e39247ff41b61efd7c  GeoIP-1.6.2.tar.gz
diff --git a/package/geoip/geoip.mk b/package/geoip/geoip.mk
index bbfa014..26e55e1 100644
--- a/package/geoip/geoip.mk
+++ b/package/geoip/geoip.mk
@@ -4,10 +4,9 @@
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
 GEOIP_LICENSE_FILES = LICENSE COPYING
-- 
2.1.1
