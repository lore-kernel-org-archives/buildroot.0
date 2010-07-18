From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Jul 2010 23:30:24 +0200
Subject: [Buildroot] [PATCH 1/2] neon: explicit path to xml2-config
In-Reply-To: <cover.1279488610.git.thomas.petazzoni@free-electrons.com>
References: <cover.1279488610.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4a2dabe9d53e6c361ecdeaba0431ef74a9ad297c.1279488610.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that $(STAGING_DIR)/usr/bin is not in the PATH, we need to
explicit the path to such tools.

This might also fix bug 1393 since by expliciting the path to
xml2-config, we'll force neon ./configure to choose our xml2-config
and not the one of the host.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/neon/neon.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index ed5f999..e942f87 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -14,6 +14,7 @@ NEON_DEPENDENCIES:=host-pkg-config
 ifeq ($(BR2_PACKAGE_NEON_LIBXML2),y)
 NEON_CONF_OPT+=--with-libxml2=yes
 NEON_CONF_OPT+=--with-expat=no
+NEON_CONF_ENV+=ac_cv_prog_XML2_CONFIG=$(STAGING_DIR)/usr/bin/xml2-config
 NEON_DEPENDENCIES+=libxml2
 endif
 ifeq ($(BR2_PACKAGE_NEON_ZLIB),y)
-- 
1.7.0.4
