From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Feb 2020 10:26:29 +0100
Subject: [Buildroot] [git commit] package/libmodsecurity: point to staging
 pcre-config
Message-ID: <20200201091602.2C6428675C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=788a7560cb4e1c2f3aea086bd1556616d505cb7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The libmodsecurity build system uses the file installed on the host if not
explicitly pointed to pcre-config in the staging dir.

Fixes:
- http://autobuild.buildroot.net/results/f936ad05bca4bb776917306700750ba6d2498ef0
  + similar failures for other architectures

Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libmodsecurity/libmodsecurity.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libmodsecurity/libmodsecurity.mk b/package/libmodsecurity/libmodsecurity.mk
index c32bfb4b3c..063f969fc6 100644
--- a/package/libmodsecurity/libmodsecurity.mk
+++ b/package/libmodsecurity/libmodsecurity.mk
@@ -18,6 +18,7 @@ LIBMODSECURITY_CONF_ENV = \
 
 LIBMODSECURITY_DEPENDENCIES = pcre
 LIBMODSECURITY_CONF_OPTS = \
+	--with-pcre="$(STAGING_DIR)/usr/bin/pcre-config" \
 	--disable-examples \
 	--without-lmdb \
 	--without-ssdeep \
