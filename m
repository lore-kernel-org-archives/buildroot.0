From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 26 Nov 2011 14:30:11 +0100
Subject: [Buildroot] [git commit] ruby: fix build breakage
Message-ID: <20111126133047.4A6FD8F643@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fc11bb0ab4db4c44f50b8985b5d1a6f7ca7f5b84
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix build breakage regarding invalid file format of
/usr/lib/libpthread.so
This is because ruby has rpath enabled by default and was throwing in
the runtime paths and pulling in host libraries into the mix.
So disable rpath.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
 
