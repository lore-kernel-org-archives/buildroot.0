From: Nicolas Carrier <nicolas.carrier@orolia.com>
Date: Fri, 25 Oct 2019 12:42:12 +0000
Subject: [Buildroot] [PATCH 1/1] package/ruby: enable openssl for host-ruby
Message-ID: <20191025124156.16411-1-nicolas.carrier@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Andrew Viteri <andrew.viteri@orolia.com>

Openssl is required so that Gem can install ruby gems from secure websites.

ERROR:  While executing gem ... (Gem::Exception)
    Unable to require openssl, install OpenSSL and rebuild ruby (preferred) or
use non-HTTPS sources

Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
---
 package/ruby/ruby.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index c3d021c381..3f26ae2dfc 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -15,7 +15,7 @@ RUBY_MAKE_ENV = $(TARGET_MAKE_ENV)
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
