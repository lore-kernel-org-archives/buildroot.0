From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 1 May 2021 14:46:15 +0200
Subject: [Buildroot] [git commit] package/sane-backends: poppler-glib needs
 cairo
Message-ID: <20210501121954.C6D8B8418E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d3a8ca93717231b332a9e8b7f2d5d6f492145a3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- poppler-glib depends on cairo (see poppler-0.84.0/CMakeLists.txt):

  185 else()
  186   set(CAIRO_FEATURE "#undef POPPLER_HAS_CAIRO")
  187   set(ENABLE_GLIB OFF)
  188 endif()

Fixes:

  - http://autobuild.buildroot.net/results/9a345f82c7a010f6b2a3361f25b14caefa9dcbef

  checking for POPPLER_GLIB... no
  configure: error: poppler-glib requested but not found

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/sane-backends/sane-backends.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sane-backends/sane-backends.mk b/package/sane-backends/sane-backends.mk
index 697aa3252b..a8f7466f70 100644
--- a/package/sane-backends/sane-backends.mk
+++ b/package/sane-backends/sane-backends.mk
@@ -61,7 +61,7 @@ else
 SANE_BACKENDS_CONF_OPTS += --without-libcurl
 endif
 
-ifeq ($(BR2_PACKAGE_POPPLER)$(BR2_PACKAGE_LIBGLIB2),yy)
+ifeq ($(BR2_PACKAGE_POPPLER)$(BR2_PACKAGE_CAIRO)$(BR2_PACKAGE_LIBGLIB2),yyy)
 SANE_BACKENDS_DEPENDENCIES += poppler libglib2
 SANE_BACKENDS_CONF_OPTS += --with-poppler-glib
 else
