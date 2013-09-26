From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu, 26 Sep 2013 18:21:52 -0500
Subject: [Buildroot] [PATCH v3 09/11] libpng: ensure libpng12 is installed
	before libpng
In-Reply-To: <1380237714-2470-1-git-send-email-spenser@gillilanding.com>
References: <1380237714-2470-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1380237714-2470-10-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This ensures that libpng (which is a newer version) is used when a specific
version of libpng (i.e. libpng12) is not selected.

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/libpng/libpng.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index f5bf956..033587e 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -14,5 +14,9 @@ LIBPNG_INSTALL_STAGING = YES
 LIBPNG_DEPENDENCIES = host-pkgconf zlib
 LIBPNG_CONFIG_SCRIPTS = libpng$(LIBPNG_SERIES)-config libpng-config
 
+# Ensure this libpng is the last installed in the case of multiple libpng
+# installs.
+LIBPNG_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBPNG12),libpng12)
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.7.1
