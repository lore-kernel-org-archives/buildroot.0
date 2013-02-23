From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 23 Feb 2013 21:37:07 +0100
Subject: [Buildroot] [git commit] ruby: disable parallel build
Message-ID: <20130223204021.E3BFB9AC96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9332a1ad4157605c290639b270a68050ee60cbfe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/c71100ee21a12db47047563c6e70afdc552595d4/

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ruby/ruby.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 601ae90..692e265 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -9,6 +9,7 @@ RUBY_SITE = ftp://ftp.ruby-lang.org/pub/ruby/1.9
 RUBY_DEPENDENCIES = host-pkgconf host-ruby
 HOST_RUBY_DEPENDENCIES = host-pkgconf
 RUBY_MAKE_ENV = $(TARGET_MAKE_ENV)
+RUBY_MAKE = $(MAKE1)
 RUBY_CONF_OPT = --disable-install-doc --disable-rpath
 HOST_RUBY_CONF_OPT = --disable-install-doc --with-out-ext=curses,readline
 RUBY_LICENSE = Ruby
