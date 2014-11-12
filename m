From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 12 Nov 2014 08:53:25 +0100
Subject: [Buildroot] [git commit] libmemcached: disable libmudflapth support
Message-ID: <20141112075951.43F22B442E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2bf5928503231224980d5030197d57d511ab9645
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We're not handling it (copying it) for external toolchains and it's
causing build failures. Fixes:
http://autobuild.buildroot.net/results/9d1/9d1e414850307487d65435216ae0ddee56d1098f/
http://autobuild.buildroot.net/results/f08/f08c8e5514e054397428677f08fadac5386189dc/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmemcached/libmemcached.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

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
