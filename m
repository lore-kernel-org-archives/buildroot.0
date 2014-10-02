From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Oct 2014 12:06:39 +0200
Subject: [Buildroot] [git commit] ruby: use --disable-rubygems
Message-ID: <20141002101332.A34649D801@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=75fb62dd034f6a72b87157b5e5752a98f5019248
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

At least for ruby 2.x we need to --disable-rubygems besides removing the
gems files to avoid the requires.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ruby/ruby.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 8c094b5..bf34189 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -12,7 +12,7 @@ RUBY_DEPENDENCIES = host-pkgconf host-ruby
 HOST_RUBY_DEPENDENCIES = host-pkgconf
 RUBY_MAKE_ENV = $(TARGET_MAKE_ENV)
 RUBY_MAKE = $(MAKE1)
-RUBY_CONF_OPT = --disable-install-doc --disable-rpath
+RUBY_CONF_OPT = --disable-install-doc --disable-rpath --disable-rubygems
 HOST_RUBY_CONF_OPT = --disable-install-doc \
 	--with-out-ext=curses,openssl,readline \
 	--without-gmp
