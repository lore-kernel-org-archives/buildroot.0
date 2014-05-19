From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 19 May 2014 17:11:24 -0300
Subject: [Buildroot] [PATCH] ruby: add psych/libyaml support
Message-ID: <1400530284-17057-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ruby/ruby.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 0ea352d..1185323 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -29,6 +29,9 @@ RUBY_CONF_ENV = CFLAGS="$(RUBY_CFLAGS)"
 ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
 	RUBY_DEPENDENCIES += berkeleydb
 endif
+ifeq ($(BR2_PACKAGE_LIBYAML),y)
+	RUBY_DEPENDENCIES += libyaml
+endif
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 	RUBY_DEPENDENCIES += ncurses
 endif
-- 
1.8.5.5
