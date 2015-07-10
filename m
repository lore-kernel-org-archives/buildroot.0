From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jul 2015 19:35:27 +0200
Subject: [Buildroot] [git commit] ruby: enable parallel build
Message-ID: <20150710173532.818078195F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=08138dd13060563733f4c7bd9daebcfdb458840e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Re-enable parallel builds, it doesn't seem to be affected by the issue
worked around in 9332a1ad4 any more.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ruby/ruby.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

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
