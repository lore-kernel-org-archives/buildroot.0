From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2010 18:46:50 +0100
Subject: [Buildroot] [PATCH 12/38] libpng: enable compilation on the host
In-Reply-To: <cover.1266774432.git.thomas.petazzoni@free-electrons.com>
References: <cover.1266774432.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4829ea9e91eb7a9dde697d83670bc129f17a2cb1.1266774432.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libpng is needed on the host to build ace_of_penguins.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libpng/libpng.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 1297c89..0303d51 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -11,7 +11,12 @@ LIBPNG_INSTALL_STAGING = YES
 LIBPNG_CONF_OPT = --without-libpng-compat
 LIBPNG_DEPENDENCIES = host-pkg-config zlib
 
+HOST_LIBPNG_LIBTOOL_PATCH = NO
+HOST_LIBPNG_CONF_OPT = --without-libpng-compat
+HOST_LIBPNG_DEPENDENCIES = host-zlib
+
 $(eval $(call AUTOTARGETS,package,libpng))
+$(eval $(call AUTOTARGETS,package,libpng,host))
 
 $(LIBPNG_HOOK_POST_INSTALL):
 	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
-- 
1.6.3.3
