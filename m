From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 17 Jan 2012 23:32:33 +0100
Subject: [Buildroot] [git commit] libpng: removed redundant
	HOST_FOO_DEPENDENCIES
Message-ID: <20120117224424.4ACB59036D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cfd73405e082ca2d955c689ebadacccc168530e0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libpng/libpng.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index d2aa329..f78b61d 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -10,8 +10,6 @@ LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.bz2
 LIBPNG_INSTALL_STAGING = YES
 LIBPNG_DEPENDENCIES = host-pkg-config zlib
 
-HOST_LIBPNG_DEPENDENCIES = host-pkg-config host-zlib
-
 define LIBPNG_STAGING_LIBPNG12_CONFIG_FIXUP
 	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
 		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
