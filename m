From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 May 2021 14:22:53 +0200
Subject: [Buildroot] [git commit branch/next] package/libsndfile: add
 external libs support
Message-ID: <20210524115418.D5B918A433@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dbc6e9e9f385995eb10bbfb0bb08e7674100ce66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr: dependencies fit on a single line]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libsndfile/libsndfile.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/libsndfile/libsndfile.mk b/package/libsndfile/libsndfile.mk
index 2505e8d17f..69530c98ed 100644
--- a/package/libsndfile/libsndfile.mk
+++ b/package/libsndfile/libsndfile.mk
@@ -18,7 +18,13 @@ LIBSNDFILE_IGNORE_CVES += CVE-2018-13419
 LIBSNDFILE_CONF_OPTS = \
 	--disable-sqlite \
 	--disable-alsa \
-	--disable-external-libs \
 	--disable-full-suite
 
+ifeq ($(BR2_PACKAGE_FLAC)$(BR2_PACKAGE_LIBVORBIS)$(BR2_PACKAGE_OPUS),yyy)
+LIBSNDFILE_DEPENDENCIES += flac host-pkgconf libvorbis opus
+LIBSNDFILE_CONF_OPTS += --enable-external-libs
+else
+LIBSNDFILE_CONF_OPTS += --disable-external-libs
+endif
+
 $(eval $(autotools-package))
