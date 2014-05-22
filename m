From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 22 May 2014 15:04:28 -0300
Subject: [Buildroot] [PATCH] ruby: disable openssl for host variant
Message-ID: <1400781868-18305-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As reported by Fatih A??c? on the mailing list it sometimes fails with
the host openssl depending on versions when development files are
installed.
And as suggested by Thomas Petazzoni it's really not required for
anything so just disable it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ruby/ruby.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 7359cf1..f88ff16 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -14,7 +14,8 @@ HOST_RUBY_DEPENDENCIES = host-pkgconf
 RUBY_MAKE_ENV = $(TARGET_MAKE_ENV)
 RUBY_MAKE = $(MAKE1)
 RUBY_CONF_OPT = --disable-install-doc --disable-rpath
-HOST_RUBY_CONF_OPT = --disable-install-doc --with-out-ext=curses,readline
+HOST_RUBY_CONF_OPT = --disable-install-doc \
+	--with-out-ext=curses,openssl,readline
 RUBY_LICENSE = Ruby or BSD-2c, BSD-3c, others
 RUBY_LICENSE_FILES = LEGAL COPYING BSDL
 
-- 
1.8.5.5
