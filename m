From: Nicolas Carrier <nicolas.carrier@orolia.com>
Date: Fri, 25 Oct 2019 13:37:20 +0000
Subject: [Buildroot] [PATCH v2 1/1] package/ruby: enable openssl for
 host-ruby
Message-ID: <20191025133705.32021-1-nicolas.carrier@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Openssl is required so that Gem can install ruby gems from secure websites.

ERROR:  While executing gem ... (Gem::Exception)
    Unable to require openssl, install OpenSSL and rebuild ruby (preferred) or
use non-HTTPS sources

Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
---
Changes v1 -> v2:
  - remove original committer, since he has left the company
  - added dependency on host-openssl
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
-- 
2.20.1
