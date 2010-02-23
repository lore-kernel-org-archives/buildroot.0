From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2010 21:27:28 +0100
Subject: [Buildroot] [git commit master] libpng: enable compilation on the
	host
Message-ID: <20100223202925.BCD81776A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=988b4d8d1cce4187bb0600cebd31dcff7c726056
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libpng is needed on the host to build ace_of_penguins.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libpng/libpng.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 1297c89..86e943c 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -11,7 +11,12 @@ LIBPNG_INSTALL_STAGING = YES
 LIBPNG_CONF_OPT = --without-libpng-compat
 LIBPNG_DEPENDENCIES = host-pkg-config zlib
 
+HOST_LIBPNG_LIBTOOL_PATCH = NO
+HOST_LIBPNG_CONF_OPT = --without-libpng-compat
+HOST_LIBPNG_DEPENDENCIES = host-pkg-config host-zlib
+
 $(eval $(call AUTOTARGETS,package,libpng))
+$(eval $(call AUTOTARGETS,package,libpng,host))
 
 $(LIBPNG_HOOK_POST_INSTALL):
 	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
-- 
1.6.3.3
