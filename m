From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 14 Oct 2012 20:18:03 +0200
Subject: [Buildroot] [git commit] cairo: disable trace and trace interpreter
Message-ID: <20121014182022.A297799551@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=85280ef82936257456449f189d2ea4b484a8f269
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Cairo tracing and trace interpreter are most likely not that
useful, so disable them. They also require zlib, which isn't a
dependency of Cairo at the moment. This fixes the following build
failure:

  http://autobuild.buildroot.org/results/a91e4e337fd9deb0f9fad433350feb27b2aee556/build-end.log

In the future, if people are interested by the trace and trace
interpreter, we can add a new Config.in knob for them.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cairo/cairo.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index eedb28d..2a453bb 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -34,6 +34,10 @@ CAIRO_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 		ac_cv_func_working_mktime=yes jm_cv_func_working_re_compile_pattern=yes \
 		ac_use_included_regex=no gl_cv_c_restrict=no
 
+CAIRO_CONF_OPT = \
+	--enable-trace=no \
+	--enable-interpreter=no
+
 CAIRO_DEPENDENCIES = host-pkg-config fontconfig pixman
 
 ifeq ($(BR2_PACKAGE_DIRECTFB),y)
