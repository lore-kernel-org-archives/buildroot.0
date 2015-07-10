From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 10 Jul 2015 13:50:08 -0300
Subject: [Buildroot] [PATCH] ruby: enable parallel build
Message-ID: <1436547008-31236-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Re-enable parallel builds, it doesn't seem to be affected by the issue
worked around in 9332a1ad4 any more.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ruby/ruby.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 552da07..2fa6b4e 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -12,7 +12,6 @@ RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
 RUBY_DEPENDENCIES = host-pkgconf host-ruby
 HOST_RUBY_DEPENDENCIES = host-pkgconf
 RUBY_MAKE_ENV = $(TARGET_MAKE_ENV)
-RUBY_MAKE = $(MAKE1)
 RUBY_CONF_OPTS = --disable-install-doc --disable-rpath --disable-rubygems
 HOST_RUBY_CONF_OPTS = \
 	--disable-install-doc \
-- 
2.3.6
