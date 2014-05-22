From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 May 2014 23:38:30 +0200
Subject: [Buildroot] [git commit] ruby: disable openssl for host variant
Message-ID: <20140522215335.8A76E9CD28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5d231598c2e9bd632eecdfe4326b74e3bbc77e0c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported by Fatih A????c?? on the mailing list it sometimes fails with
the host openssl depending on versions when development files are
installed.
And as suggested by Thomas Petazzoni it's really not required for
anything so just disable it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ruby/ruby.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 0ea352d..65a59f5 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -12,7 +12,8 @@ HOST_RUBY_DEPENDENCIES = host-pkgconf
 RUBY_MAKE_ENV = $(TARGET_MAKE_ENV)
 RUBY_MAKE = $(MAKE1)
 RUBY_CONF_OPT = --disable-install-doc --disable-rpath
-HOST_RUBY_CONF_OPT = --disable-install-doc --with-out-ext=curses,readline
+HOST_RUBY_CONF_OPT = --disable-install-doc \
+	--with-out-ext=curses,openssl,readline
 RUBY_LICENSE = Ruby or BSD-2c, BSD-3c, others
 RUBY_LICENSE_FILES = LEGAL COPYING BSDL
 
