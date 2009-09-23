From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 23 Sep 2009 14:57:12 +0200
Subject: [Buildroot] [git commit master] package: fix reference to host
	glib-genmarshal
Message-ID: <20090923125729.A0E90776BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=04bef3eb55a154b846d59da2d6758f7a6e34e181
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported by Sven Neumann <s.neumann@raumfeld.com>

Use LIBGLIB2_HOST_BINARY instead of the non-existing $(HOST_GLIB)
variable to refer to the host version of glib-genmarshal.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/java/classpath/classpath.mk |    2 +-
 package/libsoup/libsoup.mk          |    3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/java/classpath/classpath.mk b/package/java/classpath/classpath.mk
index 49728f4..3cd21eb 100644
--- a/package/java/classpath/classpath.mk
+++ b/package/java/classpath/classpath.mk
@@ -41,7 +41,7 @@ CLASSPATH_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 		gl_cv_func_mkdir_trailing_slash_bug=no gl_cv_func_mkstemp_limitations=no \
 		ac_cv_func_working_mktime=yes jm_cv_func_working_re_compile_pattern=yes \
 		ac_use_included_regex=no gl_cv_c_restrict=no \
-		ac_cv_path_GLIB_GENMARSHAL=$(HOST_GLIB)/glib-genmarshal \
+		ac_cv_path_GLIB_GENMARSHAL=$(LIBGLIB2_HOST_BINARY) \
 		ac_cv_prog_F77=no ac_cv_prog_CXX=no ac_cv_path_CUPS_CONFIG=no
 
 
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index e6a5f0a..64a192c 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -12,8 +12,7 @@ LIBSOUP_AUTORECONF = YES
 LIBSOUP_INSTALL_STAGING = YES
 LIBSOUP_INSTALL_TARGET = YES
 
-LIBSOUP_CONF_ENV = \
-		ac_cv_path_GLIB_GENMARSHAL=$(HOST_GLIB)/bin/glib-genmarshal
+LIBSOUP_CONF_ENV = ac_cv_path_GLIB_GENMARSHAL=$(LIBGLIB2_HOST_BINARY)
 
 ifneq ($(BR2_INET_IPV6),y)
 LIBSOUP_CONF_ENV += soup_cv_ipv6=no
-- 
1.6.3.3
