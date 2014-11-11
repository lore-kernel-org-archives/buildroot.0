From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 11 Nov 2014 20:42:44 -0300
Subject: [Buildroot] [PATCH 1/2] libmemcached: disable libmudflapth support
Message-ID: <1415749365-10946-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We're not handling it (copying it) for external toolchains and it's
causing build failures. Fixes:
http://autobuild.buildroot.net/results/9d1/9d1e414850307487d65435216ae0ddee56d1098f/
http://autobuild.buildroot.net/results/f08/f08c8e5514e054397428677f08fadac5386189dc/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libmemcached/libmemcached.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libmemcached/libmemcached.mk b/package/libmemcached/libmemcached.mk
index 5ba2044..daeb283 100644
--- a/package/libmemcached/libmemcached.mk
+++ b/package/libmemcached/libmemcached.mk
@@ -7,7 +7,9 @@
 LIBMEMCACHED_VERSION_MAJOR = 1.0
 LIBMEMCACHED_VERSION = $(LIBMEMCACHED_VERSION_MAJOR).18
 LIBMEMCACHED_SITE = http://launchpad.net/libmemcached/$(LIBMEMCACHED_VERSION_MAJOR)/$(LIBMEMCACHED_VERSION)/+download
-LIBMEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
+LIBMEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99' \
+	ax_cv_check_cflags__Werror__fmudflapth=no \
+	ax_cv_check_cxxflags__Werror__fmudflapth=no
 LIBMEMCACHED_CONF_OPTS = --disable-dtrace
 LIBMEMCACHED_INSTALL_STAGING = YES
 LIBMEMCACHED_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBEVENT),libevent)
-- 
2.0.4
