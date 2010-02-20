From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2010 19:43:03 +0100
Subject: [Buildroot] [PATCH 12/16] libpng: enable compilation on the host
In-Reply-To: <cover.1266691382.git.thomas.petazzoni@free-electrons.com>
References: <cover.1266691382.git.thomas.petazzoni@free-electrons.com>
Message-ID: <8e8a4ee518b84a7e5f16764022ea2cf8ba455627.1266691382.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libpng is needed on the host to build ace_of_penguins.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libpng/libpng.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 1297c89..1b50707 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -11,7 +11,11 @@ LIBPNG_INSTALL_STAGING = YES
 LIBPNG_CONF_OPT = --without-libpng-compat
 LIBPNG_DEPENDENCIES = host-pkg-config zlib
 
+HOST_LIBPNG_CONF_OPT = --without-libpng-compat
+HOST_LIBPNG_DEPENDENCIES = host-zlib
+
 $(eval $(call AUTOTARGETS,package,libpng))
+$(eval $(call AUTOTARGETS,package,libpng,host))
 
 $(LIBPNG_HOOK_POST_INSTALL):
 	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
-- 
1.6.3.3
