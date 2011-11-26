From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 26 Nov 2011 14:30:15 +0100
Subject: [Buildroot] [git commit] ruby: fix host build breakage
Message-ID: <20111126133047.86D968F643@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=150124b9525c5db8f1f70e092ac6b00a7fb7e898
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When building host-ruby with ncurses enabled on an x86_64 host we get a
"relocation R_X86_64_32 against `_nc_globals' can not be used when making
a shared object; recompile with -fPIC" error when building.
Just disable ncurses and readline support for the host version - we
don't need it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ruby/ruby.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index a34a251..ad791f8 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -11,8 +11,7 @@ HOST_RUBY_AUTORECONF = YES
 RUBY_DEPENDENCIES = host-ruby
 RUBY_MAKE_ENV = $(TARGET_MAKE_ENV)
 RUBY_CONF_OPT = --disable-install-doc --disable-rpath
-
-HOST_RUBY_CONF_OPT = --disable-install-doc
+HOST_RUBY_CONF_OPT = --disable-install-doc --without-ncurses --without-readline
 
 # Force optionals to build before we do
 ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
