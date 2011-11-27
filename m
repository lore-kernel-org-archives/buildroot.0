From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 27 Nov 2011 22:16:40 +0100
Subject: [Buildroot] [git commit] ruby: really disable ncurses/readline for
	host
Message-ID: <20111127212439.2194D8F6ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e4c61e5ea4b09bf112c94b86cde78784476c4014
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 150124b (ruby: fix host build breakage) tried to fix host-ruby
build failures by disabling ncurses/readline extensions, but the
ruby configure script doesn't understand --without-ncurses /
--without-readline arguments, so the commit didn't do anything.

Fix it by really disabling them using the --with-out-ext argument.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ruby/ruby.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index ad791f8..d99fd1e 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -11,7 +11,7 @@ HOST_RUBY_AUTORECONF = YES
 RUBY_DEPENDENCIES = host-ruby
 RUBY_MAKE_ENV = $(TARGET_MAKE_ENV)
 RUBY_CONF_OPT = --disable-install-doc --disable-rpath
-HOST_RUBY_CONF_OPT = --disable-install-doc --without-ncurses --without-readline
+HOST_RUBY_CONF_OPT = --disable-install-doc --with-out-ext=curses,readline
 
 # Force optionals to build before we do
 ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
