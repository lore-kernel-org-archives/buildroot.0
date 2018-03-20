From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 20 Mar 2018 20:56:49 +0100
Subject: [Buildroot] [V2 2/2] dropbear: unbundle libtomath & libtomcrypt
In-Reply-To: <20180320195649.5309-1-francois.perrad@gadz.org>
References: <20180320195649.5309-1-francois.perrad@gadz.org>
Message-ID: <20180320195649.5309-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/dropbear/Config.in   | 1 +
 package/dropbear/dropbear.mk | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/dropbear/Config.in b/package/dropbear/Config.in
index 670077816..3fa8473e4 100644
--- a/package/dropbear/Config.in
+++ b/package/dropbear/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_DROPBEAR
 	bool "dropbear"
 	select BR2_PACKAGE_ZLIB if !BR2_PACKAGE_DROPBEAR_SMALL
+	select BR2_PACKAGE_LIBTOMCRYPT
 	help
 	  A small SSH 2 server designed for small memory environments.
 
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index c6716f90d..b1818ea5e 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -9,6 +9,8 @@ DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_LICENSE = MIT, BSD-2-Clause-like, BSD-2-Clause
 DROPBEAR_LICENSE_FILES = LICENSE
+DROPBEAR_DEPENDENCIES = libtomcrypt
+DROPBEAR_CONF_OPTS = --disable-bundled-libtom
 DROPBEAR_TARGET_BINS = dropbearkey dropbearconvert scp
 DROPBEAR_PROGRAMS = dropbear $(DROPBEAR_TARGET_BINS)
 
-- 
2.11.0
