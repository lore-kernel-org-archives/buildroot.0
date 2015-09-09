From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 9 Sep 2015 10:01:13 +0100
Subject: [Buildroot] [PATCHv3] package/efl/libevas: remove unsafe paths
Message-ID: <1441789273-1850-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.net/results/7f2/7f2baef97c4ff3b9111becc1e0b79780c6e9db6f/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v2 -> v3:
  - Indent the sed command with a tab (Suggested by Arnout)
Changes v1 -> v2:
  - Use % instead of # in the sed command (Suggested by Arnout)
  - Remove the useless host-post-patch-hook (Suggested by Arnout)

 package/efl/libevas/libevas.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
index 8113162..6f48720 100644
--- a/package/efl/libevas/libevas.mk
+++ b/package/efl/libevas/libevas.mk
@@ -17,6 +17,12 @@ LIBEVAS_DEPENDENCIES = host-pkgconf zlib libeina freetype
 HOST_LIBEVAS_DEPENDENCIES = \
 	host-pkgconf host-zlib host-libeina \
 	host-freetype host-libpng host-libjpeg
+
+define LIBEVAS_REMOVE_UNSAFE_PATHS
+	$(SED) 's%-I/usr/include%%g' $(@D)/configure
+endef
+LIBEVAS_POST_PATCH_HOOKS += LIBEVAS_REMOVE_UNSAFE_PATHS
+
 HOST_LIBEVAS_CONF_OPTS += \
 	--enable-image-loader-png \
 	--enable-image-loader-jpeg \
-- 
1.7.1
