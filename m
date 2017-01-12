From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 12 Jan 2017 14:40:34 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/ortp: bump version to 0.27.0
In-Reply-To: <20170112134034.29031-1-joerg.krause@embedded.rocks>
References: <20170112134034.29031-1-joerg.krause@embedded.rocks>
Message-ID: <20170112134034.29031-2-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ortp now depends on bctoolbox. Note, that bctoolbox is added by the
first commit of this series.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
Changes v2:
 - add dependency on bctoolbox
---
 package/ortp/Config.in | 1 +
 package/ortp/ortp.hash | 2 +-
 package/ortp/ortp.mk   | 3 ++-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/ortp/Config.in b/package/ortp/Config.in
index 2de3c91f9..58b8d5c69 100644
--- a/package/ortp/Config.in
+++ b/package/ortp/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_ORTP
 	bool "oRTP"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_BCTOOLBOX
 	help
 	  oRTP, a Real-time Transport Protocol (RTP,RFC3550) library
 
diff --git a/package/ortp/ortp.hash b/package/ortp/ortp.hash
index 8b099a705..c990d96eb 100644
--- a/package/ortp/ortp.hash
+++ b/package/ortp/ortp.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	0deb826b79b1fd329f7638821d5439dc343bc55bb122daa6c90d19116cfe8d9a	ortp-0.25.0.tar.gz
+sha256  eb61a833ab3ad80978d7007411240f46e9b2d1034373b9d9dfaac88c1b6ec0af  ortp-0.27.0.tar.gz
diff --git a/package/ortp/ortp.mk b/package/ortp/ortp.mk
index ca4a90d6d..da17231f9 100644
--- a/package/ortp/ortp.mk
+++ b/package/ortp/ortp.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-ORTP_VERSION = 0.25.0
+ORTP_VERSION = 0.27.0
 ORTP_SITE = http://download.savannah.nongnu.org/releases/linphone/ortp/sources
 
 ORTP_CONF_OPTS = --disable-strict
 ORTP_INSTALL_STAGING = YES
 ORTP_LICENSE = LGPLv2.1+
 ORTP_LICENSE_FILES = COPYING
+ORTP_DEPENDENCIES = bctoolbox
 
 $(eval $(autotools-package))
-- 
2.11.0
