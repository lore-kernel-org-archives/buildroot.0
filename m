From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Sep 2020 23:01:33 +0200
Subject: [Buildroot] [git commit] package/ruby: drop useless SuperH CFLAGS
 tweaks
Message-ID: <20200930205128.91CFD87588@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1c2b4070026bac40beb610504348dd3cc2af337b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We dropped the CodeBench 2012.09 toolchain for SuperH a long time,
and with recent toolchains, Ruby at -Os builds perfectly fine, so
there's no reason to keep this work-around.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998 at free.fr: slight rewording in the commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ruby/ruby.mk | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 6f8cb319cb..d138aaaa1a 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -20,15 +20,6 @@ HOST_RUBY_CONF_OPTS = \
 RUBY_LICENSE = Ruby or BSD-2-Clause, BSD-3-Clause, others
 RUBY_LICENSE_FILES = LEGAL COPYING BSDL
 
-RUBY_CFLAGS = $(TARGET_CFLAGS)
-# With some SuperH toolchains (like Sourcery CodeBench 2012.09), ruby fails to
-# build with 'pcrel too far'. This seems to be caused by the -Os option we pass
-# by default. To fix the problem, use standard -O2 optimization instead.
-ifeq ($(BR2_sh),y)
-RUBY_CFLAGS += -O2
-endif
-RUBY_CONF_ENV = CFLAGS="$(RUBY_CFLAGS)"
-
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 # On uClibc, finite, isinf and isnan are not directly implemented as
 # functions.  Instead math.h #define's these to __finite, __isinf and
