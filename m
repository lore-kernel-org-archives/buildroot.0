From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Oct 2019 16:51:42 +0200
Subject: [Buildroot] [git commit] package/ruby: enable openssl for host-ruby
Message-ID: <20191025150508.3321B868DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed5549b987ed35087b37828b6012a4155db31509
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Openssl is required so that Gem can install ruby gems from secure websites.

ERROR:  While executing gem ... (Gem::Exception)
    Unable to require openssl, install OpenSSL and rebuild ruby (preferred) or
use non-HTTPS sources

Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ruby/ruby.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index c3d021c381..1899d14797 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -10,12 +10,12 @@ RUBY_VERSION_EXT = 2.4.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
 RUBY_DEPENDENCIES = host-pkgconf host-ruby
-HOST_RUBY_DEPENDENCIES = host-pkgconf
+HOST_RUBY_DEPENDENCIES = host-pkgconf host-openssl
 RUBY_MAKE_ENV = $(TARGET_MAKE_ENV)
 RUBY_CONF_OPTS = --disable-install-doc --disable-rpath --disable-rubygems
 HOST_RUBY_CONF_OPTS = \
 	--disable-install-doc \
-	--with-out-ext=curses,openssl,readline \
+	--with-out-ext=curses,readline \
 	--without-gmp
 RUBY_LICENSE = Ruby or BSD-2-Clause, BSD-3-Clause, others
 RUBY_LICENSE_FILES = LEGAL COPYING BSDL
