From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  1 Oct 2014 19:39:56 -0300
Subject: [Buildroot] [PATCH 1/2] ruby: use --disable-rubygems
Message-ID: <1412203197-1167-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

At least for ruby 2.x we need to --disable-rubygems besides removing the
gems files to avoid the requires.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ruby/ruby.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.0.4
