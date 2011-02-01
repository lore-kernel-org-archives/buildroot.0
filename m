From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 1 Feb 2011 20:14:00 +0100
Subject: [Buildroot] [git commit master 1/1] ruby: don't build documentation
	when building for host either
Message-ID: <20110201191437.5ADA98EE80@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b823c04d080016b28c955240ec634764718041bd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We don't use it, so it only slows down the build.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ruby/ruby.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index adb1862..966a6a1 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -12,6 +12,8 @@ RUBY_DEPENDENCIES = host-ruby
 RUBY_MAKE_ENV = $(TARGET_MAKE_ENV)
 RUBY_CONF_OPT = --disable-install-doc
 
+HOST_RUBY_CONF_OPT = --disable-install-doc
+
 # Force optionals to build before we do
 ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
 	RUBY_DEPENDENCIES += berkeleydb
-- 
1.7.3.4
