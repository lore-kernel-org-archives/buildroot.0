From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 24 Nov 2011 21:44:21 -0300
Subject: [Buildroot] [PATCH] ruby: fix build breakage
Message-ID: <1322181861-11963-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix build breakage regarding invalid file format of
/usr/lib/libpthread.so
This is because ruby has rpath enabled by default and was throwing in
the runtime paths and pulling in host libraries into the mix.
So disable rpath.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ruby/ruby.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 3495333..a34a251 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -10,7 +10,7 @@ RUBY_AUTORECONF = YES
 HOST_RUBY_AUTORECONF = YES
 RUBY_DEPENDENCIES = host-ruby
 RUBY_MAKE_ENV = $(TARGET_MAKE_ENV)
-RUBY_CONF_OPT = --disable-install-doc
+RUBY_CONF_OPT = --disable-install-doc --disable-rpath
 
 HOST_RUBY_CONF_OPT = --disable-install-doc
 
-- 
1.7.3.4
